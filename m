Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMNMY74AKGQEY75FQTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D62240C3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jul 2020 18:47:46 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id y12sf5487178lfh.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jul 2020 09:47:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595004466; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ee9d6czqDNeTj+hllsI+T8X/AhYY/9gw+hkk6Umxw1Nc+pMZWFoZ0ycBM8law4EZKp
         gBaA6iktuvKecfUjX2TeSDtV5ooK+m8EK4mfB2vq/V3E4siy2Z3Nt8VNDaTZNbUjFU6i
         MaEtTl6zDYd2+4+awd25e1LimUQrVkEWZD6sndbgqUXwRNGHwUprtTigcltQItbkdqv3
         Ba5gZk+vBV7b85pKqPEmGxl8427fnQvMiVY4S6AkzAdyUaZFsipapHPoMEiapEk2nP43
         I7S0lYhy9de/5kTzPFr6P7DHBZ2klhavG5XTDs98MTKP3tGMLa30VBY80CVf+LlyN+Kn
         g0wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=SBlhTdUb3Yvl86SBII8MYcv9eSGNePFa+20nBDifNFQ=;
        b=BK1RMapRayh3ya0W2zT1/yPNDBHJ+ekvpHkAlVOcpSArwNBxCj+xs55F2nbEcXGJsQ
         atblgGm5VsXHDpLtNZBaCQzlIxv1NQt08cXx6Y/HoKuPy+JEZ+B7CeNg6tI2VxJ+p1lY
         UgS4rqojmDNYewqyEj2yusrZ3/i9zZGXXPAYzkkZ8ByK6EdFKHGVNGU4ixVkMNb0EsE/
         qyIozpQJBKFIPsAgABt5gVb65S868O5ykVCEaYWwqnHri4OgVCCwU5olGLDoHtVDU5Uk
         xtbDSoZa5LHe7wsk0eWXbC3dDOk5rWSN6e6UKeFu6VVila7Ygb4aUXN0zKqHHkSWBuzy
         w3IQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SBlhTdUb3Yvl86SBII8MYcv9eSGNePFa+20nBDifNFQ=;
        b=ln+DIb+V7GlnmJKhWpwObisVccGg9/s0u6XkkckZQKn8znSU3m1vxZo5Mo6MT/bPBj
         ipG7djIJAzcK9/gMS50HbYqAdK9CPYFFJadfGwNzPZjhrejTLAb7ygLDCbKqMmf7kJCv
         WWGJ8bKihvVjMMcjEUi1tkhmx5i1jKix/E2kCdl2yitD6E4Ta5GhH8+w1RBmuy/NO27f
         7LzRohlYffXlg5UghTTsDxUFmmDhd1oBJoVh8z2rRUp0FxNwUt+fVEg+kLGymXIX6fpE
         Lgwr0bUtWhajcRfT+q9LHSR0WGk1VXWqoOr1K4RLsgkvauQmEK1Dm5eSWUFw84r8x9ZE
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SBlhTdUb3Yvl86SBII8MYcv9eSGNePFa+20nBDifNFQ=;
        b=PX/ndNzmEKCQneepAbhurVo2Y6ifvkDotNH5kD5Pwg23AIcPGt0LuE6BhifIwI9Pmq
         eQtWnSjF7FQwy/l75kQPrwO2A2fFo025OJVLy1CMuA6Thc8z7rXd6AGoLK6n494B6GZS
         qcZnWRdtPmpq5MS9ennAKiwp3kdEjDGtgAXCbveUn6pZLJ/+jF8PhSuPRhTNWuCpmDHR
         Bx6QJkmAAinUmAEx8BojLEtn8p/Hr0aN7LkgPP1wni8rRkqBa+EPEySzlZt/Byym3CWi
         M7YpRcsKUpDvCQ/bWKhfhJwsy3mVbzo1f+d2Sv455D73C/48TY/6yyfL+b78BQ3kwUsV
         FBEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531wxXnucXW77htV2si3h8gT0LiLit3nk4QwJU7VfUOkVq9pnbPB
	8norEZ9lSIGAsGx4rsDWOIA=
X-Google-Smtp-Source: ABdhPJw+DMvKzUNRpA9NbVLDk7Bqj8U7pk8dJaHR2J+0ofXsbTO63PBx4I4eQdhDlj4HSQjCq3wOlQ==
X-Received: by 2002:a2e:b4ed:: with SMTP id s13mr4965333ljm.296.1595004465965;
        Fri, 17 Jul 2020 09:47:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9dd2:: with SMTP id x18ls1469367ljj.5.gmail; Fri, 17 Jul
 2020 09:47:45 -0700 (PDT)
X-Received: by 2002:a05:651c:550:: with SMTP id q16mr4752376ljp.188.1595004465122;
        Fri, 17 Jul 2020 09:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595004465; cv=none;
        d=google.com; s=arc-20160816;
        b=gW+CiovFIgyCNS6qIuxWewnXnw35MFMictLOmBsxeIS62upuRcSpzcWSOFs4Stj/9M
         cDw/O7HmruzMayC0wxddhadg7HwkT75gYdvvJ6BViOEuwlx3x/ZXKOfpddUeJCrE7bgb
         LtU5tlIlxv4/fOZApQYIRj3aIfs5gXnH1suFigVAWuZ7/yRi172p3k48Fr8bQtM9MUH3
         wMbVj6vDkr3JIxcN1sWs8OeUJ+rVe4Lek7x+lktYePyawsMlckdk8qxtAOCbZw7qlZlh
         GTkkeYNZRi7ZEx0kuUlBC7eFxiOEhFHeiUt/IwIGgb1JWvUdstNre+/p6HDpkuUapfiJ
         iC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=nZT6yMmXavsUfpFo0P+Q3eU1rE8a+g2WAsuOgTz/+XY=;
        b=lHl3vGOcmD+FviQuuqxz5568N1ocpZY5cRCwbLfbp8aFXB8WWzksTxiEKWXnbcHCVN
         PnmlcOnNtVmAJh1dDUb/iI1OE95DELeAs2WwO06pogvpBKSuafbAoT5MWxInr2H5FnCi
         vVBT3TZzUpzC5Zvu0JGG6Cw5vrybHKS73cTKiFB+ddanAkt4CbAcRB4vZy+Cjay/smgm
         M2puF1oG3qeba4HuSkH6wEzexq/WCRhaf93JDvR3+e8uRk3P+PmM81znKFlL7uiT/+Ec
         iJE1YnFEGZPsbRWi91EJt6BPfIIMl5sTGgmqAW2Xg6+WYDnrjUVNmwFQ/OJML93Ypsgg
         DGuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e2si526622ljg.8.2020.07.17.09.47.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jul 2020 09:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06HGlh3G025593
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jul 2020 18:47:43 +0200
Received: from [167.87.7.111] ([167.87.7.111])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06HGlgAt009332;
	Fri, 17 Jul 2020 18:47:43 +0200
Subject: Re: error: implicit declaration of function 'cpu_down'
To: Parth Dode <dodecoder@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <375baf50-dcb2-486b-9ddf-3de231f22ea8o@googlegroups.com>
 <eb8f71d2-b861-4136-2968-fa2407c7207a@siemens.com>
 <5d346985-f668-4940-8f6f-520f72cf1842o@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f0166430-3052-799e-acb4-c01ecbf86b25@siemens.com>
Date: Fri, 17 Jul 2020 18:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d346985-f668-4940-8f6f-520f72cf1842o@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Please avoid top-posting.

On 17.07.20 14:15, Parth Dode wrote:
> How did you figure that out?
>=20

Figure out what exactly? Your kernel config? You have the yocto layers,=20
study the recipe that describes the kernel build, which config it is using.

Jan

>=20
> On Friday, July 17, 2020 at 11:37:23 AM UTC+5:30, Jan Kiszka wrote:
>=20
>     On 17.07.20 05:13, Parth Dode wrote:
>      > I am using=C2=A0 yocto to build jailhouse module in agl=C2=A0 =C2=
=A0for rpi4 .
>      > This is the error Im getting, please help figure out
>      >
>      > NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't
>     need to
>      > be rerun and 1 failed.
>      >
>      > Summary: 1 task failed:
>      >
>     /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailho=
use_git.bb:do_compile
>=20
>      > Summary: There were 2 WARNING messages shown.
>      > Summary: There were 2 ERROR messages shown, returning a non-zero
>     exit code.
>      > parth@Debian-95-stretch-64-minimal:~/meta-yocto-jailhouse-rpi4$
>      > x/9.3.0/include
>      >
>     -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi=
4-64/kernel-
>=20
>      > source/arch/arm64/include -I./arch/arm64/include/generated
>      > -I/home/parth/AGL/build-agl-jailhouse
>      > -rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include
>     -I./include
>      > -I/home/parth/AGL/build-ag
>      >
>     l-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/arch/ar=
m64/include/uapi
>=20
>      > -I./arch/ar
>      > m64/include/generated/uapi
>      >
>     -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi=
4
>      > -64/kernel-source/include/uapi -I./include/generated/uapi -include
>      > /home/parth/AGL/build-agl-jail
>      >
>     house-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include/linux=
/kconfig.h
>=20
>      > -D__KERNEL__ -mli
>      > ttle-endian -D__ASSEMBLY__ -fno-PIE -DCONFIG_AS_LSE=3D1 -mabi=3Dlp=
64
>      > -Wa,-gdwarf-2 -DMODULE -c -o /h
>      >
>     ome/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-li=
nux/jailhouse/0.12+gitAUTOIN
>=20
>      > C+4ce7658ddd-r0/git/driver/vpci_template.dtb.o
>      > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/r
>      >
>     aspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/=
driver/vpci_template.dtb.S
>=20
>      > | (cat /dev/null; ) >
>      >
>     /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-=
linux/
>=20
>      > jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/modules.order
>      > |
>      >
>     /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-=
linux/jailhouse/0.12+gitAU
>=20
>      > TOINC+4ce7658ddd-r0/git/driver/cell.c: In function
>      > 'jailhouse_cmd_cell_create':
>      > |
>      >
>     /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-=
linux/jailhouse/0.12+gitAU
>=20
>      > TOINC+4ce7658ddd-r0/git/driver/cell.c:31:26: error: implicit
>     declaration
>      > of function 'cpu_down' [
>      > -Werror=3Dimplicit-function-declaration]
>      > | 31 | #define remove_cpu(cpu) cpu_down(cpu)
>      > | | ^~~~~~~~
>      > |
>      >
>     /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-=
linux/jailhouse/0.12+gitAU
>=20
>      > TOINC+4ce7658ddd-r0/git/driver/cell.c:243:10: note: in expansion o=
f
>      > macro 'remove_cpu'
>      > | 243 | err =3D remove_cpu(cpu);
>      > | | ^~~~~~~~~~
>      > | if [ "-pg" =3D "-pg" ]; then if [
>      > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
>      >
>     _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysf=
s.o
>=20
>      > !=3D "scripts/mod/empty.o"
>      > ]; then ./scripts/recordmcount
>      > "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_6
>      >
>     4-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.=
o";
>=20
>      > fi; fi;
>      > | cc1: all warnings being treated as errors
>      > | make[5]: ***
>      >
>     [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4=
-64/kernel-so
>=20
>      > urce/scripts/Makefile.build:303:
>      > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64
>      >
>     -agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell.o]
>      > Error 1
>      > | make[5]: *** Waiting for unfinished jobs....
>      > | if [ "-pg" =3D "-pg" ]; then if [
>      > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
>      >
>     _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.=
o
>      > !=3D "scripts/mod/empty.o" ]
>      > ; then ./scripts/recordmcount
>      >
>     "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl=
-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o";
>=20
>      > fi; fi;
>      > | make[4]: ***
>      >
>     [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4=
-64/kernel-source/scripts/Makefile.build:544:
>=20
>      >
>     /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-=
linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver]
>=20
>      > Error 2
>      > | make[3]: ***
>      >
>     [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4=
-64/kernel-source/Makefile:1527:
>=20
>      >
>     _module_/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4=
_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git]
>=20
>      > Error 2
>      > | make[2]: *** [Makefile:146: sub-make] Error 2
>      > | make[1]: *** [Makefile:24: __sub-make] Error 2
>      > | make: *** [Makefile:40: modules] Error 2
>      > | WARNING:
>      >
>     /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-=
linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.24833:1
>=20
>      > exit 1 from 'exit 1'
>      > |
>      > ERROR: Task
>      >
>     (/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailh=
ouse_git.bb:do_compile)
>=20
>      > failed with exit code '1'
>      > NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't
>     need to
>      > be rerun and 1 failed.
>      >
>      > Summary: 1 task failed:
>      >
>     /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailho=
use_git.bb:do_compile
>=20
>      > Summary: There were 2 WARNING messages shown.
>      > Summary: There were 2 ERROR messages shown, returning a non-zero
>     exit code.
>      >
>=20
>     I suspect your target kernel lacks CONFIG_HOTPLUG_CPU=3Dy. See
>     jailhouse-images for a know-to-work reference config.
>=20
>     Also note that you will need an ATF-based boot on the RPi4, just in
>     case
>     you didn't spot that dependency yet. Again, jailhouse-images is the
>     reference.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/5d346985-f668-4940-8f6f-5=
20f72cf1842o%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/5d346985-f668-4940-8f6f-=
520f72cf1842o%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f0166430-3052-799e-acb4-c01ecbf86b25%40siemens.com.
