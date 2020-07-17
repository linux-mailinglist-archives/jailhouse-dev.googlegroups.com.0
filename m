Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG4AYX4AKGQESPLN3RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5A22335D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jul 2020 08:07:23 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id l5sf8094683wml.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jul 2020 23:07:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594966043; cv=pass;
        d=google.com; s=arc-20160816;
        b=S3JMeKvfSOSmdaoK0XQNFb89XiId4imOCbtq2EL2r9Q4toadfe4IRUGBcQyEVxqi82
         eflnJwhWgrOFV9hsby6D4r830WYaPJtOkwVzdP9JVds0qX9hWMEcV25Yumx+H/gohuZr
         adVctefV3gyMx4Lxo/wNnya5B7OWTVGHVaSfiVmeGLCdjnCD2OQ/PkYSZr9tFRfydOnY
         V6JrRU8XDwdQiWE7OFegbUofGsLQJZ1bL7dx9no23hfNSLc673xZKpUmkK+atX5+f0kG
         pnaeJY6669eJftPtBmr2aL8W+qING0vL5uGWmzj/IHEfBzOuEoSR9cHbKMKRJsydVmLK
         1EnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=z1bWMJyFKTpQaUtNNvdv+1fTlmLIUNmjIykHkq8w0so=;
        b=HNaslDFHNBNgbw6RXBLA1TLESOrurPcSr8E7FUocbIl4yFcYEjY1XpxdfaoibZvJh5
         2Hsyb9Rdmf3jitVemCPdbfHd10ZR8mB3kdM8Zktiw4DDr/H3aRSKL0Rh8vRHM4GQjgjm
         zNA/nJSdn72ieR/jCmm9/IfSX9ddBzXRUaIRE35PYSbqdhnUcTiFiU+2aZ0pAiYCUWFK
         VxUNTpWDZzwJiCdX6jUO9yH5iqhqY7H+Dc0SQyE1v16Vy/7zI+j8u7TczJ+dCmlWtUzY
         eqmLzb9O9r8+FN9WlfgdE5bJfW6UmA4zwVxlZA0tmIunoUgAmQa7C1U6805dICsfWMzX
         Dtkw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z1bWMJyFKTpQaUtNNvdv+1fTlmLIUNmjIykHkq8w0so=;
        b=iOIea4uesHs7ILWktoQGHDU2u6wQ7qdhnxziIZEkoWbCHeSeD5D+tfHiLmqmx5HW2K
         d7P7BHqkRNY0nxMMx/QDN0tH3C1oKPKvWF4whvJG5OMsBn4eH4xasX0wyC0Dm5eUq7Uq
         +laCVOVNFVVJbtnV7fsWJmKSj2ZvtecuIFcup7uLy5m31e1jk9kMZ1YxbXWxCdxQDzQR
         Ef7HO7gLW61qKmzot9LHaASQkcZp8J6pK7ddLDX3nOd3dZ/8GXuM9WppR0fmrmGUerqd
         dpE3LC48SenOAir78n+SMNnm1tOfZacXuVMdIrxxNPpSyzesywsEJbIIwO0zti7f39WK
         9Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z1bWMJyFKTpQaUtNNvdv+1fTlmLIUNmjIykHkq8w0so=;
        b=uGQfp9/V7XOuOFWaLZnjNjdxnMCLSjoobciiGKIXsARHRYf0LMNAQQDKDrfveXIJAo
         dhumnekm6cMkGVNCm9WX4TDhNSgL0GclS6iy4zicxsYmJqRhmp7DsKx48CcYa/lkZ8d1
         iuKHt/wCkuiYpD2k7AFodVCIK62JwkPzkg72DX/bRt33+S6o70zgBRXRDGxmShfbLORG
         6Tvkubrqs+bCBWh0sFC0DmRIN5CIfVYKJ/6MQLl6STxydeQbo1qMHz3fTOdI7S4Gi7FV
         Bg3GB7qlpaV7DEPTOdhalvXIH0ySYKa70BuypgoPORomGlXzilM21k6MQKzJUsq5f5KU
         PBqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533LFIcSc6FtO2sHL6nJ8VPaey+vHq7FRJ+VJVq2kCqnYxSF9qY+
	vrLyFpOGb4CKmk51/NE8q/w=
X-Google-Smtp-Source: ABdhPJzChxrm6kF/gM+N3na3wst3LunmMV+NsuGm1kQq+F42TOKK/VnR0ihdpuncOoqgswlozxuLNw==
X-Received: by 2002:a05:600c:2144:: with SMTP id v4mr8111643wml.128.1594966043214;
        Thu, 16 Jul 2020 23:07:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2049:: with SMTP id g70ls3172434wmg.0.gmail; Thu, 16 Jul
 2020 23:07:22 -0700 (PDT)
X-Received: by 2002:a1c:4183:: with SMTP id o125mr7536998wma.101.1594966042484;
        Thu, 16 Jul 2020 23:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594966042; cv=none;
        d=google.com; s=arc-20160816;
        b=z816XT/iLUBEUqSG9AM/mSagsZFqVvTD/s6BCDMm5QVJd7NzGBOvYWRRXNKQUE4M4T
         EzQHSAwgAhGEr7zVT57jNRJOChxonSM9/l4X6nfnIsckqdGl9Ef4R7GcEugyfcSFkPhq
         sHAh8jEpMgC/NE7wRbxwiwo9LMq8sO/tqX+jel5ds5/IOUt5zlInDh5WseSvutdC7Uz0
         ZSgFUFVxesmbbwC/XaXzLUOr3oXzRgCmc2Zpa0oUV6MNlwDZtJXM+a3LdqYxvZuC7J2H
         t9rQGYhHTWFIi3Z9jI7LgSXk4tiOIK5DMLnuSY5Bu3SuKKS3DY2whHPz5m/uypfRDRWA
         uh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2+vDxlHmPGiiNJ/qurtap50TNzCr5RxahH61eErU8AA=;
        b=CSykV2Kf/2s1/zQ9kvgb9nmHxs8JMSjHpQA/vu5VtzaIC9NJURzOdJ7SxKb7Uq11dJ
         0p3fL//RDsScJos1WvY3myoaDpeeUiOs3mbdkKD2henIE2m2lAJB0jcthNfF1jq4oEkZ
         pWXSHmhEzqY4Vggdd67BT+kdgIk9EU2cg6J/jUWsHM4u7PckcS1oVqYAjB7CYJxlWzJn
         0wE41aM1OOkxbH9v93bDm2atSGmjmUllHXu0JTyQi66oQGPFjFspv4ST9JYjYFHLEK7B
         JLLacAlozPLUMB53O1//aMdUaPVeT5CqOx8ZOuULJC5+AegFQ6WUyTYzActsaoN0sRjq
         2gdw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u18si5812wrb.5.2020.07.16.23.07.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jul 2020 23:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06H67Lus021634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jul 2020 08:07:21 +0200
Received: from [167.87.7.111] ([167.87.7.111])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06H67KTk004805;
	Fri, 17 Jul 2020 08:07:21 +0200
Subject: Re: error: implicit declaration of function 'cpu_down'
To: Parth Dode <dodecoder@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <375baf50-dcb2-486b-9ddf-3de231f22ea8o@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eb8f71d2-b861-4136-2968-fa2407c7207a@siemens.com>
Date: Fri, 17 Jul 2020 08:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <375baf50-dcb2-486b-9ddf-3de231f22ea8o@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 17.07.20 05:13, Parth Dode wrote:
> I am using=C2=A0 yocto to build jailhouse module in agl=C2=A0 =C2=A0for r=
pi4 .
> This is the error Im getting, please help figure out
>=20
> NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to=20
> be rerun and 1 failed.
>=20
> Summary: 1 task failed:
> /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_=
git.bb:do_compile
> Summary: There were 2 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
> parth@Debian-95-stretch-64-minimal:~/meta-yocto-jailhouse-rpi4$
> x/9.3.0/include=20
> -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64=
/kernel-
> source/arch/arm64/include -I./arch/arm64/include/generated=20
> -I/home/parth/AGL/build-agl-jailhouse
> -rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include -I./include=20
> -I/home/parth/AGL/build-ag
> l-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/arch/arm64/=
include/uapi=20
> -I./arch/ar
> m64/include/generated/uapi=20
> -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4
> -64/kernel-source/include/uapi -I./include/generated/uapi -include=20
> /home/parth/AGL/build-agl-jail
> house-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include/linux/kco=
nfig.h=20
> -D__KERNEL__ -mli
> ttle-endian -D__ASSEMBLY__ -fno-PIE -DCONFIG_AS_LSE=3D1 -mabi=3Dlp64=20
> -Wa,-gdwarf-2 -DMODULE -c -o /h
> ome/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/=
jailhouse/0.12+gitAUTOIN
> C+4ce7658ddd-r0/git/driver/vpci_template.dtb.o=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/r
> aspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driv=
er/vpci_template.dtb.S
> | (cat /dev/null; ) >=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linu=
x/
> jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/modules.order
> |=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linu=
x/jailhouse/0.12+gitAU
> TOINC+4ce7658ddd-r0/git/driver/cell.c: In function=20
> 'jailhouse_cmd_cell_create':
> |=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linu=
x/jailhouse/0.12+gitAU
> TOINC+4ce7658ddd-r0/git/driver/cell.c:31:26: error: implicit declaration=
=20
> of function 'cpu_down' [
> -Werror=3Dimplicit-function-declaration]
> | 31 | #define remove_cpu(cpu) cpu_down(cpu)
> | | ^~~~~~~~
> |=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linu=
x/jailhouse/0.12+gitAU
> TOINC+4ce7658ddd-r0/git/driver/cell.c:243:10: note: in expansion of=20
> macro 'remove_cpu'
> | 243 | err =3D remove_cpu(cpu);
> | | ^~~~~~~~~~
> | if [ "-pg" =3D "-pg" ]; then if [=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
> _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o=
=20
> !=3D "scripts/mod/empty.o"
> ]; then ./scripts/recordmcount=20
> "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_6
> 4-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o";=
=20
> fi; fi;
> | cc1: all warnings being treated as errors
> | make[5]: ***=20
> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/=
kernel-so
> urce/scripts/Makefile.build:303:=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64
> -agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell.o]=20
> Error 1
> | make[5]: *** Waiting for unfinished jobs....
> | if [ "-pg" =3D "-pg" ]; then if [=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
> _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o=20
> !=3D "scripts/mod/empty.o" ]
> ; then ./scripts/recordmcount=20
> "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-lin=
ux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o";=20
> fi; fi;
> | make[4]: ***=20
> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/=
kernel-source/scripts/Makefile.build:544:=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linu=
x/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver]=20
> Error 2
> | make[3]: ***=20
> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/=
kernel-source/Makefile:1527:=20
> _module_/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-=
agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git]=20
> Error 2
> | make[2]: *** [Makefile:146: sub-make] Error 2
> | make[1]: *** [Makefile:24: __sub-make] Error 2
> | make: *** [Makefile:40: modules] Error 2
> | WARNING:=20
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linu=
x/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.24833:1=20
> exit 1 from 'exit 1'
> |
> ERROR: Task=20
> (/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse=
_git.bb:do_compile)=20
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to=20
> be rerun and 1 failed.
>=20
> Summary: 1 task failed:
> /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_=
git.bb:do_compile
> Summary: There were 2 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>=20

I suspect your target kernel lacks CONFIG_HOTPLUG_CPU=3Dy. See=20
jailhouse-images for a know-to-work reference config.

Also note that you will need an ATF-based boot on the RPi4, just in case=20
you didn't spot that dependency yet. Again, jailhouse-images is the=20
reference.

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
jailhouse-dev/eb8f71d2-b861-4136-2968-fa2407c7207a%40siemens.com.
