Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGERZ7ZQKGQEXL2P2ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E5218C06D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 20:31:37 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id v6sf1473099wrg.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 12:31:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584646297; cv=pass;
        d=google.com; s=arc-20160816;
        b=wOkUJtjB9eA+DXvSfrBGcCvx224sMyffk/wUSpblKZKzZWCa+yGDOaRiHlLL78Tr78
         chiAdvy7S88Xpa0mGSMEUjzUfdjs+UE8B+DSdmGOkO5KEQag/iioyljqCEvuMNBil5Cm
         Cah0YMiO9xbvPecxpsP7yjMI6nVJgfn0r8k4O7UQS0vV48DJLdYe83KrRvKdeZY+P1eh
         sLlh7ekJqddNHi/vUQyLbU163E82BGwK1+ztCyScaqndTLcSWiMtcl5a1hrw/We1Pphx
         X2FoYp/NFaIS+VCmswEPm1enwwnDbEANBBI2mPZF4Al1priWMe67umBLROCO+rqklhWa
         R2wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=zGvBmO+at+JSa6YYyI0kONJl5unuCCT3aAFv3tOMyQ0=;
        b=OBXaZ+khf3CfFydxNvvLc68uK+f6CPlxj2moKei1Qs5dduzpmv/FWjHqkigqQmAfWU
         wfxHqxLpc+1e6nsrRV+wnYHvAZDiIeTwrMKw7f4vHr5ogXTdggy9CGy4+IP4g4JTdCQq
         LLfnceQ3owlYpU8iPOTKtgWD4J2FAdANvfoGkeTcJ/CRcsiQlea5wWq6bFiky6ygB3La
         gCuzQ9sZEL49a18EYuj1I/wWlWsGNuyGzd5KitWqTzTuOkJsrb3vzN2CSH+6FfhAcniv
         hvXtxN/YE+Mmt62sfzgL7CIprzEWjVIC96p1mtUzJvvdsc9Yl4WG61k2gdOAwfzS1AXZ
         SW2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zGvBmO+at+JSa6YYyI0kONJl5unuCCT3aAFv3tOMyQ0=;
        b=nHF/9ovem7PK1vjCeC2QLWOYad8Zkbfy2cVU+jeXFbh5EGR0VbtnGMu4so0j3p7y6Z
         FkITTs7goo1rDSg6pgGGU0EqVrliKtONICHSmHiPqXBjhNOov4u9Mota7f4qq92ShAzm
         WcOLFYidYDERzctYPiXvOLRlhy988bQfkks9IBBXHZMULLK0plKlMbZ1OGAerjKZvuEP
         xNcGZ+hAi4kWNHXg0joW8WV63lWvkb1bX0XgOSHxmTQ9eCMw6fWIVceZgIqNVuizVHcT
         8DSyJSH06ecqHRMBDR0HmcyvUGlNK8b092axUDcC0uuQ35WEfUNZC7WgD1AbZjN1eXTD
         egTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zGvBmO+at+JSa6YYyI0kONJl5unuCCT3aAFv3tOMyQ0=;
        b=IcHkNHIvdItwUi0ugLDKLQBvgLJVnVgm35fGWD2t1gGvODVkbGgX8jvIZbooMEYetW
         CxZajnySs4Qybcr/q9zQqBg9ceMenSHy6OeW5x/StASpPVwTm2jtF+apZkj7vcc5ANAq
         7YR580+Fv/oCXv+PxwjDoaBI2Atx/PLJdnryTFNZ5uGjCDCCfd37XJBH2/FWaquNv0wZ
         ODISWphJBvN8RoIuywA5e2kQBpEFGLzHWrUUwqAGCZZEPK1W0GDNyArQCw6mV8MeLhGD
         c74FI3vqNhli8kSVqeuymfqZZ85W0gSfenv5U34Rk7gq3ZdTxWxFr2NnDYWEbO36Od7u
         44cw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ36rfOZjfMf6QHQMiABoKohdVg8nLTotsm8bLZ7zFCw56oPrWGj
	P231v3ML6yKlvTF+VDe1wB0=
X-Google-Smtp-Source: ADFU+vtRrKzuMXgcn36RprDS+lzu0kdtOz0vBCA/KzUhuFBHThozTHEB12tyZse6WTSh37+2G8o5jw==
X-Received: by 2002:a1c:5941:: with SMTP id n62mr2028878wmb.68.1584646297172;
        Thu, 19 Mar 2020 12:31:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:230e:: with SMTP id j14ls1688886wmj.0.canary-gmail; Thu,
 19 Mar 2020 12:31:36 -0700 (PDT)
X-Received: by 2002:a17:906:7d53:: with SMTP id l19mr4899098ejp.55.1584646296332;
        Thu, 19 Mar 2020 12:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584646296; cv=none;
        d=google.com; s=arc-20160816;
        b=ayp+R903oV5NzWUn+DkPvDDBC2nsG91u8iMKtCZuAxIEXfvyJk8RyrpSSnL/1lfsMJ
         6u70cno6mJEafKpcvIVbWHC0YaLFXwAXijZocxUnHRm2STnQvV4T49VvaVTC9bS0qNo8
         nou3WNntRQCh9WDCo49P3eJhiDo2/eav8FPKyVDSr/ztBOPsuzdKtBZg3U9yRab834r1
         rPPL2wvSqLNnvbecZkgh5dRCdFJQ810K7mA2zDIb1KPNTMDMnE+7MeRkabJHzDGRZdQq
         R60acbkR8wbVrYoLOOfDoC4QGzRorX9tJ5XVKlyNffBVAcWewelxG5Qv1pRNl9F2Mjlx
         a0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=xHKVmnFNuFYcmRf8cANZycxNgE+97E91Cn5GFo9pj64=;
        b=ktuHSvKvGGlB4e6PLvI5uI7iGZbwWGfBpfxMIfpxyXEjrdWUzlQ93zgPRANokyf32N
         iI+YVI3ufMtIyRUtRLmDZECPWZxR/oONU1So32tm69WF/Y8AvCWwCetZeVBKNLeQVahN
         x5nN5x4icLn2+IlaZRDHyRLig9GRZGMG6cpgk37uI7x4smCUOlnWyVHpeZMqPAuviEQv
         qpill7gLkDtXEdU+XLS9G6FfQ3VA1ENweyK0PDiCRBLtdn2SOTN2iobVgDiBnFQbz3mX
         h+ziCPKgrQAcXYR+fM9D5drk25L/Em+GMIhTVoYRVXHDjLKyz5mRUUajXFBKXxM9JJpk
         4wTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id ck3si26860edb.5.2020.03.19.12.31.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2020 12:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02JJVZUG008422
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Mar 2020 20:31:35 +0100
Received: from [139.22.37.114] ([139.22.37.114])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02JJVZrQ021259;
	Thu, 19 Mar 2020 20:31:35 +0100
Subject: Re:
 mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb:do_dpkg_build
 Summary: There was 1 ERROR message shown, returning a non-zero exit code.
To: Parth Dode <dodecoder@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
 <e680e1f1-e368-5d84-8283-47ef95e3ad80@siemens.com>
 <0a8c17d5-087a-484d-b972-ae286795aafe@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <46d73528-b64b-9310-4a94-bab84dc7ace8@siemens.com>
Date: Thu, 19 Mar 2020 20:31:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0a8c17d5-087a-484d-b972-ae286795aafe@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 19.03.20 15:25, Parth Dode wrote:
>=20
>=20
> On Thursday, March 19, 2020 at 12:03:52 AM UTC+5:30, Jan Kiszka wrote:
>=20
>     On 18.03.20 02:49, Parth Dode wrote:
>      > ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2019.11.1-r0
>      > do_dpkg_build: Error executing a python function in
>     exec_python_func()
>      > autogenerated:
>      >
>      > The stack trace of python calls that resulted in this
>     exception/failure was:
>      > File: 'exec_python_func() autogenerated', lineno: 2, function:
>     <module>
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00001:
>      > =C2=A0=C2=A0*** 0002:do_dpkg_build(d)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00003:
>      > File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 130,
>      > function: do_dpkg_build
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00126:python do_dpkg_build() {
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00127:=C2=A0 =C2=A0 lock =3D bb.utils.loc=
kfile(d.getVar("REPO_ISAR_DIR") +
>      > "/isar.lock",
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00128:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared=
=3DTrue)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00129:=C2=A0 =C2=A0 bb.build.exec_func("d=
pkg_do_mounts", d)
>      > =C2=A0=C2=A0*** 0130:=C2=A0 =C2=A0 bb.build.exec_func("dpkg_runbui=
ld", d)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00131:=C2=A0 =C2=A0 bb.build.exec_func("d=
pkg_undo_mounts", d)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00132:=C2=A0 =C2=A0 bb.utils.unlockfile(l=
ock)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00133:}
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00134:
>      > File: '/work/isar/bitbake/lib/bb/build.py', lineno: 249,
>     function: exec_func
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00245:=C2=A0 =C2=A0 with bb.utils.fileslo=
cked(lockfiles):
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00246:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ispy=
thon:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00247:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 exec_func_python(func, d, runfile, cwd=3Dadir)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00248:=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>      > =C2=A0=C2=A0*** 0249:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exe=
c_func_shell(func, d, runfile, cwd=3Dadir)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00250:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00251:=C2=A0 =C2=A0 try:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00252:=C2=A0 =C2=A0 =C2=A0 =C2=A0 curcwd =
=3D os.getcwd()
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00253:=C2=A0 =C2=A0 except:
>      > File: '/work/isar/bitbake/lib/bb/build.py', lineno: 450, function:
>      > exec_func_shell
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00446:=C2=A0 =C2=A0 with open(fifopath, '=
r+b', buffering=3D0) as fifo:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00447:=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00448:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.debug(2, "Executing shell function %s"
>     % func)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00449:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 with open(os.devnull, 'r+') as stdin,
>     logfile:
>      > =C2=A0=C2=A0*** 0450:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.process.run(cmd, shell=3DFalse,
>     stdin=3Dstdin,
>      > log=3Dlogfile, extrafiles=3D[(fifo,readfifo)])
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00451:=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally=
:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00452:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.unlink(fifopath)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00453:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00454:=C2=A0 =C2=A0 bb.debug(2, "Shell fu=
nction %s finished" % func)
>      > File: '/work/isar/bitbake/lib/bb/process.py', lineno: 182,
>     function: run
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00178:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not =
stderr is None:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00179:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 stderr =3D stderr.decode("utf-8")
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00180:
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00181:=C2=A0 =C2=A0 if pipe.returncode !=
=3D 0:
>      > =C2=A0=C2=A0*** 0182:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ExecutionEr=
ror(cmd, pipe.returncode,
>     stdout,
>      > stderr)
>      > =C2=A0=C2=A0 =C2=A0 =C2=A00183:=C2=A0 =C2=A0 return stdout, stderr
>      > Exception: bb.process.ExecutionError: Execution of
>      >
>     '/work/build/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2019.11=
.1-r0/temp/run.dpkg_runbuild.9680'
>=20
>      > failed with exit code 2:
>      > dpkg-buildpackage: info: source package non-root-initramfs
>      > dpkg-buildpackage: info: source version 2019.11.1
>      > dpkg-buildpackage: info: source distribution UNRELEASED
>      > dpkg-buildpackage: info: source changed by Unknown maintainer
>      > <unk...@example.com <javascript:>>
>      > dpkg-architecture: warning: specified GNU system type
>     aarch64-linux-gnu
>      > does not match CC system type x86_64-linux-gnu, try setting a
>     correct CC
>      > environment variable
>      > =C2=A0=C2=A0dpkg-source -I --before-build .
>      >
>=20
>     Could you share the complete shell log? This is just the python
>     backtrace *after* the actual error.
>=20
>     Also please describe your build environment (native, VM, distro
>     version). Just rebuilt an image here from scratch, without issues.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
>=20
>=20
> __________________________________________________________
> Okay so my build environment-
> Kali OS- 8GB ram - i5
> I have it on dual boot with windows10
>=20
> It got built till 85% this time but an error got reduced.
> The shell log is quite big , I'll attach it in a text file below.
>=20
> Thank you for replying , also like you mentioned you built an image=20
> without any
>  =C2=A0issues , can you send me that prebuilt image for rpi4 ?
> Do let me know. I'll keep working on the error in that time.
>=20

I think I understand the root cause: You run the build as root, aren't=20
you? Try as normal user, then it should work.

I'll see that we will catch this in build-images.sh already.

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
jailhouse-dev/46d73528-b64b-9310-4a94-bab84dc7ace8%40siemens.com.
