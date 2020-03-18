Return-Path: <jailhouse-dev+bncBDSMF24UTUGRBIH4YXZQKGQEEXXLAAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id B732C1893D2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Mar 2020 02:49:21 +0100 (CET)
Received: by mail-oi1-x23d.google.com with SMTP id s126sf14548844oih.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 18:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cni840AvoUj4hOqizLTpKJpfhtKBQjDEFBJDzGwa8N8=;
        b=RmcLleV8of+9J95kaJmmj+CmFOS++a9MzJsZq9aIlnWdekjctnaPe8nn+fpLlFNbN7
         EKiovQosb734hWq4Y06lnav9RE1XZn30R+ZKmL56nPsddKKM+IZ+JHyOmXjSVPqNppBo
         ofF+BBAWwCJPeS/A5K47mkcH/GvKirR4L//v9gVoMXszGjkyAYoPnqt89gTboLzbO4ax
         Eym8pSdSuXmKE+wLfr4vAk8Li9Ji5Ksy1X2cGk5LPJEyUdswywCgurVx8srgYrhuuGJY
         Lc4hIZh9d1Dwa2GMBtmrnkRM0f+gGJU6b2w8pd1n7a5tARooKTqcbWV8XIBzo4RgbTBG
         Lfkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cni840AvoUj4hOqizLTpKJpfhtKBQjDEFBJDzGwa8N8=;
        b=GTjh9vpXK/YBJL5FaVKtw1opLuKekRK37rmKDMh5FIU2S4DQ6KtbNkEQNEkcgGhnuN
         PESaaTBSTIL/RjHpmChpTw5CshrIdjAj+XQeE9jtqtePKEK9h/oNGXUg1nBiRQKEbLds
         uVRMV+AT91aHcXNfbanXsSqQetICVprNKOdFXg0xnHJZmNWTHvAhYxwsrMeOvbuouE5j
         Su6vWvGT3dbH3vUB9kFWXU62MIWw10R0NH844RgFVvX6DWE9wAYljtvdMK5OfZGyXW78
         8ghA72fMwz6M1Q5Iam/3gVFu+pbjuLcJt+3kwJ6uUL3CyKurV8oDoXEupeYi3NG3ZIRh
         M/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cni840AvoUj4hOqizLTpKJpfhtKBQjDEFBJDzGwa8N8=;
        b=dVmYqyJ8IT1Jf5zQQuFZcZIKwdInGZCNpBZ5J3dcTZtOK4XMRr8nBb3GgRPP/IGjij
         TROi5yuhZxSFlZnv6kd/abUoxgX4ntShG+A9CbqtMfyF3pYDre3q0toLYlNGCf9pt2vU
         E6dOFoLbcjszFMJcFWbKEI/zripZSI/RgHserh0q7efkdEIPip0x2DpJYs5I5EiJ7Yoq
         D6nWqp0VNzOR3TtiE2Cwtjz+KbBcMEbfcfjLjhX6M2K4+wvilY+h4ZDgwJBMHbRDaJ3G
         QKWl7BqxtOKnJjEzcYVn9dngmxcdU0HictPBrdWAnJeFabgH3aEa9L3b/DAPh5n4/PWD
         VsNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1FS7xIxpjBQfC0Ye7LqwxD3xaLm7rk3mrnG+RFX+9kdLTWj86X
	MY8yAr7N3qVVjo/CGZ6lN6E=
X-Google-Smtp-Source: ADFU+vtOENwyhtT0UIc6OeP6R5lmZyyZxSCfOk32ulNPHy4milojy5a9jpJ77EH5+TyRRRqtwdMkAw==
X-Received: by 2002:aca:cf87:: with SMTP id f129mr1383380oig.109.1584496160302;
        Tue, 17 Mar 2020 18:49:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:13d5:: with SMTP id e21ls8605730otq.11.gmail; Tue,
 17 Mar 2020 18:49:19 -0700 (PDT)
X-Received: by 2002:a9d:4d85:: with SMTP id u5mr2041027otk.128.1584496159562;
        Tue, 17 Mar 2020 18:49:19 -0700 (PDT)
Date: Tue, 17 Mar 2020 18:49:18 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
Subject: mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb:do_dpkg_build
 Summary: There was 1 ERROR message shown, returning a non-zero exit code.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4295_5731681.1584496158922"
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

------=_Part_4295_5731681.1584496158922
Content-Type: multipart/alternative; 
	boundary="----=_Part_4296_56483979.1584496158923"

------=_Part_4296_56483979.1584496158923
Content-Type: text/plain; charset="UTF-8"

ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2019.11.1-r0 
do_dpkg_build: Error executing a python function in exec_python_func() 
autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_dpkg_build(d)
     0003:
File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 130, function: 
do_dpkg_build
     0126:python do_dpkg_build() {
     0127:    lock = bb.utils.lockfile(d.getVar("REPO_ISAR_DIR") + 
"/isar.lock",
     0128:                             shared=True)
     0129:    bb.build.exec_func("dpkg_do_mounts", d)
 *** 0130:    bb.build.exec_func("dpkg_runbuild", d)
     0131:    bb.build.exec_func("dpkg_undo_mounts", d)
     0132:    bb.utils.unlockfile(lock)
     0133:}
     0134:
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 249, function: exec_func
     0245:    with bb.utils.fileslocked(lockfiles):
     0246:        if ispython:
     0247:            exec_func_python(func, d, runfile, cwd=adir)
     0248:        else:
 *** 0249:            exec_func_shell(func, d, runfile, cwd=adir)
     0250:
     0251:    try:
     0252:        curcwd = os.getcwd()
     0253:    except:
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 450, function: 
exec_func_shell
     0446:    with open(fifopath, 'r+b', buffering=0) as fifo:
     0447:        try:
     0448:            bb.debug(2, "Executing shell function %s" % func)
     0449:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0450:                bb.process.run(cmd, shell=False, stdin=stdin, 
log=logfile, extrafiles=[(fifo,readfifo)])
     0451:        finally:
     0452:            os.unlink(fifopath)
     0453:
     0454:    bb.debug(2, "Shell function %s finished" % func)
File: '/work/isar/bitbake/lib/bb/process.py', lineno: 182, function: run
     0178:        if not stderr is None:
     0179:            stderr = stderr.decode("utf-8")
     0180:
     0181:    if pipe.returncode != 0:
 *** 0182:        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
     0183:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of 
'/work/build/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2019.11.1-r0/temp/run.dpkg_runbuild.9680' 
failed with exit code 2:
dpkg-buildpackage: info: source package non-root-initramfs
dpkg-buildpackage: info: source version 2019.11.1
dpkg-buildpackage: info: source distribution UNRELEASED
dpkg-buildpackage: info: source changed by Unknown maintainer 
<unknown@example.com>
dpkg-architecture: warning: specified GNU system type aarch64-linux-gnu 
does not match CC system type x86_64-linux-gnu, try setting a correct CC 
environment variable
 dpkg-source -I --before-build .

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/36eac3b7-b6bc-4774-826d-9942dae992d1%40googlegroups.com.

------=_Part_4296_56483979.1584496158923
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2019=
.11.1-r0 do_dpkg_build: Error executing a python function in exec_python_fu=
nc() autogenerated:</div><div><br></div><div>The stack trace of python call=
s that resulted in this exception/failure was:</div><div>File: &#39;exec_py=
thon_func() autogenerated&#39;, lineno: 2, function: &lt;module&gt;</div><d=
iv>=C2=A0 =C2=A0 =C2=A00001:</div><div>=C2=A0*** 0002:do_dpkg_build(d)</div=
><div>=C2=A0 =C2=A0 =C2=A00003:</div><div>File: &#39;/work/isar/meta/classe=
s/dpkg-base.bbclass&#39;, lineno: 130, function: do_dpkg_build</div><div>=
=C2=A0 =C2=A0 =C2=A00126:python do_dpkg_build() {</div><div>=C2=A0 =C2=A0 =
=C2=A00127:=C2=A0 =C2=A0 lock =3D bb.utils.lockfile(d.getVar(&quot;REPO_ISA=
R_DIR&quot;) + &quot;/isar.lock&quot;,</div><div>=C2=A0 =C2=A0 =C2=A00128:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared=3DTrue)</div><div>=C2=A0 =C2=A0 =C2=
=A00129:=C2=A0 =C2=A0 bb.build.exec_func(&quot;dpkg_do_mounts&quot;, d)</di=
v><div>=C2=A0*** 0130:=C2=A0 =C2=A0 bb.build.exec_func(&quot;dpkg_runbuild&=
quot;, d)</div><div>=C2=A0 =C2=A0 =C2=A00131:=C2=A0 =C2=A0 bb.build.exec_fu=
nc(&quot;dpkg_undo_mounts&quot;, d)</div><div>=C2=A0 =C2=A0 =C2=A00132:=C2=
=A0 =C2=A0 bb.utils.unlockfile(lock)</div><div>=C2=A0 =C2=A0 =C2=A00133:}</=
div><div>=C2=A0 =C2=A0 =C2=A00134:</div><div>File: &#39;/work/isar/bitbake/=
lib/bb/build.py&#39;, lineno: 249, function: exec_func</div><div>=C2=A0 =C2=
=A0 =C2=A00245:=C2=A0 =C2=A0 with bb.utils.fileslocked(lockfiles):</div><di=
v>=C2=A0 =C2=A0 =C2=A00246:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ispython:</div><d=
iv>=C2=A0 =C2=A0 =C2=A00247:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_=
func_python(func, d, runfile, cwd=3Dadir)</div><div>=C2=A0 =C2=A0 =C2=A0024=
8:=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:</div><div>=C2=A0*** 0249:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_func_shell(func, d, runfile, cwd=3Dadir)</=
div><div>=C2=A0 =C2=A0 =C2=A00250:</div><div>=C2=A0 =C2=A0 =C2=A00251:=C2=
=A0 =C2=A0 try:</div><div>=C2=A0 =C2=A0 =C2=A00252:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 curcwd =3D os.getcwd()</div><div>=C2=A0 =C2=A0 =C2=A00253:=C2=A0 =C2=A0=
 except:</div><div>File: &#39;/work/isar/bitbake/lib/bb/build.py&#39;, line=
no: 450, function: exec_func_shell</div><div>=C2=A0 =C2=A0 =C2=A00446:=C2=
=A0 =C2=A0 with open(fifopath, &#39;r+b&#39;, buffering=3D0) as fifo:</div>=
<div>=C2=A0 =C2=A0 =C2=A00447:=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:</div><div>=
=C2=A0 =C2=A0 =C2=A00448:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug=
(2, &quot;Executing shell function %s&quot; % func)</div><div>=C2=A0 =C2=A0=
 =C2=A00449:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(os.devnull,=
 &#39;r+&#39;) as stdin, logfile:</div><div>=C2=A0*** 0450:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.process.run(cmd, shell=3DFalse=
, stdin=3Dstdin, log=3Dlogfile, extrafiles=3D[(fifo,readfifo)])</div><div>=
=C2=A0 =C2=A0 =C2=A00451:=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:</div><div>=C2=
=A0 =C2=A0 =C2=A00452:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.unlink(f=
ifopath)</div><div>=C2=A0 =C2=A0 =C2=A00453:</div><div>=C2=A0 =C2=A0 =C2=A0=
0454:=C2=A0 =C2=A0 bb.debug(2, &quot;Shell function %s finished&quot; % fun=
c)</div><div>File: &#39;/work/isar/bitbake/lib/bb/process.py&#39;, lineno: =
182, function: run</div><div>=C2=A0 =C2=A0 =C2=A00178:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if not stderr is None:</div><div>=C2=A0 =C2=A0 =C2=A00179:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr =3D stderr.decode(&quot;utf-8&quot;)=
</div><div>=C2=A0 =C2=A0 =C2=A00180:</div><div>=C2=A0 =C2=A0 =C2=A00181:=C2=
=A0 =C2=A0 if pipe.returncode !=3D 0:</div><div>=C2=A0*** 0182:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 raise ExecutionError(cmd, pipe.returncode, stdout, stderr=
)</div><div>=C2=A0 =C2=A0 =C2=A00183:=C2=A0 =C2=A0 return stdout, stderr</d=
iv><div>Exception: bb.process.ExecutionError: Execution of &#39;/work/build=
/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2019.11.1-r0/temp/run.dpk=
g_runbuild.9680&#39; failed with exit code 2:</div><div>dpkg-buildpackage: =
info: source package non-root-initramfs</div><div>dpkg-buildpackage: info: =
source version 2019.11.1</div><div>dpkg-buildpackage: info: source distribu=
tion UNRELEASED</div><div>dpkg-buildpackage: info: source changed by Unknow=
n maintainer &lt;unknown@example.com&gt;</div><div>dpkg-architecture: warni=
ng: specified GNU system type aarch64-linux-gnu does not match CC system ty=
pe x86_64-linux-gnu, try setting a correct CC environment variable</div><di=
v>=C2=A0dpkg-source -I --before-build .</div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/36eac3b7-b6bc-4774-826d-9942dae992d1%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/36eac3b7-b6bc-4774-826d-9942dae992d1%40googlegroups.com<=
/a>.<br />

------=_Part_4296_56483979.1584496158923--

------=_Part_4295_5731681.1584496158922--
