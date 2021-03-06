/*
 * Copyright (C) 2015 Tetsuya Isaki
 * Copyright (C) 2015 Y.Sugahara (moveccr)
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

extern int native_ioctl_TIOCGWINSZ(int fd, out System.OS.winsize ws);
extern int native_sysctlbyname(string sname,
	void *oldp, size_t *oldlenp,
	void *newp, size_t newlen);

[CCode(cname="SIGINT")]
extern const int native_SIGINT;
[CCode(cname="SIGWINCH")]
extern const int native_SIGWINCH;
[CCode(cname="SIGHUP")]
extern const int native_SIGHUP;
[CCode(cname="SIGPIPE")]
extern const int native_SIGPIPE;
[CCode(cname="SIGALRM")]
extern const int native_SIGALRM;
[CCode(cname="SIGXCPU")]
extern const int native_SIGXCPU;
[CCode(cname="SIGXFSZ")]
extern const int native_SIGXFSZ;
[CCode(cname="SIGVTALRM")]
extern const int native_SIGVTALRM;
[CCode(cname="SIGPROF")]
extern const int native_SIGPROF;
[CCode(cname="SIGUSR1")]
extern const int native_SIGUSR1;
[CCode(cname="SIGUSR2")]
extern const int native_SIGUSR2;

namespace System.OS
{
	public struct winsize {
		ushort ws_row;
		ushort ws_col;
		ushort ws_xpixel;
		ushort ws_ypixel;
	}

	public class ioctl
	{
		public static int TIOCGWINSZ(int fd, out winsize ws)
		{
			return native_ioctl_TIOCGWINSZ(fd, out ws);
		}
	}

	public const int SIGINT = native_SIGINT;
	public const int SIGWINCH = native_SIGWINCH;
	public const int SIGHUP = native_SIGHUP;
	public const int SIGPIPE = native_SIGPIPE;
	public const int SIGALRM = native_SIGALRM;
	public const int SIGXCPU = native_SIGXCPU;
	public const int SIGXFSZ = native_SIGXFSZ;
	public const int SIGVTALRM = native_SIGVTALRM;
	public const int SIGPROF = native_SIGPROF;
	public const int SIGUSR1 = native_SIGUSR1;
	public const int SIGUSR2 = native_SIGUSR2;

	public class sysctl
	{
		public static int getbyname_int(string sname, out int oldp)
		{
			size_t oldlenp = sizeof(int);

			oldp = 0;
			return native_sysctlbyname(sname, &oldp, &oldlenp,
				null, 0);
		}
	}
}
