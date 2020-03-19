Return-Path: <jailhouse-dev+bncBDSMF24UTUGRB3P7ZXZQKGQEFCI5OFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E818B948
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 15:21:34 +0100 (CET)
Received: by mail-ot1-x337.google.com with SMTP id g63sf1579554otb.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FA/ca7uGorx9W9RORhNYh5O8PKdObnCnPv7mPL1XSGU=;
        b=gXWs+0PIOCAF3lVp5dw1da/puozU59tgN3ZvRAAxFyizXrueIAJ1vI8fgY/9Gu5FUI
         kPUxHADJPO9vrCywtwE2luxhGJKbwbH6WwslBtzEpfLDtuPYa1NyZZq+1o0uLaZROyD6
         dRXWNk9T4eN+QLcjuo1mVb5LxnUshw6SrXQPbuJHzLbNV3UFE8nz8h84Y0fvAkT0xDUz
         gTOkw/gtgYVcSM2XDeNjhxihzx6ufLI6aRxsxtKHohNTWighCxoarGZu7U28pkCQPFxe
         4EDaHG8/RdmfHm5tlhpQ0kskdylO3AIta0+SvP2rLFgwc37pT7uVl0vU9+BTe9A7FtGB
         8paQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FA/ca7uGorx9W9RORhNYh5O8PKdObnCnPv7mPL1XSGU=;
        b=DyvKvHq+jTzhYncruxd3LFqiROTQNrZDwfoEbgqL2dI1ckRiAj7G1LOvFlhpApSxkf
         nY9g145mK7na7VLrBGisTYI7s0hYlQjTCOxWeCQzXE5EC6FZct0F1N/8dPbMq3abaeQN
         axAKGqR6eVm2ClWlMlzWX1P+KGR10f1p+7nfUZ6Ksr+GtQ/ZLJjFMtog7cHvux0PyPNL
         DFvheJnyIAGRNlH11goAmw2Bb5rFQYxYUsfyDdLiQoJKWbrIKMPZ2bw14zwmzD11sOJP
         JC34OKDSc4yK2KJBNsZDIGxrdF+AqlOOeFHpN+lNXExRDSHrPq3wCsry16lz6cZdoWNI
         bbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FA/ca7uGorx9W9RORhNYh5O8PKdObnCnPv7mPL1XSGU=;
        b=IMpptav27Dv02sVKUIXygF+mY+iRxYVZH3cfE/NHTH7R5XqXhRUpdBuVwJ55IfwWi4
         wFaspcdZGUklsxlZnM+2GLaatgCVhiILxBC1IGNN7zK0RSeFxG/7vkVZ/zytmb0Yaa44
         RuePmsniUOSatDM9jIBXQVPEEXrQS80LDO1s/ZSLLXgrYvWjaf2ALP7VuC+gJFmC6+ag
         l/WG/RzwL+YGLpPwldxgnL5s8DeRwp4GN9d2Gaq3Kjqhi0Z/3tyP9MkkglrsB1HR3BsY
         V3frBQS9hjdR6PV6BwsQ0Qe5rcT4NjFRBZ1vGXacYussHGHdXkAVu7ccpXjiJ4s5nh60
         fztg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0X2Xk9acILo2seYIH7ZbOe991a/d/+nmdHHpQ6Bkv169Zfe/4P
	nwDBLXvBLGGxwTtY+9cVCbg=
X-Google-Smtp-Source: ADFU+vvGHm9pY/nDqSuRBWXQrrhi5uUXn/sotdZ7djdcTE6Vb9w61IigcwCT95IiCAW969XFFmZm2A==
X-Received: by 2002:a05:6808:9ac:: with SMTP id e12mr2169577oig.149.1584627693451;
        Thu, 19 Mar 2020 07:21:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cd45:: with SMTP id d66ls851781oig.7.gmail; Thu, 19 Mar
 2020 07:21:33 -0700 (PDT)
X-Received: by 2002:a05:6808:b13:: with SMTP id s19mr2578055oij.60.1584627692856;
        Thu, 19 Mar 2020 07:21:32 -0700 (PDT)
Date: Thu, 19 Mar 2020 07:21:32 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1b6751f3-8e34-4170-a4cd-2b0fe152c8a6@googlegroups.com>
In-Reply-To: <e680e1f1-e368-5d84-8283-47ef95e3ad80@siemens.com>
References: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
 <e680e1f1-e368-5d84-8283-47ef95e3ad80@siemens.com>
Subject: Re:
 mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb:do_dpkg_build
 Summary: There was 1 ERROR message shown, returning a non-zero exit code.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5058_547526269.1584627692362"
X-Original-Sender: dodecoder@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_5058_547526269.1584627692362
Content-Type: multipart/alternative; 
	boundary="----=_Part_5059_1954321694.1584627692362"

------=_Part_5059_1954321694.1584627692362
Content-Type: text/plain; charset="UTF-8"



On Thursday, March 19, 2020 at 12:03:52 AM UTC+5:30, Jan Kiszka wrote:
>
> On 18.03.20 02:49, Parth Dode wrote: 
> > ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2019.11.1-r0 
> > do_dpkg_build: Error executing a python function in exec_python_func() 
> > autogenerated: 
> > 
> > The stack trace of python calls that resulted in this exception/failure 
> was: 
> > File: 'exec_python_func() autogenerated', lineno: 2, function: <module> 
> >       0001: 
> >   *** 0002:do_dpkg_build(d) 
> >       0003: 
> > File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 130, 
> > function: do_dpkg_build 
> >       0126:python do_dpkg_build() { 
> >       0127:    lock = bb.utils.lockfile(d.getVar("REPO_ISAR_DIR") + 
> > "/isar.lock", 
> >       0128:                             shared=True) 
> >       0129:    bb.build.exec_func("dpkg_do_mounts", d) 
> >   *** 0130:    bb.build.exec_func("dpkg_runbuild", d) 
> >       0131:    bb.build.exec_func("dpkg_undo_mounts", d) 
> >       0132:    bb.utils.unlockfile(lock) 
> >       0133:} 
> >       0134: 
> > File: '/work/isar/bitbake/lib/bb/build.py', lineno: 249, function: 
> exec_func 
> >       0245:    with bb.utils.fileslocked(lockfiles): 
> >       0246:        if ispython: 
> >       0247:            exec_func_python(func, d, runfile, cwd=adir) 
> >       0248:        else: 
> >   *** 0249:            exec_func_shell(func, d, runfile, cwd=adir) 
> >       0250: 
> >       0251:    try: 
> >       0252:        curcwd = os.getcwd() 
> >       0253:    except: 
> > File: '/work/isar/bitbake/lib/bb/build.py', lineno: 450, function: 
> > exec_func_shell 
> >       0446:    with open(fifopath, 'r+b', buffering=0) as fifo: 
> >       0447:        try: 
> >       0448:            bb.debug(2, "Executing shell function %s" % func) 
> >       0449:            with open(os.devnull, 'r+') as stdin, logfile: 
> >   *** 0450:                bb.process.run(cmd, shell=False, stdin=stdin, 
> > log=logfile, extrafiles=[(fifo,readfifo)]) 
> >       0451:        finally: 
> >       0452:            os.unlink(fifopath) 
> >       0453: 
> >       0454:    bb.debug(2, "Shell function %s finished" % func) 
> > File: '/work/isar/bitbake/lib/bb/process.py', lineno: 182, function: run 
> >       0178:        if not stderr is None: 
> >       0179:            stderr = stderr.decode("utf-8") 
> >       0180: 
> >       0181:    if pipe.returncode != 0: 
> >   *** 0182:        raise ExecutionError(cmd, pipe.returncode, stdout, 
> > stderr) 
> >       0183:    return stdout, stderr 
> > Exception: bb.process.ExecutionError: Execution of 
> > 
> '/work/build/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2019.11.1-r0/temp/run.dpkg_runbuild.9680' 
>
> > failed with exit code 2: 
> > dpkg-buildpackage: info: source package non-root-initramfs 
> > dpkg-buildpackage: info: source version 2019.11.1 
> > dpkg-buildpackage: info: source distribution UNRELEASED 
> > dpkg-buildpackage: info: source changed by Unknown maintainer 
> > <unk...@example.com <javascript:>> 
> > dpkg-architecture: warning: specified GNU system type aarch64-linux-gnu 
> > does not match CC system type x86_64-linux-gnu, try setting a correct CC 
> > environment variable 
> >   dpkg-source -I --before-build . 
> > 
>
> Could you share the complete shell log? This is just the python 
> backtrace *after* the actual error. 
>
> Also please describe your build environment (native, VM, distro 
> version). Just rebuilt an image here from scratch, without issues. 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

___________________________________________________________
Okay so my build environment-
Kali OS- 8GB ram - i5
I have it on dual boot with windows10

It got built till 85% this time but an error got reduced. 
The shell log is quite big , I'll attach it in a text file below.

Thank you for replying , also like you mentioned you built an image without 
any
 issues , can you send me that prebuilt image for rpi4 ?
Do let me know. I'll keep working on the error in that time.

Parth D. 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b6751f3-8e34-4170-a4cd-2b0fe152c8a6%40googlegroups.com.

------=_Part_5059_1954321694.1584627692362
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thursday, March 19, 2020 at 12:03:52 AM UTC+5:3=
0, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0px =
0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
; --darkreader-inline-border-left:#3a3a3a;" data-darkreader-inline-border-l=
eft=3D"">On 18.03.20 02:49, Parth Dode wrote:
<br>&gt; ERROR: mc:rpi4-jailhouse-demo:non-<wbr>root-initramfs-2019.11.1-r0=
=20
<br>&gt; do_dpkg_build: Error executing a python function in exec_python_fu=
nc()=20
<br>&gt; autogenerated:
<br>&gt;=20
<br>&gt; The stack trace of python calls that resulted in this exception/fa=
ilure was:
<br>&gt; File: &#39;exec_python_func() autogenerated&#39;, lineno: 2, funct=
ion: &lt;module&gt;
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00001:
<br>&gt; =C2=A0=C2=A0*** 0002:do_dpkg_build(d)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00003:
<br>&gt; File: &#39;/work/isar/meta/classes/dpkg-<wbr>base.bbclass&#39;, li=
neno: 130,=20
<br>&gt; function: do_dpkg_build
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00126:python do_dpkg_build() {
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00127:=C2=A0 =C2=A0 lock =3D bb.utils.loc=
kfile(d.getVar(&quot;<wbr>REPO_ISAR_DIR&quot;) +=20
<br>&gt; &quot;/isar.lock&quot;,
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00128:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared=
=3DTrue)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00129:=C2=A0 =C2=A0 bb.build.exec_func(&q=
uot;dpkg_do_<wbr>mounts&quot;, d)
<br>&gt; =C2=A0=C2=A0*** 0130:=C2=A0 =C2=A0 bb.build.exec_func(&quot;dpkg_<=
wbr>runbuild&quot;, d)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00131:=C2=A0 =C2=A0 bb.build.exec_func(&q=
uot;dpkg_undo_<wbr>mounts&quot;, d)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00132:=C2=A0 =C2=A0 bb.utils.unlockfile(l=
ock)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00133:}
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00134:
<br>&gt; File: &#39;/work/isar/bitbake/lib/bb/<wbr>build.py&#39;, lineno: 2=
49, function: exec_func
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00245:=C2=A0 =C2=A0 with bb.utils.fileslo=
cked(<wbr>lockfiles):
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00246:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ispy=
thon:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00247:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 exec_func_python(func, d, runfile, cwd=3Dadir)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00248:=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
<br>&gt; =C2=A0=C2=A0*** 0249:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exe=
c_func_shell(func, d, runfile, cwd=3Dadir)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00250:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00251:=C2=A0 =C2=A0 try:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00252:=C2=A0 =C2=A0 =C2=A0 =C2=A0 curcwd =
=3D os.getcwd()
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00253:=C2=A0 =C2=A0 except:
<br>&gt; File: &#39;/work/isar/bitbake/lib/bb/<wbr>build.py&#39;, lineno: 4=
50, function:=20
<br>&gt; exec_func_shell
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00446:=C2=A0 =C2=A0 with open(fifopath, &=
#39;r+b&#39;, buffering=3D0) as fifo:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00447:=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00448:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.debug(2, &quot;Executing shell function %s&quot; % func)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00449:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 with open(os.devnull, &#39;r+&#39;) as stdin, logfile:
<br>&gt; =C2=A0=C2=A0*** 0450:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.process.run(cmd, shell=3DFalse, stdin=3Dstdin,=20
<br>&gt; log=3Dlogfile, extrafiles=3D[(fifo,readfifo)])
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00451:=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally=
:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00452:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.unlink(fifopath)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00453:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00454:=C2=A0 =C2=A0 bb.debug(2, &quot;She=
ll function %s finished&quot; % func)
<br>&gt; File: &#39;/work/isar/bitbake/lib/bb/<wbr>process.py&#39;, lineno:=
 182, function: run
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00178:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not =
stderr is None:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00179:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 stderr =3D stderr.decode(&quot;utf-8&quot;)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00180:
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00181:=C2=A0 =C2=A0 if pipe.returncode !=
=3D 0:
<br>&gt; =C2=A0=C2=A0*** 0182:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExecutionEr=
ror(cmd, pipe.returncode, stdout,=20
<br>&gt; stderr)
<br>&gt; =C2=A0=C2=A0 =C2=A0 =C2=A00183:=C2=A0 =C2=A0 return stdout, stderr
<br>&gt; Exception: bb.process.ExecutionError: Execution of=20
<br>&gt; &#39;/work/build/tmp/work/<wbr>jailhouse-demo-arm64/non-root-<wbr>=
initramfs/2019.11.1-r0/temp/<wbr>run.dpkg_runbuild.9680&#39;=20
<br>&gt; failed with exit code 2:
<br>&gt; dpkg-buildpackage: info: source package non-root-initramfs
<br>&gt; dpkg-buildpackage: info: source version 2019.11.1
<br>&gt; dpkg-buildpackage: info: source distribution UNRELEASED
<br>&gt; dpkg-buildpackage: info: source changed by Unknown maintainer=20
<br>&gt; &lt;<a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailt=
o=3D"qp3NAFwjAQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascr=
ipt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return=
 true;">unk...@example.com</a>&gt;
<br>&gt; dpkg-architecture: warning: specified GNU system type aarch64-linu=
x-gnu=20
<br>&gt; does not match CC system type x86_64-linux-gnu, try setting a corr=
ect CC=20
<br>&gt; environment variable
<br>&gt; =C2=A0=C2=A0dpkg-source -I --before-build .
<br>&gt;=20
<br>
<br>Could you share the complete shell log? This is just the python=20
<br>backtrace *after* the actual error.
<br>
<br>Also please describe your build environment (native, VM, distro=20
<br>version). Just rebuilt an image here from scratch, without issues.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote><div><br></div><div>______________________________________=
_____________________</div><div>Okay so my build environment-</div><div>Kal=
i OS- 8GB ram - i5</div><div>I have it on dual boot with windows10</div><di=
v><br></div><div>It got built till 85% this time but an error got reduced.=
=C2=A0</div><div>The shell log is quite big , I&#39;ll attach it in a text =
file below.</div><div><br></div><div>Thank you for replying , also like you=
 mentioned you built an image without any</div><div>=C2=A0issues , can you =
send me that prebuilt image for rpi4 ?</div><div>Do let me know. I&#39;ll k=
eep working on the error in that time.</div><div><br></div><div>Parth D.=C2=
=A0<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1b6751f3-8e34-4170-a4cd-2b0fe152c8a6%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/1b6751f3-8e34-4170-a4cd-2b0fe152c8a6%40googlegroups.com<=
/a>.<br />

------=_Part_5059_1954321694.1584627692362--

------=_Part_5058_547526269.1584627692362--
