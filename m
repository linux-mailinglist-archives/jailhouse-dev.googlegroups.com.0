Return-Path: <jailhouse-dev+bncBCY3B2PSYIBBBS4K4DVAKGQE53X2CIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFD9109D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Aug 2019 15:46:52 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id b20sf1451289ljj.17
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Aug 2019 06:46:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566049612; cv=pass;
        d=google.com; s=arc-20160816;
        b=Och3sdpB/iFG0X7gM1R3UOnEXVkqEFnbTTcPTfadZSargtXzu87PCQ3wYe0NXql2we
         6wJiEhySz3slEpN63PK3aS5L2R+EeAUuOeXC8MaYFl9ihD04gSXMaHCnU05yTSR4O/S/
         il+AYurD7FYN/PwA0VxxEFb7qqt0TA8cBB0nzlemTK6xeZLUCIG04EbcNBuQpYSnLu7j
         QzXL9Uyg44yaQp4JIjN+yRS7QWBcsyxt8Dqcv76JLyZ2Ng3EBY93WdMifJdOBHRCObdv
         9aP//KFPdB6FuZTdzgZgw/SD4kQwWXl/n3nTMeOCiLH/W68yiMmePnyfSqj+H+1vKFME
         1Lqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=9wX8biWbVp5EnIiHy0u4koURBoylITA+jieUMIk2s5o=;
        b=XkBO4KumJGxNNhjdV29MyITKRYoNrRf22KqyyDYallaE+4dG8y/zWxTmuRUHi42Wgl
         7CDrbkcFZrUQCn6cnARO8XOf95DCDLwSiQQkmkHWhuI4d+EmbsKjldqjxYpw8aM6+uYM
         6bfDq+uYQG3TYbK5KW+1bqfIigOequtSkl0RCOiaeMLi0K2b7OlanS6EYPDVXaWdP/q/
         DGAYf25SkShTHoNKVE5AVHdBh8B2OolqcR9lvSOhBfKQyvNUMkz7ZGGYjKpdAfNdb8Kh
         AZnToSb8nfbMLKpmqnuXIEDks20EUd888WW/mrgFZO+37QSshfoTqZyDLqJk/e3lW0x1
         4kxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WIePbk5m;
       spf=pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9wX8biWbVp5EnIiHy0u4koURBoylITA+jieUMIk2s5o=;
        b=VH2KbkKgOR2h/GYun5mhuzpHydz9Jjm8ROmeY4TwUs+FLgkeo5BJ4Lk/+PG7hc9Fos
         IJExJIYOQLi4HsdmdLbkUhnbtMlc9WMxaBp2k6xqk4pjIFsjwvTMPI1MzJBSvfTDyZhx
         3ExPsg/lkLMA7E4ET9TKFMQ/F1Hovvz/nLt8fwLoV22DbyJgPd6lwN+VkoszXjoLrzUw
         yF9TC1Oc/jQhaHkCLxVZ3nttlsiF+t96D84P8CONs73KIel/tPDmKyV8jPgj6ESf8Ydj
         GUZw5iPXoxAl7LssqYEFmYddt8vnmlc/LWhye9z7k/X3z0TlcfYG6N68camG1NIXjDA7
         /+DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9wX8biWbVp5EnIiHy0u4koURBoylITA+jieUMIk2s5o=;
        b=a1nQ29sCa31Jkz1u3jjoZts9ukKskTsh+/P3LZr8+gQPasloA+j0OhjCAY5HCQV/+m
         QlO3y+JgIr655NDxCKVaG8QHA0NsaGqGD2yWQyGFGrPy5bXhf6Qr2q5hcLenGJkWDdT7
         32L4xo3jrIcPPyZjdu5HuFsbI0Trd028U9vjXitid4MAyrYvScaQ0ngllVl+zV4pyptY
         dQdVyK1ZDvUtrnpUlSzs+Bwyiu5KNtd+221o1giYyC7pOZZZfxerCcl6BKWQHjGYMlgs
         njD3wig/S64fbKY3U0TAsO9A0Un2xuTQPZxpfDqXQcawBj91k7csMmxxMBI5S5lPARjH
         MF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9wX8biWbVp5EnIiHy0u4koURBoylITA+jieUMIk2s5o=;
        b=L2BCioZTPYKqNjWlhhl73J3vLV5I7oBoWurrcBa5QcLL58KrjZUhfgVlcIMv2bM+By
         PUJ/RDXjyfPb60aBQeKxQlrOmfMu6KEojNRHYOLDlFkSp9amwCpCzWtDvTQj47v8Kx9b
         WginWXGW/BrPWHEZB4pp8D5Iqh1Ow+VIsQD659F4lMbvcNWbgQ5uQEZOkz/HTPKY7i0B
         dcEkkcwOJLyAacmjA6m9jU9sgjWLtUdgGw2f+BhV40Ne0PCmITjOyTlBg9ZVlHupVMMf
         A6MCfITfzhwN4YyF71su5OpYS2UVJETj2pkBEG6p8crkr3r1xTO19bOZxNe0Lfv4wFKv
         OkEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVRDBBprKF3AyoWtY6MbNaxlvS5sAjB+sjvuvLSa00cFIeE8k2m
	SEtbS95Ndib6PkqdG/lmOCw=
X-Google-Smtp-Source: APXvYqwlPHGwTsdpri0D1n5OOPzOmhvxI0rJdrbUq1QjPQiebCg98BhKIi2M6iYNlYyt1ulZeJnj/w==
X-Received: by 2002:a2e:9b13:: with SMTP id u19mr3421508lji.40.1566049611976;
        Sat, 17 Aug 2019 06:46:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3608:: with SMTP id d8ls1281093lja.0.gmail; Sat, 17 Aug
 2019 06:46:51 -0700 (PDT)
X-Received: by 2002:a2e:9b02:: with SMTP id u2mr7047142lji.219.1566049611240;
        Sat, 17 Aug 2019 06:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566049611; cv=none;
        d=google.com; s=arc-20160816;
        b=MfcEJJZTAoVq1X0br3IBRlI2D8PTJMyiWNDmKbS/SfjB8KvNsFZ2jCMG4TT03PUiSf
         VjnGafmPSR1RDR++OWXCft/bR/MbmeFc+14s/GLZzSNiHKH8oowQYnA8SqljzHR1yZVY
         UaqaHLI5JC/BcZSZY/g/CUDn5FuHiJ0HnHDkKlSHfANacqGl3G/zxUT1r+TXCebN0Ig+
         MzzkteTyhgQaAEMuUX4Mi+8bvQ7CdBKQSBCIwvaj6Cn8ecc8qQXE45tRzH4oiYMDYEjZ
         PazCRF3CttGqUBbmOOUNoY+54wYrK680ccPu3vT5GaYB6VHXcWqsso5zpxrypvtnGMSf
         b4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rn2CjCl3XWuANlgjl99qGK006isz3lm9VKVB4xyCJPw=;
        b=LZw+Hi4qy6xNw5oMyD/fk+/znu5J+aTMtnvSEOjWAnRT4qJC3IIUeUPnn0hlk4Re4t
         XeHXGOtu9ca+aCN0WWbOGyUg1Ja91pb9pJMLr19/VpeSVXL32ug7nxE/G9t2uYSt3TBQ
         X3UR2JAzPjld/48aY0BwAjh2ncGssu246w5cuJAW+hVvB6K7C1ylQnkxVU78kt53XQhV
         GeH1C9wpfHQGRG1sJSrh/zeuuBtlXJoKlLIU/mufDYleuS0eQ9nsed49TlabJOQ7Lh/I
         6vkjgJjuwCY61Xf/ZjikzEHVrRWp6j1C+qze8plM+gkn1YwrwF4Iu6VO1hgH8k/wcYlW
         2QOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WIePbk5m;
       spf=pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com. [2a00:1450:4864:20::541])
        by gmr-mx.google.com with ESMTPS id f26si332986lfp.5.2019.08.17.06.46.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Aug 2019 06:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) client-ip=2a00:1450:4864:20::541;
Received: by mail-ed1-x541.google.com with SMTP id p28so7442588edi.3
        for <jailhouse-dev@googlegroups.com>; Sat, 17 Aug 2019 06:46:51 -0700 (PDT)
X-Received: by 2002:a17:906:198e:: with SMTP id g14mr13309231ejd.158.1566049609623;
 Sat, 17 Aug 2019 06:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
 <a17c3513-f573-84ad-5d4e-5027121e51b5@siemens.com> <CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VDQ@mail.gmail.com>
 <20190814085057.43ce8c63@md1za8fc.ad001.siemens.net> <f4eb47c2-7a86-3e6f-8ae5-8e84ed8b70d3@retotech.se>
In-Reply-To: <f4eb47c2-7a86-3e6f-8ae5-8e84ed8b70d3@retotech.se>
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Sat, 17 Aug 2019 16:46:37 +0300
Message-ID: <CABPcKDN5izWjNsHsij8eK-3BBF5ch34peerH4EBzD8yMO-dcDw@mail.gmail.com>
Subject: Re: Orange Pi Zero Jailhouse Yocto Integration
To: Ola Redell <ola.redell@retotech.se>
Cc: Henning Schild <henning.schild@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000aead540590505610"
X-Original-Sender: bostancioglucevat@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=WIePbk5m;       spf=pass
 (google.com: domain of bostancioglucevat@gmail.com designates
 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000aead540590505610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, it's been a 3 days and i am still trying to compile, i changed yocto
versions, gcc compiler versions, external toolchain, checked against debian
build etc. but nothing worked.

i cant understand why this is compiled in jailhouse-images setup and not
compiling under this setup ?

my setup is:
https://github.com/cevatbostancioglu/meta-orangepi/blob/dev/yocto/meta-oran=
gepi/conf/machine/orange-pi-zero.conf

my latest error is:
Short log:


*arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and -mfloat-abi=3Dhard=
 may
not be used together*

Long Log:
DEBUG: Executing shell function do_compile
NOTE: make -j 8
KERNEL_SRC=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk-shared/orange-pi-zero/kernel-source
V=3D0 CC=3Darm-oe-linux-gnueabi-gcc  -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard
-mcpu=3Dcortex-a7
--sysroot=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/r=
ecipe-sysroot
CROSS_COMPILE=3Darm-oe-linux-gnueabi-
KDIR=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-sha=
red/orange-pi-zero/kernel-build-artifacts
  CHK
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/
config.mk
  CHK
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/version.h
  UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/
config.mk
  UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/version.h
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../alloc.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../cmdline.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../printk.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../string.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/asm-defines.s
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi-gic-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../uart-8250.o
  CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/c=
ell.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/gic-v2.o

*arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and -mfloat-abi=3Dhard=
 may
not be used together*make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/or=
ange-pi-zero/kernel-source/scripts/Makefile.build:314:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/ce=
ll.o]
Error 1
make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/or=
ange-pi-zero/kernel-source/scripts/Makefile.build:573:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver]
Error 2
make[4]: *** Waiting for unfinished jobs....
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi-linux-demo.o
  LDS
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/hypervisor.lds
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/gic-v3.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/gic.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/mem.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/printk.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1e-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/timer.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1e-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-hscif.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-imx.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/printk.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1e.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-mvebu.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-pl011.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1h-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-scifa.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1h-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/paging.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/control.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-xuartps.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1h.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/lib.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/mmio.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1m-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1m-uart-demo.o
  AS
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/header.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1m.o
  LDS
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/l=
ib/arm/inmate.lds
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/jetson-tk1-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/pci.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/jetson-tk1-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/jetson-tk1.o
  AR
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/lib.a
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/orangepi0-gic-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/gic-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/ivshmem.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/orangepi0-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
tools/arm/linux-loader.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/orangepi0.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/uart.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-bananapi.dtb
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/gic-demo-linked.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-emtrion-emconrzg1e.dtb
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
tools/arm/linux-loader-linked.o
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/uart-demo-linked.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/d=
emos/arm/gic-demo.bin
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/t=
ools/arm/linux-loader.bin
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/d=
emos/arm/uart-demo.bin
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-jetson-tk1.dtb
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/uart-8250.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-orangepi0.dtb
  GEN
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/arch/arm/include/generated/asm/asm-defines.h
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi-gic-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/control.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/dbg-write.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/gic-v2.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1e-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/gic-v3.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1e.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1h-uart-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/irqchip.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1h.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1m-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/ivshmem.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1m-uart-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/lib.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1m.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/mmu_cell.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/jetson-tk1-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/jetson-tk1-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/paging.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/jetson-tk1.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/orangepi0-gic-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/orangepi0-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/pci.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/psci.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/orangepi0.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/smccc.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-hscif.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-imx.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-mvebu.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-pl011.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-scifa.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-xuartps.o
  AS
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/caches.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/control.o
  AS
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/entry.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/lib.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/mmio.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/mmu_hyp.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/traps.o
  AR
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/lib.a
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/hypervisor.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/jailhouse.bin
make[3]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/or=
ange-pi-zero/kernel-source/Makefile:1503:
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/or=
ange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git]
Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.
ERROR: Execution of
'/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/temp/run.do_=
compile.28600'
failed with exit code 1:
  CHK
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/
config.mk
  CHK
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/version.h
  UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/
config.mk
  UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/include/generated/version.h
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../alloc.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../cmdline.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../printk.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../string.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/asm-defines.s
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi-gic-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/../uart-8250.o
  CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/c=
ell.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/gic-v2.o
arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and -mfloat-abi=3Dhard =
may
not be used together
make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/or=
ange-pi-zero/kernel-source/scripts/Makefile.build:314:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/ce=
ll.o]
Error 1
make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/or=
ange-pi-zero/kernel-source/scripts/Makefile.build:573:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver]
Error 2
make[4]: *** Waiting for unfinished jobs....
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi-linux-demo.o
  LDS
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/hypervisor.lds
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/gic-v3.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/gic.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/mem.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/bananapi.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/printk.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1e-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/timer.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1e-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-hscif.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-imx.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/printk.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1e.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-mvebu.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-pl011.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1h-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-scifa.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1h-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/paging.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/control.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart-xuartps.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1h.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/lib.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/../arm-common/uart.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/mmio.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1m-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1m-uart-demo.o
  AS
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/header.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/emtrion-rzg1m.o
  LDS
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/l=
ib/arm/inmate.lds
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/jetson-tk1-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/pci.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/jetson-tk1-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/jetson-tk1.o
  AR
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
lib/arm/lib.a
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/orangepi0-gic-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/gic-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/ivshmem.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/orangepi0-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
tools/arm/linux-loader.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/orangepi0.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/uart.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-bananapi.dtb
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/gic-demo-linked.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-emtrion-emconrzg1e.dtb
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
tools/arm/linux-loader-linked.o
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/=
demos/arm/uart-demo-linked.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/d=
emos/arm/gic-demo.bin
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/t=
ools/arm/linux-loader.bin
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/d=
emos/arm/uart-demo.bin
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-jetson-tk1.dtb
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/uart-8250.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/dts/inmate-orangepi0.dtb
  GEN
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/arch/arm/include/generated/asm/asm-defines.h
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi-gic-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/control.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/dbg-write.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/gic-v2.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/bananapi.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1e-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/gic-v3.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1e.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1h-uart-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/irqchip.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1h.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1m-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/ivshmem.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1m-uart-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/lib.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1m.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/mmu_cell.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/jetson-tk1-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/jetson-tk1-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/paging.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/jetson-tk1.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/orangepi0-gic-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/orangepi0-linux-demo.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/pci.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/psci.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/orangepi0.cell
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/smccc.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-hscif.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-imx.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-mvebu.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-pl011.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-scifa.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/../arm-common/uart-xuartps.o
  AS
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/caches.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/control.o
  AS
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/entry.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/lib.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/mmio.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/mmu_hyp.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/traps.o
  AR
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/arch/arm/lib.a
  LD
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervis=
or/hypervisor.o
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/jailhouse.bin
make[3]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/or=
ange-pi-zero/kernel-source/Makefile:1503:
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/or=
ange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git]
Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
WARNING: exit code 1 from a shell command.


Ola Redell <ola.redell@retotech.se>, 14 A=C4=9Fu 2019 =C3=87ar, 10:38 tarih=
inde =C5=9Funu
yazd=C4=B1:

> Hi all,
> There is also an imx8-dev branch in
> bitbucket.org/retotech/meta-jailhouse.git with a jailhouse 0.10 recipe
> and much of Henning's changes. I will look into updating master to build
> 0.11 and test it for BananaPi at least.
>
> Ola
>
> On 8/14/19 8:50 AM, Henning Schild wrote:
> > Hi,
> >
> > i did not look into the problem yet. But my jailhouse layer for yocto
> > is on github.
> >
> > https://github.com/henning-schild-work/meta-jailhouse
> >
> > Have a look at the branch henning/staging for patches to get a more
> > recent jailhouse to work.
> >
> > Henning
> >
> > Am Tue, 13 Aug 2019 14:31:36 +0300
> > schrieb Cevat Bostanc=C4=B1o=C4=9Flu <bostancioglucevat@gmail.com>:
> >
> >> Hello,
> >> Thanks for the fast reply,
> >>
> >> I tried with 9f233898917f8c1141132606f2f2c624405d8c81 commit and also
> >> latest commit, still have same problem.
> >>
> >> I will be appreciated if you guys can provide/help with examples.
> >>
> >> Thanks,
> >> Cevat
> >>
> >> Jan Kiszka <jan.kiszka@siemens.com>, 13 A=C4=9Fu 2019 Sal, 14:09 tarih=
inde
> >> =C5=9Funu yazd=C4=B1:
> >>
> >>> On 13.08.19 12:39, Cevat Bostanc=C4=B1o=C4=9Flu wrote:
> >>>> Hello,
> >>>> I am trying to learn/play embedded virtualization tools and i saw
> >>>> Isar Integrated jailhouse-image repo, tested orange pi
> >>>> zero(256mb) image and everything is fine.
> >>>> I am trying to integrate latest jailhouse(0.11) into yocto
> >>>> project and i
> >>> saw
> >>>> https://bitbucket.org/retotech/meta-jailhouse/src/master/ , which
> >>>> is
> >>> for banana
> >>>> pi with jailhouse_0.8.
> >>>>
> >>>> Anyway, I ported jailhouse-images and meta-jailhouse
> >>> together(meta-orangepi,
> >>>> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev) and
> >>>> trying
> >>> to
> >>>> compile for orange pi zero(256mb) but I saw many errors while
> >>>> building.
> >>> can you
> >>>> guys can guess what is the problem?
> >>>>
> >>>> my status:
> >>>> i am trying to build exact image with jailhouse-images so i
> >>>> patched
> >>> u-boot &
> >>>> kernel, now i am trying to compile/install jailhouse.
> >>>>
> >>>> You can see build error as follows,
> >>>> also attached log outputs too.
> >>>>
> >>> The errors look like they could get better with
> >>>
> >>>
> https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f2c=
624405d8c81
> >>>
> >>>> My repo:
> >>>> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev
> >>>>
> >>> Thanks for sharing. Henning did some yocto'ization for an internal
> >>> Jailhouse
> >>> project recently (though that was for legacy vendor BSP) - maybe he
> >>> can share
> >>> some thoughts on your direction.
> >>>
> >>> Jan
> >>>
> >>> --
> >>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >>> Corporate Competence Center Embedded Linux
> >>>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABPcKDN5izWjNsHsij8eK-3BBF5ch34peerH4EBzD8yMO-dcDw%40mail.gm=
ail.com.

--000000000000aead540590505610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, it&#39;s been a 3 days and i am still trying to com=
pile, i changed yocto versions, gcc compiler versions, external toolchain, =
checked against debian build etc. but nothing worked.<div><br></div><div>i =
cant understand why this is compiled in jailhouse-images setup and not comp=
iling under this setup ?</div><div><br></div><div>my setup is:</div><div><a=
 href=3D"https://github.com/cevatbostancioglu/meta-orangepi/blob/dev/yocto/=
meta-orangepi/conf/machine/orange-pi-zero.conf">https://github.com/cevatbos=
tancioglu/meta-orangepi/blob/dev/yocto/meta-orangepi/conf/machine/orange-pi=
-zero.conf</a><br></div><div><br></div><div>my latest error is:<br>Short lo=
g:<div><br></div><div><b>arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsof=
t and -mfloat-abi=3Dhard may not be used together<br></b><div><br></div><di=
v>Long Log:</div><div>DEBUG: Executing shell function do_compile<br>NOTE: m=
ake -j 8 KERNEL_SRC=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work-shared/orange-pi-zero/kernel-source V=3D0 CC=3Darm-oe-linux-gnu=
eabi-gcc =C2=A0-mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sy=
sroot=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/or=
ange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/recip=
e-sysroot CROSS_COMPILE=3Darm-oe-linux-gnueabi- KDIR=3D/home/cevat/Desktop/=
meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-b=
uild-artifacts<br>=C2=A0 CHK =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangep=
i/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/=
0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/include/generated/<a href=3D"h=
ttp://config.mk">config.mk</a><br>=C2=A0 CHK =C2=A0 =C2=A0 /home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gn=
ueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/include/genera=
ted/version.h<br>=C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/include/generated/<a href=3D"ht=
tp://config.mk">config.mk</a><br>=C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/include/generat=
ed/version.h<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/../alloc=
.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gi=
tAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/../cmdline.o<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/../printk.o<br>=C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-=
glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de04=
54d8-r0/git/inmates/lib/arm/../arm-common/../setup.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/=
git/inmates/lib/arm/../arm-common/../string.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyp=
ervisor/arch/arm/asm-defines.s<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat=
/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-lin=
ux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/bananapi=
-gic-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/../uart-8=
250.o<br>=C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_=
arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOIN=
C+55de0454d8-r0/git/driver/cell.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ce=
vat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-=
linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/.=
./arm-common/gic-v2.o<br><b>arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3D=
soft and -mfloat-abi=3Dhard may not be used together<br></b>make[5]: *** [/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/oran=
ge-pi-zero/kernel-source/scripts/Makefile.build:314: /home/cevat/Desktop/me=
ta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/=
jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/cell.o] Error 1<br>make[=
4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-s=
hared/orange-pi-zero/kernel-source/scripts/Makefile.build:573: /home/cevat/=
Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linu=
x-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver] Error 2<br>ma=
ke[4]: *** Waiting for unfinished jobs....<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi-linux-demo.o<br>=C2=A0 LDS =C2=A0 =C2=A0 /home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/hypervisor.lds<br=
>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/buil=
d_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTO=
INC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/gic-v3.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/inmates/lib/arm/../arm-common/gic.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inm=
ates/lib/arm/../arm-common/mem.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cev=
at/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-l=
inux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/setup.o=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitA=
UTOINC+55de0454d8-r0/git/configs/arm/bananapi-uart-demo.o<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8=
-r0/git/configs/arm/bananapi.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat=
/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-lin=
ux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../a=
rm-common/printk.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1e-linux-=
demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/y=
octo/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.1=
0-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/setup.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/inmates/lib/arm/../arm-common/timer.o<br>=C2=A0 CC =C2=A0=
 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/configs/arm/emtrion-rzg1e-uart-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-hscif.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-=
oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/ar=
m/../arm-common/uart-imx.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Des=
ktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-g=
nueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/printk.o<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/configs/arm/emtrion-rzg1e.o<br>=C2=A0 CC =C2=A0 =C2=A0=
 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/in=
mates/lib/arm/../arm-common/uart-mvebu.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/li=
b/arm/../arm-common/uart-pl011.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cev=
at/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-l=
inux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrio=
n-rzg1h-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/m=
eta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi=
/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/=
uart-scifa.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o<=
br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAU=
TOINC+55de0454d8-r0/git/hypervisor/paging.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/control.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-or=
angepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailh=
ouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/uart-x=
uartps.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1h.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/hypervisor/lib.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/De=
sktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-=
gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-=
common/uart.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-ora=
ngepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailho=
use/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/mmio.o<br>=C2=A0 CC =C2=A0=
 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/configs/arm/emtrion-rzg1m-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1m-uart-demo.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/hea=
der.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yo=
cto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10=
-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1m.o<br>=C2=A0 LDS =C2=
=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work=
/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/gi=
t/inmates/lib/arm/inmate.lds<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/D=
esktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux=
-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/jetson-tk1=
-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
10-gitAUTOINC+55de0454d8-r0/git/hypervisor/pci.o<br>=C2=A0 CC =C2=A0 =C2=A0=
 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/co=
nfigs/arm/jetson-tk1-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ce=
vat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-=
linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/jetso=
n-tk1.o<br>=C2=A0 AR =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/lib.a<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/=
git/configs/arm/orangepi0-gic-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-=
oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/demos/=
arm/gic-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-or=
angepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailh=
ouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/ivshmem.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/inmates/demos/arm/uart-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/ar=
m/orangepi0-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/tools/arm/linux-lo=
ader.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/y=
octo/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.1=
0-gitAUTOINC+55de0454d8-r0/git/configs/arm/orangepi0.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/=
git/hypervisor/uart.o<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/dts/inmate-bananapi.dt=
b<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/=
build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-git=
AUTOINC+55de0454d8-r0/git/inmates/demos/arm/gic-demo-linked.o<br>=C2=A0 DTC=
 =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r=
0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb<br>=C2=A0 LD =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/inmates/tools/arm/linux-loader-linked.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/de=
mos/arm/uart-demo-linked.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/demos/arm/gic-demo.bin<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/g=
it/inmates/tools/arm/linux-loader.bin<br>=C2=A0 OBJCOPY /home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/demos/arm/uart-demo.=
bin<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/bui=
ld_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUT=
OINC+55de0454d8-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb<br>=C2=
=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0=
454d8-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb<br>=C2=A0 DTC =
=C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/configs/arm/dts/inmate-jetson-tk1.dtb<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/uart-8250.o<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/dts/inmate-orangepi0.dtb<br=
>=C2=A0 GEN =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm=
/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+5=
5de0454d8-r0/git/hypervisor/arch/arm/include/generated/asm/asm-defines.h<br=
>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc=
/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-=
r0/git/configs/arm/bananapi-gic-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0=
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperviso=
r/arch/arm/../arm-common/control.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/me=
ta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/=
jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/bananapi-linux-demo=
.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yo=
cto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10=
-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/dbg-write.o=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitA=
UTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/gic-v2.o<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/g=
it/configs/arm/bananapi-uart-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Deskto=
p/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnue=
abi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/bananapi.cell<b=
r>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8=
-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/hypervisor/arch/arm/../arm-common/gic-v3.o<br>=C2=A0 OBJCOPY /home/cevat/D=
esktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux=
-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rz=
g1e-uart-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yoct=
o/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-g=
itAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1e.cell<br>=C2=A0 OBJCOP=
Y /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1h-linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/me=
ta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/=
jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1h-uart-=
demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangep=
i/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/=
0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/irqchip=
.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-=
glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de04=
54d8-r0/git/configs/arm/emtrion-rzg1h.cell<br>=C2=A0 OBJCOPY /home/cevat/De=
sktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-=
gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg=
1m-linux-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-commo=
n/ivshmem.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/hypervisor/arch/arm/../arm-common/lib.o<br>=C2=A0 OBJCOPY /home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emt=
rion-rzg1m.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/m=
mu_cell.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_a=
rm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC=
+55de0454d8-r0/git/configs/arm/jetson-tk1-demo.cell<br>=C2=A0 OBJCOPY /home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-=
oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/je=
tson-tk1-linux-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm=
-common/paging.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/=
build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-git=
AUTOINC+55de0454d8-r0/git/configs/arm/jetson-tk1.cell<br>=C2=A0 OBJCOPY /ho=
me/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zer=
o-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/=
orangepi0-gic-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/orangepi0-linux-demo.cell<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/pci.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/hypervisor/arch/arm/../arm-common/psci.o<br>=C2=A0 OBJCOPY /home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-=
oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/or=
angepi0.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/setu=
p.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoct=
o/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-g=
itAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/smccc.o<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/uart-hscif.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/uart-imx.o<br>=C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-=
glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de04=
54d8-r0/git/hypervisor/arch/arm/../arm-common/uart-mvebu.o<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8=
-r0/git/hypervisor/arch/arm/../arm-common/uart-pl011.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/=
git/hypervisor/arch/arm/../arm-common/uart-scifa.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/hypervisor/arch/arm/../arm-common/uart-xuartps.o<br>=C2=A0 AS =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/hypervisor/arch/arm/caches.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/=
Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linu=
x-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/c=
ontrol.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/entry.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/hypervisor/arch/arm/lib.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-=
oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arc=
h/arm/mmio.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/mmu_hyp.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/hypervisor/arch/arm/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyp=
ervisor/arch/arm/traps.o<br>=C2=A0 AR =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/lib.a<=
br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAU=
TOINC+55de0454d8-r0/git/hypervisor/hypervisor.o<br>=C2=A0 OBJCOPY /home/cev=
at/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-l=
inux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/jailhou=
se.bin<br>make[3]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/t=
mp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1503: _module_/h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_ze=
ro-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git] Error 2<br=
>make[2]: *** [Makefile:146: sub-make] Error 2<br>make[1]: *** [Makefile:24=
: __sub-make] Error 2<br>make: *** [Makefile:40: modules] Error 2<br>ERROR:=
 oe_runmake failed<br>WARNING: exit code 1 from a shell command.<br>ERROR: =
Execution of &#39;/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gli=
bc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d=
8-r0/temp/run.do_compile.28600&#39; failed with exit code 1:<br>=C2=A0 CHK =
=C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/hypervisor/include/generated/<a href=3D"http://config.mk">config.mk</a=
><br>=C2=A0 CHK =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/hypervisor/include/generated/version.h<br>=C2=A0 UPD =
=C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/hypervisor/include/generated/<a href=3D"http://config.mk">config.mk</a=
><br>=C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/hypervisor/include/generated/version.h<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/inmates/lib/arm/../arm-common/../alloc.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/inmates/lib/arm/../arm-common/../cmdline.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../printk.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm=
/../arm-common/../setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gn=
ueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-co=
mmon/../string.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/asm-defines.s<=
br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAU=
TOINC+55de0454d8-r0/git/configs/arm/bananapi-gic-demo.o<br>=C2=A0 CC =C2=A0=
 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/inmates/lib/arm/../arm-common/../uart-8250.o<br>=C2=A0 CC [M] =C2=A0/h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_ze=
ro-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/cell=
.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gi=
tAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/gic-v2.o<br>arm-oe=
-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and -mfloat-abi=3Dhard may no=
t be used together<br>make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makef=
ile.build:314: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r=
0/git/driver/cell.o] Error 1<br>make[4]: *** [/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scr=
ipts/Makefile.build:573: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/=
tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55=
de0454d8-r0/git/driver] Error 2<br>make[4]: *** Waiting for unfinished jobs=
....<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-=
gitAUTOINC+55de0454d8-r0/git/configs/arm/bananapi-linux-demo.o<br>=C2=A0 LD=
S =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc=
/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-=
r0/git/hypervisor/hypervisor.lds<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cev=
at/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-l=
inux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/..=
/arm-common/gic-v3.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/m=
eta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi=
/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/=
gic.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yo=
cto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10=
-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/mem.o<br>=C2=A0=
 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/t=
mp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55d=
e0454d8-r0/git/hypervisor/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ce=
vat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-=
linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/banan=
api-uart-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/bananapi.o<br>=C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-=
glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de04=
54d8-r0/git/inmates/lib/arm/../arm-common/printk.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/configs/arm/emtrion-rzg1e-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_ze=
ro-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib=
/arm/../arm-common/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Des=
ktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-g=
nueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-c=
ommon/timer.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-ora=
ngepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailho=
use/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitA=
UTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/uart-hscif.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/inmates/lib/arm/../arm-common/uart-imx.o<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8=
-r0/git/hypervisor/printk.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/De=
sktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-=
gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg=
1e.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-=
gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/uart-mvebu.o<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOI=
NC+55de0454d8-r0/git/inmates/lib/arm/../arm-common/uart-pl011.o<br>=C2=A0 C=
C =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0=
454d8-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/inmates/lib/arm/../arm-common/uart-scifa.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1h-uart-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/paging.o=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitA=
UTOINC+55de0454d8-r0/git/hypervisor/control.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inm=
ates/lib/arm/../arm-common/uart-xuartps.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0=
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/a=
rm/emtrion-rzg1h.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/lib.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/inmates/lib/arm/../arm-common/uart.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyp=
ervisor/mmio.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-or=
angepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailh=
ouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1m-linux-demo=
.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gi=
tAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o<br>=C2=A0 =
AS =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tm=
p-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de=
0454d8-r0/git/inmates/lib/arm/header.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/ho=
me/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zer=
o-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/=
emtrion-rzg1m.o<br>=C2=A0 LDS =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orange=
pi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse=
/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/lib/arm/inmate.lds<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/configs/arm/jetson-tk1-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor=
/pci.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/y=
octo/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.1=
0-gitAUTOINC+55de0454d8-r0/git/configs/arm/jetson-tk1-linux-demo.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/configs/arm/jetson-tk1.o<br>=C2=A0 AR =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/lib.a<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/orangepi0-gic-demo.o<br=
>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/buil=
d_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTO=
INC+55de0454d8-r0/git/inmates/demos/arm/gic-demo.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/hypervisor/ivshmem.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/=
meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueab=
i/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/demos/arm/uart-demo.o=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitA=
UTOINC+55de0454d8-r0/git/configs/arm/orangepi0-linux-demo.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/inmates/tools/arm/linux-loader.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/orangepi0.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta=
-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/ja=
ilhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/uart.o<br>=C2=A0 DTC =
=C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/configs/arm/dts/inmate-bananapi.dtb<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/de=
mos/arm/gic-demo-linked.o<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/m=
eta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi=
/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/dts/inmate-emtrion=
-emconrzg1e.dtb<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/tools/arm/linux-loader-link=
ed.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-=
gitAUTOINC+55de0454d8-r0/git/inmates/demos/arm/uart-demo-linked.o<br>=C2=A0=
 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/o=
range_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/=
inmates/demos/arm/gic-demo.bin<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.10-gitAUTOINC+55de0454d8-r0/git/inmates/tools/arm/linux-loader.bin<=
br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gli=
bc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d=
8-r0/git/inmates/demos/arm/uart-demo.bin<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/dts=
/inmate-emtrion-emconrzg1h.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gn=
ueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/dts/inmate-em=
trion-emconrzg1m.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/dts/inmate-jetson-tk1.d=
tb<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gi=
tAUTOINC+55de0454d8-r0/git/hypervisor/uart-8250.o<br>=C2=A0 DTC =C2=A0 =C2=
=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange=
_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/confi=
gs/arm/dts/inmate-orangepi0.dtb<br>=C2=A0 GEN =C2=A0 =C2=A0 /home/cevat/Des=
ktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-g=
nueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/incl=
ude/generated/asm/asm-defines.h<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/bananapi-gic-demo.cell=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitA=
UTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/control.o<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/g=
it/configs/arm/bananapi-linux-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_ze=
ro-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/=
arch/arm/../arm-common/dbg-write.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe=
-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/=
arm/../arm-common/gic-v2.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/bananapi-uart-demo.cell<br>=
=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r=
0/git/configs/arm/bananapi.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1e-linux-de=
mo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/gic-v3.o<=
br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gli=
bc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d=
8-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell<br>=C2=A0 OBJCOPY /home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe=
-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtr=
ion-rzg1e.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAU=
TOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell<br>=C2=A0=
 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/o=
range_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/=
configs/arm/emtrion-rzg1h-uart-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor=
/arch/arm/../arm-common/irqchip.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-rzg1h.cell<b=
r>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8=
-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
/hypervisor/arch/arm/../arm-common/ivshmem.o<br>=C2=A0 OBJCOPY /home/cevat/=
Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linu=
x-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/emtrion-r=
zg1m-uart-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/me=
ta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/=
jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-comm=
on/lib.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/configs/arm/emtrion-rzg1m.cell<br>=C2=A0 CC =C2=A0 =C2=A0=
 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hy=
pervisor/arch/arm/../arm-common/mmu_cell.o<br>=C2=A0 OBJCOPY /home/cevat/De=
sktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-=
gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/jetson-tk1-=
demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_a=
rm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC=
+55de0454d8-r0/git/configs/arm/jetson-tk1-linux-demo.cell<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8=
-r0/git/hypervisor/arch/arm/../arm-common/paging.o<br>=C2=A0 OBJCOPY /home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/arm/jet=
son-tk1.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/buil=
d_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTO=
INC+55de0454d8-r0/git/configs/arm/orangepi0-gic-demo.cell<br>=C2=A0 OBJCOPY=
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi=
_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs/=
arm/orangepi0-linux-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/=
Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linu=
x-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/.=
./arm-common/pci.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-commo=
n/psci.o<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/configs/arm/orangepi0.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch=
/arm/../arm-common/smccc.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Des=
ktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-g=
nueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../a=
rm-common/uart-hscif.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-c=
ommon/uart-imx.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/=
uart-mvebu.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/uart=
-pl011.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/uart-sci=
fa.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-=
gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/../arm-common/uart-xuartps=
.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gi=
tAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/caches.o<br>=C2=A0 CC =C2=A0=
 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/git/hypervisor/arch/arm/control.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe=
-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/=
arm/entry.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/lib.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de045=
4d8-r0/git/hypervisor/arch/arm/mmio.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/hom=
e/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero=
-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/ar=
ch/arm/mmu_hyp.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/arch/arm/setup.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+=
55de0454d8-r0/git/hypervisor/arch/arm/traps.o<br>=C2=A0 AR =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyp=
ervisor/arch/arm/lib.a<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervisor/hypervisor.o<br>=
=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r=
0/git/hypervisor/jailhouse.bin<br>make[3]: *** [/home/cevat/Desktop/meta-or=
angepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/M=
akefile:1503: _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0=
454d8-r0/git] Error 2<br>make[2]: *** [Makefile:146: sub-make] Error 2<br>m=
ake[1]: *** [Makefile:24: __sub-make] Error 2<br>make: *** [Makefile:40: mo=
dules] Error 2<br>WARNING: exit code 1 from a shell command.<br></div><div>=
<br></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Ola Redell &lt;<a href=3D"mailto:ola.redell@retotech.=
se">ola.redell@retotech.se</a>&gt;, 14 A=C4=9Fu 2019 =C3=87ar, 10:38 tarihi=
nde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi all,<br>
There is also an imx8-dev branch in <br>
<a href=3D"http://bitbucket.org/retotech/meta-jailhouse.git" rel=3D"norefer=
rer" target=3D"_blank">bitbucket.org/retotech/meta-jailhouse.git</a> with a=
 jailhouse 0.10 recipe <br>
and much of Henning&#39;s changes. I will look into updating master to buil=
d <br>
0.11 and test it for BananaPi at least.<br>
<br>
Ola<br>
<br>
On 8/14/19 8:50 AM, Henning Schild wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; i did not look into the problem yet. But my jailhouse layer for yocto<=
br>
&gt; is on github.<br>
&gt;<br>
&gt; <a href=3D"https://github.com/henning-schild-work/meta-jailhouse" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/henning-schild-work/me=
ta-jailhouse</a><br>
&gt;<br>
&gt; Have a look at the branch henning/staging for patches to get a more<br=
>
&gt; recent jailhouse to work.<br>
&gt;<br>
&gt; Henning<br>
&gt;<br>
&gt; Am Tue, 13 Aug 2019 14:31:36 +0300<br>
&gt; schrieb Cevat Bostanc=C4=B1o=C4=9Flu &lt;<a href=3D"mailto:bostanciogl=
ucevat@gmail.com" target=3D"_blank">bostancioglucevat@gmail.com</a>&gt;:<br=
>
&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt; Thanks for the fast reply,<br>
&gt;&gt;<br>
&gt;&gt; I tried with 9f233898917f8c1141132606f2f2c624405d8c81 commit and a=
lso<br>
&gt;&gt; latest commit, still have same problem.<br>
&gt;&gt;<br>
&gt;&gt; I will be appreciated if you guys can provide/help with examples.<=
br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Cevat<br>
&gt;&gt;<br>
&gt;&gt; Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D=
"_blank">jan.kiszka@siemens.com</a>&gt;, 13 A=C4=9Fu 2019 Sal, 14:09 tarihi=
nde<br>
&gt;&gt; =C5=9Funu yazd=C4=B1:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On 13.08.19 12:39, Cevat Bostanc=C4=B1o=C4=9Flu wrote:<br>
&gt;&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt;&gt; I am trying to learn/play embedded virtualization tools an=
d i saw<br>
&gt;&gt;&gt;&gt; Isar Integrated jailhouse-image repo, tested orange pi<br>
&gt;&gt;&gt;&gt; zero(256mb) image and everything is fine.<br>
&gt;&gt;&gt;&gt; I am trying to integrate latest jailhouse(0.11) into yocto=
<br>
&gt;&gt;&gt;&gt; project and i<br>
&gt;&gt;&gt; saw<br>
&gt;&gt;&gt;&gt; <a href=3D"https://bitbucket.org/retotech/meta-jailhouse/s=
rc/master/" rel=3D"noreferrer" target=3D"_blank">https://bitbucket.org/reto=
tech/meta-jailhouse/src/master/</a> , which<br>
&gt;&gt;&gt;&gt; is<br>
&gt;&gt;&gt; for banana<br>
&gt;&gt;&gt;&gt; pi with jailhouse_0.8.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Anyway, I ported jailhouse-images and meta-jailhouse<br>
&gt;&gt;&gt; together(meta-orangepi,<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/cevatbostancioglu/meta-orang=
epi/tree/dev" rel=3D"noreferrer" target=3D"_blank">https://github.com/cevat=
bostancioglu/meta-orangepi/tree/dev</a>) and<br>
&gt;&gt;&gt;&gt; trying<br>
&gt;&gt;&gt; to<br>
&gt;&gt;&gt;&gt; compile for orange pi zero(256mb) but I saw many errors wh=
ile<br>
&gt;&gt;&gt;&gt; building.<br>
&gt;&gt;&gt; can you<br>
&gt;&gt;&gt;&gt; guys can guess what is the problem?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; my status:<br>
&gt;&gt;&gt;&gt; i am trying to build exact image with jailhouse-images so =
i<br>
&gt;&gt;&gt;&gt; patched<br>
&gt;&gt;&gt; u-boot &amp;<br>
&gt;&gt;&gt;&gt; kernel, now i am trying to compile/install jailhouse.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; You can see build error as follows,<br>
&gt;&gt;&gt;&gt; also attached log outputs too.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt; The errors look like they could get better with<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://github.com/siemens/jailhouse/commit/9f23389=
8917f8c1141132606f2f2c624405d8c81" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f2c62440=
5d8c81</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt; My repo:<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/cevatbostancioglu/meta-orang=
epi/tree/dev" rel=3D"noreferrer" target=3D"_blank">https://github.com/cevat=
bostancioglu/meta-orangepi/tree/dev</a><br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt; Thanks for sharing. Henning did some yocto&#39;ization for an =
internal<br>
&gt;&gt;&gt; Jailhouse<br>
&gt;&gt;&gt; project recently (though that was for legacy vendor BSP) - may=
be he<br>
&gt;&gt;&gt; can share<br>
&gt;&gt;&gt; some thoughts on your direction.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Jan<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
&gt;&gt;&gt; Corporate Competence Center Embedded Linux<br>
&gt;&gt;&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABPcKDN5izWjNsHsij8eK-3BBF5ch34peerH4EBzD8yMO-dcD=
w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CABPcKDN5izWjNsHsij8eK-3BBF5ch34peerH4EBzD8=
yMO-dcDw%40mail.gmail.com</a>.<br />

--000000000000aead540590505610--
