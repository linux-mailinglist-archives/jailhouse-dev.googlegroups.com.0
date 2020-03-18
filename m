Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEGTZHZQKGQE2X2YJVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AF18A268
	for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Mar 2020 19:33:52 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id l16sf12066942wrr.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Mar 2020 11:33:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584556432; cv=pass;
        d=google.com; s=arc-20160816;
        b=Rl2nJZmDQie2UDZfEKda8wGBgbQDCEob+0Wy215icmCQipl7jUkJFge7FYlVOubnAG
         k+n6jPRxTQUJT7o9GTKDhkatVQefVcm4JF2jTdNPgs/eBHmI7qpFbYpeBE31gvkaUpwm
         j1ObwwS+nwfrTz70rCv5Z2vpvUFt0WhGWtqgttlGZd2Itcn4BaOlSjFA3/xavaCNtEyK
         sra94ELDP7OsI7aKEJj0Re63W83928V29PPAIOL1ulF4GI6U7ZjstJGFIyaSLGBBLmfV
         9YgT/IpaXIrxeVUOmN0RSUZxXoTSllj0rC8ow939gbp/B+L6svcwS83ipdEg3ro6I8vM
         chrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=EefDJ/j8d5skUSGQas1vws/1HY+orJnDHBbaKtTZWfQ=;
        b=lLWV+Mxf8J79HCwCIclH9yLlBgF2Y50ojAPBWUpzOrLSzEeU61GLVYR2cXgpP/FCa4
         AD1MXLjlQw454FNC3HuhufJrmTPxVx84SJb9pz4Tx8/pYj40f0DzUeW7FKAYNho/+VCQ
         lGvR+iTIE73k/6o4pKNdbfyUmZhtMM+nHYAn5+IHnCxRA20qoICFlzW4kyxtVXvzjPik
         k3/zO45JM7R5OWNhYknXbBrSj3bxfb7tkaqY5KGe1AKhDTbmdXANtwBxAVRDO46J8WtC
         6uuxkPjS66BKkpoUi9lpHGmhzfDMmzge9GN7Qs9KY3nMhKDMiHOqQzVwxlVh7uU08nxI
         itmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EefDJ/j8d5skUSGQas1vws/1HY+orJnDHBbaKtTZWfQ=;
        b=rJptVsFfWl0gLL3+6dw5YHj80K0x++ALpaprCQPNaADs2hWNhfd4wqbviq6wNioF++
         V5psowcx0pZf6+4z3/46BTtfTOA5rvws8Qnxh8+XDQnEiwdupARApGm9GquwR/BEJ6Y0
         EK0y1qDzrnoSgZdBkdzp/hhARMBPHbbXvjMk4IPqmd8xHZOgECoYqd9rTkfiPGn0qaAa
         rryLTQwSUOQdUXO9y3pqdMiwwrLmWypbCvg5bC+14A50KNKZ2AqNfBAnJqiWKV+uX9Q+
         SKfw7MR+86C6eTw7Ca9RpvadID3y3peoeWLprKUcTKsSL/inz5aqnT793kuNdQ1re35a
         +oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EefDJ/j8d5skUSGQas1vws/1HY+orJnDHBbaKtTZWfQ=;
        b=Z/4liVHgGIlqnosBIL6mRbsomep6BlHUtZdMfbKBFDeol34gxaDXQ8TWE56MT3O3OT
         LSCcdw3u0OX33HIiE0ARkytUw1sxyzn4KOinidW6Zie+ea3DqTGYL4RF6EAqWe2BsvkL
         ZtRwV9zjG62uz+MullUlCuw5CyU3ENv2XSiU3xVBYq9ysX1F4fF3uqnx/IH3AyMK2Wpg
         O0PHTVYrtbkQq1sNjSNfiCR5JtJxFUOoFT4IGEm6TMXmQ2jWkmVo6yIXVYxn/V3IBeQK
         LqZCprvCFNu8GkI7322L5PVXoay1PJrMD5sFI43jq7oRTNji5hxxfwKOnhovwUMRd6PY
         WSNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1OZdyRLpWR76ccvIp7Blf+Zb961vXKSe/vFOiJb+LMQz8NOwpg
	5E/rIIAAry/IlHKdpcRxnuE=
X-Google-Smtp-Source: ADFU+vs0LwU02MyQWx9fdrT/FoJtvjjUw0EZN3Ly4YPS2Tnznb97V6pghNOEE5VrVMPC25VZghUURQ==
X-Received: by 2002:a7b:c4cd:: with SMTP id g13mr6820547wmk.151.1584556432584;
        Wed, 18 Mar 2020 11:33:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f8d1:: with SMTP id f17ls13140885wrq.3.gmail; Wed, 18
 Mar 2020 11:33:51 -0700 (PDT)
X-Received: by 2002:a5d:5148:: with SMTP id u8mr7343436wrt.132.1584556431802;
        Wed, 18 Mar 2020 11:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584556431; cv=none;
        d=google.com; s=arc-20160816;
        b=Lq0ypy/MfWeWbMWS1x2zSv2TwKRTlo8r1ZoV40F6nL5Luqs+ee/TAZjweGU5MuubRQ
         XQDIKdr/uZH+t/78ovonkWFu6lPvtfAJjPJfpbL5xpe4yaQZSAtaNkvyk3ZE2hhBAtkl
         L51+RZ3eTTjJyyHqi+g50cYZlfd6tgdll+M0J92QDbNTLizfLRtud3Z9yA9LxxdD/yK0
         T/aM+fumQ9Spe2maCv3VbhaJTcqCFSX8bqCeU7F07TSHpEhf/fZlgHecPqw3HUB/qbuO
         qF3QdO+SkgRb/sth1hsUkGfiPGb4ekbdx2C2WemuUaop2M3YrArRPweVqn8Sr7p4BEC5
         NL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=hauW/5pXEgW83zONNX87W5/WspZQwuLmNKJueLAY0zU=;
        b=EdsMKlWczO9h27Irj+zEqAD1MJI9WwGXSHX3L/mfMhUk30jmWCcq5hYqOVugIaouRy
         4YzREDRxeWnl6meHPuwfeRgobw+ijmshrfrgOWMcjw60LDmjrCx+ahMZEFV+QLDWDKX7
         94B86oAx9tp6TMmKreUYLAWVdHITe3RgosDd5aGofmLD6pu4PI5DoWga7K73+PKOTU+5
         B7R9jDx9PyhfTQFdL39vgPAw0IHjz8MMQB5uaAP3iDC+uqVFlfg0XFuYGc73UZyjuScZ
         SIm3cQfNXtyR563dxx9YSUBXrhQwP3YOYFPTVTqQ4WVMjskuECgSh3LPJuxSeWRVxBCB
         YSQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id w17si368653wrn.3.2020.03.18.11.33.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Mar 2020 11:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 02IIXoEs008481
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2020 19:33:50 +0100
Received: from [139.22.45.152] ([139.22.45.152])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02IIXowD024154;
	Wed, 18 Mar 2020 19:33:50 +0100
Subject: Re:
 mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb:do_dpkg_build
 Summary: There was 1 ERROR message shown, returning a non-zero exit code.
To: Parth Dode <dodecoder@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e680e1f1-e368-5d84-8283-47ef95e3ad80@siemens.com>
Date: Wed, 18 Mar 2020 19:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 18.03.20 02:49, Parth Dode wrote:
> ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2019.11.1-r0=20
> do_dpkg_build: Error executing a python function in exec_python_func()=20
> autogenerated:
>=20
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>  =C2=A0 =C2=A0 =C2=A00001:
>  =C2=A0*** 0002:do_dpkg_build(d)
>  =C2=A0 =C2=A0 =C2=A00003:
> File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 130,=20
> function: do_dpkg_build
>  =C2=A0 =C2=A0 =C2=A00126:python do_dpkg_build() {
>  =C2=A0 =C2=A0 =C2=A00127:=C2=A0 =C2=A0 lock =3D bb.utils.lockfile(d.getV=
ar("REPO_ISAR_DIR") +=20
> "/isar.lock",
>  =C2=A0 =C2=A0 =C2=A00128:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared=3DTrue)
>  =C2=A0 =C2=A0 =C2=A00129:=C2=A0 =C2=A0 bb.build.exec_func("dpkg_do_mount=
s", d)
>  =C2=A0*** 0130:=C2=A0 =C2=A0 bb.build.exec_func("dpkg_runbuild", d)
>  =C2=A0 =C2=A0 =C2=A00131:=C2=A0 =C2=A0 bb.build.exec_func("dpkg_undo_mou=
nts", d)
>  =C2=A0 =C2=A0 =C2=A00132:=C2=A0 =C2=A0 bb.utils.unlockfile(lock)
>  =C2=A0 =C2=A0 =C2=A00133:}
>  =C2=A0 =C2=A0 =C2=A00134:
> File: '/work/isar/bitbake/lib/bb/build.py', lineno: 249, function: exec_f=
unc
>  =C2=A0 =C2=A0 =C2=A00245:=C2=A0 =C2=A0 with bb.utils.fileslocked(lockfil=
es):
>  =C2=A0 =C2=A0 =C2=A00246:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ispython:
>  =C2=A0 =C2=A0 =C2=A00247:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_=
func_python(func, d, runfile, cwd=3Dadir)
>  =C2=A0 =C2=A0 =C2=A00248:=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>  =C2=A0*** 0249:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_func_shell=
(func, d, runfile, cwd=3Dadir)
>  =C2=A0 =C2=A0 =C2=A00250:
>  =C2=A0 =C2=A0 =C2=A00251:=C2=A0 =C2=A0 try:
>  =C2=A0 =C2=A0 =C2=A00252:=C2=A0 =C2=A0 =C2=A0 =C2=A0 curcwd =3D os.getcw=
d()
>  =C2=A0 =C2=A0 =C2=A00253:=C2=A0 =C2=A0 except:
> File: '/work/isar/bitbake/lib/bb/build.py', lineno: 450, function:=20
> exec_func_shell
>  =C2=A0 =C2=A0 =C2=A00446:=C2=A0 =C2=A0 with open(fifopath, 'r+b', buffer=
ing=3D0) as fifo:
>  =C2=A0 =C2=A0 =C2=A00447:=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>  =C2=A0 =C2=A0 =C2=A00448:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.de=
bug(2, "Executing shell function %s" % func)
>  =C2=A0 =C2=A0 =C2=A00449:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with =
open(os.devnull, 'r+') as stdin, logfile:
>  =C2=A0*** 0450:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
b.process.run(cmd, shell=3DFalse, stdin=3Dstdin,=20
> log=3Dlogfile, extrafiles=3D[(fifo,readfifo)])
>  =C2=A0 =C2=A0 =C2=A00451:=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:
>  =C2=A0 =C2=A0 =C2=A00452:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.un=
link(fifopath)
>  =C2=A0 =C2=A0 =C2=A00453:
>  =C2=A0 =C2=A0 =C2=A00454:=C2=A0 =C2=A0 bb.debug(2, "Shell function %s fi=
nished" % func)
> File: '/work/isar/bitbake/lib/bb/process.py', lineno: 182, function: run
>  =C2=A0 =C2=A0 =C2=A00178:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not stderr is No=
ne:
>  =C2=A0 =C2=A0 =C2=A00179:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stder=
r =3D stderr.decode("utf-8")
>  =C2=A0 =C2=A0 =C2=A00180:
>  =C2=A0 =C2=A0 =C2=A00181:=C2=A0 =C2=A0 if pipe.returncode !=3D 0:
>  =C2=A0*** 0182:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExecutionError(cmd, pip=
e.returncode, stdout,=20
> stderr)
>  =C2=A0 =C2=A0 =C2=A00183:=C2=A0 =C2=A0 return stdout, stderr
> Exception: bb.process.ExecutionError: Execution of=20
> '/work/build/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2019.11.1-r=
0/temp/run.dpkg_runbuild.9680'=20
> failed with exit code 2:
> dpkg-buildpackage: info: source package non-root-initramfs
> dpkg-buildpackage: info: source version 2019.11.1
> dpkg-buildpackage: info: source distribution UNRELEASED
> dpkg-buildpackage: info: source changed by Unknown maintainer=20
> <unknown@example.com>
> dpkg-architecture: warning: specified GNU system type aarch64-linux-gnu=
=20
> does not match CC system type x86_64-linux-gnu, try setting a correct CC=
=20
> environment variable
>  =C2=A0dpkg-source -I --before-build .
>=20

Could you share the complete shell log? This is just the python=20
backtrace *after* the actual error.

Also please describe your build environment (native, VM, distro=20
version). Just rebuilt an image here from scratch, without issues.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e680e1f1-e368-5d84-8283-47ef95e3ad80%40siemens.com.
