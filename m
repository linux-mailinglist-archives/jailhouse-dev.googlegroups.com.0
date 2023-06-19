Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBKGRYGSAMGQESUQTM5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3A07359D1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 16:39:38 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2b46cfde570sf10963481fa.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 07:39:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1687185578; cv=pass;
        d=google.com; s=arc-20160816;
        b=ToQCQVBacbnBMWhuoetwWrWlWdYOSjukMBJzZl0aQOxwNBbdcpcCbz7MKpwKOqV6Xo
         /KFgYOYfKF6TV/w4mQCZNnI7K967o75NAnHM7OCiqx8wK0O1Ykq4xrMRr9V7mro0HdjY
         1wUEjEMH1POIYT9utKG2n7CzkqMnJz9SAb57d2oAV4QOsgBVG522vD+RmrfIm8pxWeF4
         obtYI0AQ5stDA+Tzk2yughZ+V0aQYIWO95yoLZQqAFxsYqSy3JIg25DSoFq0UlFK1CFT
         HRm9iK8ygtj3IVclWsfmE1jGfDExHTlpulQqE8JacjHJE9KlXrImOmLnMn+BAVIaMoo/
         ypsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=WDMNJk49AWfHruR/epjoqgg/KHynW7gYyGLD/aC8FAs=;
        b=CeLIIyD9nmY1hVYy0mtDzQzoTTZVeyiRqTWvYF4CJ3wEN2PPQ1oPVXl8EZuxnFzpdB
         a/Dtqxe7OLE/3SZvTo0OPHrrNyRBhh5E0WBhvHxP70UBgXXK+2ZXotSx11oAikbUK5oO
         QvS4UFp9x4CaVjlxQoQHryK+jIjRY0ljZBUnb82Z+P91MarHNnSyUrsZ3sb1IxSwyPvk
         tusWT+QHOyO3G3RY96tiBoP9LGbwGpRN+v7/28EJeH2IwA7mEG7GiMKWbjij0/ejal/P
         x02qabyrXLZYZGw/JJiPOcUmGWWKK0Vk0yA98+vaN1eph915PXM+ucPtWy3E7C13FDbl
         Vx4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pXy87ryM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687185578; x=1689777578;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WDMNJk49AWfHruR/epjoqgg/KHynW7gYyGLD/aC8FAs=;
        b=j2H0KRQasZrALD/Jc7/aHW4alUJqORIOs5vECQ1wVIuphAjgeNCLlkpu0dCAxppC2i
         zBiB78ydMFKXmev75fclCSu3c/yVbXEJhmfYfnZhLB2JG2/tI4l/qXxDUzLwFMlLG+vH
         4RWl4re/aSKdeqKcUsziRhQ2PmDO+5T/6OY6ecZdtWCEmDOhsikxCfOmC5GEjcRIC/oD
         fu9SqMSy2U5JfwC+mLVTCjaD2x3Tz66Pvk91nD7OHxIupxXhzM7FdAYAP07RGw5pj8jB
         5Pe5HTmSm5I14q6pAwNcAv7+bQajKlbFBZhS843k26aZOWtMo5lp/LCR/V8TT+/8/6CN
         Wfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687185578; x=1689777578;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDMNJk49AWfHruR/epjoqgg/KHynW7gYyGLD/aC8FAs=;
        b=LvSslG6bsSnMrRdSOrMYjlelcat5BohWvJQy65uy5+83WsClwdZSlqKONB5tu7OhjO
         0N9sdVlJdFBKoU+Yu3AOIKnXTAA9geBg6kF5EER5R5k0y/i2CicM1YJowfAKu2xpa95c
         7b6Rdv5399I1EUdsZi014SsZNMyhs23gP+1fYFnsT9v9CLFiq9eLlM17rGfKppDHHU07
         bAQxt+s6y592LNxdyb9NbD4EnN90wFyeJZWB5sqc/1q/8O+B5Uu6U/0JPJ1iBTxwAN+w
         rlbt+FTXDvCjb5tkyn0mX9Ytpth+M0AJq/9Fbz5XdkDLYQ+N61UkSLG7WNtP0gm7pK0n
         1zrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxICovrjlBiEhLZ6Wfj6UnMQOJtfyhUEI8fkZ+PBuAyBXuob6PZ
	oFMd/WWUTbgSCSKyIaISngA=
X-Google-Smtp-Source: ACHHUZ4sHEhpNutz8oMkwbyNebkYPv7OHQhWrDzE3JGgWpNrhXCD1gJZDDhtzlVHv0mGQ25MSFKyOQ==
X-Received: by 2002:a2e:9dca:0:b0:2b4:5a6f:efa2 with SMTP id x10-20020a2e9dca000000b002b45a6fefa2mr5511200ljj.27.1687185577481;
        Mon, 19 Jun 2023 07:39:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc28:0:b0:2af:3051:12ed with SMTP id b40-20020a2ebc28000000b002af305112edls59810ljf.1.-pod-prod-01-eu;
 Mon, 19 Jun 2023 07:39:35 -0700 (PDT)
X-Received: by 2002:a2e:3618:0:b0:2b4:62ad:3c49 with SMTP id d24-20020a2e3618000000b002b462ad3c49mr3923054lja.5.1687185575398;
        Mon, 19 Jun 2023 07:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687185575; cv=none;
        d=google.com; s=arc-20160816;
        b=Jzt63NxgkVih+I/yX2d4vgcxjBoMlGMjYSVEUJYXP1XnwulkhXk7UQEU9a+T2F7/aw
         E4Kv7G1kAwINoFbrVxCkylHhy8ZvRQKkCm43z4rtNkfOtE+/NahpOX3BkEi7P9Gr8dKy
         CG2M6hyG0WgF1mef7+sI8Ae3mDi0GFOlbYGdV4MGQII0ReaBCqq0kj473t48rs63kpsT
         eqvSjyB+z0WA9h4AUY72sZ7m0hI2fxmRqeZ1JtZSnt2sqmlsr1Wnc6hgejyNztJxzFIb
         lWCyT+C8qjFb/Q0RgIa3oGbMIM1c/KS4S/uB/hDw187oRKZmFqVQUe4xlQ52xxyXSl0A
         RMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Twy0V5D2NvYV+d7AXXQ7+15eQ4VEJ6H5/NBnwBObpe8=;
        b=T02a4MzH477AtVj7slEo2YIHkrpRTd+m3KRRuZogEEky4rvWuyqS5d7mXnAdJd+NXg
         pM+fDzoOPzFvbajdwpFx8qxwBe6Blu9CuNIcP+PUO4QUBZDHf4uXM4xHR9m91wN4VEHF
         Rx9igHvs/FUBjMwmbi/tpx7FBAphA5wWLBdgenY30It4JwHSGpEh5YIGcRjj3ov3rvwH
         m93PGQ0h9q/9/avb/6piIOnWC2KRL5jDwu0QYWXx9F2PAgw5cXeAjYViSP1jEgemMX4m
         pHb9vRYhGdgaw6DGtB7lqNm7YWWdo+Li5FaiTEqctYHR8lyK7s5p+lZvZmFlj3D5VKwo
         HOkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pXy87ryM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id j9-20020a2ea909000000b002b4735cbfb3si253431ljq.5.2023.06.19.07.39.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4QlC8Q3814zxwR;
	Mon, 19 Jun 2023 16:39:34 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:e089:ee05:7189:d907]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Jun
 2023 16:39:34 +0200
Message-ID: <c7787605-7a3f-b392-f7e8-9fd10170ab57@oth-regensburg.de>
Date: Mon, 19 Jun 2023 16:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
Content-Language: en-US
To: sai krishna Allu <saikrishna.allu@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
 <c7f684bd-ffcd-4ab2-076e-03dac205339e@oth-regensburg.de>
 <bdaa1499-4532-423f-a59d-812557f8162an@googlegroups.com>
 <0f73d59b-4574-17c9-e2da-68c52222be44@oth-regensburg.de>
 <60a06afd-9ddd-4304-aee5-d61d8ebeb141n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <60a06afd-9ddd-4304-aee5-d61d8ebeb141n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pXy87ryM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 19/06/2023 16:23, sai krishna Allu wrote:
> Hi Ralf,
>=20
> I have downloaded the master branch and given make and I have got the=20
> following error, I fixed the error with one of the reference link, but=20
> didn't find the /dev/jailhouse post installation
>=20
> ubuntu@ubuntu:~/jailhouse$ git branch
> * master
> ubuntu@ubuntu:~/jailhouse$make
> ...
> ...
> ...
>  =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ubuntu/jailhouse/configs/arm64/zynqm=
p-zcu102.o
>  =C2=A0 OBJCOPY /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.cell
>  =C2=A0 DTC =C2=A0 =C2=A0 /home/ubuntu/jailhouse/configs/arm64/dts/inmate=
-amd-seattle.dtb
> */home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54:=
=20
> error: no include path in which to search for=20
> dt-bindings/interrupt-controller/arm-gic.h
>  =C2=A0 =C2=A017 | #include <dt-bindings/interrupt-controller/arm-gic.h>*
>  =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^
> make[3]: *** [scripts/Makefile.lib:286:=20
> /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:519:=20
> /home/ubuntu/jailhouse/configs] Error 2
> make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Error 2
> make: *** [Makefile:40: modules] Error 2
> ubuntu@ubuntu:~/jailhouse$
>=20
> To fix the above I have followed the link=20
> https://bbs.csdn.net/topics/615205697 and changed as per instruction,=20
> even I followed the earlier build from this link only. but I was not=20
> able to build jailhouse-image.

Ok, perfect.

>=20
>=20
> DTC_INCLUDE =C2=A0 =C2=A0+=3D /usr/src/linux-headers-5.4.0-1069-raspi/inc=
lude added=20
> in the file -->/usr/src/linux-headers-5.4.0-1011-raspi/scripts/Makefile.l=
ib
>=20
> After that I am able to install,
>=20
> ubuntu@ubuntu:~/jailhouse$ sudo make install
>  =C2=A0 Building modules, stage 2.
>  =C2=A0 MODPOST 1 modules
>  =C2=A0 INSTALL /home/ubuntu/jailhouse/driver/jailhouse.ko
> At main.c:160:
> - SSL error:02001002:system library:fopen:No such file or directory:=20
> ../crypto/bio/bss_file.c:69
> - SSL error:2006D080:BIO routines:BIO_new_file:no such file:=20
> ../crypto/bio/bss_file.c:76
> sign-file: certs/signing_key.pem: No such file or directory
>  =C2=A0 DEPMOD =C2=A05.4.0-1069-raspi
> Warning: modules_install: missing 'System.map' file. Skipping depmod.
> install -m 644 hypervisor/jailhouse*.bin /lib/firmware
> install -d -m 755 /usr/local/libexec/jailhouse
> install -m 644 inmates/tools/arm64/*.bin /usr/local/libexec/jailhouse
> install jailhouse demos/ivshmem-demo /usr/local/sbin
> install jailhouse-config-collect jailhouse-cell-linux=20
> jailhouse-cell-stats jailhouse-config-create jailhouse-config-check=20
> jailhouse-hardware-check /usr/local/libexec/jailhouse
> install -d -m 755 /usr/local/share/jailhouse
> install -m 644 jailhouse-config-collect.tmpl root-cell-config.c.tmpl=20
> /usr/local/share/jailhouse
> install -m 644 jailhouse-completion.bash=20
> /usr/share/bash-completion/completions/jailhouse
> install -d -m 755 /usr/local/share/man/man8
> install -m 644 jailhouse.8 jailhouse-cell.8 jailhouse-enable.8=20
> /usr/local/share/man/man8
> python3 -m pip install --upgrade --force-reinstall =C2=A0.
> Processing /home/ubuntu/jailhouse
> Building wheels for collected packages: pyjailhouse
>  =C2=A0 Building wheel for pyjailhouse (setup.py) ... done
>  =C2=A0 Created wheel for pyjailhouse:=20
> filename=3Dpyjailhouse-0.12-py3-none-any.whl size=3D22795=20
> sha256=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf55021a3853bb
>  =C2=A0 Stored in directory:=20
> /tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/70/5f/41e4b42a3693d675b8bd9=
bcdcb021956f8d467789b3be58740
> Successfully built pyjailhouse
> Installing collected packages: pyjailhouse
> Successfully installed pyjailhouse-0.12
> ubuntu@ubuntu:~/jailhouse$
>=20
> *but not able to get jailhouse in dev file.*

Yeah, you need to load the jailhouse module first:

insmod drivers/jailhouse.ko
or
modprobe jailhouse

Thanks
   Ralf

>=20
> ubuntu@ubuntu:~/jailhouse$*ls -l /dev/jailhouse*
> *ls: cannot access '/dev/jailhouse': No such file or directory*
> ubuntu@ubuntu:~/jailhouse$
>=20
> Please suggest the correct way to install or anything else I need to=20
> change or need to follow different steps to fix this issue to get the=20
> installation success.
>=20
> Regards,
> Sai Krishna
>=20
> On Monday, June 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 Ralf Ramsauer wro=
te:
>=20
>=20
>=20
>     On 19/06/2023 12:23, sai krishna Allu wrote:
>      > Hi Ralf,
>      >
>      > I have attached the hypervisor.o and I have taken the dump of
>     that which
>      > is also attached too.
>      > I have below command to extract, let me know is it ok or not.
>      >
>      > ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d
>      > jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.txt
>      >
>      > ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep "ffffc0203820"
>      > *3338 =C2=A0 =C2=A0ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9400282 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
>      > ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
>      > =C2=A0 =C2=A0 =C2=A0 patch+0x218>
>      > =C2=A03334 =C2=A0 =C2=A0 ffffc0203810: =C2=A0 =C2=A0 =C2=A0 f94002=
82 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]
>      > =C2=A03335 =C2=A0 =C2=A0 ffffc0203814: =C2=A0 =C2=A0 =C2=A0 f94008=
42 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #16]
>      > =C2=A03336 =C2=A0 =C2=A0 ffffc0203818: =C2=A0 =C2=A0 =C2=A0 8a1300=
42 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x2, x2, x19
>      > =C2=A03337 =C2=A0 =C2=A0 ffffc020381c: =C2=A0 =C2=A0 =C2=A0 f90a40=
02 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 x2, [x0,
>     #5248]
>      > *=C2=A03338 =C2=A0 =C2=A0 ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9400=
282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
>      > =C2=A03339 =C2=A0 =C2=A0 ffffc0203824: =C2=A0 =C2=A0 =C2=A0 f9400c=
42 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #24]
>      > =C2=A03340 =C2=A0 =C2=A0 ffffc0203828: =C2=A0 =C2=A0 =C2=A0 8a1300=
53 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x19, x2, x19
>      > =C2=A03341 =C2=A0 =C2=A0 ffffc020382c: =C2=A0 =C2=A0 =C2=A0 528000=
22 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 w2, #0x1
>      >
>      > The instruction at=C2=A0ffffc0203820=C2=A0means it Load x2 from co=
ntents of
>     x20
>      > register.
>      > Please suggest how to fix this.
>=20
>     Keep calm, I'm still trying to figure out where the problem exactly i=
s.
>=20
>     Now I know the line of code, where the exception exactly happens. It'=
s
>     in hypervisor/arch/arm-common/psci.c:39
>=20
>     ldr x2, [x20] <- Here we likely load ctx->regs[2], and the only varia=
nt
>     how this could fail is that ctx points to somewhere. Here we're insid=
e
>     the routine psci_emulate_cpu_on, which shouldn't even be called when
>     enabling the hypervisor. I don't know yet what could be the issue.
>=20
>     Before we keep on debugging: I saw that you use Jailhouse v0.12.
>=20
>     Could you please switch to the master and/or next branch of jailhouse=
,
>     and see if the error still occurs there?
>=20
>     Thanks,
>     Ralf
>=20
>      >
>      > Regards,
>      > Sai Krishna
>      >
>      > On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:30 Ralf Ram=
sauer
>     wrote:
>      >
>      > Hi,
>      >
>      > On 15/06/2023 10:11, sai krishna Allu wrote:
>      > > Hi Team,
>      > >
>      > > I have=C2=A0Raspberry Pi 4, which is installed with Ubuntu 20.04=
.5 LTS
>      > 64 bit.
>      > > after loading the jailhouse.ko file, when I gave following
>      > command I am
>      > > getting the exception.
>      > >
>      > > ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
>      > configs/arm64/rpi4.cell
>      > >
>      > > Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
>      > > Code location: 0x0000ffffc0200800
>      > > Page pool usage after early setup: mem 39/994, remap 0/131072
>      > > Initializing processors:
>      > > =C2=A0CPU 0...
>      > > FATAL: Unhandled HYP exception: synchronous abort from EL2
>      >
>      > Synchronous abort from EL2 means that we have a fatal error inside
>      > Jailhouse (e.g., segfault).
>      >
>      > > =C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 0000ffffc020380c spsr: 800=
003c9   =20
>     EL2
>      >
>      > Could you please disassemble your hypervisor binary, and see
>     where the
>      > exception exactly occurs? Do this with:
>      >
>      > aarch64-objdump -d hypervisor/hypervisor.o
>      >
>      > And see what code executes behind 0x0000ffffc0203820. Alternativel=
y,
>      > you
>      > can also attach the hypervisor.o.
>      >
>      > Thanks,
>      > Ralf
>      >
>      > > =C2=A0sp: 0000ffffc021ee40 =C2=A0esr: 00 1 0000000
>      > > =C2=A0x0: 0000000084000000 =C2=A0 x1: 0000000000000008 =C2=A0 x2=
:
>     0000000080003580
>      > > =C2=A0x3: 0000ffffc020e170 =C2=A0 x4: 0000000000000014 =C2=A0 x5=
:
>     000003ffffffffff
>      > > =C2=A0x6: 0000000000000029 =C2=A0 x7: 0000ffffc0219d30 =C2=A0 x8=
:
>     000000000000002a
>      > > =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11=
:
>     0000000000000001
>      > > x12: 0000000000000015 =C2=A0x13: 0000000000000001 =C2=A0x14:
>     0000ffffc0219000
>      > > x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d1fc =C2=A0x17:
>     ffffbcae22826688
>      > > x18: 0000000000000001 =C2=A0x19: 0000ffffc021e000 =C2=A0x20:
>     0000ffffc0219000
>      > > x21: 0000ffffc0200000 =C2=A0x22: 0000ffffc0219000 =C2=A0x23:
>     0000000000000000
>      > > x24: 0000000000000001 =C2=A0x25: 0000ffffc021e000 =C2=A0x26:
>     0000ffffc021f000
>      > > x27: 0000ffffc020f000 =C2=A0x28: 0000ffffc0218000 =C2=A0x29:
>     0000ffffc021ee40
>      > >
>      > > Hypervisor stack before exception Stopping CPU 0 (Cell:
>      > "Raspberry-Pi4")
>      > >
>      > >
>      > > Please suggest how to fix this problem.
>      > >
>      > > Regards,
>      > > Sai Krishna
>      > >
>      > > --
>      > > You received this message because you are subscribed to the Goog=
le
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails from it=
,
>      > send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-96=
66-9093a0b76300n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76=
300n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/3e=
6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?u=
tm_medium=3Demail&utm_source=3Dfooter>>>.
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a5=
9d-812557f8162an%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f81=
62an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d=
61d8ebeb141n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c7787605-7a3f-b392-f7e8-9fd10170ab57%40oth-regensburg.de.
