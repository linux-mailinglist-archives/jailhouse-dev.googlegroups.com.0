Return-Path: <jailhouse-dev+bncBCY3B2PSYIBBBX5GZLVAKGQE5JFJ2YQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F918B5C7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 12:39:28 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id j16sf2984618wrn.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 03:39:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565692768; cv=pass;
        d=google.com; s=arc-20160816;
        b=a11FtoJzeXe+Ubs1NPuHjM+7yaYixQOv2NgWzBwapMLI3bZoGYpX46TFZeHYSafGxi
         +qJ7S/FGErsARhwEf/mjiynFUyGnAD96zzIaKn4AkuCFJnkHvpeX164F3Jimvp1P0826
         n2wz2xVnIiszrkuwSitOinAwpFvXptPBxiF+5d33wAsqWDTtUHaV4quVuwTqSOfjaxFS
         VuaFuT2J7vvLLMs4KVMqBKve0nUwGocM8P5aIrKwwaYg55oS6ZzSiL/ygI0oVPNmvKdX
         ENeIxevMBkAL/OvpZzQTtd4xN2nUlxhceMTwDpYuSoPmaN/Rotqm9z2ABb/w2Jt271QD
         xccA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=EI3beLA7ocO99Tz/sCIQINTXxoIrdgIbZ63P1HFfef0=;
        b=a8KarVuwHpsLaFy0vqp1y25J7vH1jRRSD1VKYlhzjbwcOFkyjbI47HHX1IsqG4OBXF
         /KIBSg2XM8vZ059ZQyLOkOJqkzuXpp13ChZolch/Bn1WdsQK1JxwfgAWI/BR/7uGbB0O
         bElxhTcB8nc79zEBw1H3xQBOAOGDg2XQ7NLiB38gXKbHLl3OJFocO2suvau1dR9QfScG
         PZLqfclR/EeOK+FXO7afFVOPL2LUjQgCsFYrh5nlFxP04T5Ms3DRcJrGUIZCytdK+DQv
         vISMOVJYJwo2KgPRaFcjZikEuQ78GwV1ldyWRkBaivRuBArstLQ1azHL2s9ygph17DQt
         KQUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nuNlc4Rq;
       spf=pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to:cc
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EI3beLA7ocO99Tz/sCIQINTXxoIrdgIbZ63P1HFfef0=;
        b=nKLAHpVNBpY09rPkjIBDxisjo/tQQB/FE5sAZV6A+o9Fst6fWeMuxuyI81TkT5LYhI
         2rgljjPHzNC+zywhXNHK3m3kdiRzT678Xp6IU+d74ng11lrhAdZz6jScTJ3X2O7f89Tx
         yWw/jN+aCRaPZewScytu0sGQpkI2tWgZ1SZgP9u/WOSPSPENbkOPetAATlc+9UUbCpz3
         7fWV62FpcWzQNcnB94uAC68p/87GpDX0B+IRoENv2o9Z0ZieJ6QwfyNM6qyUmIGRS+b7
         V4HqzDMuIeOeF/rcuKAsDtOUhM7zsRzDvlZWzyFpCGRQfboYxa+/bNzbsc58IwsUxvZr
         EzHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EI3beLA7ocO99Tz/sCIQINTXxoIrdgIbZ63P1HFfef0=;
        b=IpN24iUB09amZ8mpB1WHTr+7+KolKrinp1LZrwWNq+uZMtj14KSTTOrpRGuL/gL4eb
         HY5r8iZnHOYHxp/2uNLMDZZiEZ9YO7mXZXqqwipiYlWFbLeWSpp/g1v/ZfmWWABNGuy7
         4ZX3SOY0CjAnLmKt5ujnHdrbC5uLp1NzaJSXbe80jkgq+shn+0WHkZbqNT9SbOVxObtN
         PJiDE98GWTgJ8gHAw4GhxVG7UnPHdZPzIyR/69VUAlK1PjV7y/WmRLdecQSJ/mWPnaJZ
         rv8p65NT2yV2PHp+qqDrXr2kUtcbw8dycrLK7JEgRUkG7V+/c8UhaM2vpj7ti0anoPO9
         QslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EI3beLA7ocO99Tz/sCIQINTXxoIrdgIbZ63P1HFfef0=;
        b=lrm9Oed9OcFEEJ4fFa9diUDkvYr+yd2b6nhLQscgdWq430Z6z8P+C3Jxi1/E9v0qQ1
         lUiLc9Iy8kWeihQSrlUE7Ns0mG1h2WJQOXYnVGtNMChgPJ5+xeZFVZRTuelP2mlrHw2X
         1uRZ4SOkAt9kj2JYQdXunLPat1hl5ufCvdqwlwKWNlhFURKzn5LzE+X1UIW8BaI3rkdC
         lXJlOZ7+MIBafPe+8QrWcRLOC242UuywjeQ3KO5rFZaWM6aDOSTz844mk1BLrvK+0h3G
         DHguoW4XgcHSOgONi2kEbuKoV0pplctO76nNliRWJsMJ/iuKwyawsM6+FuqO0oNdLNa2
         5DFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXZgrlHnfh1ks1qCQOXOa/Z/xq+e3OylYrRQJlQnmkfyEQuahBX
	cYjwfQk5aq1xy6WOb0eSy8c=
X-Google-Smtp-Source: APXvYqwRxZlVjxJl4MVy8qTmk4nxKIjQELH5jdOvbUWXGLfD7NaK3vxf5eIcJEdM2bZ2sW5CjmG2cA==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr45036157wrv.247.1565692767801;
        Tue, 13 Aug 2019 03:39:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:540c:: with SMTP id g12ls1733657wrv.9.gmail; Tue, 13 Aug
 2019 03:39:27 -0700 (PDT)
X-Received: by 2002:adf:f304:: with SMTP id i4mr16696557wro.61.1565692766302;
        Tue, 13 Aug 2019 03:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565692766; cv=none;
        d=google.com; s=arc-20160816;
        b=yU2kUEJT5dOOLZV3BnjOBShGpdAf9T9Qnfaul3B1wrDcMAMXJpwXqkgi1VZqWPDSkp
         pJ+pWc/osKcYgs2rHkEo2JXeQfxwktetvm8R8xtAJb43jACBow9Qu2+sj1k55vk4AhWz
         Hka9Q5JJbAcgJEUUxbinSgvpwE8SxUqzcCzmZtHUjuCFaekryF81BhOB1hUvavcu5WbQ
         5S72jM5ZVRlvBiyIgleNBFjKJWjJcR7IVGgO6KVGUPp36NDDj8ibv8RQcwp/zkYL1su0
         fL6JnH/M6j0BFJySd/iGgFkyLbYZ8ILT93y3N5Yfazo7J9wJTAFS9XWql4+bNeaiDj3A
         nnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=q9VbLV8keatQ+mzC5l/mdzjO+0pAnV8LzIF+NJKNN7I=;
        b=vm/8FAxnC0DxP2Qr0244TOQVjzUZDBbE3Gukw86sENwjeP5WlenYsJIO+yUgRyAww0
         FKVfn0/iKv1vXIUFK9qbL/QdLKxqSj7JlK0JBoCeEpfkfQAJlnusMqu1PhZXImHUrE/T
         FosQk1kTrsn5zjsEyHMe2JOFIkh0lvlqOSK+JHHhguF+rhlwlBhE1Em0eJCtNOg8yMjG
         pNZm00+2TCajMxu/dPptZxthQmtnCx8mf9IYO8n7pWEAcZIm09UVg3xaY1FH8Ek6OWkc
         4rx+6WPF9wqKK+tROuct6oKG2eUX7ggYB2YohusZ9ugXGwvdLSfoWYKNnuWYUrWhQ1wP
         V9Jw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nuNlc4Rq;
       spf=pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com. [2a00:1450:4864:20::52a])
        by gmr-mx.google.com with ESMTPS id y4si2479597wrp.0.2019.08.13.03.39.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 03:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) client-ip=2a00:1450:4864:20::52a;
Received: by mail-ed1-x52a.google.com with SMTP id m44so3640957edd.9
        for <jailhouse-dev@googlegroups.com>; Tue, 13 Aug 2019 03:39:26 -0700 (PDT)
X-Received: by 2002:a50:f7c7:: with SMTP id i7mr5747101edn.225.1565692764718;
 Tue, 13 Aug 2019 03:39:24 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Tue, 13 Aug 2019 13:39:13 +0300
Message-ID: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
Subject: Orange Pi Zero Jailhouse Yocto Integration
To: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Cc: ola@retotech.se, anders@retotech.se, jonas@retotech.se
Content-Type: multipart/mixed; boundary="0000000000001277a5058ffd4170"
X-Original-Sender: bostancioglucevat@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=nuNlc4Rq;       spf=pass
 (google.com: domain of bostancioglucevat@gmail.com designates
 2a00:1450:4864:20::52a as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
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

--0000000000001277a5058ffd4170
Content-Type: multipart/alternative; boundary="0000000000001277a2058ffd416e"

--0000000000001277a2058ffd416e
Content-Type: text/plain; charset="UTF-8"

Hello,
I am trying to learn/play embedded virtualization tools and i saw Isar
Integrated jailhouse-image repo, tested orange pi zero(256mb) image and
everything is fine.
I am trying to integrate latest jailhouse(0.11) into yocto project and i
saw https://bitbucket.org/retotech/meta-jailhouse/src/master/ , which is
for banana pi with jailhouse_0.8.

Anyway, I ported jailhouse-images and meta-jailhouse
together(meta-orangepi,
https://github.com/cevatbostancioglu/meta-orangepi/tree/dev) and trying to
compile for orange pi zero(256mb) but I saw many errors while building. can
you guys can guess what is the problem?

my status:
i am trying to build exact image with jailhouse-images so i patched u-boot
& kernel, now i am trying to compile/install jailhouse.

You can see build error as follows,
also attached log outputs too.

My repo:
https://github.com/cevatbostancioglu/meta-orangepi/tree/dev

Thanks

Cevat

$ bitbake  jailhouse
WARNING: Layer meta-orangepi should set LAYERSERIES_COMPAT_meta-orangepi in
its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer meta-orangepi should set LAYERSERIES_COMPAT_meta-orangepi in
its conf/layer.conf file to list the core layer names it is compatible with.
Loading cache: 100%
|###################################################################################################################################################################################################|
Time: 0:00:01
Loaded 3309 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.43.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "arm-oe-linux-gnueabi"
MACHINE              = "orange-pi-zero"
DISTRO               = "orangepi"
DISTRO_VERSION       = "nodistro.0"
TUNE_FEATURES        = "arm vfp cortexa7 neon vfpv4 callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky            = "HEAD:9983b07fffd19082abded7c3f15cc77d306dd69c"
meta-filesystems
meta-oe
meta-python
meta-networking      = "HEAD:4e0538516b1e0ef42dc79bd08f7895f0052063ac"
meta-orangepi        = "dev:377e6533d05ef16dcbeac849f515a7a0b6a26110"

Initialising tasks: 100%
|##############################################################################################################################################################################################|
Time: 0:00:00
Sstate summary: Wanted 6 Found 0 Missed 6 Current 195 (0% match, 97%
complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
WARNING: jailhouse-0.11-r0 do_populate_lic: jailhouse: No generic license
file exists for: BSD-2-clause in any provider
ERROR: jailhouse-0.11-r0 do_compile: oe_runmake failed
ERROR: jailhouse-0.11-r0 do_compile: Execution of
'/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/run.do_compile.14598'
failed with exit code 1:
  UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/
config.mk
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
  UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
  CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
/tmp/ccWTZUPO.s: Assembler messages:
/tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if'
in ARM mode
/tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in ARM
mode
make[6]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o]
Error 1
make[6]: *** Waiting for unfinished jobs....
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
  CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
  LDS
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
/tmp/ccreteLO.s: Assembler messages:
/tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed
for the current base architecture
/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc
#0x4a48' in ARM mode
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
make[6]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o]
Error 1
make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm]
Error 2
make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates]
Error 2
make[4]: *** Waiting for unfinished jobs....
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
  CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
/tmp/ccdwkr9Y.s: Assembler messages:
/tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
/tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed for
the current base architecture
/tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw [r2]'
in ARM mode
/tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex
r1,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex
r0,r3,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' in
ARM mode
/tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in ARM
mode
/tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb ishst'
in ARM mode
/tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in
ARM mode
/tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb ishst'
in ARM mode
/tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in
ARM mode
/tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish'
in ARM mode
  CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o]
Error 1
make[5]: *** Waiting for unfinished jobs....
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
/tmp/ccITUo2X.s: Assembler messages:
/tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
/tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed
for the current base architecture
/tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw
[r2]' in ARM mode
/tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex
r1,[r2]' in ARM mode
/tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex
r0,r3,[r2]' in ARM mode
/tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb ish'
in ARM mode
/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb
ishst' in ARM mode
/tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in
ARM mode
/tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in
ARM mode
/tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed
for the current base architecture
/tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw
[r3]' in ARM mode
/tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex
lr,[r3]' in ARM mode
/tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex
ip,lr,[r3]' in ARM mode
make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o]
Error 1
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
/tmp/ccr5KeF1.s: Assembler messages:
/tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
/tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit
r3,r3' in ARM mode
/tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed for
the current base architecture
/tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]'
in ARM mode
/tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex
ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex
r0,ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in
ARM mode
/tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in
ARM mode
/tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in
ARM mode
/tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed for
the current base architecture
/tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw [r2]'
in ARM mode
/tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex
r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex
r1,r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed
for the current base architecture
/tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw
[r3]' in ARM mode
/tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex
lr,[r3]' in ARM mode
/tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex
ip,lr,[r3]' in ARM mode
make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o]
Error 1
make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor]
Error 2
  DTB
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
  AS [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
  CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
  DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
  OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
  LD [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
make[3]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518:
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git]
Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/log.do_compile.14598
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8
KERNEL_SRC=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source
V=0 CROSS_COMPILE=arm-oe-linux-gnueabi-
KDIR=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-build-artifacts
|   UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/
config.mk
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
|   UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
| /tmp/ccWTZUPO.s: Assembler messages:
| /tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if'
in ARM mode
| /tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in
ARM mode
| make[6]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o]
Error 1
| make[6]: *** Waiting for unfinished jobs....
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
|   LDS
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
| /tmp/ccreteLO.s: Assembler messages:
| /tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccreteLO.s:187: Error: selected processor does not support `hvc
#0x4a48' in ARM mode
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
| make[6]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o]
Error 1
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm]
Error 2
| make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates]
Error 2
| make[4]: *** Waiting for unfinished jobs....
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
| /tmp/ccdwkr9Y.s: Assembler messages:
| /tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw
[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex
r1,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex
r0,r3,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in
ARM mode
| /tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in
ARM mode
| /tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in
ARM mode
| /tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish'
in ARM mode
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o]
Error 1
| make[5]: *** Waiting for unfinished jobs....
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
| /tmp/ccITUo2X.s: Assembler messages:
| /tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw
[r2]' in ARM mode
| /tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex
r1,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex
r0,r3,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb
ish' in ARM mode
| /tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb
ish' in ARM mode
| /tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb
ishst' in ARM mode
| /tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in
ARM mode
| /tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in
ARM mode
| /tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw
[r3]' in ARM mode
| /tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex
lr,[r3]' in ARM mode
| /tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex
ip,lr,[r3]' in ARM mode
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o]
Error 1
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
| /tmp/ccr5KeF1.s: Assembler messages:
| /tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit
r3,r3' in ARM mode
| /tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex
ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex
r0,ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in
ARM mode
| /tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in
ARM mode
| /tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in
ARM mode
| /tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw
[r2]' in ARM mode
| /tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex
r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex
r1,r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex
lr,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex
ip,lr,[r3]' in ARM mode
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o]
Error 1
| make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor]
Error 2
|   DTB
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
|   AS [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
|   LD [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
| make[3]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518:
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git]
Error 2
| make[2]: *** [Makefile:146: sub-make] Error 2
| make[1]: *** [Makefile:24: __sub-make] Error 2
| make: *** [Makefile:40: modules] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of
'/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/run.do_compile.14598'
failed with exit code 1:
|   UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/
config.mk
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
|   UPD
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
| /tmp/ccWTZUPO.s: Assembler messages:
| /tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if'
in ARM mode
| /tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in
ARM mode
| make[6]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o]
Error 1
| make[6]: *** Waiting for unfinished jobs....
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
|   LDS
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
| /tmp/ccreteLO.s: Assembler messages:
| /tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccreteLO.s:187: Error: selected processor does not support `hvc
#0x4a48' in ARM mode
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
| make[6]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o]
Error 1
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm]
Error 2
| make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates]
Error 2
| make[4]: *** Waiting for unfinished jobs....
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
| /tmp/ccdwkr9Y.s: Assembler messages:
| /tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw
[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex
r1,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex
r0,r3,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in
ARM mode
| /tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in
ARM mode
| /tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in
ARM mode
| /tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish'
in ARM mode
|   CC [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o]
Error 1
| make[5]: *** Waiting for unfinished jobs....
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
| /tmp/ccITUo2X.s: Assembler messages:
| /tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish'
in ARM mode
| /tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw
[r2]' in ARM mode
| /tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex
r1,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex
r0,r3,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb
ish' in ARM mode
| /tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb
ish' in ARM mode
| /tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb
ishst' in ARM mode
| /tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in
ARM mode
| /tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in
ARM mode
| /tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw
[r3]' in ARM mode
| /tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex
lr,[r3]' in ARM mode
| /tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex
ip,lr,[r3]' in ARM mode
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o]
Error 1
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
| /tmp/ccr5KeF1.s: Assembler messages:
| /tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit
r3,r3' in ARM mode
| /tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex
ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex
r0,ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in
ARM mode
| /tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in
ARM mode
| /tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in
ARM mode
| /tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw
[r2]' in ARM mode
| /tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex
r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex
r1,r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed
for the current base architecture
| /tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex
lr,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex
ip,lr,[r3]' in ARM mode
| make[5]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o]
Error 1
| make[4]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544:
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor]
Error 2
|   DTB
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
|   AS [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
|   CC
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
|   DTC
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
|   OBJCOPY
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
|   LD [M]
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
| make[3]: ***
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518:
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git]
Error 2
| make[2]: *** [Makefile:146: sub-make] Error 2
| make[1]: *** [Makefile:24: __sub-make] Error 2
| make: *** [Makefile:40: modules] Error 2
| WARNING: exit code 1 from a shell command.
|
ERROR: Task
(/home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse_0.11.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 908 tasks of which 901 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:

/home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse_0.11.bb:
do_compile
Summary: There were 3 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
cevat@cevat-MS-7970:~/Desktop/meta-orangepi/yocto/build_arm$

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa%2B--w%40mail.gmail.com.

--0000000000001277a2058ffd416e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<br>I am trying to learn/play embedded virtual=
ization tools and i saw Isar Integrated jailhouse-image repo, tested orange=
 pi zero(256mb) image and everything is fine.=C2=A0<div>I am trying to inte=
grate latest jailhouse(0.11) into yocto project and i saw=C2=A0<a href=3D"h=
ttps://bitbucket.org/retotech/meta-jailhouse/src/master/">https://bitbucket=
.org/retotech/meta-jailhouse/src/master/</a>=C2=A0, which is for banana pi =
with jailhouse_0.8.</div><div><br></div><div>Anyway, I ported jailhouse-ima=
ges and meta-jailhouse together(meta-orangepi,=C2=A0<a href=3D"https://gith=
ub.com/cevatbostancioglu/meta-orangepi/tree/dev">https://github.com/cevatbo=
stancioglu/meta-orangepi/tree/dev</a>) and trying to compile for orange pi =
zero(256mb) but I saw many errors while building. can you guys can guess wh=
at is the problem?</div><div><br></div><div>my status:<br>i am trying to bu=
ild exact image with jailhouse-images so i patched u-boot &amp; kernel, now=
 i am trying to compile/install jailhouse.<br><br></div><div>You can see bu=
ild error as follows,</div><div>also attached log outputs too.</div><div><b=
r></div><div>My repo:</div><div><a href=3D"https://github.com/cevatbostanci=
oglu/meta-orangepi/tree/dev">https://github.com/cevatbostancioglu/meta-oran=
gepi/tree/dev</a></div><div><br></div><div>Thanks</div><div><br></div><div>=
Cevat</div><div><br></div><div>$ bitbake =C2=A0jailhouse<br>WARNING: Layer =
meta-orangepi should set LAYERSERIES_COMPAT_meta-orangepi in its conf/layer=
.conf file to list the core layer names it is compatible with.<br>WARNING: =
Layer meta-orangepi should set LAYERSERIES_COMPAT_meta-orangepi in its conf=
/layer.conf file to list the core layer names it is compatible with.<br>Loa=
ding cache: 100% |#########################################################=
###########################################################################=
###############################################################| Time: 0:00=
:01<br>Loaded 3309 entries from dependency cache.<br>NOTE: Resolving any mi=
ssing task queue dependencies<br><br>Build Configuration:<br>BB_VERSION =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.43.1&quot;<br>BUILD_SYS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>NATIVELSB=
STRING =C2=A0 =C2=A0 =C2=A0=3D &quot;ubuntu-16.04&quot;<br>TARGET_SYS =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-oe-linux-gnueabi&quot;<br>MAC=
HINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;orange-pi-ze=
ro&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;orangepi&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D &quot;nodistro=
.0&quot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm vfp cort=
exa7 neon vfpv4 callconvention-hard&quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;hard&quot;<br>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;HEAD:9983b07fffd19082abded7c3f15cc77d306dd69c&quot;<br>=
meta-filesystems =C2=A0 =C2=A0 <br>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>meta-python =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta=
-networking =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:4e0538516b1e0ef42dc79bd08f78=
95f0052063ac&quot;<br>meta-orangepi =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;de=
v:377e6533d05ef16dcbeac849f515a7a0b6a26110&quot;<br><br>Initialising tasks:=
 100% |####################################################################=
###########################################################################=
###############################################| Time: 0:00:00<br>Sstate su=
mmary: Wanted 6 Found 0 Missed 6 Current 195 (0% match, 97% complete)<br>NO=
TE: Executing Tasks<br>NOTE: Setscene tasks completed<br>WARNING: jailhouse=
-0.11-r0 do_populate_lic: jailhouse: No generic license file exists for: BS=
D-2-clause in any provider<br>ERROR: jailhouse-0.11-r0 do_compile: oe_runma=
ke failed<br>ERROR: jailhouse-0.11-r0 do_compile: Execution of &#39;/home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe=
-linux-gnueabi/jailhouse/0.11-r0/temp/run.do_compile.14598&#39; failed with=
 exit code 1:<br>=C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.11-r0/git/hypervisor/include/generated/<a href=3D"http://config.mk">config=
.mk</a><br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
11-r0/git/inmates/lib/arm/../arm-common/../alloc.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../ar=
m-common/../cmdline.o<br>=C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.11-r0/git/hypervisor/include/generated/version.h<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/ar=
m/../arm-common/../printk.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/De=
sktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-=
gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib=
/arm/../arm-common/../setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/=
Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linu=
x-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o<br>=C2=A0=
 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/t=
mp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs=
/arm/bananapi-uart-demo.o<br>=C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.11-r0/git/driver/cell.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/g=
it/configs/arm/bananapi.o<br>/tmp/ccWTZUPO.s: Assembler messages:<br>/tmp/c=
cWTZUPO.s:73: Error: selected processor does not support `cpsid if&#39; in =
ARM mode<br>/tmp/ccWTZUPO.s:87: Error: selected processor does not support =
`wfi&#39; in ARM mode<br>make[6]: *** [/home/cevat/Desktop/meta-orangepi/yo=
cto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Ma=
kefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gli=
bc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/a=
rm/../arm-common/../setup.o] Error 1<br>make[6]: *** Waiting for unfinished=
 jobs....<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangep=
i/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/=
0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o<br>=C2=A0 CC [M] =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o<br>=C2=A0 C=
C =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hyperviso=
r/arch/arm/asm-defines.s<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o<br>=C2=A0=
 LDS =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gl=
ibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/h=
ypervisor.lds<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-ora=
ngepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailho=
use/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrio=
n-rzg1e.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangep=
i/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/=
0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o<br=
>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/buil=
d_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/=
configs/arm/emtrion-rzg1h-uart-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/hom=
e/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero=
-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o<br>/tmp=
/ccreteLO.s: Assembler messages:<br>/tmp/ccreteLO.s:186: Error: architectur=
al extension `virt&#39; is not allowed for the current base architecture<br=
>/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc #0x4a=
48&#39; in ARM mode<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/me=
ta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/=
jailhouse/0.11-r0/git/hypervisor/printk.o<br>make[6]: *** [/home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kern=
el-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-=
r0/git/inmates/lib/arm/../arm-common/../printk.o] Error 1<br>make[5]: *** [=
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/ora=
nge-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/m=
eta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi=
/jailhouse/0.11-r0/git/inmates/lib/arm] Error 2<br>make[4]: *** [/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zer=
o/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orange=
pi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse=
/0.11-r0/git/inmates] Error 2<br>make[4]: *** Waiting for unfinished jobs..=
..<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0=
/git/configs/arm/emtrion-rzg1m-linux-demo.o<br>=C2=A0 CC [M] =C2=A0/home/ce=
vat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-=
linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o<b=
r>/tmp/ccdwkr9Y.s: Assembler messages:<br>/tmp/ccdwkr9Y.s:16: Error: archit=
ectural extension `virt&#39; is not allowed for the current base architectu=
re<br>/tmp/ccdwkr9Y.s:42: Error: architectural extension `mp&#39; is not al=
lowed for the current base architecture<br>/tmp/ccdwkr9Y.s:43: Error: selec=
ted processor does not support `pldw [r2]&#39; in ARM mode<br>/tmp/ccdwkr9Y=
.s:45: Error: selected processor does not support `ldrex r1,[r2]&#39; in AR=
M mode<br>/tmp/ccdwkr9Y.s:47: Error: selected processor does not support `s=
trex r0,r3,[r2]&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:70: Error: selected pro=
cessor does not support `dmb ish&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:82: Er=
ror: selected processor does not support `wfe&#39; in ARM mode<br>/tmp/ccdw=
kr9Y.s:179: Error: selected processor does not support `dmb ish&#39; in ARM=
 mode<br>/tmp/ccdwkr9Y.s:200: Error: selected processor does not support `d=
mb ish&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:212: Error: selected processor d=
oes not support `dsb ishst&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:216: Error: =
selected processor does not support `sev&#39; in ARM mode<br>/tmp/ccdwkr9Y.=
s:598: Error: selected processor does not support `dmb ish&#39; in ARM mode=
<br>/tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb is=
h&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:635: Error: selected processor does n=
ot support `dsb ishst&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:639: Error: selec=
ted processor does not support `sev&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:966=
: Error: selected processor does not support `dmb ish&#39; in ARM mode<br>=
=C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.=
o<br>make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gl=
ibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_ze=
ro-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] Error 1<br>ma=
ke[5]: *** Waiting for unfinished jobs....<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-ua=
rt-demo.o<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-=
r0/git/driver/vpci_template.dtb<br>/tmp/ccITUo2X.s: Assembler messages:<br>=
/tmp/ccITUo2X.s:16: Error: architectural extension `virt&#39; is not allowe=
d for the current base architecture<br>/tmp/ccITUo2X.s:165: Error: selected=
 processor does not support `dmb ish&#39; in ARM mode<br>/tmp/ccITUo2X.s:22=
9: Error: selected processor does not support `dmb ish&#39; in ARM mode<br>=
/tmp/ccITUo2X.s:1324: Error: architectural extension `mp&#39; is not allowe=
d for the current base architecture<br>/tmp/ccITUo2X.s:1325: Error: selecte=
d processor does not support `pldw [r2]&#39; in ARM mode<br>/tmp/ccITUo2X.s=
:1327: Error: selected processor does not support `ldrex r1,[r2]&#39; in AR=
M mode<br>/tmp/ccITUo2X.s:1329: Error: selected processor does not support =
`strex r0,r3,[r2]&#39; in ARM mode<br>/tmp/ccITUo2X.s:1352: Error: selected=
 processor does not support `dmb ish&#39; in ARM mode<br>/tmp/ccITUo2X.s:13=
73: Error: selected processor does not support `dmb ish&#39; in ARM mode<br=
>/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb ishs=
t&#39; in ARM mode<br>/tmp/ccITUo2X.s:1390: Error: selected processor does =
not support `sev&#39; in ARM mode<br>/tmp/ccITUo2X.s:1420: Error: selected =
processor does not support `wfe&#39; in ARM mode<br>/tmp/ccITUo2X.s:1485: E=
rror: architectural extension `mp&#39; is not allowed for the current base =
architecture<br>/tmp/ccITUo2X.s:1486: Error: selected processor does not su=
pport `pldw [r3]&#39; in ARM mode<br>/tmp/ccITUo2X.s:1499: Error: selected =
processor does not support `ldrex lr,[r3]&#39; in ARM mode<br>/tmp/ccITUo2X=
.s:1503: Error: selected processor does not support `strex ip,lr,[r3]&#39; =
in ARM mode<br>make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_=
arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.bui=
ld:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/or=
ange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] Er=
ror 1<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yo=
cto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11=
-r0/git/configs/arm/emtrion-rzg1m.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/conf=
igs/arm/jetson-tk1-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o<br>/tmp/ccr5KeF1=
.s: Assembler messages:<br>/tmp/ccr5KeF1.s:16: Error: architectural extensi=
on `virt&#39; is not allowed for the current base architecture<br>/tmp/ccr5=
KeF1.s:132: Error: selected processor does not support `rbit r3,r3&#39; in =
ARM mode<br>/tmp/ccr5KeF1.s:305: Error: architectural extension `mp&#39; is=
 not allowed for the current base architecture<br>/tmp/ccr5KeF1.s:306: Erro=
r: selected processor does not support `pldw [r3]&#39; in ARM mode<br>/tmp/=
ccr5KeF1.s:323: Error: selected processor does not support `ldrex ip,[r3]&#=
39; in ARM mode<br>/tmp/ccr5KeF1.s:325: Error: selected processor does not =
support `strex r0,ip,[r3]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:431: Error: s=
elected processor does not support `dsb &#39; in ARM mode<br>/tmp/ccr5KeF1.=
s:447: Error: selected processor does not support `dsb &#39; in ARM mode<br=
>/tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb&#39; =
in ARM mode<br>/tmp/ccr5KeF1.s:661: Error: architectural extension `mp&#39;=
 is not allowed for the current base architecture<br>/tmp/ccr5KeF1.s:662: E=
rror: selected processor does not support `pldw [r2]&#39; in ARM mode<br>/t=
mp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex r0,[r2=
]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:684: Error: selected processor does n=
ot support `strex r1,r0,[r2]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:2634: Erro=
r: architectural extension `mp&#39; is not allowed for the current base arc=
hitecture<br>/tmp/ccr5KeF1.s:2635: Error: selected processor does not suppo=
rt `pldw [r3]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:2652: Error: selected pro=
cessor does not support `ldrex lr,[r3]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:=
2654: Error: selected processor does not support `strex ip,lr,[r3]&#39; in =
ARM mode<br>make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm=
/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:=
303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orang=
e_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] Error=
 1<br>make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] Error 2<br>=C2=A0 DT=
B =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc=
/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_tem=
plate.dtb.S<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.11-r0/git/configs/arm/orangepi0-gic-demo.o<br>=C2=A0 AS [M] =C2=A0/home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-=
oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o<br>=C2=A0=
 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/t=
mp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs=
/arm/orangepi0-linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/De=
sktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-=
gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o<br>=C2=A0 DTC =C2=A0 =
=C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-b=
ananapi.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/y=
octo/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.1=
1-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb<br>=C2=A0 DTC =C2=A0=
 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/or=
ange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-=
emtrion-emconrzg1h.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta=
-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/ja=
ilhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb<br>=C2=A0=
 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gl=
ibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/=
dts/inmate-jetson-tk1.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/m=
eta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi=
/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb<br>=C2=A0 OBJCO=
PY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-dem=
o.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/=
tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/config=
s/arm/bananapi-linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.11-r0/git/configs/arm/bananapi-uart-demo.cell<br>=C2=A0 OBJCOPY /ho=
me/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zer=
o-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion=
-rzg1e-uart-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/y=
octo/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.1=
1-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell<br>=C2=A0 OBJCOPY /home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion=
-rzg1h-linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell<br>=C2=A0 OBJCOPY /home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion=
-rzg1m-linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell<br>=C2=A0 OBJCOPY /home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-=
tk1-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/bui=
ld_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git=
/configs/arm/jetson-tk1-linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell<br>=C2=A0 OBJCOPY /h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_ze=
ro-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.ce=
ll<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-=
glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/ar=
m/orangepi0-linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.11-r0/git/configs/arm/orangepi0.cell<br>=C2=A0 LD [M] =C2=A0/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o<br>make[3]: *** [/home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-p=
i-zero/kernel-source/Makefile:1518: _module_/home/cevat/Desktop/meta-orange=
pi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse=
/0.11-r0/git] Error 2<br>make[2]: *** [Makefile:146: sub-make] Error 2<br>m=
ake[1]: *** [Makefile:24: __sub-make] Error 2<br>make: *** [Makefile:40: mo=
dules] Error 2<br>WARNING: exit code 1 from a shell command.<br><br>ERROR: =
Logfile of failure stored in: /home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/=
log.do_compile.14598<br>Log data follows:<br>| DEBUG: Executing shell funct=
ion do_compile<br>| NOTE: make -j 8 KERNEL_SRC=3D/home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source =
V=3D0 CROSS_COMPILE=3Darm-oe-linux-gnueabi- KDIR=3D/home/cevat/Desktop/meta=
-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-build=
-artifacts<br>| =C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
11-r0/git/hypervisor/include/generated/<a href=3D"http://config.mk">config.=
mk</a><br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o<br>| =C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/..=
/arm-common/../cmdline.o<br>| =C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/=
meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueab=
i/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h<br>| =C2=A0 =
CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tm=
p-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/=
lib/arm/../arm-common/../printk.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o<br>| =
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/i=
nmates/lib/arm/../arm-common/../setup.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0=
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo=
.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-=
r0/git/configs/arm/bananapi-uart-demo.o<br>| =C2=A0 CC [M] =C2=A0/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../ar=
m-common/../string.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.11-r0/git/configs/arm/bananapi.o<br>| /tmp/ccWTZUPO.s: Assem=
bler messages:<br>| /tmp/ccWTZUPO.s:73: Error: selected processor does not =
support `cpsid if&#39; in ARM mode<br>| /tmp/ccWTZUPO.s:87: Error: selected=
 processor does not support `wfi&#39; in ARM mode<br>| make[6]: *** [/home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi=
-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-or=
angepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailh=
ouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] Error 1<br>| mak=
e[6]: *** Waiting for unfinished jobs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-commo=
n/../uart-8250.o<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.11-r0/git/driver/main.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Des=
ktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-g=
nueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s<br>| =C2=A0 =
CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tm=
p-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/=
arm/emtrion-rzg1e-linux-demo.o<br>| =C2=A0 LDS =C2=A0 =C2=A0 /home/cevat/De=
sktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-=
gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds<br>| =C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/em=
trion-rzg1e-uart-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gn=
ueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o<br>| =C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/em=
trion-rzg1h-linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Des=
ktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-g=
nueabi/jailhouse/0.11-r0/git/hypervisor/setup.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-r=
zg1h-uart-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o<br>| /tmp/ccreteLO.s: Asse=
mbler messages:<br>| /tmp/ccreteLO.s:186: Error: architectural extension `v=
irt&#39; is not allowed for the current base architecture<br>| /tmp/ccreteL=
O.s:187: Error: selected processor does not support `hvc #0x4a48&#39; in AR=
M mode<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi=
/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0=
.11-r0/git/hypervisor/printk.o<br>| make[6]: *** [/home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source=
/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_=
arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/in=
mates/lib/arm/../arm-common/../printk.o] Error 1<br>| make[5]: *** [/home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-=
zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-ora=
ngepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailho=
use/0.11-r0/git/inmates/lib/arm] Error 2<br>| make[4]: *** [/home/cevat/Des=
ktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/ker=
nel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yo=
cto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11=
-r0/git/inmates] Error 2<br>| make[4]: *** Waiting for unfinished jobs....<=
br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/=
build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/=
git/configs/arm/emtrion-rzg1m-linux-demo.o<br>| =C2=A0 CC [M] =C2=A0/home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe=
-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o<br>| =C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.=
o<br>| /tmp/ccdwkr9Y.s: Assembler messages:<br>| /tmp/ccdwkr9Y.s:16: Error:=
 architectural extension `virt&#39; is not allowed for the current base arc=
hitecture<br>| /tmp/ccdwkr9Y.s:42: Error: architectural extension `mp&#39; =
is not allowed for the current base architecture<br>| /tmp/ccdwkr9Y.s:43: E=
rror: selected processor does not support `pldw [r2]&#39; in ARM mode<br>| =
/tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex r1,[r=
2]&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:47: Error: selected processor does=
 not support `strex r0,r3,[r2]&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:70: Er=
ror: selected processor does not support `dmb ish&#39; in ARM mode<br>| /tm=
p/ccdwkr9Y.s:82: Error: selected processor does not support `wfe&#39; in AR=
M mode<br>| /tmp/ccdwkr9Y.s:179: Error: selected processor does not support=
 `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:200: Error: selected proces=
sor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:212: Er=
ror: selected processor does not support `dsb ishst&#39; in ARM mode<br>| /=
tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev&#39; in=
 ARM mode<br>| /tmp/ccdwkr9Y.s:598: Error: selected processor does not supp=
ort `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:623: Error: selected pro=
cessor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:635:=
 Error: selected processor does not support `dsb ishst&#39; in ARM mode<br>=
| /tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev&#39;=
 in ARM mode<br>| /tmp/ccdwkr9Y.s:966: Error: selected processor does not s=
upport `dmb ish&#39; in ARM mode<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.11-r0/git/driver/pci.o<br>| make[5]: *** [/home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kern=
el-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-=
r0/git/hypervisor/setup.o] Error 1<br>| make[5]: *** Waiting for unfinished=
 jobs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o<br>| =C2=A0 DTC =C2=A0 =
=C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb=
<br>| /tmp/ccITUo2X.s: Assembler messages:<br>| /tmp/ccITUo2X.s:16: Error: =
architectural extension `virt&#39; is not allowed for the current base arch=
itecture<br>| /tmp/ccITUo2X.s:165: Error: selected processor does not suppo=
rt `dmb ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:229: Error: selected proc=
essor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1324:=
 Error: architectural extension `mp&#39; is not allowed for the current bas=
e architecture<br>| /tmp/ccITUo2X.s:1325: Error: selected processor does no=
t support `pldw [r2]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1327: Error: sel=
ected processor does not support `ldrex r1,[r2]&#39; in ARM mode<br>| /tmp/=
ccITUo2X.s:1329: Error: selected processor does not support `strex r0,r3,[r=
2]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1352: Error: selected processor do=
es not support `dmb ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1373: Error: =
selected processor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccI=
TUo2X.s:1386: Error: selected processor does not support `dsb ishst&#39; in=
 ARM mode<br>| /tmp/ccITUo2X.s:1390: Error: selected processor does not sup=
port `sev&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1420: Error: selected proce=
ssor does not support `wfe&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1485: Erro=
r: architectural extension `mp&#39; is not allowed for the current base arc=
hitecture<br>| /tmp/ccITUo2X.s:1486: Error: selected processor does not sup=
port `pldw [r3]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1499: Error: selected=
 processor does not support `ldrex lr,[r3]&#39; in ARM mode<br>| /tmp/ccITU=
o2X.s:1503: Error: selected processor does not support `strex ip,lr,[r3]&#3=
9; in ARM mode<br>| make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/b=
uild_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefil=
e.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wo=
rk/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.=
o] Error 1<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.11-r0/git/configs/arm/emtrion-rzg1m.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.=
o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoct=
o/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r=
0/git/configs/arm/jetson-tk1-linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o<br>=
| /tmp/ccr5KeF1.s: Assembler messages:<br>| /tmp/ccr5KeF1.s:16: Error: arch=
itectural extension `virt&#39; is not allowed for the current base architec=
ture<br>| /tmp/ccr5KeF1.s:132: Error: selected processor does not support `=
rbit r3,r3&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:305: Error: architectural =
extension `mp&#39; is not allowed for the current base architecture<br>| /t=
mp/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]&#3=
9; in ARM mode<br>| /tmp/ccr5KeF1.s:323: Error: selected processor does not=
 support `ldrex ip,[r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:325: Error: s=
elected processor does not support `strex r0,ip,[r3]&#39; in ARM mode<br>| =
/tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb &#39; =
in ARM mode<br>| /tmp/ccr5KeF1.s:447: Error: selected processor does not su=
pport `dsb &#39; in ARM mode<br>| /tmp/ccr5KeF1.s:451: Error: selected proc=
essor does not support `isb&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:661: Erro=
r: architectural extension `mp&#39; is not allowed for the current base arc=
hitecture<br>| /tmp/ccr5KeF1.s:662: Error: selected processor does not supp=
ort `pldw [r2]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:682: Error: selected p=
rocessor does not support `ldrex r0,[r2]&#39; in ARM mode<br>| /tmp/ccr5KeF=
1.s:684: Error: selected processor does not support `strex r1,r0,[r2]&#39; =
in ARM mode<br>| /tmp/ccr5KeF1.s:2634: Error: architectural extension `mp&#=
39; is not allowed for the current base architecture<br>| /tmp/ccr5KeF1.s:2=
635: Error: selected processor does not support `pldw [r3]&#39; in ARM mode=
<br>| /tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldr=
ex lr,[r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:2654: Error: selected proc=
essor does not support `strex ip,lr,[r3]&#39; in ARM mode<br>| make[5]: ***=
 [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/o=
range-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.11-r0/git/hypervisor/paging.o] Error 1<br>| make[4]: *** [/h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orang=
e-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.11-r0/git/hypervisor] Error 2<br>| =C2=A0 DTB =C2=A0 =C2=A0 /hom=
e/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero=
-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S<br>| =C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_ar=
m/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/conf=
igs/arm/orangepi0-gic-demo.o<br>| =C2=A0 AS [M] =C2=A0/home/cevat/Desktop/m=
eta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi=
/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0=
-linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.11-r0/git/configs/arm/orangepi0.o<br>| =C2=A0 DTC =C2=A0 =C2=A0 /ho=
me/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zer=
o-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dt=
b<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/bui=
ld_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git=
/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb<br>| =C2=A0 DTC =C2=A0 =C2=
=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange=
_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtr=
ion-emconrzg1h.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb<br>| =C2=A0=
 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gl=
ibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/=
dts/inmate-jetson-tk1.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb<br>| =C2=A0 O=
BJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic=
-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/buil=
d_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/=
configs/arm/bananapi-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Deskto=
p/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnue=
abi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell<br>| =C2=A0 O=
BJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cel=
l<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/a=
rm/emtrion-rzg1e-uart-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell<br>| =C2=A0 =
OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/or=
ange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg=
1e.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_a=
rm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/con=
figs/arm/emtrion-rzg1h-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gn=
ueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell<br>| =
=C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtr=
ion-rzg1h.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/=
build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/=
git/configs/arm/emtrion-rzg1m-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cev=
at/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-l=
inux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell=
<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-=
glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/ar=
m/emtrion-rzg1m.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
11-r0/git/configs/arm/jetson-tk1-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/=
Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linu=
x-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell<br>|=
 =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc=
/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jet=
son-tk1.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/gi=
t/configs/arm/orangepi0-gic-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell<br>| =C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangep=
i0.cell<br>| =C2=A0 LD [M] =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/gi=
t/driver/jailhouse.o<br>| make[3]: *** [/home/cevat/Desktop/meta-orangepi/y=
octo/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:=
1518: _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] Error 2<br>| mak=
e[2]: *** [Makefile:146: sub-make] Error 2<br>| make[1]: *** [Makefile:24: =
__sub-make] Error 2<br>| make: *** [Makefile:40: modules] Error 2<br>| ERRO=
R: oe_runmake failed<br>| WARNING: exit code 1 from a shell command.<br>| E=
RROR: Execution of &#39;/home/cevat/Desktop/meta-orangepi/yocto/build_arm/t=
mp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/run.do=
_compile.14598&#39; failed with exit code 1:<br>| =C2=A0 UPD =C2=A0 =C2=A0 =
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/<a=
 href=3D"http://config.mk">config.mk</a><br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-commo=
n/../alloc.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-or=
angepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailh=
ouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o<br>| =C2=A0 UPD=
 =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/inclu=
de/generated/version.h<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnu=
eabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o<br>| =
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/c=
onfigs/arm/bananapi-gic-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cev=
at/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-l=
inux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o=
<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto=
/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0=
/git/configs/arm/bananapi-linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/=
home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_z=
ero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o=
<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm=
/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/drive=
r/cell.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orange=
pi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse=
/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o<br>| =C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/ba=
nanapi.o<br>| /tmp/ccWTZUPO.s: Assembler messages:<br>| /tmp/ccWTZUPO.s:73:=
 Error: selected processor does not support `cpsid if&#39; in ARM mode<br>|=
 /tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi&#39; i=
n ARM mode<br>| make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build=
_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.bu=
ild:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/o=
range_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm=
-common/../setup.o] Error 1<br>| make[6]: *** Waiting for unfinished jobs..=
..<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-=
r0/git/inmates/lib/arm/../arm-common/../uart-8250.o<br>| =C2=A0 CC [M] =C2=
=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o<br>| =C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-=
glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor=
/arch/arm/asm-defines.s<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desk=
top/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gn=
ueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o<br>| =C2=
=A0 LDS =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hyperviso=
r/hypervisor.lds<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o<br>| =C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm=
/emtrion-rzg1e.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/j=
ailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o<br>| =C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-g=
libc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/=
setup.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangep=
i/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/=
0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-r=
zg1h.o<br>| /tmp/ccreteLO.s: Assembler messages:<br>| /tmp/ccreteLO.s:186: =
Error: architectural extension `virt&#39; is not allowed for the current ba=
se architecture<br>| /tmp/ccreteLO.s:187: Error: selected processor does no=
t support `hvc #0x4a48&#39; in ARM mode<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0=
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o<br>| make[6=
]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-sh=
ared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/D=
esktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux=
-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] E=
rror 1<br>| make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm=
/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:=
544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orang=
e_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] Error 2<b=
r>| make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gli=
bc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /ho=
me/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zer=
o-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] Error 2<br>| make[4]: ***=
 Waiting for unfinished jobs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe=
-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o=
<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm=
/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/drive=
r/sysfs.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.11-r0/git/hypervisor/paging.o<br>| /tmp/ccdwkr9Y.s: Assembler messages:=
<br>| /tmp/ccdwkr9Y.s:16: Error: architectural extension `virt&#39; is not =
allowed for the current base architecture<br>| /tmp/ccdwkr9Y.s:42: Error: a=
rchitectural extension `mp&#39; is not allowed for the current base archite=
cture<br>| /tmp/ccdwkr9Y.s:43: Error: selected processor does not support `=
pldw [r2]&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:45: Error: selected process=
or does not support `ldrex r1,[r2]&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:47=
: Error: selected processor does not support `strex r0,r3,[r2]&#39; in ARM =
mode<br>| /tmp/ccdwkr9Y.s:70: Error: selected processor does not support `d=
mb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:82: Error: selected processor =
does not support `wfe&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:179: Error: sel=
ected processor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr=
9Y.s:200: Error: selected processor does not support `dmb ish&#39; in ARM m=
ode<br>| /tmp/ccdwkr9Y.s:212: Error: selected processor does not support `d=
sb ishst&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:216: Error: selected process=
or does not support `sev&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:598: Error: =
selected processor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccd=
wkr9Y.s:623: Error: selected processor does not support `dmb ish&#39; in AR=
M mode<br>| /tmp/ccdwkr9Y.s:635: Error: selected processor does not support=
 `dsb ishst&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:639: Error: selected proc=
essor does not support `sev&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:966: Erro=
r: selected processor does not support `dmb ish&#39; in ARM mode<br>| =C2=
=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o<b=
r>| make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gli=
bc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /ho=
me/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zer=
o-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] Error 1<br>| m=
ake[5]: *** Waiting for unfinished jobs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/oran=
ge_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m=
-uart-demo.o<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangep=
i/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/=
0.11-r0/git/driver/vpci_template.dtb<br>| /tmp/ccITUo2X.s: Assembler messag=
es:<br>| /tmp/ccITUo2X.s:16: Error: architectural extension `virt&#39; is n=
ot allowed for the current base architecture<br>| /tmp/ccITUo2X.s:165: Erro=
r: selected processor does not support `dmb ish&#39; in ARM mode<br>| /tmp/=
ccITUo2X.s:229: Error: selected processor does not support `dmb ish&#39; in=
 ARM mode<br>| /tmp/ccITUo2X.s:1324: Error: architectural extension `mp&#39=
; is not allowed for the current base architecture<br>| /tmp/ccITUo2X.s:132=
5: Error: selected processor does not support `pldw [r2]&#39; in ARM mode<b=
r>| /tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex=
 r1,[r2]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1329: Error: selected proces=
sor does not support `strex r0,r3,[r2]&#39; in ARM mode<br>| /tmp/ccITUo2X.=
s:1352: Error: selected processor does not support `dmb ish&#39; in ARM mod=
e<br>| /tmp/ccITUo2X.s:1373: Error: selected processor does not support `dm=
b ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1386: Error: selected processor=
 does not support `dsb ishst&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1390: Er=
ror: selected processor does not support `sev&#39; in ARM mode<br>| /tmp/cc=
ITUo2X.s:1420: Error: selected processor does not support `wfe&#39; in ARM =
mode<br>| /tmp/ccITUo2X.s:1485: Error: architectural extension `mp&#39; is =
not allowed for the current base architecture<br>| /tmp/ccITUo2X.s:1486: Er=
ror: selected processor does not support `pldw [r3]&#39; in ARM mode<br>| /=
tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex lr,[=
r3]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1503: Error: selected processor d=
oes not support `strex ip,lr,[r3]&#39; in ARM mode<br>| make[5]: *** [/home=
/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-p=
i-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.11-r0/git/hypervisor/printk.o] Error 1<br>| =C2=A0 CC =C2=A0 =C2=A0=
 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/ora=
nge_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1=
m.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yo=
cto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11=
-r0/git/configs/arm/jetson-tk1-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/h=
ome/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_ze=
ro-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo=
.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-=
r0/git/configs/arm/jetson-tk1.o<br>| /tmp/ccr5KeF1.s: Assembler messages:<b=
r>| /tmp/ccr5KeF1.s:16: Error: architectural extension `virt&#39; is not al=
lowed for the current base architecture<br>| /tmp/ccr5KeF1.s:132: Error: se=
lected processor does not support `rbit r3,r3&#39; in ARM mode<br>| /tmp/cc=
r5KeF1.s:305: Error: architectural extension `mp&#39; is not allowed for th=
e current base architecture<br>| /tmp/ccr5KeF1.s:306: Error: selected proce=
ssor does not support `pldw [r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:323:=
 Error: selected processor does not support `ldrex ip,[r3]&#39; in ARM mode=
<br>| /tmp/ccr5KeF1.s:325: Error: selected processor does not support `stre=
x r0,ip,[r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:431: Error: selected pro=
cessor does not support `dsb &#39; in ARM mode<br>| /tmp/ccr5KeF1.s:447: Er=
ror: selected processor does not support `dsb &#39; in ARM mode<br>| /tmp/c=
cr5KeF1.s:451: Error: selected processor does not support `isb&#39; in ARM =
mode<br>| /tmp/ccr5KeF1.s:661: Error: architectural extension `mp&#39; is n=
ot allowed for the current base architecture<br>| /tmp/ccr5KeF1.s:662: Erro=
r: selected processor does not support `pldw [r2]&#39; in ARM mode<br>| /tm=
p/ccr5KeF1.s:682: Error: selected processor does not support `ldrex r0,[r2]=
&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:684: Error: selected processor does =
not support `strex r1,r0,[r2]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:2634: E=
rror: architectural extension `mp&#39; is not allowed for the current base =
architecture<br>| /tmp/ccr5KeF1.s:2635: Error: selected processor does not =
support `pldw [r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:2652: Error: selec=
ted processor does not support `ldrex lr,[r3]&#39; in ARM mode<br>| /tmp/cc=
r5KeF1.s:2654: Error: selected processor does not support `strex ip,lr,[r3]=
&#39; in ARM mode<br>| make[5]: *** [/home/cevat/Desktop/meta-orangepi/yoct=
o/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Make=
file.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc=
/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/pagi=
ng.o] Error 1<br>| make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile=
.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] Error 2=
<br>| =C2=A0 DTB =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/buil=
d_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/=
driver/vpci_template.dtb.S<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/D=
esktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux=
-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o<br>| =C2=A0=
 AS [M] =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_templ=
ate.dtb.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-orang=
epi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhous=
e/0.11-r0/git/configs/arm/orangepi0-linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0=
.o<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/bu=
ild_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/gi=
t/configs/arm/dts/inmate-bananapi.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/c=
evat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe=
-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrz=
g1e.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yoc=
to/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-=
r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb<br>| =C2=A0 DTC =C2=A0=
 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/or=
ange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-=
emtrion-emconrzg1m.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/me=
ta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/=
jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb<br>| =C2=A0 DTC=
 =C2=A0 =C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/=
inmate-orangepi0.dtb<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
11-r0/git/configs/arm/bananapi-gic-demo.cell<br>| =C2=A0 OBJCOPY /home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell<br>|=
 =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc=
/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/ban=
anapi-uart-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/=
yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.=
11-r0/git/configs/arm/bananapi.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop=
/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnuea=
bi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell<br>| =C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/wor=
k/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion=
-rzg1e-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangep=
i/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/=
0.11-r0/git/configs/arm/emtrion-rzg1e.cell<br>| =C2=A0 OBJCOPY /home/cevat/=
Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linu=
x-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell<b=
r>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-gl=
ibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/=
emtrion-rzg1h-uart-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-o=
rangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jail=
house/0.11-r0/git/configs/arm/emtrion-rzg1h.cell<br>| =C2=A0 OBJCOPY /home/=
cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-o=
e-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.=
cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/=
tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/config=
s/arm/emtrion-rzg1m-uart-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/=
meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueab=
i/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell<br>| =C2=A0 OBJCOPY =
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_=
zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cel=
l<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp=
-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/a=
rm/jetson-tk1-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-=
orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jai=
lhouse/0.11-r0/git/configs/arm/jetson-tk1.cell<br>| =C2=A0 OBJCOPY /home/ce=
vat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-=
linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell<br>=
| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glib=
c/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/or=
angepi0-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-orange=
pi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse=
/0.11-r0/git/configs/arm/orangepi0.cell<br>| =C2=A0 LD [M] =C2=A0/home/ceva=
t/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-li=
nux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o<br>| make[3]: *** [/ho=
me/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange=
-pi-zero/kernel-source/Makefile:1518: _module_/home/cevat/Desktop/meta-oran=
gepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhou=
se/0.11-r0/git] Error 2<br>| make[2]: *** [Makefile:146: sub-make] Error 2<=
br>| make[1]: *** [Makefile:24: __sub-make] Error 2<br>| make: *** [Makefil=
e:40: modules] Error 2<br>| WARNING: exit code 1 from a shell command.<br>|=
 <br>ERROR: Task (/home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/rec=
ipes-jailhouse/jailhouse/jailhouse_0.11.bb:do_compile) failed with exit cod=
e &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 908 tasks of which 901 didn=
&#39;t need to be rerun and 1 failed.<br>NOTE: Writing buildhistory<br>NOTE=
: Writing buildhistory took: 0 seconds<br><br>Summary: 1 task failed:<br>=
=C2=A0 /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailho=
use/jailhouse/jailhouse_0.11.bb:do_compile<br>Summary: There were 3 WARNING=
 messages shown.<br>Summary: There were 2 ERROR messages shown, returning a=
 non-zero exit code.<br>cevat@cevat-MS-7970:~/Desktop/meta-orangepi/yocto/b=
uild_arm$=C2=A0<br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa%2B=
--w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyF=
hrMRwa%2B--w%40mail.gmail.com</a>.<br />

--0000000000001277a2058ffd416e--
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_compile.14598"
Content-Disposition: attachment; filename="log.do_compile.14598"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy37e3>
X-Attachment-Id: f_jz9oy37e3

REVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb21waWxlCk5PVEU6IG1ha2UgLWog
OCBLRVJORUxfU1JDPS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Ug
Vj0wIENST1NTX0NPTVBJTEU9YXJtLW9lLWxpbnV4LWdudWVhYmktIEtESVI9L2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFy
ZWQvb3JhbmdlLXBpLXplcm8va2VybmVsLWJ1aWxkLWFydGlmYWN0cwogIFVQRCAgICAgL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9o
eXBlcnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL2NvbmZpZy5tawogIENDICAgICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1h
dGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9hbGxvYy5vCiAgQ0MgICAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lubWF0
ZXMvbGliL2FybS8uLi9hcm0tY29tbW9uLy4uL2NtZGxpbmUubwogIFVQRCAgICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBl
cnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL3ZlcnNpb24uaAogIENDICAgICAgL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1hdGVz
L2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9wcmludGsubwogIENDICAgICAgL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdz
L2FybS9iYW5hbmFwaS1naWMtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lubWF0ZXMvbGliL2FybS8u
Li9hcm0tY29tbW9uLy4uL3NldHVwLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5h
cGktbGludXgtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2JhbmFuYXBpLXVhcnQt
ZGVtby5vCiAgQ0MgW01dICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci9jZWxsLm8KICBDQyAgICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRl
cy9saWIvYXJtLy4uL2FybS1jb21tb24vLi4vc3RyaW5nLm8KICBDQyAgICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmln
cy9hcm0vYmFuYW5hcGkubwovdG1wL2NjV1RaVVBPLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKL3Rt
cC9jY1dUWlVQTy5zOjczOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBv
cnQgYGNwc2lkIGlmJyBpbiBBUk0gbW9kZQovdG1wL2NjV1RaVVBPLnM6ODc6IEVycm9yOiBzZWxl
Y3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgd2ZpJyBpbiBBUk0gbW9kZQptYWtlWzZd
OiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJtLy4uL2FybS1jb21tb24v
Li4vc2V0dXAub10gRXJyb3IgMQptYWtlWzZdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBq
b2JzLi4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi91
YXJ0LTgyNTAubwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvbWFpbi5vCiAgQ0MgICAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2h5
cGVydmlzb3IvYXJjaC9hcm0vYXNtLWRlZmluZXMucwogIENDICAgICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2Fy
bS9lbXRyaW9uLXJ6ZzFlLWxpbnV4LWRlbW8ubwogIExEUyAgICAgL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29yL2h5
cGVydmlzb3IubGRzCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkv
eW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWUtdWFy
dC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlvbi1yemcxZS5vCiAgQ0Mg
ICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWgtbGludXgtZGVtby5vCiAgQ0MgICAg
ICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvZ2l0L2h5cGVydmlzb3Ivc2V0dXAubwogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRy
aW9uLXJ6ZzFoLXVhcnQtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24t
cnpnMWgubwovdG1wL2NjcmV0ZUxPLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKL3RtcC9jY3JldGVM
Ty5zOjE4NjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGB2aXJ0JyBpcyBub3QgYWxs
b3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3RtcC9jY3JldGVMTy5zOjE4
NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBodmMgIzB4NGE0
OCcgaW4gQVJNIG1vZGUKICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaHlwZXJ2aXNvci9wcmludGsubwptYWtlWzZd
OiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJtLy4uL2FybS1jb21tb24v
Li4vcHJpbnRrLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFsvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2Ut
cGktemVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTQ0OiAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lu
bWF0ZXMvbGliL2FybV0gRXJyb3IgMgptYWtlWzRdOiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5n
ZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NDQ6IC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
aW5tYXRlc10gRXJyb3IgMgptYWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLWxpbnV4LWRlbW8u
bwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvc3lzZnMubwogIENDICAgICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29y
L3BhZ2luZy5vCi90bXAvY2Nkd2tyOVkuczogQXNzZW1ibGVyIG1lc3NhZ2VzOgovdG1wL2NjZHdr
cjlZLnM6MTY6IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgdmlydCcgaXMgbm90IGFs
bG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2Nkd2tyOVkuczo0
MjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFsbG93ZWQgZm9y
IHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2Nkd2tyOVkuczo0MzogRXJyb3I6
IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3IFtyMl0nIGluIEFSTSBt
b2RlCi90bXAvY2Nkd2tyOVkuczo0NTogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBsZHJleCByMSxbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6NDc6
IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgc3RyZXggcjAscjMs
W3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5zOjcwOiBFcnJvcjogc2VsZWN0ZWQgcHJv
Y2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRtYiBpc2gnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2ty
OVkuczo4MjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGB3ZmUn
IGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczoxNzk6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNz
b3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5z
OjIwMDogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNo
JyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6MjEyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vz
c29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5
WS5zOjIxNjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzZXYn
IGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo1OTg6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNz
b3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5z
OjYyMzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNo
JyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6NjM1OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vz
c29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5
WS5zOjYzOTogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzZXYn
IGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo5NjY6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNz
b3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUKICBDQyBbTV0gIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
ZHJpdmVyL3BjaS5vCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8v
a2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzogL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29y
L3NldHVwLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9i
cy4uLi4KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlvbi1yemcxbS11YXJ0LWRlbW8u
bwogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvdnBjaV90ZW1wbGF0ZS5kdGIKL3RtcC9jY0lUVW8yWC5z
OiBBc3NlbWJsZXIgbWVzc2FnZXM6Ci90bXAvY2NJVFVvMlguczoxNjogRXJyb3I6IGFyY2hpdGVj
dHVyYWwgZXh0ZW5zaW9uIGB2aXJ0JyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFz
ZSBhcmNoaXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjE2NTogRXJyb3I6IHNlbGVjdGVkIHByb2Nl
c3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJY
LnM6MjI5OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRtYiBp
c2gnIGluIEFSTSBtb2RlCi90bXAvY2NJVFVvMlguczoxMzI0OiBFcnJvcjogYXJjaGl0ZWN0dXJh
bCBleHRlbnNpb24gYG1wJyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFzZSBhcmNo
aXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjEzMjU6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3Ig
ZG9lcyBub3Qgc3VwcG9ydCBgcGxkdyBbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6
MTMyNzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBsZHJleCBy
MSxbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTMyOTogRXJyb3I6IHNlbGVjdGVk
IHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzdHJleCByMCxyMyxbcjJdJyBpbiBBUk0gbW9k
ZQovdG1wL2NjSVRVbzJYLnM6MTM1MjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTM3MzogRXJy
b3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0g
bW9kZQovdG1wL2NjSVRVbzJYLnM6MTM4NjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2Vz
IG5vdCBzdXBwb3J0IGBkc2IgaXNoc3QnIGluIEFSTSBtb2RlCi90bXAvY2NJVFVvMlguczoxMzkw
OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHNldicgaW4gQVJN
IG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE0MjA6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9l
cyBub3Qgc3VwcG9ydCBgd2ZlJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTQ4NTogRXJy
b3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFsbG93ZWQgZm9yIHRoZSBj
dXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NJVFVvMlguczoxNDg2OiBFcnJvcjogc2Vs
ZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcgW3IzXScgaW4gQVJNIG1vZGUK
L3RtcC9jY0lUVW8yWC5zOjE0OTk6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qg
c3VwcG9ydCBgbGRyZXggbHIsW3IzXScgaW4gQVJNIG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE1MDM6
IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgc3RyZXggaXAsbHIs
W3IzXScgaW4gQVJNIG1vZGUKbWFrZVs1XTogKioqIFsvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2UtcGkt
emVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MzAzOiAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2h5cGVy
dmlzb3IvcHJpbnRrLm9dIEVycm9yIDEKICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlv
bi1yemcxbS5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEtZGVtby5vCiAg
Q0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEtbGludXgtZGVtby5vCiAgQ0MgICAg
ICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEubwovdG1wL2NjcjVLZUYxLnM6IEFzc2VtYmxl
ciBtZXNzYWdlczoKL3RtcC9jY3I1S2VGMS5zOjE2OiBFcnJvcjogYXJjaGl0ZWN0dXJhbCBleHRl
bnNpb24gYHZpcnQnIGlzIG5vdCBhbGxvd2VkIGZvciB0aGUgY3VycmVudCBiYXNlIGFyY2hpdGVj
dHVyZQovdG1wL2NjcjVLZUYxLnM6MTMyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMg
bm90IHN1cHBvcnQgYHJiaXQgcjMscjMnIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczozMDU6
IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5vdCBhbGxvd2VkIGZvciB0
aGUgY3VycmVudCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MzA2OiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcgW3IzXScgaW4gQVJNIG1v
ZGUKL3RtcC9jY3I1S2VGMS5zOjMyMzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBsZHJleCBpcCxbcjNdJyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6MzI1
OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHN0cmV4IHIwLGlw
LFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczo0MzE6IEVycm9yOiBzZWxlY3RlZCBw
cm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZHNiICcgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VG
MS5zOjQ0NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkc2Ig
JyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6NDUxOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vz
c29yIGRvZXMgbm90IHN1cHBvcnQgYGlzYicgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjY2
MTogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFsbG93ZWQgZm9y
IHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NyNUtlRjEuczo2NjI6IEVycm9y
OiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgcGxkdyBbcjJdJyBpbiBBUk0g
bW9kZQovdG1wL2NjcjVLZUYxLnM6NjgyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMg
bm90IHN1cHBvcnQgYGxkcmV4IHIwLFtyMl0nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczo2
ODQ6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgc3RyZXggcjEs
cjAsW3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjI2MzQ6IEVycm9yOiBhcmNoaXRl
Y3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5vdCBhbGxvd2VkIGZvciB0aGUgY3VycmVudCBiYXNl
IGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MjYzNTogRXJyb3I6IHNlbGVjdGVkIHByb2Nl
c3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3IFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtl
RjEuczoyNjUyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGxk
cmV4IGxyLFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczoyNjU0OiBFcnJvcjogc2Vs
ZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHN0cmV4IGlwLGxyLFtyM10nIGluIEFS
TSBtb2RlCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8va2VybmVs
LXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzogL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29yL3BhZ2lu
Zy5vXSBFcnJvciAxCm1ha2VbNF06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8v
a2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU0NDogL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29y
XSBFcnJvciAyCiAgRFRCICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci92cGNpX3RlbXBsYXRlLmR0Yi5TCiAgQ0Mg
ICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL29yYW5nZXBpMC1naWMtZGVtby5vCiAgQVMgW01dICAvaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0
L2RyaXZlci92cGNpX3RlbXBsYXRlLmR0Yi5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL29y
YW5nZXBpMC1saW51eC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3JhbmdlcGkw
Lm8KICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1iYW5hbmFwaS5kdGIKICBE
VEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1lbXRyaW9uLWVtY29ucnpnMWUuZHRi
CiAgRFRDICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2R0cy9pbm1hdGUtZW10cmlvbi1lbWNvbnJ6ZzFo
LmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRlLWVtdHJpb24tZW1jb25y
emcxbS5kdGIKICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1qZXRzb24tdGsx
LmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRlLW9yYW5nZXBpMC5kdGIK
ICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGktZ2ljLWRlbW8uY2VsbAogIE9CSkNP
UFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9jb25maWdzL2FybS9iYW5hbmFwaS1saW51eC1kZW1vLmNlbGwKICBPQkpDT1BZIC9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9n
aXQvY29uZmlncy9hcm0vYmFuYW5hcGktdWFydC1kZW1vLmNlbGwKICBPQkpDT1BZIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29u
Zmlncy9hcm0vYmFuYW5hcGkuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9u
LXJ6ZzFlLXVhcnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24t
cnpnMWUtbGludXgtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24t
cnpnMWUuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFoLWxpbnV4
LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFoLXVhcnQt
ZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWguY2VsbAog
IE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLWxpbnV4LWRlbW8uY2VsbAog
IE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLXVhcnQtZGVtby5jZWxsCiAg
T0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMW0uY2VsbAogIE9CSkNPUFkgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dp
dC9jb25maWdzL2FybS9qZXRzb24tdGsxLWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdz
L2FybS9qZXRzb24tdGsxLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2Fy
bS9qZXRzb24tdGsxLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3JhbmdlcGkwLWdp
Yy1kZW1vLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3JhbmdlcGkwLWxpbnV4LWRl
bW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9vcmFuZ2VwaTAuY2VsbAogIExEIFtN
XSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9kcml2ZXIvamFpbGhvdXNlLm8KbWFrZVszXTogKioqIFsvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9v
cmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL01ha2VmaWxlOjE1MTg6IF9tb2R1bGVfL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdF0g
RXJyb3IgMgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjE0Njogc3ViLW1ha2VdIEVycm9yIDIKbWFr
ZVsxXTogKioqIFtNYWtlZmlsZToyNDogX19zdWItbWFrZV0gRXJyb3IgMgptYWtlOiAqKiogW01h
a2VmaWxlOjQwOiBtb2R1bGVzXSBFcnJvciAyCkVSUk9SOiBvZV9ydW5tYWtlIGZhaWxlZApXQVJO
SU5HOiBleGl0IGNvZGUgMSBmcm9tIGEgc2hlbGwgY29tbWFuZC4KRVJST1I6IEV4ZWN1dGlvbiBv
ZiAnL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuMTQ1OTgnIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAxOgog
IFVQRCAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdC9oeXBlcnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL2NvbmZpZy5tawogIEND
ICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9hbGxvYy5vCiAgQ0Mg
ICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2lubWF0ZXMvbGliL2FybS8uLi9hcm0tY29tbW9uLy4uL2NtZGxpbmUubwogIFVQ
RCAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL2dpdC9oeXBlcnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL3ZlcnNpb24uaAogIENDICAg
ICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9wcmludGsubwogIENDICAg
ICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9jb25maWdzL2FybS9iYW5hbmFwaS1naWMtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lu
bWF0ZXMvbGliL2FybS8uLi9hcm0tY29tbW9uLy4uL3NldHVwLm8KICBDQyAgICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29u
Zmlncy9hcm0vYmFuYW5hcGktbGludXgtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJt
L2JhbmFuYXBpLXVhcnQtZGVtby5vCiAgQ0MgW01dICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci9jZWxsLm8KICBDQyAg
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9naXQvaW5tYXRlcy9saWIvYXJtLy4uL2FybS1jb21tb24vLi4vc3RyaW5nLm8KICBDQyAg
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGkubwovdG1wL2NjV1RaVVBPLnM6IEFzc2VtYmxl
ciBtZXNzYWdlczoKL3RtcC9jY1dUWlVQTy5zOjczOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29y
IGRvZXMgbm90IHN1cHBvcnQgYGNwc2lkIGlmJyBpbiBBUk0gbW9kZQovdG1wL2NjV1RaVVBPLnM6
ODc6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgd2ZpJyBpbiBB
Uk0gbW9kZQptYWtlWzZdOiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5l
bC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJt
Ly4uL2FybS1jb21tb24vLi4vc2V0dXAub10gRXJyb3IgMQptYWtlWzZdOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4v
YXJtLWNvbW1vbi8uLi91YXJ0LTgyNTAubwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvbWFpbi5vCiAg
Q0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2h5cGVydmlzb3IvYXJjaC9hcm0vYXNtLWRlZmluZXMucwogIENDICAgICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFlLWxpbnV4LWRlbW8ubwogIExEUyAgICAgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dp
dC9oeXBlcnZpc29yL2h5cGVydmlzb3IubGRzCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2Vt
dHJpb24tcnpnMWUtdWFydC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlv
bi1yemcxZS5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWgtbGludXgt
ZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvZ2l0L2h5cGVydmlzb3Ivc2V0dXAubwogIENDICAgICAgL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9j
b25maWdzL2FybS9lbXRyaW9uLXJ6ZzFoLXVhcnQtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZp
Z3MvYXJtL2VtdHJpb24tcnpnMWgubwovdG1wL2NjcmV0ZUxPLnM6IEFzc2VtYmxlciBtZXNzYWdl
czoKL3RtcC9jY3JldGVMTy5zOjE4NjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGB2
aXJ0JyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3Rt
cC9jY3JldGVMTy5zOjE4NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBw
b3J0IGBodmMgIzB4NGE0OCcgaW4gQVJNIG1vZGUKICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaHlwZXJ2aXNvci9w
cmludGsubwptYWtlWzZdOiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5l
bC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJt
Ly4uL2FybS1jb21tb24vLi4vcHJpbnRrLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFsvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
LXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6NTQ0OiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2lubWF0ZXMvbGliL2FybV0gRXJyb3IgMgptYWtlWzRdOiAqKiogWy9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDo1NDQ6IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvaW5tYXRlc10gRXJyb3IgMgptYWtlWzRdOiAqKiogV2FpdGluZyBmb3Ig
dW5maW5pc2hlZCBqb2JzLi4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6
ZzFtLWxpbnV4LWRlbW8ubwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvc3lzZnMubwogIENDICAgICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9oeXBlcnZpc29yL3BhZ2luZy5vCi90bXAvY2Nkd2tyOVkuczogQXNzZW1ibGVyIG1lc3Nh
Z2VzOgovdG1wL2NjZHdrcjlZLnM6MTY6IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBg
dmlydCcgaXMgbm90IGFsbG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90
bXAvY2Nkd2tyOVkuczo0MjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMg
bm90IGFsbG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2Nkd2ty
OVkuczo0MzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3
IFtyMl0nIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo0NTogRXJyb3I6IHNlbGVjdGVkIHBy
b2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBsZHJleCByMSxbcjJdJyBpbiBBUk0gbW9kZQovdG1w
L2NjZHdrcjlZLnM6NDc6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9y
dCBgc3RyZXggcjAscjMsW3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5zOjcwOiBFcnJv
cjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRtYiBpc2gnIGluIEFSTSBt
b2RlCi90bXAvY2Nkd2tyOVkuczo4MjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGB3ZmUnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczoxNzk6IEVycm9yOiBz
ZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUK
L3RtcC9jY2R3a3I5WS5zOjIwMDogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBz
dXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6MjEyOiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1v
ZGUKL3RtcC9jY2R3a3I5WS5zOjIxNjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBzZXYnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo1OTg6IEVycm9yOiBz
ZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUK
L3RtcC9jY2R3a3I5WS5zOjYyMzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBz
dXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6NjM1OiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1v
ZGUKL3RtcC9jY2R3a3I5WS5zOjYzOTogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBzZXYnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo5NjY6IEVycm9yOiBz
ZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUK
ICBDQyBbTV0gIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvZHJpdmVyL3BjaS5vCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQv
b3JhbmdlLXBpLXplcm8va2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzog
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9oeXBlcnZpc29yL3NldHVwLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFdhaXRpbmcgZm9y
IHVuZmluaXNoZWQgam9icy4uLi4KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlvbi1y
emcxbS11YXJ0LWRlbW8ubwogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvdnBjaV90ZW1wbGF0ZS5kdGIK
L3RtcC9jY0lUVW8yWC5zOiBBc3NlbWJsZXIgbWVzc2FnZXM6Ci90bXAvY2NJVFVvMlguczoxNjog
RXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGB2aXJ0JyBpcyBub3QgYWxsb3dlZCBmb3Ig
dGhlIGN1cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjE2NTogRXJyb3I6
IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9k
ZQovdG1wL2NjSVRVbzJYLnM6MjI5OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90
IHN1cHBvcnQgYGRtYiBpc2gnIGluIEFSTSBtb2RlCi90bXAvY2NJVFVvMlguczoxMzI0OiBFcnJv
cjogYXJjaGl0ZWN0dXJhbCBleHRlbnNpb24gYG1wJyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1
cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjEzMjU6IEVycm9yOiBzZWxl
Y3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgcGxkdyBbcjJdJyBpbiBBUk0gbW9kZQov
dG1wL2NjSVRVbzJYLnM6MTMyNzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBz
dXBwb3J0IGBsZHJleCByMSxbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTMyOTog
RXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzdHJleCByMCxyMyxb
cjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTM1MjogRXJyb3I6IHNlbGVjdGVkIHBy
b2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRV
bzJYLnM6MTM3MzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBk
bWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTM4NjogRXJyb3I6IHNlbGVjdGVk
IHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkc2IgaXNoc3QnIGluIEFSTSBtb2RlCi90bXAv
Y2NJVFVvMlguczoxMzkwOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBv
cnQgYHNldicgaW4gQVJNIG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE0MjA6IEVycm9yOiBzZWxlY3Rl
ZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgd2ZlJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRV
bzJYLnM6MTQ4NTogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFs
bG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NJVFVvMlguczox
NDg2OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcgW3Iz
XScgaW4gQVJNIG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE0OTk6IEVycm9yOiBzZWxlY3RlZCBwcm9j
ZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgbGRyZXggbHIsW3IzXScgaW4gQVJNIG1vZGUKL3RtcC9j
Y0lUVW8yWC5zOjE1MDM6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9y
dCBgc3RyZXggaXAsbHIsW3IzXScgaW4gQVJNIG1vZGUKbWFrZVs1XTogKioqIFsvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNo
YXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6
MzAzOiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2h5cGVydmlzb3IvcHJpbnRrLm9dIEVycm9yIDEKICBDQyAgICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29u
Zmlncy9hcm0vZW10cmlvbi1yemcxbS5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNv
bi10azEtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkv
eW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEtbGludXgt
ZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEubwovdG1wL2NjcjVL
ZUYxLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKL3RtcC9jY3I1S2VGMS5zOjE2OiBFcnJvcjogYXJj
aGl0ZWN0dXJhbCBleHRlbnNpb24gYHZpcnQnIGlzIG5vdCBhbGxvd2VkIGZvciB0aGUgY3VycmVu
dCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MTMyOiBFcnJvcjogc2VsZWN0ZWQg
cHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHJiaXQgcjMscjMnIGluIEFSTSBtb2RlCi90bXAv
Y2NyNUtlRjEuczozMDU6IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5v
dCBhbGxvd2VkIGZvciB0aGUgY3VycmVudCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYx
LnM6MzA2OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcg
W3IzXScgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjMyMzogRXJyb3I6IHNlbGVjdGVkIHBy
b2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBsZHJleCBpcCxbcjNdJyBpbiBBUk0gbW9kZQovdG1w
L2NjcjVLZUYxLnM6MzI1OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBv
cnQgYHN0cmV4IHIwLGlwLFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczo0MzE6IEVy
cm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZHNiICcgaW4gQVJNIG1v
ZGUKL3RtcC9jY3I1S2VGMS5zOjQ0NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBkc2IgJyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6NDUxOiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGlzYicgaW4gQVJNIG1vZGUKL3Rt
cC9jY3I1S2VGMS5zOjY2MTogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMg
bm90IGFsbG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NyNUtl
RjEuczo2NjI6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgcGxk
dyBbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6NjgyOiBFcnJvcjogc2VsZWN0ZWQg
cHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGxkcmV4IHIwLFtyMl0nIGluIEFSTSBtb2RlCi90
bXAvY2NyNUtlRjEuczo2ODQ6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3Vw
cG9ydCBgc3RyZXggcjEscjAsW3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjI2MzQ6
IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5vdCBhbGxvd2VkIGZvciB0
aGUgY3VycmVudCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MjYzNTogRXJyb3I6
IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3IFtyM10nIGluIEFSTSBt
b2RlCi90bXAvY2NyNUtlRjEuczoyNjUyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMg
bm90IHN1cHBvcnQgYGxkcmV4IGxyLFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczoy
NjU0OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHN0cmV4IGlw
LGxyLFtyM10nIGluIEFSTSBtb2RlCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3Jhbmdl
LXBpLXplcm8va2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzogL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9o
eXBlcnZpc29yL3BhZ2luZy5vXSBFcnJvciAxCm1ha2VbNF06ICoqKiBbL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQv
b3JhbmdlLXBpLXplcm8va2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU0NDog
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9oeXBlcnZpc29yXSBFcnJvciAyCiAgRFRCICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci92cGNpX3RlbXBs
YXRlLmR0Yi5TCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL29yYW5nZXBpMC1naWMtZGVtby5v
CiAgQVMgW01dICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvZ2l0L2RyaXZlci92cGNpX3RlbXBsYXRlLmR0Yi5vCiAgQ0MgICAgICAvaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0
L2NvbmZpZ3MvYXJtL29yYW5nZXBpMC1saW51eC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmln
cy9hcm0vb3JhbmdlcGkwLm8KICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1i
YW5hbmFwaS5kdGIKICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1lbXRyaW9u
LWVtY29ucnpnMWUuZHRiCiAgRFRDICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2R0cy9pbm1hdGUtZW10
cmlvbi1lbWNvbnJ6ZzFoLmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRl
LWVtdHJpb24tZW1jb25yemcxbS5kdGIKICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lu
bWF0ZS1qZXRzb24tdGsxLmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRl
LW9yYW5nZXBpMC5kdGIKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGktZ2ljLWRl
bW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9iYW5hbmFwaS1saW51eC1kZW1vLmNl
bGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGktdWFydC1kZW1vLmNlbGwKICBP
QkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGkuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25m
aWdzL2FybS9lbXRyaW9uLXJ6ZzFlLXVhcnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZp
Z3MvYXJtL2VtdHJpb24tcnpnMWUtbGludXgtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZp
Z3MvYXJtL2VtdHJpb24tcnpnMWUuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRy
aW9uLXJ6ZzFoLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRy
aW9uLXJ6ZzFoLXVhcnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJp
b24tcnpnMWguY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLWxp
bnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLXVh
cnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkv
eW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMW0uY2Vs
bAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9qZXRzb24tdGsxLWRlbW8uY2VsbAogIE9CSkNP
UFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9jb25maWdzL2FybS9qZXRzb24tdGsxLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9jb25maWdzL2FybS9qZXRzb24tdGsxLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9h
cm0vb3JhbmdlcGkwLWdpYy1kZW1vLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3Jh
bmdlcGkwLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9vcmFuZ2Vw
aTAuY2VsbAogIExEIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvamFpbGhvdXNlLm8KbWFrZVszXTogKioqIFsv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrLXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL01ha2VmaWxlOjE1MTg6
IF9tb2R1bGVfL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdF0gRXJyb3IgMgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjE0Njogc3ViLW1h
a2VdIEVycm9yIDIKbWFrZVsxXTogKioqIFtNYWtlZmlsZToyNDogX19zdWItbWFrZV0gRXJyb3Ig
MgptYWtlOiAqKiogW01ha2VmaWxlOjQwOiBtb2R1bGVzXSBFcnJvciAyCldBUk5JTkc6IGV4aXQg
Y29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLgoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_cleansstate.14255"
Content-Disposition: attachment; filename="log.do_cleansstate.14255"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3761>
X-Attachment-Id: f_jz9oy3761

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fY2xlYW5zc3RhdGUKTk9URTogUmVt
b3ZpbmcgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS9z
c3RhdGUtY2FjaGUvKi9zc3RhdGU6amFpbGhvdXNlOm9yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmk6MC4xMTpyMDpvcmFuZ2VfcGlfemVybzozOipfcGFja2FnZS50Z3oqCk5PVEU6IFJlbW92
aW5nIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vc3N0
YXRlLWNhY2hlLyovc3N0YXRlOmphaWxob3VzZTpvcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpOjAuMTE6cjA6b3JhbmdlX3BpX3plcm86MzoqX3BhY2thZ2VfcWEudGd6KgpOT1RFOiBSZW1v
dmluZyAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Nz
dGF0ZS1jYWNoZS8qL3NzdGF0ZTpqYWlsaG91c2U6b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaTowLjExOnIwOm9yYW5nZV9waV96ZXJvOjM6Kl9wYWNrYWdlX3dyaXRlX2lway50Z3oqCk5P
VEU6IFJlbW92aW5nIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vc3N0YXRlLWNhY2hlLyovc3N0YXRlOmphaWxob3VzZTpvcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpOjAuMTE6cjA6b3JhbmdlX3BpX3plcm86MzoqX3BhY2thZ2VkYXRhLnRneioK
Tk9URTogUmVtb3ZpbmcgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS9zc3RhdGUtY2FjaGUvKi9zc3RhdGU6amFpbGhvdXNlOjowLjExOnIwOjozOipfcG9w
dWxhdGVfbGljLnRneioKTk9URTogUmVtb3ZpbmcgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS9zc3RhdGUtY2FjaGUvKi9zc3RhdGU6amFpbGhvdXNlOm9y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmk6MC4xMTpyMDpvcmFuZ2VfcGlfemVybzozOipf
cG9wdWxhdGVfc3lzcm9vdC50Z3oqCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gZG9fY2xlYW5zc3Rh
dGUgZmluaXNoZWQK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_cleansstate"
Content-Disposition: attachment; filename="log.do_cleansstate"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy36k0>
X-Attachment-Id: f_jz9oy36k0

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fY2xlYW5zc3RhdGUKTk9URTogUmVt
b3ZpbmcgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS9z
c3RhdGUtY2FjaGUvKi9zc3RhdGU6amFpbGhvdXNlOm9yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmk6MC4xMTpyMDpvcmFuZ2VfcGlfemVybzozOipfcGFja2FnZS50Z3oqCk5PVEU6IFJlbW92
aW5nIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vc3N0
YXRlLWNhY2hlLyovc3N0YXRlOmphaWxob3VzZTpvcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpOjAuMTE6cjA6b3JhbmdlX3BpX3plcm86MzoqX3BhY2thZ2VfcWEudGd6KgpOT1RFOiBSZW1v
dmluZyAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Nz
dGF0ZS1jYWNoZS8qL3NzdGF0ZTpqYWlsaG91c2U6b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaTowLjExOnIwOm9yYW5nZV9waV96ZXJvOjM6Kl9wYWNrYWdlX3dyaXRlX2lway50Z3oqCk5P
VEU6IFJlbW92aW5nIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vc3N0YXRlLWNhY2hlLyovc3N0YXRlOmphaWxob3VzZTpvcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpOjAuMTE6cjA6b3JhbmdlX3BpX3plcm86MzoqX3BhY2thZ2VkYXRhLnRneioK
Tk9URTogUmVtb3ZpbmcgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS9zc3RhdGUtY2FjaGUvKi9zc3RhdGU6amFpbGhvdXNlOjowLjExOnIwOjozOipfcG9w
dWxhdGVfbGljLnRneioKTk9URTogUmVtb3ZpbmcgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS9zc3RhdGUtY2FjaGUvKi9zc3RhdGU6amFpbGhvdXNlOm9y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmk6MC4xMTpyMDpvcmFuZ2VfcGlfemVybzozOipf
cG9wdWxhdGVfc3lzcm9vdC50Z3oqCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gZG9fY2xlYW5zc3Rh
dGUgZmluaXNoZWQK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_compile"
Content-Disposition: attachment; filename="log.do_compile"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy37a2>
X-Attachment-Id: f_jz9oy37a2

REVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb21waWxlCk5PVEU6IG1ha2UgLWog
OCBLRVJORUxfU1JDPS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Ug
Vj0wIENST1NTX0NPTVBJTEU9YXJtLW9lLWxpbnV4LWdudWVhYmktIEtESVI9L2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFy
ZWQvb3JhbmdlLXBpLXplcm8va2VybmVsLWJ1aWxkLWFydGlmYWN0cwogIFVQRCAgICAgL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9o
eXBlcnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL2NvbmZpZy5tawogIENDICAgICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1h
dGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9hbGxvYy5vCiAgQ0MgICAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lubWF0
ZXMvbGliL2FybS8uLi9hcm0tY29tbW9uLy4uL2NtZGxpbmUubwogIFVQRCAgICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBl
cnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL3ZlcnNpb24uaAogIENDICAgICAgL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1hdGVz
L2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9wcmludGsubwogIENDICAgICAgL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdz
L2FybS9iYW5hbmFwaS1naWMtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lubWF0ZXMvbGliL2FybS8u
Li9hcm0tY29tbW9uLy4uL3NldHVwLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5h
cGktbGludXgtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2JhbmFuYXBpLXVhcnQt
ZGVtby5vCiAgQ0MgW01dICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci9jZWxsLm8KICBDQyAgICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRl
cy9saWIvYXJtLy4uL2FybS1jb21tb24vLi4vc3RyaW5nLm8KICBDQyAgICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmln
cy9hcm0vYmFuYW5hcGkubwovdG1wL2NjV1RaVVBPLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKL3Rt
cC9jY1dUWlVQTy5zOjczOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBv
cnQgYGNwc2lkIGlmJyBpbiBBUk0gbW9kZQovdG1wL2NjV1RaVVBPLnM6ODc6IEVycm9yOiBzZWxl
Y3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgd2ZpJyBpbiBBUk0gbW9kZQptYWtlWzZd
OiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJtLy4uL2FybS1jb21tb24v
Li4vc2V0dXAub10gRXJyb3IgMQptYWtlWzZdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBq
b2JzLi4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi91
YXJ0LTgyNTAubwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvbWFpbi5vCiAgQ0MgICAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2h5
cGVydmlzb3IvYXJjaC9hcm0vYXNtLWRlZmluZXMucwogIENDICAgICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2Fy
bS9lbXRyaW9uLXJ6ZzFlLWxpbnV4LWRlbW8ubwogIExEUyAgICAgL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29yL2h5
cGVydmlzb3IubGRzCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkv
eW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWUtdWFy
dC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlvbi1yemcxZS5vCiAgQ0Mg
ICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWgtbGludXgtZGVtby5vCiAgQ0MgICAg
ICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvZ2l0L2h5cGVydmlzb3Ivc2V0dXAubwogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRy
aW9uLXJ6ZzFoLXVhcnQtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24t
cnpnMWgubwovdG1wL2NjcmV0ZUxPLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKL3RtcC9jY3JldGVM
Ty5zOjE4NjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGB2aXJ0JyBpcyBub3QgYWxs
b3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3RtcC9jY3JldGVMTy5zOjE4
NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBodmMgIzB4NGE0
OCcgaW4gQVJNIG1vZGUKICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaHlwZXJ2aXNvci9wcmludGsubwptYWtlWzZd
OiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJtLy4uL2FybS1jb21tb24v
Li4vcHJpbnRrLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFsvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2Ut
cGktemVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTQ0OiAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lu
bWF0ZXMvbGliL2FybV0gRXJyb3IgMgptYWtlWzRdOiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5n
ZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NDQ6IC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
aW5tYXRlc10gRXJyb3IgMgptYWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLWxpbnV4LWRlbW8u
bwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvc3lzZnMubwogIENDICAgICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29y
L3BhZ2luZy5vCi90bXAvY2Nkd2tyOVkuczogQXNzZW1ibGVyIG1lc3NhZ2VzOgovdG1wL2NjZHdr
cjlZLnM6MTY6IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgdmlydCcgaXMgbm90IGFs
bG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2Nkd2tyOVkuczo0
MjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFsbG93ZWQgZm9y
IHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2Nkd2tyOVkuczo0MzogRXJyb3I6
IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3IFtyMl0nIGluIEFSTSBt
b2RlCi90bXAvY2Nkd2tyOVkuczo0NTogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBsZHJleCByMSxbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6NDc6
IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgc3RyZXggcjAscjMs
W3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5zOjcwOiBFcnJvcjogc2VsZWN0ZWQgcHJv
Y2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRtYiBpc2gnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2ty
OVkuczo4MjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGB3ZmUn
IGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczoxNzk6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNz
b3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5z
OjIwMDogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNo
JyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6MjEyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vz
c29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5
WS5zOjIxNjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzZXYn
IGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo1OTg6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNz
b3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5z
OjYyMzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNo
JyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6NjM1OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vz
c29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5
WS5zOjYzOTogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzZXYn
IGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo5NjY6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNz
b3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUKICBDQyBbTV0gIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
ZHJpdmVyL3BjaS5vCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8v
a2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzogL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29y
L3NldHVwLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9i
cy4uLi4KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlvbi1yemcxbS11YXJ0LWRlbW8u
bwogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvdnBjaV90ZW1wbGF0ZS5kdGIKL3RtcC9jY0lUVW8yWC5z
OiBBc3NlbWJsZXIgbWVzc2FnZXM6Ci90bXAvY2NJVFVvMlguczoxNjogRXJyb3I6IGFyY2hpdGVj
dHVyYWwgZXh0ZW5zaW9uIGB2aXJ0JyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFz
ZSBhcmNoaXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjE2NTogRXJyb3I6IHNlbGVjdGVkIHByb2Nl
c3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJY
LnM6MjI5OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRtYiBp
c2gnIGluIEFSTSBtb2RlCi90bXAvY2NJVFVvMlguczoxMzI0OiBFcnJvcjogYXJjaGl0ZWN0dXJh
bCBleHRlbnNpb24gYG1wJyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFzZSBhcmNo
aXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjEzMjU6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3Ig
ZG9lcyBub3Qgc3VwcG9ydCBgcGxkdyBbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6
MTMyNzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBsZHJleCBy
MSxbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTMyOTogRXJyb3I6IHNlbGVjdGVk
IHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzdHJleCByMCxyMyxbcjJdJyBpbiBBUk0gbW9k
ZQovdG1wL2NjSVRVbzJYLnM6MTM1MjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTM3MzogRXJy
b3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0g
bW9kZQovdG1wL2NjSVRVbzJYLnM6MTM4NjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2Vz
IG5vdCBzdXBwb3J0IGBkc2IgaXNoc3QnIGluIEFSTSBtb2RlCi90bXAvY2NJVFVvMlguczoxMzkw
OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHNldicgaW4gQVJN
IG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE0MjA6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9l
cyBub3Qgc3VwcG9ydCBgd2ZlJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTQ4NTogRXJy
b3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFsbG93ZWQgZm9yIHRoZSBj
dXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NJVFVvMlguczoxNDg2OiBFcnJvcjogc2Vs
ZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcgW3IzXScgaW4gQVJNIG1vZGUK
L3RtcC9jY0lUVW8yWC5zOjE0OTk6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qg
c3VwcG9ydCBgbGRyZXggbHIsW3IzXScgaW4gQVJNIG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE1MDM6
IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgc3RyZXggaXAsbHIs
W3IzXScgaW4gQVJNIG1vZGUKbWFrZVs1XTogKioqIFsvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2UtcGkt
emVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MzAzOiAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2h5cGVy
dmlzb3IvcHJpbnRrLm9dIEVycm9yIDEKICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlv
bi1yemcxbS5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEtZGVtby5vCiAg
Q0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEtbGludXgtZGVtby5vCiAgQ0MgICAg
ICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEubwovdG1wL2NjcjVLZUYxLnM6IEFzc2VtYmxl
ciBtZXNzYWdlczoKL3RtcC9jY3I1S2VGMS5zOjE2OiBFcnJvcjogYXJjaGl0ZWN0dXJhbCBleHRl
bnNpb24gYHZpcnQnIGlzIG5vdCBhbGxvd2VkIGZvciB0aGUgY3VycmVudCBiYXNlIGFyY2hpdGVj
dHVyZQovdG1wL2NjcjVLZUYxLnM6MTMyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMg
bm90IHN1cHBvcnQgYHJiaXQgcjMscjMnIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczozMDU6
IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5vdCBhbGxvd2VkIGZvciB0
aGUgY3VycmVudCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MzA2OiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcgW3IzXScgaW4gQVJNIG1v
ZGUKL3RtcC9jY3I1S2VGMS5zOjMyMzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBsZHJleCBpcCxbcjNdJyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6MzI1
OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHN0cmV4IHIwLGlw
LFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczo0MzE6IEVycm9yOiBzZWxlY3RlZCBw
cm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZHNiICcgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VG
MS5zOjQ0NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkc2Ig
JyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6NDUxOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vz
c29yIGRvZXMgbm90IHN1cHBvcnQgYGlzYicgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjY2
MTogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFsbG93ZWQgZm9y
IHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NyNUtlRjEuczo2NjI6IEVycm9y
OiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgcGxkdyBbcjJdJyBpbiBBUk0g
bW9kZQovdG1wL2NjcjVLZUYxLnM6NjgyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMg
bm90IHN1cHBvcnQgYGxkcmV4IHIwLFtyMl0nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczo2
ODQ6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgc3RyZXggcjEs
cjAsW3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjI2MzQ6IEVycm9yOiBhcmNoaXRl
Y3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5vdCBhbGxvd2VkIGZvciB0aGUgY3VycmVudCBiYXNl
IGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MjYzNTogRXJyb3I6IHNlbGVjdGVkIHByb2Nl
c3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3IFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtl
RjEuczoyNjUyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGxk
cmV4IGxyLFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczoyNjU0OiBFcnJvcjogc2Vs
ZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHN0cmV4IGlwLGxyLFtyM10nIGluIEFS
TSBtb2RlCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8va2VybmVs
LXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzogL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29yL3BhZ2lu
Zy5vXSBFcnJvciAxCm1ha2VbNF06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8v
a2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU0NDogL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9oeXBlcnZpc29y
XSBFcnJvciAyCiAgRFRCICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci92cGNpX3RlbXBsYXRlLmR0Yi5TCiAgQ0Mg
ICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL29yYW5nZXBpMC1naWMtZGVtby5vCiAgQVMgW01dICAvaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0
L2RyaXZlci92cGNpX3RlbXBsYXRlLmR0Yi5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL29y
YW5nZXBpMC1saW51eC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3JhbmdlcGkw
Lm8KICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1iYW5hbmFwaS5kdGIKICBE
VEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1lbXRyaW9uLWVtY29ucnpnMWUuZHRi
CiAgRFRDICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2R0cy9pbm1hdGUtZW10cmlvbi1lbWNvbnJ6ZzFo
LmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRlLWVtdHJpb24tZW1jb25y
emcxbS5kdGIKICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1qZXRzb24tdGsx
LmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRlLW9yYW5nZXBpMC5kdGIK
ICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGktZ2ljLWRlbW8uY2VsbAogIE9CSkNP
UFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9jb25maWdzL2FybS9iYW5hbmFwaS1saW51eC1kZW1vLmNlbGwKICBPQkpDT1BZIC9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9n
aXQvY29uZmlncy9hcm0vYmFuYW5hcGktdWFydC1kZW1vLmNlbGwKICBPQkpDT1BZIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29u
Zmlncy9hcm0vYmFuYW5hcGkuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9u
LXJ6ZzFlLXVhcnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24t
cnpnMWUtbGludXgtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24t
cnpnMWUuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFoLWxpbnV4
LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFoLXVhcnQt
ZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWguY2VsbAog
IE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLWxpbnV4LWRlbW8uY2VsbAog
IE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLXVhcnQtZGVtby5jZWxsCiAg
T0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMW0uY2VsbAogIE9CSkNPUFkgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dp
dC9jb25maWdzL2FybS9qZXRzb24tdGsxLWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdz
L2FybS9qZXRzb24tdGsxLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2Fy
bS9qZXRzb24tdGsxLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3JhbmdlcGkwLWdp
Yy1kZW1vLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3JhbmdlcGkwLWxpbnV4LWRl
bW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9vcmFuZ2VwaTAuY2VsbAogIExEIFtN
XSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9kcml2ZXIvamFpbGhvdXNlLm8KbWFrZVszXTogKioqIFsvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9v
cmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL01ha2VmaWxlOjE1MTg6IF9tb2R1bGVfL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdF0g
RXJyb3IgMgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjE0Njogc3ViLW1ha2VdIEVycm9yIDIKbWFr
ZVsxXTogKioqIFtNYWtlZmlsZToyNDogX19zdWItbWFrZV0gRXJyb3IgMgptYWtlOiAqKiogW01h
a2VmaWxlOjQwOiBtb2R1bGVzXSBFcnJvciAyCkVSUk9SOiBvZV9ydW5tYWtlIGZhaWxlZApXQVJO
SU5HOiBleGl0IGNvZGUgMSBmcm9tIGEgc2hlbGwgY29tbWFuZC4KRVJST1I6IEV4ZWN1dGlvbiBv
ZiAnL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuMTQ1OTgnIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAxOgog
IFVQRCAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdC9oeXBlcnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL2NvbmZpZy5tawogIEND
ICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9hbGxvYy5vCiAgQ0Mg
ICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2lubWF0ZXMvbGliL2FybS8uLi9hcm0tY29tbW9uLy4uL2NtZGxpbmUubwogIFVQ
RCAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL2dpdC9oeXBlcnZpc29yL2luY2x1ZGUvZ2VuZXJhdGVkL3ZlcnNpb24uaAogIENDICAg
ICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4vYXJtLWNvbW1vbi8uLi9wcmludGsubwogIENDICAg
ICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9jb25maWdzL2FybS9iYW5hbmFwaS1naWMtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2lu
bWF0ZXMvbGliL2FybS8uLi9hcm0tY29tbW9uLy4uL3NldHVwLm8KICBDQyAgICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29u
Zmlncy9hcm0vYmFuYW5hcGktbGludXgtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJt
L2JhbmFuYXBpLXVhcnQtZGVtby5vCiAgQ0MgW01dICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci9jZWxsLm8KICBDQyAg
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9naXQvaW5tYXRlcy9saWIvYXJtLy4uL2FybS1jb21tb24vLi4vc3RyaW5nLm8KICBDQyAg
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGkubwovdG1wL2NjV1RaVVBPLnM6IEFzc2VtYmxl
ciBtZXNzYWdlczoKL3RtcC9jY1dUWlVQTy5zOjczOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29y
IGRvZXMgbm90IHN1cHBvcnQgYGNwc2lkIGlmJyBpbiBBUk0gbW9kZQovdG1wL2NjV1RaVVBPLnM6
ODc6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgd2ZpJyBpbiBB
Uk0gbW9kZQptYWtlWzZdOiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5l
bC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJt
Ly4uL2FybS1jb21tb24vLi4vc2V0dXAub10gRXJyb3IgMQptYWtlWzZdOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9pbm1hdGVzL2xpYi9hcm0vLi4v
YXJtLWNvbW1vbi8uLi91YXJ0LTgyNTAubwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvbWFpbi5vCiAg
Q0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2h5cGVydmlzb3IvYXJjaC9hcm0vYXNtLWRlZmluZXMucwogIENDICAgICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFlLWxpbnV4LWRlbW8ubwogIExEUyAgICAgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dp
dC9oeXBlcnZpc29yL2h5cGVydmlzb3IubGRzCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2Vt
dHJpb24tcnpnMWUtdWFydC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlv
bi1yemcxZS5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMWgtbGludXgt
ZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvZ2l0L2h5cGVydmlzb3Ivc2V0dXAubwogIENDICAgICAgL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9j
b25maWdzL2FybS9lbXRyaW9uLXJ6ZzFoLXVhcnQtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZp
Z3MvYXJtL2VtdHJpb24tcnpnMWgubwovdG1wL2NjcmV0ZUxPLnM6IEFzc2VtYmxlciBtZXNzYWdl
czoKL3RtcC9jY3JldGVMTy5zOjE4NjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGB2
aXJ0JyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3Rt
cC9jY3JldGVMTy5zOjE4NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBw
b3J0IGBodmMgIzB4NGE0OCcgaW4gQVJNIG1vZGUKICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaHlwZXJ2aXNvci9w
cmludGsubwptYWtlWzZdOiAqKiogWy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5l
bC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozMDM6IC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5tYXRlcy9saWIvYXJt
Ly4uL2FybS1jb21tb24vLi4vcHJpbnRrLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFsvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
LXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6NTQ0OiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvZ2l0L2lubWF0ZXMvbGliL2FybV0gRXJyb3IgMgptYWtlWzRdOiAqKiogWy9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmstc2hhcmVkL29yYW5nZS1waS16ZXJvL2tlcm5lbC1zb3VyY2Uvc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDo1NDQ6IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvaW5tYXRlc10gRXJyb3IgMgptYWtlWzRdOiAqKiogV2FpdGluZyBmb3Ig
dW5maW5pc2hlZCBqb2JzLi4uLgogIENDICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6
ZzFtLWxpbnV4LWRlbW8ubwogIENDIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvc3lzZnMubwogIENDICAgICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9oeXBlcnZpc29yL3BhZ2luZy5vCi90bXAvY2Nkd2tyOVkuczogQXNzZW1ibGVyIG1lc3Nh
Z2VzOgovdG1wL2NjZHdrcjlZLnM6MTY6IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBg
dmlydCcgaXMgbm90IGFsbG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90
bXAvY2Nkd2tyOVkuczo0MjogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMg
bm90IGFsbG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2Nkd2ty
OVkuczo0MzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3
IFtyMl0nIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo0NTogRXJyb3I6IHNlbGVjdGVkIHBy
b2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBsZHJleCByMSxbcjJdJyBpbiBBUk0gbW9kZQovdG1w
L2NjZHdrcjlZLnM6NDc6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9y
dCBgc3RyZXggcjAscjMsW3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY2R3a3I5WS5zOjcwOiBFcnJv
cjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRtYiBpc2gnIGluIEFSTSBt
b2RlCi90bXAvY2Nkd2tyOVkuczo4MjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGB3ZmUnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczoxNzk6IEVycm9yOiBz
ZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUK
L3RtcC9jY2R3a3I5WS5zOjIwMDogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBz
dXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6MjEyOiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1v
ZGUKL3RtcC9jY2R3a3I5WS5zOjIxNjogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBzZXYnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo1OTg6IEVycm9yOiBz
ZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUK
L3RtcC9jY2R3a3I5WS5zOjYyMzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBz
dXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjZHdrcjlZLnM6NjM1OiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGRzYiBpc2hzdCcgaW4gQVJNIG1v
ZGUKL3RtcC9jY2R3a3I5WS5zOjYzOTogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBzZXYnIGluIEFSTSBtb2RlCi90bXAvY2Nkd2tyOVkuczo5NjY6IEVycm9yOiBz
ZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZG1iIGlzaCcgaW4gQVJNIG1vZGUK
ICBDQyBbTV0gIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvZHJpdmVyL3BjaS5vCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQv
b3JhbmdlLXBpLXplcm8va2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzog
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9oeXBlcnZpc29yL3NldHVwLm9dIEVycm9yIDEKbWFrZVs1XTogKioqIFdhaXRpbmcgZm9y
IHVuZmluaXNoZWQgam9icy4uLi4KICBDQyAgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZW10cmlvbi1y
emcxbS11YXJ0LWRlbW8ubwogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvdnBjaV90ZW1wbGF0ZS5kdGIK
L3RtcC9jY0lUVW8yWC5zOiBBc3NlbWJsZXIgbWVzc2FnZXM6Ci90bXAvY2NJVFVvMlguczoxNjog
RXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGB2aXJ0JyBpcyBub3QgYWxsb3dlZCBmb3Ig
dGhlIGN1cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjE2NTogRXJyb3I6
IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9k
ZQovdG1wL2NjSVRVbzJYLnM6MjI5OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90
IHN1cHBvcnQgYGRtYiBpc2gnIGluIEFSTSBtb2RlCi90bXAvY2NJVFVvMlguczoxMzI0OiBFcnJv
cjogYXJjaGl0ZWN0dXJhbCBleHRlbnNpb24gYG1wJyBpcyBub3QgYWxsb3dlZCBmb3IgdGhlIGN1
cnJlbnQgYmFzZSBhcmNoaXRlY3R1cmUKL3RtcC9jY0lUVW8yWC5zOjEzMjU6IEVycm9yOiBzZWxl
Y3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgcGxkdyBbcjJdJyBpbiBBUk0gbW9kZQov
dG1wL2NjSVRVbzJYLnM6MTMyNzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBz
dXBwb3J0IGBsZHJleCByMSxbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTMyOTog
RXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBzdHJleCByMCxyMyxb
cjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTM1MjogRXJyb3I6IHNlbGVjdGVkIHBy
b2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkbWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRV
bzJYLnM6MTM3MzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBk
bWIgaXNoJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRVbzJYLnM6MTM4NjogRXJyb3I6IHNlbGVjdGVk
IHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBkc2IgaXNoc3QnIGluIEFSTSBtb2RlCi90bXAv
Y2NJVFVvMlguczoxMzkwOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBv
cnQgYHNldicgaW4gQVJNIG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE0MjA6IEVycm9yOiBzZWxlY3Rl
ZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgd2ZlJyBpbiBBUk0gbW9kZQovdG1wL2NjSVRV
bzJYLnM6MTQ4NTogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMgbm90IGFs
bG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NJVFVvMlguczox
NDg2OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcgW3Iz
XScgaW4gQVJNIG1vZGUKL3RtcC9jY0lUVW8yWC5zOjE0OTk6IEVycm9yOiBzZWxlY3RlZCBwcm9j
ZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgbGRyZXggbHIsW3IzXScgaW4gQVJNIG1vZGUKL3RtcC9j
Y0lUVW8yWC5zOjE1MDM6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9y
dCBgc3RyZXggaXAsbHIsW3IzXScgaW4gQVJNIG1vZGUKbWFrZVs1XTogKioqIFsvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNo
YXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6
MzAzOiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvZ2l0L2h5cGVydmlzb3IvcHJpbnRrLm9dIEVycm9yIDEKICBDQyAgICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29u
Zmlncy9hcm0vZW10cmlvbi1yemcxbS5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNv
bi10azEtZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkv
eW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEtbGludXgt
ZGVtby5vCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2pldHNvbi10azEubwovdG1wL2NjcjVL
ZUYxLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKL3RtcC9jY3I1S2VGMS5zOjE2OiBFcnJvcjogYXJj
aGl0ZWN0dXJhbCBleHRlbnNpb24gYHZpcnQnIGlzIG5vdCBhbGxvd2VkIGZvciB0aGUgY3VycmVu
dCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MTMyOiBFcnJvcjogc2VsZWN0ZWQg
cHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHJiaXQgcjMscjMnIGluIEFSTSBtb2RlCi90bXAv
Y2NyNUtlRjEuczozMDU6IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5v
dCBhbGxvd2VkIGZvciB0aGUgY3VycmVudCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYx
LnM6MzA2OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHBsZHcg
W3IzXScgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjMyMzogRXJyb3I6IHNlbGVjdGVkIHBy
b2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBsZHJleCBpcCxbcjNdJyBpbiBBUk0gbW9kZQovdG1w
L2NjcjVLZUYxLnM6MzI1OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBv
cnQgYHN0cmV4IHIwLGlwLFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczo0MzE6IEVy
cm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgZHNiICcgaW4gQVJNIG1v
ZGUKL3RtcC9jY3I1S2VGMS5zOjQ0NzogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5v
dCBzdXBwb3J0IGBkc2IgJyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6NDUxOiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGlzYicgaW4gQVJNIG1vZGUKL3Rt
cC9jY3I1S2VGMS5zOjY2MTogRXJyb3I6IGFyY2hpdGVjdHVyYWwgZXh0ZW5zaW9uIGBtcCcgaXMg
bm90IGFsbG93ZWQgZm9yIHRoZSBjdXJyZW50IGJhc2UgYXJjaGl0ZWN0dXJlCi90bXAvY2NyNUtl
RjEuczo2NjI6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgcGxk
dyBbcjJdJyBpbiBBUk0gbW9kZQovdG1wL2NjcjVLZUYxLnM6NjgyOiBFcnJvcjogc2VsZWN0ZWQg
cHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGxkcmV4IHIwLFtyMl0nIGluIEFSTSBtb2RlCi90
bXAvY2NyNUtlRjEuczo2ODQ6IEVycm9yOiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3Vw
cG9ydCBgc3RyZXggcjEscjAsW3IyXScgaW4gQVJNIG1vZGUKL3RtcC9jY3I1S2VGMS5zOjI2MzQ6
IEVycm9yOiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBgbXAnIGlzIG5vdCBhbGxvd2VkIGZvciB0
aGUgY3VycmVudCBiYXNlIGFyY2hpdGVjdHVyZQovdG1wL2NjcjVLZUYxLnM6MjYzNTogRXJyb3I6
IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBwbGR3IFtyM10nIGluIEFSTSBt
b2RlCi90bXAvY2NyNUtlRjEuczoyNjUyOiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMg
bm90IHN1cHBvcnQgYGxkcmV4IGxyLFtyM10nIGluIEFSTSBtb2RlCi90bXAvY2NyNUtlRjEuczoy
NjU0OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHN0cmV4IGlw
LGxyLFtyM10nIGluIEFSTSBtb2RlCm1ha2VbNV06ICoqKiBbL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3Jhbmdl
LXBpLXplcm8va2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzogL2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9o
eXBlcnZpc29yL3BhZ2luZy5vXSBFcnJvciAxCm1ha2VbNF06ICoqKiBbL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQv
b3JhbmdlLXBpLXplcm8va2VybmVsLXNvdXJjZS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU0NDog
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9oeXBlcnZpc29yXSBFcnJvciAyCiAgRFRCICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2RyaXZlci92cGNpX3RlbXBs
YXRlLmR0Yi5TCiAgQ0MgICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL29yYW5nZXBpMC1naWMtZGVtby5v
CiAgQVMgW01dICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvZ2l0L2RyaXZlci92cGNpX3RlbXBsYXRlLmR0Yi5vCiAgQ0MgICAgICAvaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0
L2NvbmZpZ3MvYXJtL29yYW5nZXBpMC1saW51eC1kZW1vLm8KICBDQyAgICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmln
cy9hcm0vb3JhbmdlcGkwLm8KICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1i
YW5hbmFwaS5kdGIKICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lubWF0ZS1lbXRyaW9u
LWVtY29ucnpnMWUuZHRiCiAgRFRDICAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2R0cy9pbm1hdGUtZW10
cmlvbi1lbWNvbnJ6ZzFoLmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRl
LWVtdHJpb24tZW1jb25yemcxbS5kdGIKICBEVEMgICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vZHRzL2lu
bWF0ZS1qZXRzb24tdGsxLmR0YgogIERUQyAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9kdHMvaW5tYXRl
LW9yYW5nZXBpMC5kdGIKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGktZ2ljLWRl
bW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9iYW5hbmFwaS1saW51eC1kZW1vLmNl
bGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGktdWFydC1kZW1vLmNlbGwKICBP
QkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9naXQvY29uZmlncy9hcm0vYmFuYW5hcGkuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25m
aWdzL2FybS9lbXRyaW9uLXJ6ZzFlLXVhcnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZp
Z3MvYXJtL2VtdHJpb24tcnpnMWUtbGludXgtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZp
Z3MvYXJtL2VtdHJpb24tcnpnMWUuY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRy
aW9uLXJ6ZzFoLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRy
aW9uLXJ6ZzFoLXVhcnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJp
b24tcnpnMWguY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLWxp
bnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9lbXRyaW9uLXJ6ZzFtLXVh
cnQtZGVtby5jZWxsCiAgT0JKQ09QWSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkv
eW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdu
dWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NvbmZpZ3MvYXJtL2VtdHJpb24tcnpnMW0uY2Vs
bAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9qZXRzb24tdGsxLWRlbW8uY2VsbAogIE9CSkNP
UFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC9jb25maWdzL2FybS9qZXRzb24tdGsxLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L2dpdC9jb25maWdzL2FybS9qZXRzb24tdGsxLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9h
cm0vb3JhbmdlcGkwLWdpYy1kZW1vLmNlbGwKICBPQkpDT1BZIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY29uZmlncy9hcm0vb3Jh
bmdlcGkwLWxpbnV4LWRlbW8uY2VsbAogIE9CSkNPUFkgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jb25maWdzL2FybS9vcmFuZ2Vw
aTAuY2VsbAogIExEIFtNXSAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJp
L2phaWxob3VzZS8wLjExLXIwL2dpdC9kcml2ZXIvamFpbGhvdXNlLm8KbWFrZVszXTogKioqIFsv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrLXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtc291cmNlL01ha2VmaWxlOjE1MTg6
IF9tb2R1bGVfL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL2dpdF0gRXJyb3IgMgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjE0Njogc3ViLW1h
a2VdIEVycm9yIDIKbWFrZVsxXTogKioqIFtNYWtlZmlsZToyNDogX19zdWItbWFrZV0gRXJyb3Ig
MgptYWtlOiAqKiogW01ha2VmaWxlOjQwOiBtb2R1bGVzXSBFcnJvciAyCldBUk5JTkc6IGV4aXQg
Y29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLgoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_configure"
Content-Disposition: attachment; filename="log.do_configure"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy37i4>
X-Attachment-Id: f_jz9oy37i4

REVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb25maWd1cmUKJy9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY2kvamFp
bGhvdXNlLWNvbmZpZy1iYW5hbmEtcGkuaCcgLT4gJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5jbHVkZS9qYWlsaG91c2UvY29u
ZmlnLmgnCkRFQlVHOiBTaGVsbCBmdW5jdGlvbiBkb19jb25maWd1cmUgZmluaXNoZWQKREVCVUc6
IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcWFfY29uZmlndXJlCkRFQlVHOiBQeXRob24g
ZnVuY3Rpb24gZG9fcWFfY29uZmlndXJlIGZpbmlzaGVkCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_configure.14592"
Content-Disposition: attachment; filename="log.do_configure.14592"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy37m5>
X-Attachment-Id: f_jz9oy37m5

REVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb25maWd1cmUKJy9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvY2kvamFp
bGhvdXNlLWNvbmZpZy1iYW5hbmEtcGkuaCcgLT4gJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5jbHVkZS9qYWlsaG91c2UvY29u
ZmlnLmgnCkRFQlVHOiBTaGVsbCBmdW5jdGlvbiBkb19jb25maWd1cmUgZmluaXNoZWQKREVCVUc6
IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcWFfY29uZmlndXJlCkRFQlVHOiBQeXRob24g
ZnVuY3Rpb24gZG9fcWFfY29uZmlndXJlIGZpbmlzaGVkCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_fetch"
Content-Disposition: attachment; filename="log.do_fetch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy37q6>
X-Attachment-Id: f_jz9oy37q6

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFtdCk5PVEU6IEluc3RhbGxlZCBpbnRvIHN5c3Jv
b3Q6IFtdCk5PVEU6IFNraXBwaW5nIGFzIGFscmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6IFtdCkRF
QlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290IGZpbmlzaGVkCkRFQlVH
OiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX2ZldGNoCkRFQlVHOiBFeGVjdXRpbmcgcHl0
aG9uIGZ1bmN0aW9uIGJhc2VfZG9fZmV0Y2gKREVCVUc6IFRyeWluZyBQUkVNSVJST1JTCkRFQlVH
OiBUcnlpbmcgVXBzdHJlYW0KREVCVUc6IEZldGNoZXIgYWNjZXNzZWQgdGhlIG5ldHdvcmsgd2l0
aCB0aGUgY29tbWFuZCBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25l
IC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMvamFpbGhvdXNlIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dp
dDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNzCkRFQlVHOiBSdW5uaW5n
IGV4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05B
TUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9k
YnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5
cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5
dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVh
Ymk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lz
cm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMi
OyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmpl
Y3RmaWxlcz0wIGNsb25lIC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMv
amFpbGhvdXNlIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNz
CkNsb25pbmcgaW50byBiYXJlIHJlcG9zaXRvcnkgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5z
LmphaWxob3VzZScuLi4KcmVtb3RlOiBFbnVtZXJhdGluZyBvYmplY3RzOiA2MCwgZG9uZS4gICAg
ICAgIApyZW1vdGU6IENvdW50aW5nIG9iamVjdHM6IDEwMCUgKDYwLzYwKSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IENvbXByZXNzaW5nIG9iamVjdHM6IDEwMCUgKDQ4LzQ4KSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IFRvdGFsIDIxNTM5IChkZWx0YSAxOSksIHJldXNlZCAyNiAoZGVsdGEgMTApLCBw
YWNrLXJldXNlZCAyMTQ3OSAgICAgICAgClJlY2VpdmluZyBvYmplY3RzOiAxMDAlICgyMTUzOS8y
MTUzOSksIDQuNTQgTWlCIHwgMS41MSBNaUIvcywgZG9uZS4KUmVzb2x2aW5nIGRlbHRhczogMTAw
JSAoMTUwNzUvMTUwNzUpLCBkb25lLgpDaGVja2luZyBjb25uZWN0aXZpdHkuLi4gZG9uZS4KREVC
VUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVND
T05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJz
dHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91
c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9l
LWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmlu
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWds
aWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1y
MC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3lu
Y29iamVjdGZpbGVzPTAgYnJhbmNoIC0tY29udGFpbnMgNTgwNTJhN2E5ZDFmNTkwNGQ3MmIxNjM3
MjgyYzg3NzE3MmVlNjlmNiAtLWxpc3QgbmV4dCAyPiAvZGV2L251bGwgfCB3YyAtbCcgaW4gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS9kb3dubG9hZHMv
Z2l0Mi9naXRodWIuY29tLnNpZW1lbnMuamFpbGhvdXNlCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogU2VhcmNoaW5nIGZvciAwMDAxLWZpeC1tYWtlZmlsZXMucGF0
Y2ggaW4gcGF0aHM6CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEv
b3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvb3JhbmdlcGkK
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9vcmFuZ2VwaQogICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvb3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2ph
aWxob3VzZS9qYWlsaG91c2UtMC4xMS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzL3N1bjhp
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEvYXJtdjd2ZQogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS9hcm12N3ZlCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS0wLjExL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3Vz
ZS9hcm0KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9y
YW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9hcm0KICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFp
bGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvZmlsZXMvCkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYmFzZV9kb19mZXRjaCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1
bmN0aW9uIGRvX2ZldGNoIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9u
IHdyaXRlX3NyY3JldgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIHdyaXRlX3NyY3JldiBmaW5pc2hl
ZAo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_fetch.14470"
Content-Disposition: attachment; filename="log.do_fetch.14470"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy37u7>
X-Attachment-Id: f_jz9oy37u7

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFtdCk5PVEU6IEluc3RhbGxlZCBpbnRvIHN5c3Jv
b3Q6IFtdCk5PVEU6IFNraXBwaW5nIGFzIGFscmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6IFtdCkRF
QlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290IGZpbmlzaGVkCkRFQlVH
OiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX2ZldGNoCkRFQlVHOiBFeGVjdXRpbmcgcHl0
aG9uIGZ1bmN0aW9uIGJhc2VfZG9fZmV0Y2gKREVCVUc6IFRyeWluZyBQUkVNSVJST1JTCkRFQlVH
OiBUcnlpbmcgVXBzdHJlYW0KREVCVUc6IEZldGNoZXIgYWNjZXNzZWQgdGhlIG5ldHdvcmsgd2l0
aCB0aGUgY29tbWFuZCBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25l
IC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMvamFpbGhvdXNlIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dp
dDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNzCkRFQlVHOiBSdW5uaW5n
IGV4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05B
TUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9k
YnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5
cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5
dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVh
Ymk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lz
cm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMi
OyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmpl
Y3RmaWxlcz0wIGNsb25lIC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMv
amFpbGhvdXNlIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNz
CkNsb25pbmcgaW50byBiYXJlIHJlcG9zaXRvcnkgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5z
LmphaWxob3VzZScuLi4KcmVtb3RlOiBFbnVtZXJhdGluZyBvYmplY3RzOiA2MCwgZG9uZS4gICAg
ICAgIApyZW1vdGU6IENvdW50aW5nIG9iamVjdHM6IDEwMCUgKDYwLzYwKSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IENvbXByZXNzaW5nIG9iamVjdHM6IDEwMCUgKDQ4LzQ4KSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IFRvdGFsIDIxNTM5IChkZWx0YSAxOSksIHJldXNlZCAyNiAoZGVsdGEgMTApLCBw
YWNrLXJldXNlZCAyMTQ3OSAgICAgICAgClJlY2VpdmluZyBvYmplY3RzOiAxMDAlICgyMTUzOS8y
MTUzOSksIDQuNTQgTWlCIHwgMS41MSBNaUIvcywgZG9uZS4KUmVzb2x2aW5nIGRlbHRhczogMTAw
JSAoMTUwNzUvMTUwNzUpLCBkb25lLgpDaGVja2luZyBjb25uZWN0aXZpdHkuLi4gZG9uZS4KREVC
VUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVND
T05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJz
dHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91
c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9l
LWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmlu
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWds
aWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1y
MC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3lu
Y29iamVjdGZpbGVzPTAgYnJhbmNoIC0tY29udGFpbnMgNTgwNTJhN2E5ZDFmNTkwNGQ3MmIxNjM3
MjgyYzg3NzE3MmVlNjlmNiAtLWxpc3QgbmV4dCAyPiAvZGV2L251bGwgfCB3YyAtbCcgaW4gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS9kb3dubG9hZHMv
Z2l0Mi9naXRodWIuY29tLnNpZW1lbnMuamFpbGhvdXNlCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogU2VhcmNoaW5nIGZvciAwMDAxLWZpeC1tYWtlZmlsZXMucGF0
Y2ggaW4gcGF0aHM6CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEv
b3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvb3JhbmdlcGkK
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9vcmFuZ2VwaQogICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvb3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2ph
aWxob3VzZS9qYWlsaG91c2UtMC4xMS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzL3N1bjhp
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEvYXJtdjd2ZQogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS9hcm12N3ZlCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS0wLjExL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3Vz
ZS9hcm0KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9y
YW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9hcm0KICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFp
bGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvZmlsZXMvCkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYmFzZV9kb19mZXRjaCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1
bmN0aW9uIGRvX2ZldGNoIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9u
IHdyaXRlX3NyY3JldgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIHdyaXRlX3NyY3JldiBmaW5pc2hl
ZAo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_patch"
Content-Disposition: attachment; filename="log.do_patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy37x8>
X-Attachment-Id: f_jz9oy37x8

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFsnL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3F1aWx0L3F1aWx0LW5hdGl2
ZV8wLjY2LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnXQpOT1RFOiBJbnN0YWxsZWQgaW50byBzeXNy
b290OiBbXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBzeXNyb290OiBbJ3F1
aWx0LW5hdGl2ZSddCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290
IGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX3BhdGNoCkRFQlVH
OiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIHBhdGNoX2RvX3BhdGNoCkRFQlVHOiBTZWFyY2hp
bmcgZm9yIDAwMDEtZml4LW1ha2VmaWxlcy5wYXRjaCBpbiBwYXRoczoKICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhv
dXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS9vcmFuZ2VwaQogICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2Uv
amFpbGhvdXNlL2phaWxob3VzZS9vcmFuZ2VwaQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2ZpbGVzL29yYW5nZXBpCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAu
MTEvb3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uv
b3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9vcmFuZ2Ut
cGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEt
b3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL3N1bjhp
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL3N1bjhpCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvZmlsZXMvc3VuOGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3Vz
ZS9qYWlsaG91c2UtMC4xMS9hcm12N3ZlCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFp
bGhvdXNlL2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9hcm12N3Zl
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEvYXJtCiAgICAvaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVz
LWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFp
bGhvdXNlL2ZpbGVzL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0w
LjExLwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3Jh
bmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS8KICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFp
bGhvdXNlL2phaWxob3VzZS9maWxlcy8KTk9URTogQXBwbHlpbmcgcGF0Y2ggJzAwMDEtZml4LW1h
a2VmaWxlcy5wYXRjaCcgKC4uL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhv
dXNlL2phaWxob3VzZS8wMDAxLWZpeC1tYWtlZmlsZXMucGF0Y2gpCkRFQlVHOiBQeXRob24gZnVu
Y3Rpb24gcGF0Y2hfZG9fcGF0Y2ggZmluaXNoZWQKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19w
YXRjaCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBkb19xYV9wYXRj
aApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3FhX3BhdGNoIGZpbmlzaGVkCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_patch.14518"
Content-Disposition: attachment; filename="log.do_patch.14518"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3829>
X-Attachment-Id: f_jz9oy3829

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFsnL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3F1aWx0L3F1aWx0LW5hdGl2
ZV8wLjY2LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnXQpOT1RFOiBJbnN0YWxsZWQgaW50byBzeXNy
b290OiBbXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBzeXNyb290OiBbJ3F1
aWx0LW5hdGl2ZSddCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290
IGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX3BhdGNoCkRFQlVH
OiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIHBhdGNoX2RvX3BhdGNoCkRFQlVHOiBTZWFyY2hp
bmcgZm9yIDAwMDEtZml4LW1ha2VmaWxlcy5wYXRjaCBpbiBwYXRoczoKICAgIC9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhv
dXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS9vcmFuZ2VwaQogICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2Uv
amFpbGhvdXNlL2phaWxob3VzZS9vcmFuZ2VwaQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2ZpbGVzL29yYW5nZXBpCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAu
MTEvb3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uv
b3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9vcmFuZ2Ut
cGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEt
b3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL3N1bjhp
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL3N1bjhpCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvZmlsZXMvc3VuOGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3Vz
ZS9qYWlsaG91c2UtMC4xMS9hcm12N3ZlCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFp
bGhvdXNlL2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9hcm12N3Zl
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEvYXJtCiAgICAvaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVz
LWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFp
bGhvdXNlL2ZpbGVzL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0w
LjExLwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3Jh
bmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS8KICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFp
bGhvdXNlL2phaWxob3VzZS9maWxlcy8KTk9URTogQXBwbHlpbmcgcGF0Y2ggJzAwMDEtZml4LW1h
a2VmaWxlcy5wYXRjaCcgKC4uL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhv
dXNlL2phaWxob3VzZS8wMDAxLWZpeC1tYWtlZmlsZXMucGF0Y2gpCkRFQlVHOiBQeXRob24gZnVu
Y3Rpb24gcGF0Y2hfZG9fcGF0Y2ggZmluaXNoZWQKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19w
YXRjaCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBkb19xYV9wYXRj
aApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3FhX3BhdGNoIGZpbmlzaGVkCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_populate_lic"
Content-Disposition: attachment; filename="log.do_populate_lic"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38510>
X-Attachment-Id: f_jz9oy38510

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3N0YXRlX3Rhc2tfcHJlZnVuYwpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3ByZWZ1bmMgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcG9wdWxhdGVfbGljCldBUk5JTkc6IGphaWxob3Vz
ZTogTm8gZ2VuZXJpYyBsaWNlbnNlIGZpbGUgZXhpc3RzIGZvcjogQlNELTItY2xhdXNlIGluIGFu
eSBwcm92aWRlcgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3BvcHVsYXRlX2xpYyBmaW5pc2hl
ZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBwb3B1bGF0ZV9saWNfcWFfY2hlY2tz
dW0KTk9URTogamFpbGhvdXNlOiBtZDUgY2hlY2tzdW0gbWF0Y2hlZCBmb3IgZmlsZTovL0NPUFlJ
Tkc7bWQ1PTlmYTdmODk1Zjk2YmRlMmQ0N2ZkNWI3ZDk1YjZiYTRkCkRFQlVHOiBQeXRob24gZnVu
Y3Rpb24gcG9wdWxhdGVfbGljX3FhX2NoZWNrc3VtIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcg
cHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jCkRFQlVHOiBQcmVwYXJpbmcgdHJl
ZSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvbGljZW5zZS1kZXN0ZGlyIGZvciBwYWNrYWdpbmcgYXQgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3NzdGF0ZS1idWlsZC1wb3B1bGF0
ZV9saWMvbGljZW5zZS1kZXN0ZGlyCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIHNz
dGF0ZV9oYXJkY29kZV9wYXRoCk5PVEU6IFJlbW92aW5nIGhhcmRjb2RlZCBwYXRocyBmcm9tIHNz
dGF0ZSBwYWNrYWdlOiAnZmluZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvc3N0YXRlLWJ1aWxkLXBvcHVsYXRlX2xpYy8gXCggLW5hbWUg
IioubGEiIC1vIC1uYW1lICIqLWNvbmZpZyIgLW8gLW5hbWUgIipfY29uZmlnIiAtbyAtbmFtZSAi
cG9zdGluc3QtKiIgXCkgLXR5cGUgZiB8IHhhcmdzIGdyZXAgLWwgLWUgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dCcgLWUgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUnIC1lICcvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMnIHwgdGVlIC9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9z
c3RhdGUtYnVpbGQtcG9wdWxhdGVfbGljL2ZpeG1lcGF0aCB8IHhhcmdzIC0tbm8tcnVuLWlmLWVt
cHR5IHNlZCAtaSAtZSAnczovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlOkZJWE1FU1RBR0lOR0RJUkhP
U1Q6ZycgLWUgJ3M6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290OkZJWE1FU1RBR0lOR0RJUlRBUkdFVDpnJyAtZSAn
czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy9ob3N0dG9vbHM6RklYTUVfSE9TVFRPT0xTX0RJUjpnJycKREVCVUc6IFB5dGhvbiBmdW5j
dGlvbiBzc3RhdGVfaGFyZGNvZGVfcGF0aCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhv
biBmdW5jdGlvbiBzc3RhdGVfcmVwb3J0X3VuaWhhc2gKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfcmVwb3J0X3VuaWhhc2ggZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5j
dGlvbiBzc3RhdGVfY3JlYXRlX3BhY2thZ2UKREVCVUc6IFNoZWxsIGZ1bmN0aW9uIHNzdGF0ZV9j
cmVhdGVfcGFja2FnZSBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfaGFyZGNvZGVfcGF0aF91bnBhY2sKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBzc3RhdGVf
aGFyZGNvZGVfcGF0aF91bnBhY2sgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVu
Y3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfb3V0cHV0c2lncwpERUJVRzogUHl0aG9uIGZ1bmN0aW9u
IGJ1aWxkaGlzdG9yeV9lbWl0X291dHB1dHNpZ3MgZmluaXNoZWQKREVCVUc6IFN0YWdpbmcgZmls
ZXMgZnJvbSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvbGljZW5zZS1kZXN0ZGlyIHRvIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2RlcGxveS9saWNlbnNlcwpERUJVRzogRXhl
Y3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBidWlsZGhpc3RvcnlfZW1pdF9wa2doaXN0b3J5CkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSBmaW5pc2hlZApE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jIGZpbmlzaGVkCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_populate_lic.14593"
Content-Disposition: attachment; filename="log.do_populate_lic.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38811>
X-Attachment-Id: f_jz9oy38811

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3N0YXRlX3Rhc2tfcHJlZnVuYwpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3ByZWZ1bmMgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcG9wdWxhdGVfbGljCldBUk5JTkc6IGphaWxob3Vz
ZTogTm8gZ2VuZXJpYyBsaWNlbnNlIGZpbGUgZXhpc3RzIGZvcjogQlNELTItY2xhdXNlIGluIGFu
eSBwcm92aWRlcgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3BvcHVsYXRlX2xpYyBmaW5pc2hl
ZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBwb3B1bGF0ZV9saWNfcWFfY2hlY2tz
dW0KTk9URTogamFpbGhvdXNlOiBtZDUgY2hlY2tzdW0gbWF0Y2hlZCBmb3IgZmlsZTovL0NPUFlJ
Tkc7bWQ1PTlmYTdmODk1Zjk2YmRlMmQ0N2ZkNWI3ZDk1YjZiYTRkCkRFQlVHOiBQeXRob24gZnVu
Y3Rpb24gcG9wdWxhdGVfbGljX3FhX2NoZWNrc3VtIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcg
cHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jCkRFQlVHOiBQcmVwYXJpbmcgdHJl
ZSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvbGljZW5zZS1kZXN0ZGlyIGZvciBwYWNrYWdpbmcgYXQgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3NzdGF0ZS1idWlsZC1wb3B1bGF0
ZV9saWMvbGljZW5zZS1kZXN0ZGlyCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIHNz
dGF0ZV9oYXJkY29kZV9wYXRoCk5PVEU6IFJlbW92aW5nIGhhcmRjb2RlZCBwYXRocyBmcm9tIHNz
dGF0ZSBwYWNrYWdlOiAnZmluZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvc3N0YXRlLWJ1aWxkLXBvcHVsYXRlX2xpYy8gXCggLW5hbWUg
IioubGEiIC1vIC1uYW1lICIqLWNvbmZpZyIgLW8gLW5hbWUgIipfY29uZmlnIiAtbyAtbmFtZSAi
cG9zdGluc3QtKiIgXCkgLXR5cGUgZiB8IHhhcmdzIGdyZXAgLWwgLWUgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dCcgLWUgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUnIC1lICcvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMnIHwgdGVlIC9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9z
c3RhdGUtYnVpbGQtcG9wdWxhdGVfbGljL2ZpeG1lcGF0aCB8IHhhcmdzIC0tbm8tcnVuLWlmLWVt
cHR5IHNlZCAtaSAtZSAnczovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlOkZJWE1FU1RBR0lOR0RJUkhP
U1Q6ZycgLWUgJ3M6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290OkZJWE1FU1RBR0lOR0RJUlRBUkdFVDpnJyAtZSAn
czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy9ob3N0dG9vbHM6RklYTUVfSE9TVFRPT0xTX0RJUjpnJycKREVCVUc6IFB5dGhvbiBmdW5j
dGlvbiBzc3RhdGVfaGFyZGNvZGVfcGF0aCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhv
biBmdW5jdGlvbiBzc3RhdGVfcmVwb3J0X3VuaWhhc2gKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfcmVwb3J0X3VuaWhhc2ggZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5j
dGlvbiBzc3RhdGVfY3JlYXRlX3BhY2thZ2UKREVCVUc6IFNoZWxsIGZ1bmN0aW9uIHNzdGF0ZV9j
cmVhdGVfcGFja2FnZSBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfaGFyZGNvZGVfcGF0aF91bnBhY2sKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBzc3RhdGVf
aGFyZGNvZGVfcGF0aF91bnBhY2sgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVu
Y3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfb3V0cHV0c2lncwpERUJVRzogUHl0aG9uIGZ1bmN0aW9u
IGJ1aWxkaGlzdG9yeV9lbWl0X291dHB1dHNpZ3MgZmluaXNoZWQKREVCVUc6IFN0YWdpbmcgZmls
ZXMgZnJvbSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvbGljZW5zZS1kZXN0ZGlyIHRvIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2RlcGxveS9saWNlbnNlcwpERUJVRzogRXhl
Y3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBidWlsZGhpc3RvcnlfZW1pdF9wa2doaXN0b3J5CkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSBmaW5pc2hlZApE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jIGZpbmlzaGVkCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_prepare_recipe_sysroot"
Content-Disposition: attachment; filename="log.do_prepare_recipe_sysroot"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38b12>
X-Attachment-Id: f_jz9oy38b12

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcHJlcGFyZV9yZWNpcGVfc3lzcm9v
dApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QK
Tk9URTogRGlyZWN0IGRlcGVuZGVuY2llcyBhcmUgWyd2aXJ0dWFsOm5hdGl2ZTovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMta2VybmVsL2R0
Yy9kdGNfMS41LjAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1y
dW50aW1lXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIu
MzAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWtlcm5lbC9saW51eC1vcmFuZ2VwaS16
ZXJvL2xpbnV4LW9yYW5nZXBpLXplcm9fNC4xOS42My5iYjpkb19wb3B1bGF0ZV9zeXNyb290Jywg
Jy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJlZGRl
ZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEuMC5i
Yjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNv
bXBsZXRpb25fMi45LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAnL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tbmF0aXZlXzIuNy4xNi5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJl
ZGRlZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEu
MC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2dj
b25maWcvcGtnY29uZmlnX2dpdC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLWNyb3NzXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZl
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tYWtlL21ha2VfNC4yLjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCddCk5PVEU6
IEluc3RhbGxlZCBpbnRvIHN5c3Jvb3Q6IFsnZHRjLW5hdGl2ZScsICdnY2MtcnVudGltZScsICdn
bGliYycsICdsaW51eC1vcmFuZ2VwaS16ZXJvJywgJ3B5dGhvbi1tYWtvJywgJ2Jhc2gtY29tcGxl
dGlvbicsICdweXRob24tbmF0aXZlJywgJ3B5dGhvbi1tYWtvLW5hdGl2ZScsICdwa2djb25maWct
bmF0aXZlJywgJ2djYy1jcm9zcy1hcm0nLCAnbWFrZS1uYXRpdmUnLCAncXVpbHQtbmF0aXZlJywg
J2ZsZXgtbmF0aXZlJywgJ2xpbnV4LWxpYmMtaGVhZGVycycsICdsaWJnY2MnLCAnbHo0JywgJ3B5
dGhvbicsICd4ei1uYXRpdmUnLCAnYXV0b21ha2UtbmF0aXZlJywgJ3JlYWRsaW5lLW5hdGl2ZScs
ICdvcGVuc3NsLW5hdGl2ZScsICdleHBhdC1uYXRpdmUnLCAnYXV0b2NvbmYtbmF0aXZlJywgJ2J6
aXAyLW5hdGl2ZScsICd6bGliLW5hdGl2ZScsICdzcWxpdGUzLW5hdGl2ZScsICdnbnUtY29uZmln
LW5hdGl2ZScsICdsaWJ0b29sLW5hdGl2ZScsICdnZGJtLW5hdGl2ZScsICdkYi1uYXRpdmUnLCAn
cHl0aG9uLXNldHVwdG9vbHMtbmF0aXZlJywgJ21wZnItbmF0aXZlJywgJ3RleGluZm8tZHVtbXkt
bmF0aXZlJywgJ2JpbnV0aWxzLWNyb3NzLWFybScsICdsaWJtcGMtbmF0aXZlJywgJ2dtcC1uYXRp
dmUnLCAnZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZScsICdtNC1uYXRpdmUnLCAnbGliZmZpJywgJ3Jl
YWRsaW5lJywgJ3NxbGl0ZTMnLCAnZGInLCAnb3BlbnNzbCcsICdiemlwMicsICdnZGJtJywgJ2xp
YnhjcnlwdCcsICd6bGliJywgJ25jdXJzZXMtbmF0aXZlJywgJ3VuemlwLW5hdGl2ZScsICduY3Vy
c2VzJywgJ29wa2ctdXRpbHMnXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBz
eXNyb290OiBbXQpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LzpnJyAv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9zeXNyb290cy1jb21wb25lbnRzL2NvcnRleGE3aGYtbmVvbi12ZnB2NC9weXRob24vZml4bWVw
YXRoIHwgeGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5
c3Jvb3Q6ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6Zycg
LWUgJ3M6RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQv
cHNldWRvLW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpn
JyAtZSAnczpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1l
ICdzOkZJWE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xP
R0ZJRk86L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lw
ZS1zeXNyb290LW5hdGl2ZS86ZycgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHl0aG9u
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcGtnY29uZmln
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ2NjLWNyb3Nz
LWFybS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcXVpbHQtbmF0aXZl
L2ZpeG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvbWFrZS1uYXRpdmUv
Zml4bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L29wZW5zc2wtbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvY29uZi1uYXRpdmUvZml4
bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L2dudS1jb25maWctbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9saWJ0b29sLW5hdGl2ZS9maXht
ZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ21wLW5hdGl2ZS9maXhtZXBhdGgg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvbmN1cnNlcy1uYXRpdmUvZml4bWVwYXRoIHwg
eGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Q6
ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6ZycgLWUgJ3M6
RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHNldWRv
LW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpnJyAtZSAn
czpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1lICdzOkZJ
WE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xPR0ZJRk86
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGV4dGVuZF9yZWNpcGVf
c3lzcm9vdCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3ByZXBhcmVfcmVjaXBl
X3N5c3Jvb3QgZmluaXNoZWQK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="log.do_prepare_recipe_sysroot.14489"
Content-Disposition: attachment; 
	filename="log.do_prepare_recipe_sysroot.14489"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38f13>
X-Attachment-Id: f_jz9oy38f13

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcHJlcGFyZV9yZWNpcGVfc3lzcm9v
dApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QK
Tk9URTogRGlyZWN0IGRlcGVuZGVuY2llcyBhcmUgWyd2aXJ0dWFsOm5hdGl2ZTovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMta2VybmVsL2R0
Yy9kdGNfMS41LjAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1y
dW50aW1lXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIu
MzAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWtlcm5lbC9saW51eC1vcmFuZ2VwaS16
ZXJvL2xpbnV4LW9yYW5nZXBpLXplcm9fNC4xOS42My5iYjpkb19wb3B1bGF0ZV9zeXNyb290Jywg
Jy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJlZGRl
ZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEuMC5i
Yjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNv
bXBsZXRpb25fMi45LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAnL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tbmF0aXZlXzIuNy4xNi5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJl
ZGRlZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEu
MC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2dj
b25maWcvcGtnY29uZmlnX2dpdC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLWNyb3NzXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZl
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tYWtlL21ha2VfNC4yLjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCddCk5PVEU6
IEluc3RhbGxlZCBpbnRvIHN5c3Jvb3Q6IFsnZHRjLW5hdGl2ZScsICdnY2MtcnVudGltZScsICdn
bGliYycsICdsaW51eC1vcmFuZ2VwaS16ZXJvJywgJ3B5dGhvbi1tYWtvJywgJ2Jhc2gtY29tcGxl
dGlvbicsICdweXRob24tbmF0aXZlJywgJ3B5dGhvbi1tYWtvLW5hdGl2ZScsICdwa2djb25maWct
bmF0aXZlJywgJ2djYy1jcm9zcy1hcm0nLCAnbWFrZS1uYXRpdmUnLCAncXVpbHQtbmF0aXZlJywg
J2ZsZXgtbmF0aXZlJywgJ2xpbnV4LWxpYmMtaGVhZGVycycsICdsaWJnY2MnLCAnbHo0JywgJ3B5
dGhvbicsICd4ei1uYXRpdmUnLCAnYXV0b21ha2UtbmF0aXZlJywgJ3JlYWRsaW5lLW5hdGl2ZScs
ICdvcGVuc3NsLW5hdGl2ZScsICdleHBhdC1uYXRpdmUnLCAnYXV0b2NvbmYtbmF0aXZlJywgJ2J6
aXAyLW5hdGl2ZScsICd6bGliLW5hdGl2ZScsICdzcWxpdGUzLW5hdGl2ZScsICdnbnUtY29uZmln
LW5hdGl2ZScsICdsaWJ0b29sLW5hdGl2ZScsICdnZGJtLW5hdGl2ZScsICdkYi1uYXRpdmUnLCAn
cHl0aG9uLXNldHVwdG9vbHMtbmF0aXZlJywgJ21wZnItbmF0aXZlJywgJ3RleGluZm8tZHVtbXkt
bmF0aXZlJywgJ2JpbnV0aWxzLWNyb3NzLWFybScsICdsaWJtcGMtbmF0aXZlJywgJ2dtcC1uYXRp
dmUnLCAnZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZScsICdtNC1uYXRpdmUnLCAnbGliZmZpJywgJ3Jl
YWRsaW5lJywgJ3NxbGl0ZTMnLCAnZGInLCAnb3BlbnNzbCcsICdiemlwMicsICdnZGJtJywgJ2xp
YnhjcnlwdCcsICd6bGliJywgJ25jdXJzZXMtbmF0aXZlJywgJ3VuemlwLW5hdGl2ZScsICduY3Vy
c2VzJywgJ29wa2ctdXRpbHMnXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBz
eXNyb290OiBbXQpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LzpnJyAv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9zeXNyb290cy1jb21wb25lbnRzL2NvcnRleGE3aGYtbmVvbi12ZnB2NC9weXRob24vZml4bWVw
YXRoIHwgeGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5
c3Jvb3Q6ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6Zycg
LWUgJ3M6RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQv
cHNldWRvLW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpn
JyAtZSAnczpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1l
ICdzOkZJWE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xP
R0ZJRk86L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lw
ZS1zeXNyb290LW5hdGl2ZS86ZycgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHl0aG9u
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcGtnY29uZmln
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ2NjLWNyb3Nz
LWFybS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcXVpbHQtbmF0aXZl
L2ZpeG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvbWFrZS1uYXRpdmUv
Zml4bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L29wZW5zc2wtbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvY29uZi1uYXRpdmUvZml4
bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L2dudS1jb25maWctbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9saWJ0b29sLW5hdGl2ZS9maXht
ZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ21wLW5hdGl2ZS9maXhtZXBhdGgg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvbmN1cnNlcy1uYXRpdmUvZml4bWVwYXRoIHwg
eGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Q6
ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6ZycgLWUgJ3M6
RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHNldWRv
LW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpnJyAtZSAn
czpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1lICdzOkZJ
WE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xPR0ZJRk86
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGV4dGVuZF9yZWNpcGVf
c3lzcm9vdCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3ByZXBhcmVfcmVjaXBl
X3N5c3Jvb3QgZmluaXNoZWQK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_unpack"
Content-Disposition: attachment; filename="log.do_unpack"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38j14>
X-Attachment-Id: f_jz9oy38j14

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fdW5wYWNrCkRFQlVHOiBFeGVjdXRp
bmcgcHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogUnVubmluZyBleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVu
c2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19B
RERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9B
VVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Ny
b3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNy
b290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bv
a3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0Ijsg
Z2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25lIC1zIC1uIC9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHVi
LmNvbS5zaWVtZW5zLmphaWxob3VzZS8gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VV
RE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBE
QlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVo
MzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBl
eHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVj
aXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3Ni
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUv
c2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9N
RT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgcmVtb3RlIHNl
dC11cmwgb3JpZ2luIGdpdDovL2dpdGh1Yi5jb20vc2llbWVucy9qYWlsaG91c2UnIGluIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
CkRFQlVHOiBSdW5uaW5nICdleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05f
U1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4
OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9y
dW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2Fy
bS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNy
L2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUu
ZnN5bmNvYmplY3RmaWxlcz0wIGdyZXAgbGZzIEhFQUQ6LmdpdGF0dHJpYnV0ZXMgfCB3YyAtbCcg
aW4gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQg
X1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJF
U1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhf
U09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3Nz
Y3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9i
aXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQg
LWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgY2hlY2tvdXQgLUIgbmV4dCA1ODA1MmE3YTlkMWY1
OTA0ZDcyYjE2MzcyODJjODc3MTcyZWU2OWY2JyBpbiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0LwpERUJVRzogUnVubmluZyAnZXhw
b3J0IFBTRVVET19ESVNBQkxFRD0xOyB1bnNldCBfUFlUSE9OX1NZU0NPTkZJR0RBVEFfTkFNRTsg
ZXhwb3J0IERCVVNfU0VTU0lPTl9CVVNfQUREUkVTUz0idW5peDphYnN0cmFjdD0vdG1wL2RidXMt
T3JWTkFpVWgzOSI7IGV4cG9ydCBTU0hfQVVUSF9TT0NLPSIvcnVuL3VzZXIvMTAwMC9rZXlyaW5n
L3NzaCI7IGV4cG9ydCBQQVRIPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9u
LW5hdGl2ZTovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9zY3Jp
cHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9hcm0tb2UtbGludXgtZ251ZWFiaTov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QvdXNyL2Jpbi9jcm9zc3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3Ivc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L2JpdGJha2UvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29scyI7IGV4
cG9ydCBIT01FPSIvaG9tZS9jZXZhdCI7IGdpdCAtYyBjb3JlLmZzeW5jb2JqZWN0ZmlsZXM9MCBi
cmFuY2ggbmV4dCAtLXNldC11cHN0cmVhbS10byBvcmlnaW4vbmV4dCcgaW4gL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6
IFNlYXJjaGluZyBmb3IgMDAwMS1maXgtbWFrZWZpbGVzLnBhdGNoIGluIHBhdGhzOgogICAgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBl
cy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZXBpCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZXBpCiAgICAvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9q
YWlsaG91c2UvZmlsZXMvb3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWls
aG91c2UtMC4xMS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ph
aWxob3VzZS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAu
MTEvc3VuOGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvc3VuOGkKICAg
IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3Jl
Y2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2Uv
amFpbGhvdXNlL2phaWxob3VzZS0wLjExL2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS9hcm0K
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UvYXJtCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFp
bGhvdXNlLTAuMTEvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLwogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzLwpOT1RFOiBVbnBhY2tpbmcgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS8wMDAxLWZpeC1tYWtlZmlsZXMucGF0Y2ggdG8gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwLwpE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBQeXRo
b24gZnVuY3Rpb24gZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1
bmN0aW9uIGRvX3FhX3VucGFjawpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3FhX3VucGFjayBm
aW5pc2hlZAo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.do_unpack.14488"
Content-Disposition: attachment; filename="log.do_unpack.14488"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38m15>
X-Attachment-Id: f_jz9oy38m15

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fdW5wYWNrCkRFQlVHOiBFeGVjdXRp
bmcgcHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogUnVubmluZyBleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVu
c2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19B
RERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9B
VVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Ny
b3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNy
b290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bv
a3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0Ijsg
Z2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25lIC1zIC1uIC9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHVi
LmNvbS5zaWVtZW5zLmphaWxob3VzZS8gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VV
RE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBE
QlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVo
MzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBl
eHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVj
aXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3Ni
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUv
c2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9N
RT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgcmVtb3RlIHNl
dC11cmwgb3JpZ2luIGdpdDovL2dpdGh1Yi5jb20vc2llbWVucy9qYWlsaG91c2UnIGluIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
CkRFQlVHOiBSdW5uaW5nICdleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05f
U1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4
OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9y
dW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2Fy
bS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNy
L2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUu
ZnN5bmNvYmplY3RmaWxlcz0wIGdyZXAgbGZzIEhFQUQ6LmdpdGF0dHJpYnV0ZXMgfCB3YyAtbCcg
aW4gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQg
X1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJF
U1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhf
U09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3Nz
Y3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9i
aXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQg
LWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgY2hlY2tvdXQgLUIgbmV4dCA1ODA1MmE3YTlkMWY1
OTA0ZDcyYjE2MzcyODJjODc3MTcyZWU2OWY2JyBpbiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0LwpERUJVRzogUnVubmluZyAnZXhw
b3J0IFBTRVVET19ESVNBQkxFRD0xOyB1bnNldCBfUFlUSE9OX1NZU0NPTkZJR0RBVEFfTkFNRTsg
ZXhwb3J0IERCVVNfU0VTU0lPTl9CVVNfQUREUkVTUz0idW5peDphYnN0cmFjdD0vdG1wL2RidXMt
T3JWTkFpVWgzOSI7IGV4cG9ydCBTU0hfQVVUSF9TT0NLPSIvcnVuL3VzZXIvMTAwMC9rZXlyaW5n
L3NzaCI7IGV4cG9ydCBQQVRIPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9u
LW5hdGl2ZTovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9zY3Jp
cHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9hcm0tb2UtbGludXgtZ251ZWFiaTov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QvdXNyL2Jpbi9jcm9zc3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3Ivc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L2JpdGJha2UvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29scyI7IGV4
cG9ydCBIT01FPSIvaG9tZS9jZXZhdCI7IGdpdCAtYyBjb3JlLmZzeW5jb2JqZWN0ZmlsZXM9MCBi
cmFuY2ggbmV4dCAtLXNldC11cHN0cmVhbS10byBvcmlnaW4vbmV4dCcgaW4gL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6
IFNlYXJjaGluZyBmb3IgMDAwMS1maXgtbWFrZWZpbGVzLnBhdGNoIGluIHBhdGhzOgogICAgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBl
cy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZXBpCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZXBpCiAgICAvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9q
YWlsaG91c2UvZmlsZXMvb3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWls
aG91c2UtMC4xMS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ph
aWxob3VzZS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAu
MTEvc3VuOGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvc3VuOGkKICAg
IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3Jl
Y2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2Uv
amFpbGhvdXNlL2phaWxob3VzZS0wLjExL2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS9hcm0K
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UvYXJtCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFp
bGhvdXNlLTAuMTEvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLwogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzLwpOT1RFOiBVbnBhY2tpbmcgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS8wMDAxLWZpeC1tYWtlZmlsZXMucGF0Y2ggdG8gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwLwpE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBQeXRo
b24gZnVuY3Rpb24gZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1
bmN0aW9uIGRvX3FhX3VucGFjawpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3FhX3VucGFjayBm
aW5pc2hlZAo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="log.task_order"
Content-Disposition: attachment; filename="log.task_order"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38q16>
X-Attachment-Id: f_jz9oy38q16

ZG9fY2xlYW5zc3RhdGUgKDE0MjU1KTogbG9nLmRvX2NsZWFuc3N0YXRlLjE0MjU1CmRvX2ZldGNo
ICgxNDQ3MCk6IGxvZy5kb19mZXRjaC4xNDQ3MApkb191bnBhY2sgKDE0NDg4KTogbG9nLmRvX3Vu
cGFjay4xNDQ4OApkb19wcmVwYXJlX3JlY2lwZV9zeXNyb290ICgxNDQ4OSk6IGxvZy5kb19wcmVw
YXJlX3JlY2lwZV9zeXNyb290LjE0NDg5CmRvX3BhdGNoICgxNDUxOCk6IGxvZy5kb19wYXRjaC4x
NDUxOApkb19jb25maWd1cmUgKDE0NTkyKTogbG9nLmRvX2NvbmZpZ3VyZS4xNDU5Mgpkb19wb3B1
bGF0ZV9saWMgKDE0NTkzKTogbG9nLmRvX3BvcHVsYXRlX2xpYy4xNDU5Mwpkb19jb21waWxlICgx
NDU5OCk6IGxvZy5kb19jb21waWxlLjE0NTk4Cg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.base_do_unpack.14488"
Content-Disposition: attachment; filename="run.base_do_unpack.14488"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38w18>
X-Attachment-Id: f_jz9oy38w18

ZGVmIGJhc2VfZG9fdW5wYWNrKGQpOgogICAgc3JjX3VyaSA9IChkLmdldFZhcignU1JDX1VSSScp
IG9yICIiKS5zcGxpdCgpCiAgICBpZiBsZW4oc3JjX3VyaSkgPT0gMDoKICAgICAgICByZXR1cm4K
CiAgICB0cnk6CiAgICAgICAgZmV0Y2hlciA9IGJiLmZldGNoMi5GZXRjaChzcmNfdXJpLCBkKQog
ICAgICAgIGZldGNoZXIudW5wYWNrKGQuZ2V0VmFyKCdXT1JLRElSJykpCiAgICBleGNlcHQgYmIu
ZmV0Y2gyLkJCRmV0Y2hFeGNlcHRpb24gYXMgZToKICAgICAgICBiYi5mYXRhbChzdHIoZSkpCgpi
YXNlX2RvX3VucGFjayhkKQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.base_do_fetch.14470"
Content-Disposition: attachment; filename="run.base_do_fetch.14470"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy38t17>
X-Attachment-Id: f_jz9oy38t17

ZGVmIGJhc2VfZG9fZmV0Y2goZCk6CgogICAgc3JjX3VyaSA9IChkLmdldFZhcignU1JDX1VSSScp
IG9yICIiKS5zcGxpdCgpCiAgICBpZiBsZW4oc3JjX3VyaSkgPT0gMDoKICAgICAgICByZXR1cm4K
CiAgICB0cnk6CiAgICAgICAgZmV0Y2hlciA9IGJiLmZldGNoMi5GZXRjaChzcmNfdXJpLCBkKQog
ICAgICAgIGZldGNoZXIuZG93bmxvYWQoKQogICAgZXhjZXB0IGJiLmZldGNoMi5CQkZldGNoRXhj
ZXB0aW9uIGFzIGU6CiAgICAgICAgYmIuZmF0YWwoc3RyKGUpKQoKYmFzZV9kb19mZXRjaChkKQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.buildhistory_emit_outputsigs.14593"
Content-Disposition: attachment; 
	filename="run.buildhistory_emit_outputsigs.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39019>
X-Attachment-Id: f_jz9oy39019

ZGVmIGJ1aWxkaGlzdG9yeV9lbWl0X291dHB1dHNpZ3MoZCk6CiAgICBpZiBub3QgInRhc2siIGlu
IChkLmdldFZhcignQlVJTERISVNUT1JZX0ZFQVRVUkVTJykgb3IgIiIpLnNwbGl0KCk6CiAgICAg
ICAgcmV0dXJuCgogICAgaW1wb3J0IGhhc2hsaWIKCiAgICB0YXNrb3V0ZGlyID0gb3MucGF0aC5q
b2luKGQuZ2V0VmFyKCdCVUlMREhJU1RPUllfRElSJyksICd0YXNrJywgJ291dHB1dCcpCiAgICBi
Yi51dGlscy5ta2RpcmhpZXIodGFza291dGRpcikKICAgIGN1cnJlbnR0YXNrID0gZC5nZXRWYXIo
J0JCX0NVUlJFTlRUQVNLJykKICAgIHBuID0gZC5nZXRWYXIoJ1BOJykKICAgIHRhc2tmaWxlID0g
b3MucGF0aC5qb2luKHRhc2tvdXRkaXIsICclcy4lcycgJSAocG4sIGN1cnJlbnR0YXNrKSkKCiAg
ICBjd2QgPSBvcy5nZXRjd2QoKQogICAgZmlsZXNpZ3MgPSB7fQogICAgZm9yIHJvb3QsIF8sIGZp
bGVzIGluIG9zLndhbGsoY3dkKToKICAgICAgICBmb3IgZm5hbWUgaW4gZmlsZXM6CiAgICAgICAg
ICAgIGlmIGZuYW1lID09ICdmaXhtZXBhdGgnOgogICAgICAgICAgICAgICAgY29udGludWUKICAg
ICAgICAgICAgZnVsbHBhdGggPSBvcy5wYXRoLmpvaW4ocm9vdCwgZm5hbWUpCiAgICAgICAgICAg
IHRyeToKICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguaXNsaW5rKGZ1bGxwYXRoKToKICAgICAg
ICAgICAgICAgICAgICBzaGEyNTYgPSBoYXNobGliLnNoYTI1Nihvcy5yZWFkbGluayhmdWxscGF0
aCkuZW5jb2RlKCd1dGYtOCcpKS5oZXhkaWdlc3QoKQogICAgICAgICAgICAgICAgZWxpZiBvcy5w
YXRoLmlzZmlsZShmdWxscGF0aCk6CiAgICAgICAgICAgICAgICAgICAgc2hhMjU2ID0gYmIudXRp
bHMuc2hhMjU2X2ZpbGUoZnVsbHBhdGgpCiAgICAgICAgICAgICAgICBlbHNlOgogICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgIGV4Y2VwdCBPU0Vycm9yOgogICAgICAgICAg
ICAgICAgYmIud2FybignYnVpbGRoaXN0b3J5OiB1bmFibGUgdG8gcmVhZCAlcyB0byBnZXQgb3V0
cHV0IHNpZ25hdHVyZScgJSBmdWxscGF0aCkKICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAg
ICAgICAgIGZpbGVzaWdzW29zLnBhdGgucmVscGF0aChmdWxscGF0aCwgY3dkKV0gPSBzaGEyNTYK
ICAgIHdpdGggb3Blbih0YXNrZmlsZSwgJ3cnKSBhcyBmOgogICAgICAgIGZvciBmcGF0aCwgZnNp
ZyBpbiBzb3J0ZWQoZmlsZXNpZ3MuaXRlbXMoKSwga2V5PWxhbWJkYSBpdGVtOiBpdGVtWzBdKToK
ICAgICAgICAgICAgZi53cml0ZSgnJXMgJXNcbicgJSAoZnBhdGgsIGZzaWcpKQoKYnVpbGRoaXN0
b3J5X2VtaXRfb3V0cHV0c2lncyhkKQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_cleansstate.14255"
Content-Disposition: attachment; filename="run.do_cleansstate.14255"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39a22>
X-Attachment-Id: f_jz9oy39a22

ZGVmIGRvX2NsZWFuc3N0YXRlKGQpOgogICAgICAgIHNzdGF0ZV9jbGVhbl9jYWNoZWZpbGVzKGQp
Cgpkb19jbGVhbnNzdGF0ZShkKQoKZGVmIHNzdGF0ZV9jbGVhbl9jYWNoZWZpbGVzKGQpOgogICAg
Zm9yIHRhc2sgaW4gKGQuZ2V0VmFyKCdTU1RBVEVUQVNLUycpIG9yICIiKS5zcGxpdCgpOgogICAg
ICAgIGxkID0gZC5jcmVhdGVDb3B5KCkKICAgICAgICBzcyA9IHNzdGF0ZV9zdGF0ZV9mcm9tdmFy
cyhsZCwgdGFzaykKICAgICAgICBzc3RhdGVfY2xlYW5fY2FjaGVmaWxlKHNzLCBsZCkKCmRlZiBz
c3RhdGVfY2xlYW5fY2FjaGVmaWxlKHNzLCBkKToKICAgIGltcG9ydCBvZS5wYXRoCgogICAgc3N0
YXRlcGtnZmlsZSA9IGQuZ2V0VmFyKCdTU1RBVEVfUEFUSFNQRUMnKSArICIqXyIgKyBzc1sndGFz
ayddICsgIi50Z3oqIgogICAgaWYgZC5nZXRWYXJGbGFnKCdkb18lcycgJSBzc1sndGFzayddLCAn
dGFzaycpOgogICAgICAgIGJiLm5vdGUoIlJlbW92aW5nICVzIiAlIHNzdGF0ZXBrZ2ZpbGUpCiAg
ICAgICAgb2UucGF0aC5yZW1vdmUoc3N0YXRlcGtnZmlsZSkKCmRlZiBzc3RhdGVfc3RhdGVfZnJv
bXZhcnMoZCwgdGFzayA9IE5vbmUpOgogICAgaWYgdGFzayBpcyBOb25lOgogICAgICAgIHRhc2sg
PSBkLmdldFZhcignQkJfQ1VSUkVOVFRBU0snKQogICAgICAgIGlmIG5vdCB0YXNrOgogICAgICAg
ICAgICBiYi5mYXRhbCgic3N0YXRlIGNvZGUgcnVubmluZyB3aXRob3V0IHRhc2sgY29udGV4dD8h
IikKICAgICAgICB0YXNrID0gdGFzay5yZXBsYWNlKCJfc2V0c2NlbmUiLCAiIikKCiAgICBpZiB0
YXNrLnN0YXJ0c3dpdGgoImRvXyIpOgogICAgICAgIHRhc2sgPSB0YXNrWzM6XQogICAgaW5wdXRz
ID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtaW5wdXRkaXJzJykgb3IgIiIp
LnNwbGl0KCkKICAgIG91dHB1dHMgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0
ZS1vdXRwdXRkaXJzJykgb3IgIiIpLnNwbGl0KCkKICAgIHBsYWluZGlycyA9IChkLmdldFZhckZs
YWcoImRvXyIgKyB0YXNrLCAnc3N0YXRlLXBsYWluZGlycycpIG9yICIiKS5zcGxpdCgpCiAgICBs
b2NrZmlsZXMgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0ZS1sb2NrZmlsZScp
IG9yICIiKS5zcGxpdCgpCiAgICBsb2NrZmlsZXNzaGFyZWQgPSAoZC5nZXRWYXJGbGFnKCJkb18i
ICsgdGFzaywgJ3NzdGF0ZS1sb2NrZmlsZS1zaGFyZWQnKSBvciAiIikuc3BsaXQoKQogICAgaW50
ZXJjZXB0ZnVuY3MgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0ZS1pbnRlcmNl
cHRmdW5jcycpIG9yICIiKS5zcGxpdCgpCiAgICBmaXhtZWRpciA9IGQuZ2V0VmFyRmxhZygiZG9f
IiArIHRhc2ssICdzc3RhdGUtZml4bWVkaXInKSBvciAiIgogICAgaWYgbm90IHRhc2sgb3IgbGVu
KGlucHV0cykgIT0gbGVuKG91dHB1dHMpOgogICAgICAgIGJiLmZhdGFsKCJzc3RhdGUgdmFyaWFi
bGVzIG5vdCBzZXR1cCBjb3JyZWN0bHk/ISIpCgogICAgaWYgdGFzayA9PSAicG9wdWxhdGVfbGlj
IjoKICAgICAgICBkLnNldFZhcigiU1NUQVRFX1BLR1NQRUMiLCAiJHtTU1RBVEVfU1dTUEVDfSIp
CiAgICAgICAgZC5zZXRWYXIoIlNTVEFURV9FWFRSQVBBVEgiLCAiIikKICAgICAgICBkLnNldFZh
cignU1NUQVRFX0VYVFJBUEFUSFdJTERDQVJEJywgIiIpCgogICAgc3MgPSBzc3RhdGVfaW5pdCh0
YXNrLCBkKQogICAgZm9yIGkgaW4gcmFuZ2UobGVuKGlucHV0cykpOgogICAgICAgIHNzdGF0ZV9h
ZGQoc3MsIGlucHV0c1tpXSwgb3V0cHV0c1tpXSwgZCkKICAgIHNzWydsb2NrZmlsZXMnXSA9IGxv
Y2tmaWxlcwogICAgc3NbJ2xvY2tmaWxlcy1zaGFyZWQnXSA9IGxvY2tmaWxlc3NoYXJlZAogICAg
c3NbJ3BsYWluZGlycyddID0gcGxhaW5kaXJzCiAgICBzc1snaW50ZXJjZXB0ZnVuY3MnXSA9IGlu
dGVyY2VwdGZ1bmNzCiAgICBzc1snZml4bWVkaXInXSA9IGZpeG1lZGlyCiAgICByZXR1cm4gc3MK
CmRlZiBzc3RhdGVfaW5pdCh0YXNrLCBkKToKICAgIHNzID0ge30KICAgIHNzWyd0YXNrJ10gPSB0
YXNrCiAgICBzc1snZGlycyddID0gW10KICAgIHNzWydwbGFpbmRpcnMnXSA9IFtdCiAgICBzc1sn
bG9ja2ZpbGVzJ10gPSBbXQogICAgc3NbJ2xvY2tmaWxlcy1zaGFyZWQnXSA9IFtdCiAgICByZXR1
cm4gc3MKCmRlZiBzc3RhdGVfYWRkKHNzLCBzb3VyY2UsIGRlc3QsIGQpOgogICAgaWYgbm90IHNv
dXJjZS5lbmRzd2l0aCgiLyIpOgogICAgICAgICBzb3VyY2UgPSBzb3VyY2UgKyAiLyIKICAgIGlm
IG5vdCBkZXN0LmVuZHN3aXRoKCIvIik6CiAgICAgICAgIGRlc3QgPSBkZXN0ICsgIi8iCiAgICBz
b3VyY2UgPSBvcy5wYXRoLm5vcm1wYXRoKHNvdXJjZSkKICAgIGRlc3QgPSBvcy5wYXRoLm5vcm1w
YXRoKGRlc3QpCiAgICBzcmNiYXNlID0gb3MucGF0aC5iYXNlbmFtZShzb3VyY2UpCiAgICBzc1sn
ZGlycyddLmFwcGVuZChbc3JjYmFzZSwgc291cmNlLCBkZXN0XSkKICAgIHJldHVybiBzcwoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_cleansstate"
Content-Disposition: attachment; filename="run.do_cleansstate"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39721>
X-Attachment-Id: f_jz9oy39721

ZGVmIGRvX2NsZWFuc3N0YXRlKGQpOgogICAgICAgIHNzdGF0ZV9jbGVhbl9jYWNoZWZpbGVzKGQp
Cgpkb19jbGVhbnNzdGF0ZShkKQoKZGVmIHNzdGF0ZV9jbGVhbl9jYWNoZWZpbGVzKGQpOgogICAg
Zm9yIHRhc2sgaW4gKGQuZ2V0VmFyKCdTU1RBVEVUQVNLUycpIG9yICIiKS5zcGxpdCgpOgogICAg
ICAgIGxkID0gZC5jcmVhdGVDb3B5KCkKICAgICAgICBzcyA9IHNzdGF0ZV9zdGF0ZV9mcm9tdmFy
cyhsZCwgdGFzaykKICAgICAgICBzc3RhdGVfY2xlYW5fY2FjaGVmaWxlKHNzLCBsZCkKCmRlZiBz
c3RhdGVfY2xlYW5fY2FjaGVmaWxlKHNzLCBkKToKICAgIGltcG9ydCBvZS5wYXRoCgogICAgc3N0
YXRlcGtnZmlsZSA9IGQuZ2V0VmFyKCdTU1RBVEVfUEFUSFNQRUMnKSArICIqXyIgKyBzc1sndGFz
ayddICsgIi50Z3oqIgogICAgaWYgZC5nZXRWYXJGbGFnKCdkb18lcycgJSBzc1sndGFzayddLCAn
dGFzaycpOgogICAgICAgIGJiLm5vdGUoIlJlbW92aW5nICVzIiAlIHNzdGF0ZXBrZ2ZpbGUpCiAg
ICAgICAgb2UucGF0aC5yZW1vdmUoc3N0YXRlcGtnZmlsZSkKCmRlZiBzc3RhdGVfc3RhdGVfZnJv
bXZhcnMoZCwgdGFzayA9IE5vbmUpOgogICAgaWYgdGFzayBpcyBOb25lOgogICAgICAgIHRhc2sg
PSBkLmdldFZhcignQkJfQ1VSUkVOVFRBU0snKQogICAgICAgIGlmIG5vdCB0YXNrOgogICAgICAg
ICAgICBiYi5mYXRhbCgic3N0YXRlIGNvZGUgcnVubmluZyB3aXRob3V0IHRhc2sgY29udGV4dD8h
IikKICAgICAgICB0YXNrID0gdGFzay5yZXBsYWNlKCJfc2V0c2NlbmUiLCAiIikKCiAgICBpZiB0
YXNrLnN0YXJ0c3dpdGgoImRvXyIpOgogICAgICAgIHRhc2sgPSB0YXNrWzM6XQogICAgaW5wdXRz
ID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtaW5wdXRkaXJzJykgb3IgIiIp
LnNwbGl0KCkKICAgIG91dHB1dHMgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0
ZS1vdXRwdXRkaXJzJykgb3IgIiIpLnNwbGl0KCkKICAgIHBsYWluZGlycyA9IChkLmdldFZhckZs
YWcoImRvXyIgKyB0YXNrLCAnc3N0YXRlLXBsYWluZGlycycpIG9yICIiKS5zcGxpdCgpCiAgICBs
b2NrZmlsZXMgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0ZS1sb2NrZmlsZScp
IG9yICIiKS5zcGxpdCgpCiAgICBsb2NrZmlsZXNzaGFyZWQgPSAoZC5nZXRWYXJGbGFnKCJkb18i
ICsgdGFzaywgJ3NzdGF0ZS1sb2NrZmlsZS1zaGFyZWQnKSBvciAiIikuc3BsaXQoKQogICAgaW50
ZXJjZXB0ZnVuY3MgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0ZS1pbnRlcmNl
cHRmdW5jcycpIG9yICIiKS5zcGxpdCgpCiAgICBmaXhtZWRpciA9IGQuZ2V0VmFyRmxhZygiZG9f
IiArIHRhc2ssICdzc3RhdGUtZml4bWVkaXInKSBvciAiIgogICAgaWYgbm90IHRhc2sgb3IgbGVu
KGlucHV0cykgIT0gbGVuKG91dHB1dHMpOgogICAgICAgIGJiLmZhdGFsKCJzc3RhdGUgdmFyaWFi
bGVzIG5vdCBzZXR1cCBjb3JyZWN0bHk/ISIpCgogICAgaWYgdGFzayA9PSAicG9wdWxhdGVfbGlj
IjoKICAgICAgICBkLnNldFZhcigiU1NUQVRFX1BLR1NQRUMiLCAiJHtTU1RBVEVfU1dTUEVDfSIp
CiAgICAgICAgZC5zZXRWYXIoIlNTVEFURV9FWFRSQVBBVEgiLCAiIikKICAgICAgICBkLnNldFZh
cignU1NUQVRFX0VYVFJBUEFUSFdJTERDQVJEJywgIiIpCgogICAgc3MgPSBzc3RhdGVfaW5pdCh0
YXNrLCBkKQogICAgZm9yIGkgaW4gcmFuZ2UobGVuKGlucHV0cykpOgogICAgICAgIHNzdGF0ZV9h
ZGQoc3MsIGlucHV0c1tpXSwgb3V0cHV0c1tpXSwgZCkKICAgIHNzWydsb2NrZmlsZXMnXSA9IGxv
Y2tmaWxlcwogICAgc3NbJ2xvY2tmaWxlcy1zaGFyZWQnXSA9IGxvY2tmaWxlc3NoYXJlZAogICAg
c3NbJ3BsYWluZGlycyddID0gcGxhaW5kaXJzCiAgICBzc1snaW50ZXJjZXB0ZnVuY3MnXSA9IGlu
dGVyY2VwdGZ1bmNzCiAgICBzc1snZml4bWVkaXInXSA9IGZpeG1lZGlyCiAgICByZXR1cm4gc3MK
CmRlZiBzc3RhdGVfaW5pdCh0YXNrLCBkKToKICAgIHNzID0ge30KICAgIHNzWyd0YXNrJ10gPSB0
YXNrCiAgICBzc1snZGlycyddID0gW10KICAgIHNzWydwbGFpbmRpcnMnXSA9IFtdCiAgICBzc1sn
bG9ja2ZpbGVzJ10gPSBbXQogICAgc3NbJ2xvY2tmaWxlcy1zaGFyZWQnXSA9IFtdCiAgICByZXR1
cm4gc3MKCmRlZiBzc3RhdGVfYWRkKHNzLCBzb3VyY2UsIGRlc3QsIGQpOgogICAgaWYgbm90IHNv
dXJjZS5lbmRzd2l0aCgiLyIpOgogICAgICAgICBzb3VyY2UgPSBzb3VyY2UgKyAiLyIKICAgIGlm
IG5vdCBkZXN0LmVuZHN3aXRoKCIvIik6CiAgICAgICAgIGRlc3QgPSBkZXN0ICsgIi8iCiAgICBz
b3VyY2UgPSBvcy5wYXRoLm5vcm1wYXRoKHNvdXJjZSkKICAgIGRlc3QgPSBvcy5wYXRoLm5vcm1w
YXRoKGRlc3QpCiAgICBzcmNiYXNlID0gb3MucGF0aC5iYXNlbmFtZShzb3VyY2UpCiAgICBzc1sn
ZGlycyddLmFwcGVuZChbc3JjYmFzZSwgc291cmNlLCBkZXN0XSkKICAgIHJldHVybiBzcwoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.buildhistory_emit_pkghistory.14593"
Content-Disposition: attachment; 
	filename="run.buildhistory_emit_pkghistory.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39320>
X-Attachment-Id: f_jz9oy39320

ZGVmIGJ1aWxkaGlzdG9yeV9lbWl0X3BrZ2hpc3RvcnkoZCk6CiAgICBpZiBkLmdldFZhcignQkJf
Q1VSUkVOVFRBU0snKSBpbiBbJ3BvcHVsYXRlX3N5c3Jvb3QnLCAncG9wdWxhdGVfc3lzcm9vdF9z
ZXRzY2VuZSddOgogICAgICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygiYnVpbGRoaXN0b3J5X2VtaXRf
c3lzcm9vdCIsIGQpCgogICAgaWYgbm90IGQuZ2V0VmFyKCdCQl9DVVJSRU5UVEFTSycpIGluIFsn
cGFja2FnZWRhdGEnLCAncGFja2FnZWRhdGFfc2V0c2NlbmUnXToKICAgICAgICByZXR1cm4gMAoK
ICAgIGlmIG5vdCAicGFja2FnZSIgaW4gKGQuZ2V0VmFyKCdCVUlMREhJU1RPUllfRkVBVFVSRVMn
KSBvciAiIikuc3BsaXQoKToKICAgICAgICByZXR1cm4gMAoKICAgIGltcG9ydCByZQogICAgaW1w
b3J0IGpzb24KICAgIGltcG9ydCBzaGxleAogICAgaW1wb3J0IGVycm5vCgogICAgcGtnaGlzdGRp
ciA9IGQuZ2V0VmFyKCdCVUlMREhJU1RPUllfRElSX1BBQ0tBR0UnKQogICAgb2xkcGtnaGlzdGRp
ciA9IGQuZ2V0VmFyKCdCVUlMREhJU1RPUllfT0xEX0RJUl9QQUNLQUdFJykKCiAgICBjbGFzcyBS
ZWNpcGVJbmZvOgogICAgICAgIGRlZiBfX2luaXRfXyhzZWxmLCBuYW1lKToKICAgICAgICAgICAg
c2VsZi5uYW1lID0gbmFtZQogICAgICAgICAgICBzZWxmLnBlID0gIjAiCiAgICAgICAgICAgIHNl
bGYucHYgPSAiMCIKICAgICAgICAgICAgc2VsZi5wciA9ICJyMCIKICAgICAgICAgICAgc2VsZi5k
ZXBlbmRzID0gIiIKICAgICAgICAgICAgc2VsZi5wYWNrYWdlcyA9ICIiCiAgICAgICAgICAgIHNl
bGYuc3JjcmV2ID0gIiIKICAgICAgICAgICAgc2VsZi5sYXllciA9ICIiCgoKICAgIGNsYXNzIFBh
Y2thZ2VJbmZvOgogICAgICAgIGRlZiBfX2luaXRfXyhzZWxmLCBuYW1lKToKICAgICAgICAgICAg
c2VsZi5uYW1lID0gbmFtZQogICAgICAgICAgICBzZWxmLnBlID0gIjAiCiAgICAgICAgICAgIHNl
bGYucHYgPSAiMCIKICAgICAgICAgICAgc2VsZi5wciA9ICJyMCIKICAgICAgICAgICAgIyBwa2cv
cGtnZS9wa2d2L3BrZ3Igc2hvdWxkIGJlIGVtcHR5IGJlY2F1c2Ugd2Ugd2FudCB0byBiZSBhYmxl
IHRvIGRlZmF1bHQgdGhlbQogICAgICAgICAgICBzZWxmLnBrZyA9ICIiCiAgICAgICAgICAgIHNl
bGYucGtnZSA9ICIiCiAgICAgICAgICAgIHNlbGYucGtndiA9ICIiCiAgICAgICAgICAgIHNlbGYu
cGtnciA9ICIiCiAgICAgICAgICAgIHNlbGYuc2l6ZSA9IDAKICAgICAgICAgICAgc2VsZi5kZXBl
bmRzID0gIiIKICAgICAgICAgICAgc2VsZi5ycHJvdmlkZXMgPSAiIgogICAgICAgICAgICBzZWxm
LnJkZXBlbmRzID0gIiIKICAgICAgICAgICAgc2VsZi5ycmVjb21tZW5kcyA9ICIiCiAgICAgICAg
ICAgIHNlbGYucnN1Z2dlc3RzID0gIiIKICAgICAgICAgICAgc2VsZi5ycmVwbGFjZXMgPSAiIgog
ICAgICAgICAgICBzZWxmLnJjb25mbGljdHMgPSAiIgogICAgICAgICAgICBzZWxmLmZpbGVzID0g
IiIKICAgICAgICAgICAgc2VsZi5maWxlbGlzdCA9ICIiCiAgICAgICAgICAgICMgVmFyaWFibGVz
IHRoYXQgbmVlZCB0byBiZSB3cml0dGVuIHRvIHRoZWlyIG93biBzZXBhcmF0ZSBmaWxlCiAgICAg
ICAgICAgIHNlbGYuZmlsZXZhcnMgPSBkaWN0LmZyb21rZXlzKFsncGtnX3ByZWluc3QnLCAncGtn
X3Bvc3RpbnN0JywgJ3BrZ19wcmVybScsICdwa2dfcG9zdHJtJ10pCgogICAgIyBTaG91bGQgY2hl
Y2sgUEFDS0FHRVMgaGVyZSB0byBzZWUgaWYgYW55dGhpbmcgcmVtb3ZlZAoKICAgIGRlZiByZWFk
UGFja2FnZUluZm8ocGtnLCBoaXN0ZmlsZSk6CiAgICAgICAgcGtnaW5mbyA9IFBhY2thZ2VJbmZv
KHBrZykKICAgICAgICB3aXRoIG9wZW4oaGlzdGZpbGUsICJyIikgYXMgZjoKICAgICAgICAgICAg
Zm9yIGxpbmUgaW4gZjoKICAgICAgICAgICAgICAgIGxucyA9IGxpbmUuc3BsaXQoJz0nLCAxKQog
ICAgICAgICAgICAgICAgbmFtZSA9IGxuc1swXS5zdHJpcCgpCiAgICAgICAgICAgICAgICB2YWx1
ZSA9IGxuc1sxXS5zdHJpcCgiIFx0XHJcbiIpLnN0cmlwKCciJykKICAgICAgICAgICAgICAgIGlm
IG5hbWUgPT0gIlBFIjoKICAgICAgICAgICAgICAgICAgICBwa2dpbmZvLnBlID0gdmFsdWUKICAg
ICAgICAgICAgICAgIGVsaWYgbmFtZSA9PSAiUFYiOgogICAgICAgICAgICAgICAgICAgIHBrZ2lu
Zm8ucHYgPSB2YWx1ZQogICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJQUiI6CiAgICAgICAg
ICAgICAgICAgICAgcGtnaW5mby5wciA9IHZhbHVlCiAgICAgICAgICAgICAgICBlbGlmIG5hbWUg
PT0gIlBLRyI6CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5wa2cgPSB2YWx1ZQogICAgICAg
ICAgICAgICAgZWxpZiBuYW1lID09ICJQS0dFIjoKICAgICAgICAgICAgICAgICAgICBwa2dpbmZv
LnBrZ2UgPSB2YWx1ZQogICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJQS0dWIjoKICAgICAg
ICAgICAgICAgICAgICBwa2dpbmZvLnBrZ3YgPSB2YWx1ZQogICAgICAgICAgICAgICAgZWxpZiBu
YW1lID09ICJQS0dSIjoKICAgICAgICAgICAgICAgICAgICBwa2dpbmZvLnBrZ3IgPSB2YWx1ZQog
ICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJSUFJPVklERVMiOgogICAgICAgICAgICAgICAg
ICAgIHBrZ2luZm8ucnByb3ZpZGVzID0gdmFsdWUKICAgICAgICAgICAgICAgIGVsaWYgbmFtZSA9
PSAiUkRFUEVORFMiOgogICAgICAgICAgICAgICAgICAgIHBrZ2luZm8ucmRlcGVuZHMgPSB2YWx1
ZQogICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJSUkVDT01NRU5EUyI6CiAgICAgICAgICAg
ICAgICAgICAgcGtnaW5mby5ycmVjb21tZW5kcyA9IHZhbHVlCiAgICAgICAgICAgICAgICBlbGlm
IG5hbWUgPT0gIlJTVUdHRVNUUyI6CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5yc3VnZ2Vz
dHMgPSB2YWx1ZQogICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJSUkVQTEFDRVMiOgogICAg
ICAgICAgICAgICAgICAgIHBrZ2luZm8ucnJlcGxhY2VzID0gdmFsdWUKICAgICAgICAgICAgICAg
IGVsaWYgbmFtZSA9PSAiUkNPTkZMSUNUUyI6CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5y
Y29uZmxpY3RzID0gdmFsdWUKICAgICAgICAgICAgICAgIGVsaWYgbmFtZSA9PSAiUEtHU0laRSI6
CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5zaXplID0gaW50KHZhbHVlKQogICAgICAgICAg
ICAgICAgZWxpZiBuYW1lID09ICJGSUxFUyI6CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5m
aWxlcyA9IHZhbHVlCiAgICAgICAgICAgICAgICBlbGlmIG5hbWUgPT0gIkZJTEVMSVNUIjoKICAg
ICAgICAgICAgICAgICAgICBwa2dpbmZvLmZpbGVsaXN0ID0gdmFsdWUKICAgICAgICAjIEFwcGx5
IGRlZmF1bHRzCiAgICAgICAgaWYgbm90IHBrZ2luZm8ucGtnOgogICAgICAgICAgICBwa2dpbmZv
LnBrZyA9IHBrZ2luZm8ubmFtZQogICAgICAgIGlmIG5vdCBwa2dpbmZvLnBrZ2U6CiAgICAgICAg
ICAgIHBrZ2luZm8ucGtnZSA9IHBrZ2luZm8ucGUKICAgICAgICBpZiBub3QgcGtnaW5mby5wa2d2
OgogICAgICAgICAgICBwa2dpbmZvLnBrZ3YgPSBwa2dpbmZvLnB2CiAgICAgICAgaWYgbm90IHBr
Z2luZm8ucGtncjoKICAgICAgICAgICAgcGtnaW5mby5wa2dyID0gcGtnaW5mby5wcgogICAgICAg
IHJldHVybiBwa2dpbmZvCgogICAgZGVmIGdldGxhc3Rwa2d2ZXJzaW9uKHBrZyk6CiAgICAgICAg
dHJ5OgogICAgICAgICAgICBoaXN0ZmlsZSA9IG9zLnBhdGguam9pbihvbGRwa2doaXN0ZGlyLCBw
a2csICJsYXRlc3QiKQogICAgICAgICAgICByZXR1cm4gcmVhZFBhY2thZ2VJbmZvKHBrZywgaGlz
dGZpbGUpCiAgICAgICAgZXhjZXB0IEVudmlyb25tZW50RXJyb3I6CiAgICAgICAgICAgIHJldHVy
biBOb25lCgogICAgZGVmIHNvcnRwa2dsaXN0KHN0cmluZyk6CiAgICAgICAgcGtnaXRlciA9IHJl
LmZpbmRpdGVyKHInW2EtekEtWjAtOS4rLV0rKCBcKFs+PD1dK1teKV0rXCkpPycsIHN0cmluZywg
MCkKICAgICAgICBwa2dsaXN0ID0gW3AuZ3JvdXAoMCkgZm9yIHAgaW4gcGtnaXRlcl0KICAgICAg
ICBwa2dsaXN0LnNvcnQoKQogICAgICAgIHJldHVybiAnICcuam9pbihwa2dsaXN0KQoKICAgIGRl
ZiBzb3J0bGlzdChzdHJpbmcpOgogICAgICAgIGl0ZW1zID0gc3RyaW5nLnNwbGl0KCcgJykKICAg
ICAgICBpdGVtcy5zb3J0KCkKICAgICAgICByZXR1cm4gJyAnLmpvaW4oaXRlbXMpCgogICAgcG4g
PSBkLmdldFZhcignUE4nKQogICAgcGUgPSBkLmdldFZhcignUEUnKSBvciAiMCIKICAgIHB2ID0g
ZC5nZXRWYXIoJ1BWJykKICAgIHByID0gZC5nZXRWYXIoJ1BSJykKICAgIGxheWVyID0gYmIudXRp
bHMuZ2V0X2ZpbGVfbGF5ZXIoZC5nZXRWYXIoJ0ZJTEUnKSwgZCkKCiAgICBwa2dkYXRhX2RpciA9
IGQuZ2V0VmFyKCdQS0dEQVRBX0RJUicpCiAgICBwYWNrYWdlcyA9ICIiCiAgICB0cnk6CiAgICAg
ICAgd2l0aCBvcGVuKG9zLnBhdGguam9pbihwa2dkYXRhX2RpciwgcG4pKSBhcyBmOgogICAgICAg
ICAgICBmb3IgbGluZSBpbiBmLnJlYWRsaW5lcygpOgogICAgICAgICAgICAgICAgaWYgbGluZS5z
dGFydHN3aXRoKCdQQUNLQUdFUzogJyk6CiAgICAgICAgICAgICAgICAgICAgcGFja2FnZXMgPSBv
ZS51dGlscy5zcXVhc2hzcGFjZXMobGluZS5zcGxpdCgnOiAnLCAxKVsxXSkKICAgICAgICAgICAg
ICAgICAgICBicmVhawogICAgZXhjZXB0IElPRXJyb3IgYXMgZToKICAgICAgICBpZiBlLmVycm5v
ID09IGVycm5vLkVOT0VOVDoKICAgICAgICAgICAgIyBQcm9iYWJseSBhIC1jcm9zcyByZWNpcGUs
IGp1c3QgaWdub3JlCiAgICAgICAgICAgIHJldHVybiAwCiAgICAgICAgZWxzZToKICAgICAgICAg
ICAgcmFpc2UKCiAgICBwYWNrYWdlbGlzdCA9IHBhY2thZ2VzLnNwbGl0KCkKICAgIHByZXNlcnZl
ID0gZC5nZXRWYXIoJ0JVSUxESElTVE9SWV9QUkVTRVJWRScpLnNwbGl0KCkKICAgIGlmIG5vdCBv
cy5wYXRoLmV4aXN0cyhwa2doaXN0ZGlyKToKICAgICAgICBiYi51dGlscy5ta2RpcmhpZXIocGtn
aGlzdGRpcikKICAgIGVsc2U6CiAgICAgICAgIyBSZW1vdmUgZmlsZXMgZm9yIHBhY2thZ2VzIHRo
YXQgbm8gbG9uZ2VyIGV4aXN0CiAgICAgICAgZm9yIGl0ZW0gaW4gb3MubGlzdGRpcihwa2doaXN0
ZGlyKToKICAgICAgICAgICAgaWYgaXRlbSBub3QgaW4gcHJlc2VydmU6CiAgICAgICAgICAgICAg
ICBpZiBpdGVtIG5vdCBpbiBwYWNrYWdlbGlzdDoKICAgICAgICAgICAgICAgICAgICBpdGVtcGF0
aCA9IG9zLnBhdGguam9pbihwa2doaXN0ZGlyLCBpdGVtKQogICAgICAgICAgICAgICAgICAgIGlm
IG9zLnBhdGguaXNkaXIoaXRlbXBhdGgpOgogICAgICAgICAgICAgICAgICAgICAgICBmb3Igc3Vi
ZmlsZSBpbiBvcy5saXN0ZGlyKGl0ZW1wYXRoKToKICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG9zLnVubGluayhvcy5wYXRoLmpvaW4oaXRlbXBhdGgsIHN1YmZpbGUpKQogICAgICAgICAgICAg
ICAgICAgICAgICBvcy5ybWRpcihpdGVtcGF0aCkKICAgICAgICAgICAgICAgICAgICBlbHNlOgog
ICAgICAgICAgICAgICAgICAgICAgICBvcy51bmxpbmsoaXRlbXBhdGgpCgogICAgcmNwaW5mbyA9
IFJlY2lwZUluZm8ocG4pCiAgICByY3BpbmZvLnBlID0gcGUKICAgIHJjcGluZm8ucHYgPSBwdgog
ICAgcmNwaW5mby5wciA9IHByCiAgICByY3BpbmZvLmRlcGVuZHMgPSBzb3J0bGlzdChvZS51dGls
cy5zcXVhc2hzcGFjZXMoZC5nZXRWYXIoJ0RFUEVORFMnKSBvciAiIikpCiAgICByY3BpbmZvLnBh
Y2thZ2VzID0gcGFja2FnZXMKICAgIHJjcGluZm8ubGF5ZXIgPSBsYXllcgogICAgd3JpdGVfcmVj
aXBlaGlzdG9yeShyY3BpbmZvLCBkKQoKICAgIHBrZ2Rlc3QgPSBkLmdldFZhcignUEtHREVTVCcp
CiAgICBmb3IgcGtnIGluIHBhY2thZ2VsaXN0OgogICAgICAgIHBrZ2RhdGEgPSB7fQogICAgICAg
IHdpdGggb3Blbihvcy5wYXRoLmpvaW4ocGtnZGF0YV9kaXIsICdydW50aW1lJywgcGtnKSkgYXMg
ZjoKICAgICAgICAgICAgZm9yIGxpbmUgaW4gZi5yZWFkbGluZXMoKToKICAgICAgICAgICAgICAg
IGl0ZW0gPSBsaW5lLnJzdHJpcCgnXG4nKS5zcGxpdCgnOiAnLCAxKQogICAgICAgICAgICAgICAg
a2V5ID0gaXRlbVswXQogICAgICAgICAgICAgICAgaWYga2V5LmVuZHN3aXRoKCdfJyArIHBrZyk6
CiAgICAgICAgICAgICAgICAgICAga2V5ID0ga2V5WzotbGVuKHBrZyktMV0KICAgICAgICAgICAg
ICAgIHBrZ2RhdGFba2V5XSA9IGl0ZW1bMV0uZW5jb2RlKCdsYXRpbi0xJykuZGVjb2RlKCd1bmlj
b2RlX2VzY2FwZScpCgogICAgICAgIHBrZ2UgPSBwa2dkYXRhLmdldCgnUEtHRScsICcwJykKICAg
ICAgICBwa2d2ID0gcGtnZGF0YVsnUEtHViddCiAgICAgICAgcGtnciA9IHBrZ2RhdGFbJ1BLR1In
XQogICAgICAgICMKICAgICAgICAjIEZpbmQgb3V0IHdoYXQgdGhlIGxhc3QgdmVyc2lvbiB3YXMK
ICAgICAgICAjIE1ha2Ugc3VyZSB0aGUgdmVyc2lvbiBkaWQgbm90IGRlY3JlYXNlCiAgICAgICAg
IwogICAgICAgIGxhc3R2ZXJzaW9uID0gZ2V0bGFzdHBrZ3ZlcnNpb24ocGtnKQogICAgICAgIGlm
IGxhc3R2ZXJzaW9uOgogICAgICAgICAgICBsYXN0X3BrZ2UgPSBsYXN0dmVyc2lvbi5wa2dlCiAg
ICAgICAgICAgIGxhc3RfcGtndiA9IGxhc3R2ZXJzaW9uLnBrZ3YKICAgICAgICAgICAgbGFzdF9w
a2dyID0gbGFzdHZlcnNpb24ucGtncgogICAgICAgICAgICByID0gYmIudXRpbHMudmVyY21wKChw
a2dlLCBwa2d2LCBwa2dyKSwgKGxhc3RfcGtnZSwgbGFzdF9wa2d2LCBsYXN0X3BrZ3IpKQogICAg
ICAgICAgICBpZiByIDwgMDoKICAgICAgICAgICAgICAgIG1zZyA9ICJQYWNrYWdlIHZlcnNpb24g
Zm9yIHBhY2thZ2UgJXMgd2VudCBiYWNrd2FyZHMgd2hpY2ggd291bGQgYnJlYWsgcGFja2FnZSBm
ZWVkcyBmcm9tICglczolcy0lcyB0byAlczolcy0lcykiICUgKHBrZywgbGFzdF9wa2dlLCBsYXN0
X3BrZ3YsIGxhc3RfcGtnciwgcGtnZSwgcGtndiwgcGtncikKICAgICAgICAgICAgICAgIHBhY2th
Z2VfcWFfaGFuZGxlX2Vycm9yKCJ2ZXJzaW9uLWdvaW5nLWJhY2t3YXJkcyIsIG1zZywgZCkKCiAg
ICAgICAgcGtnaW5mbyA9IFBhY2thZ2VJbmZvKHBrZykKICAgICAgICAjIEFwcGFyZW50bHkgdGhl
IHZlcnNpb24gY2FuIGJlIGRpZmZlcmVudCBvbiBhIHBlci1wYWNrYWdlIGJhc2lzIChzZWUgUHl0
aG9uKQogICAgICAgIHBrZ2luZm8ucGUgPSBwa2dkYXRhLmdldCgnUEUnLCAnMCcpCiAgICAgICAg
cGtnaW5mby5wdiA9IHBrZ2RhdGFbJ1BWJ10KICAgICAgICBwa2dpbmZvLnByID0gcGtnZGF0YVsn
UFInXQogICAgICAgIHBrZ2luZm8ucGtnID0gcGtnZGF0YVsnUEtHJ10KICAgICAgICBwa2dpbmZv
LnBrZ2UgPSBwa2dlCiAgICAgICAgcGtnaW5mby5wa2d2ID0gcGtndgogICAgICAgIHBrZ2luZm8u
cGtnciA9IHBrZ3IKICAgICAgICBwa2dpbmZvLnJwcm92aWRlcyA9IHNvcnRwa2dsaXN0KG9lLnV0
aWxzLnNxdWFzaHNwYWNlcyhwa2dkYXRhLmdldCgnUlBST1ZJREVTJywgIiIpKSkKICAgICAgICBw
a2dpbmZvLnJkZXBlbmRzID0gc29ydHBrZ2xpc3Qob2UudXRpbHMuc3F1YXNoc3BhY2VzKHBrZ2Rh
dGEuZ2V0KCdSREVQRU5EUycsICIiKSkpCiAgICAgICAgcGtnaW5mby5ycmVjb21tZW5kcyA9IHNv
cnRwa2dsaXN0KG9lLnV0aWxzLnNxdWFzaHNwYWNlcyhwa2dkYXRhLmdldCgnUlJFQ09NTUVORFMn
LCAiIikpKQogICAgICAgIHBrZ2luZm8ucnN1Z2dlc3RzID0gc29ydHBrZ2xpc3Qob2UudXRpbHMu
c3F1YXNoc3BhY2VzKHBrZ2RhdGEuZ2V0KCdSU1VHR0VTVFMnLCAiIikpKQogICAgICAgIHBrZ2lu
Zm8ucnJlcGxhY2VzID0gc29ydHBrZ2xpc3Qob2UudXRpbHMuc3F1YXNoc3BhY2VzKHBrZ2RhdGEu
Z2V0KCdSUkVQTEFDRVMnLCAiIikpKQogICAgICAgIHBrZ2luZm8ucmNvbmZsaWN0cyA9IHNvcnRw
a2dsaXN0KG9lLnV0aWxzLnNxdWFzaHNwYWNlcyhwa2dkYXRhLmdldCgnUkNPTkZMSUNUUycsICIi
KSkpCiAgICAgICAgcGtnaW5mby5maWxlcyA9IG9lLnV0aWxzLnNxdWFzaHNwYWNlcyhwa2dkYXRh
LmdldCgnRklMRVMnLCAiIikpCiAgICAgICAgZm9yIGZpbGV2YXIgaW4gcGtnaW5mby5maWxldmFy
czoKICAgICAgICAgICAgcGtnaW5mby5maWxldmFyc1tmaWxldmFyXSA9IHBrZ2RhdGEuZ2V0KGZp
bGV2YXIsICIiKQoKICAgICAgICAjIEdhdGhlciBpbmZvcm1hdGlvbiBhYm91dCBwYWNrYWdlZCBm
aWxlcwogICAgICAgIHZhbCA9IHBrZ2RhdGEuZ2V0KCdGSUxFU19JTkZPJywgJycpCiAgICAgICAg
ZGljdHZhbCA9IGpzb24ubG9hZHModmFsKQogICAgICAgIGZpbGVsaXN0ID0gbGlzdChkaWN0dmFs
LmtleXMoKSkKICAgICAgICBmaWxlbGlzdC5zb3J0KCkKICAgICAgICBwa2dpbmZvLmZpbGVsaXN0
ID0gIiAiLmpvaW4oW3NobGV4LnF1b3RlKHgpIGZvciB4IGluIGZpbGVsaXN0XSkKCiAgICAgICAg
cGtnaW5mby5zaXplID0gaW50KHBrZ2RhdGFbJ1BLR1NJWkUnXSkKCiAgICAgICAgd3JpdGVfcGtn
aGlzdG9yeShwa2dpbmZvLCBkKQoKICAgICMgQ3JlYXRlIGZpbGVzLWluLTxwYWNrYWdlLW5hbWU+
LnR4dCBmaWxlcyBjb250YWluaW5nIGEgbGlzdCBvZiBmaWxlcyBvZiBlYWNoIHJlY2lwZSdzIHBh
Y2thZ2UKICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygiYnVpbGRoaXN0b3J5X2xpc3RfcGtnX2ZpbGVz
IiwgZCkKCmJ1aWxkaGlzdG9yeV9lbWl0X3BrZ2hpc3RvcnkoZCkKCmRlZiBwYWNrYWdlX3FhX2hh
bmRsZV9lcnJvcihlcnJvcl9jbGFzcywgZXJyb3JfbXNnLCBkKToKICAgIGlmIGVycm9yX2NsYXNz
IGluIChkLmdldFZhcigiRVJST1JfUUEiKSBvciAiIikuc3BsaXQoKToKICAgICAgICBwYWNrYWdl
X3FhX3dyaXRlX2Vycm9yKGVycm9yX2NsYXNzLCBlcnJvcl9tc2csIGQpCiAgICAgICAgYmIuZXJy
b3IoIlFBIElzc3VlOiAlcyBbJXNdIiAlIChlcnJvcl9tc2csIGVycm9yX2NsYXNzKSkKICAgICAg
ICBkLnNldFZhcigiUUFfU0FORSIsIEZhbHNlKQogICAgICAgIHJldHVybiBGYWxzZQogICAgZWxp
ZiBlcnJvcl9jbGFzcyBpbiAoZC5nZXRWYXIoIldBUk5fUUEiKSBvciAiIikuc3BsaXQoKToKICAg
ICAgICBwYWNrYWdlX3FhX3dyaXRlX2Vycm9yKGVycm9yX2NsYXNzLCBlcnJvcl9tc2csIGQpCiAg
ICAgICAgYmIud2FybigiUUEgSXNzdWU6ICVzIFslc10iICUgKGVycm9yX21zZywgZXJyb3JfY2xh
c3MpKQogICAgZWxzZToKICAgICAgICBiYi5ub3RlKCJRQSBJc3N1ZTogJXMgWyVzXSIgJSAoZXJy
b3JfbXNnLCBlcnJvcl9jbGFzcykpCiAgICByZXR1cm4gVHJ1ZQoKZGVmIHdyaXRlX3BrZ2hpc3Rv
cnkocGtnaW5mbywgZCk6CiAgICBiYi5kZWJ1ZygyLCAiV3JpdGluZyBwYWNrYWdlIGhpc3Rvcnkg
Zm9yIHBhY2thZ2UgJXMiICUgcGtnaW5mby5uYW1lKQoKICAgIHBrZ2hpc3RkaXIgPSBkLmdldFZh
cignQlVJTERISVNUT1JZX0RJUl9QQUNLQUdFJykKCiAgICBwa2dwYXRoID0gb3MucGF0aC5qb2lu
KHBrZ2hpc3RkaXIsIHBrZ2luZm8ubmFtZSkKICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhwa2dw
YXRoKToKICAgICAgICBiYi51dGlscy5ta2RpcmhpZXIocGtncGF0aCkKCiAgICBpbmZvZmlsZSA9
IG9zLnBhdGguam9pbihwa2dwYXRoLCAibGF0ZXN0IikKICAgIHdpdGggb3BlbihpbmZvZmlsZSwg
InciKSBhcyBmOgogICAgICAgIGlmIHBrZ2luZm8ucGUgIT0gIjAiOgogICAgICAgICAgICBmLndy
aXRlKHUiUEUgPSAlc1xuIiAlICBwa2dpbmZvLnBlKQogICAgICAgIGYud3JpdGUodSJQViA9ICVz
XG4iICUgIHBrZ2luZm8ucHYpCiAgICAgICAgZi53cml0ZSh1IlBSID0gJXNcbiIgJSAgcGtnaW5m
by5wcikKCiAgICAgICAgaWYgcGtnaW5mby5wa2cgIT0gcGtnaW5mby5uYW1lOgogICAgICAgICAg
ICBmLndyaXRlKHUiUEtHID0gJXNcbiIgJSBwa2dpbmZvLnBrZykKICAgICAgICBpZiBwa2dpbmZv
LnBrZ2UgIT0gcGtnaW5mby5wZToKICAgICAgICAgICAgZi53cml0ZSh1IlBLR0UgPSAlc1xuIiAl
IHBrZ2luZm8ucGtnZSkKICAgICAgICBpZiBwa2dpbmZvLnBrZ3YgIT0gcGtnaW5mby5wdjoKICAg
ICAgICAgICAgZi53cml0ZSh1IlBLR1YgPSAlc1xuIiAlIHBrZ2luZm8ucGtndikKICAgICAgICBp
ZiBwa2dpbmZvLnBrZ3IgIT0gcGtnaW5mby5wcjoKICAgICAgICAgICAgZi53cml0ZSh1IlBLR1Ig
PSAlc1xuIiAlIHBrZ2luZm8ucGtncikKICAgICAgICBmLndyaXRlKHUiUlBST1ZJREVTID0gJXNc
biIgJSAgcGtnaW5mby5ycHJvdmlkZXMpCiAgICAgICAgZi53cml0ZSh1IlJERVBFTkRTID0gJXNc
biIgJSAgcGtnaW5mby5yZGVwZW5kcykKICAgICAgICBmLndyaXRlKHUiUlJFQ09NTUVORFMgPSAl
c1xuIiAlICBwa2dpbmZvLnJyZWNvbW1lbmRzKQogICAgICAgIGlmIHBrZ2luZm8ucnN1Z2dlc3Rz
OgogICAgICAgICAgICBmLndyaXRlKHUiUlNVR0dFU1RTID0gJXNcbiIgJSAgcGtnaW5mby5yc3Vn
Z2VzdHMpCiAgICAgICAgaWYgcGtnaW5mby5ycmVwbGFjZXM6CiAgICAgICAgICAgIGYud3JpdGUo
dSJSUkVQTEFDRVMgPSAlc1xuIiAlICBwa2dpbmZvLnJyZXBsYWNlcykKICAgICAgICBpZiBwa2dp
bmZvLnJjb25mbGljdHM6CiAgICAgICAgICAgIGYud3JpdGUodSJSQ09ORkxJQ1RTID0gJXNcbiIg
JSAgcGtnaW5mby5yY29uZmxpY3RzKQogICAgICAgIGYud3JpdGUodSJQS0dTSVpFID0gJWRcbiIg
JSAgcGtnaW5mby5zaXplKQogICAgICAgIGYud3JpdGUodSJGSUxFUyA9ICVzXG4iICUgIHBrZ2lu
Zm8uZmlsZXMpCiAgICAgICAgZi53cml0ZSh1IkZJTEVMSVNUID0gJXNcbiIgJSAgcGtnaW5mby5m
aWxlbGlzdCkKCiAgICBmb3IgZmlsZXZhciBpbiBwa2dpbmZvLmZpbGV2YXJzOgogICAgICAgIGZp
bGV2YXJwYXRoID0gb3MucGF0aC5qb2luKHBrZ3BhdGgsICJsYXRlc3QuJXMiICUgZmlsZXZhcikK
ICAgICAgICB2YWwgPSBwa2dpbmZvLmZpbGV2YXJzW2ZpbGV2YXJdCiAgICAgICAgaWYgdmFsOgog
ICAgICAgICAgICB3aXRoIG9wZW4oZmlsZXZhcnBhdGgsICJ3IikgYXMgZjoKICAgICAgICAgICAg
ICAgIGYud3JpdGUodmFsKQogICAgICAgIGVsc2U6CiAgICAgICAgICAgIGlmIG9zLnBhdGguZXhp
c3RzKGZpbGV2YXJwYXRoKToKICAgICAgICAgICAgICAgIG9zLnVubGluayhmaWxldmFycGF0aCkK
CiMKIyByb290ZnNfdHlwZSBjYW4gYmU6IGltYWdlLCBzZGtfdGFyZ2V0LCBzZGtfaG9zdAojCgpk
ZWYgd3JpdGVfcmVjaXBlaGlzdG9yeShyY3BpbmZvLCBkKToKICAgIGJiLmRlYnVnKDIsICJXcml0
aW5nIHJlY2lwZSBoaXN0b3J5IikKCiAgICBwa2doaXN0ZGlyID0gZC5nZXRWYXIoJ0JVSUxESElT
VE9SWV9ESVJfUEFDS0FHRScpCgogICAgaW5mb2ZpbGUgPSBvcy5wYXRoLmpvaW4ocGtnaGlzdGRp
ciwgImxhdGVzdCIpCiAgICB3aXRoIG9wZW4oaW5mb2ZpbGUsICJ3IikgYXMgZjoKICAgICAgICBp
ZiByY3BpbmZvLnBlICE9ICIwIjoKICAgICAgICAgICAgZi53cml0ZSh1IlBFID0gJXNcbiIgJSAg
cmNwaW5mby5wZSkKICAgICAgICBmLndyaXRlKHUiUFYgPSAlc1xuIiAlICByY3BpbmZvLnB2KQog
ICAgICAgIGYud3JpdGUodSJQUiA9ICVzXG4iICUgIHJjcGluZm8ucHIpCiAgICAgICAgZi53cml0
ZSh1IkRFUEVORFMgPSAlc1xuIiAlICByY3BpbmZvLmRlcGVuZHMpCiAgICAgICAgZi53cml0ZSh1
IlBBQ0tBR0VTID0gJXNcbiIgJSAgcmNwaW5mby5wYWNrYWdlcykKICAgICAgICBmLndyaXRlKHUi
TEFZRVIgPSAlc1xuIiAlICByY3BpbmZvLmxheWVyKQoKICAgIHdyaXRlX2xhdGVzdF9zcmNyZXYo
ZCwgcGtnaGlzdGRpcikKCmRlZiB3cml0ZV9sYXRlc3Rfc3JjcmV2KGQsIHBrZ2hpc3RkaXIpOgog
ICAgc3JjcmV2ZmlsZSA9IG9zLnBhdGguam9pbihwa2doaXN0ZGlyLCAnbGF0ZXN0X3NyY3Jldicp
CgogICAgc3JjcmV2cywgdGFnX3NyY3JldnMgPSBfZ2V0X3NyY3Jldl92YWx1ZXMoZCkKICAgIGlm
IHNyY3JldnM6CiAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKHBrZ2hpc3RkaXIpOgogICAg
ICAgICAgICBiYi51dGlscy5ta2RpcmhpZXIocGtnaGlzdGRpcikKICAgICAgICBvbGRfdGFnX3Ny
Y3JldnMgPSB7fQogICAgICAgIGlmIG9zLnBhdGguZXhpc3RzKHNyY3JldmZpbGUpOgogICAgICAg
ICAgICB3aXRoIG9wZW4oc3JjcmV2ZmlsZSkgYXMgZjoKICAgICAgICAgICAgICAgIGZvciBsaW5l
IGluIGY6CiAgICAgICAgICAgICAgICAgICAgaWYgbGluZS5zdGFydHN3aXRoKCcjIHRhZ18nKToK
ICAgICAgICAgICAgICAgICAgICAgICAga2V5LCB2YWx1ZSA9IGxpbmUuc3BsaXQoIj0iLCAxKQog
ICAgICAgICAgICAgICAgICAgICAgICBrZXkgPSBrZXkucmVwbGFjZSgnIyB0YWdfJywgJycpLnN0
cmlwKCkKICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWUgPSB2YWx1ZS5yZXBsYWNlKCciJywg
JycpLnN0cmlwKCkKICAgICAgICAgICAgICAgICAgICAgICAgb2xkX3RhZ19zcmNyZXZzW2tleV0g
PSB2YWx1ZQogICAgICAgIHdpdGggb3BlbihzcmNyZXZmaWxlLCAndycpIGFzIGY6CiAgICAgICAg
ICAgIG9yaWdfc3JjcmV2ID0gZC5nZXRWYXIoJ1NSQ1JFVicsIEZhbHNlKSBvciAnSU5WQUxJRCcK
ICAgICAgICAgICAgaWYgb3JpZ19zcmNyZXYgIT0gJ0lOVkFMSUQnOgogICAgICAgICAgICAgICAg
Zi53cml0ZSgnIyBTUkNSRVYgPSAiJXMiXG4nICUgb3JpZ19zcmNyZXYpCiAgICAgICAgICAgIGlm
IGxlbihzcmNyZXZzKSA+IDE6CiAgICAgICAgICAgICAgICBmb3IgbmFtZSwgc3JjcmV2IGluIHNv
cnRlZChzcmNyZXZzLml0ZW1zKCkpOgogICAgICAgICAgICAgICAgICAgIG9yaWdfc3JjcmV2ID0g
ZC5nZXRWYXIoJ1NSQ1JFVl8lcycgJSBuYW1lLCBGYWxzZSkKICAgICAgICAgICAgICAgICAgICBp
ZiBvcmlnX3NyY3JldjoKICAgICAgICAgICAgICAgICAgICAgICAgZi53cml0ZSgnIyBTUkNSRVZf
JXMgPSAiJXMiXG4nICUgKG5hbWUsIG9yaWdfc3JjcmV2KSkKICAgICAgICAgICAgICAgICAgICBm
LndyaXRlKCdTUkNSRVZfJXMgPSAiJXMiXG4nICUgKG5hbWUsIHNyY3JldikpCiAgICAgICAgICAg
IGVsc2U6CiAgICAgICAgICAgICAgICBmLndyaXRlKCdTUkNSRVYgPSAiJXMiXG4nICUgbmV4dChp
dGVyKHNyY3JldnMudmFsdWVzKCkpKSkKICAgICAgICAgICAgaWYgbGVuKHRhZ19zcmNyZXZzKSA+
IDA6CiAgICAgICAgICAgICAgICBmb3IgbmFtZSwgc3JjcmV2IGluIHNvcnRlZCh0YWdfc3JjcmV2
cy5pdGVtcygpKToKICAgICAgICAgICAgICAgICAgICBmLndyaXRlKCcjIHRhZ18lcyA9ICIlcyJc
bicgJSAobmFtZSwgc3JjcmV2KSkKICAgICAgICAgICAgICAgICAgICBpZiBuYW1lIGluIG9sZF90
YWdfc3JjcmV2cyBhbmQgb2xkX3RhZ19zcmNyZXZzW25hbWVdICE9IHNyY3JldjoKICAgICAgICAg
ICAgICAgICAgICAgICAgcGtnID0gZC5nZXRWYXIoJ1BOJykKICAgICAgICAgICAgICAgICAgICAg
ICAgYmIud2FybigiUmV2aXNpb24gZm9yIHRhZyAlcyBpbiBwYWNrYWdlICVzIHdhcyBjaGFuZ2Vk
IHNpbmNlIGxhc3QgYnVpbGQgKGZyb20gJXMgdG8gJXMpIiAlIChuYW1lLCBwa2csIG9sZF90YWdf
c3JjcmV2c1tuYW1lXSwgc3JjcmV2KSkKCiAgICBlbHNlOgogICAgICAgIGlmIG9zLnBhdGguZXhp
c3RzKHNyY3JldmZpbGUpOgogICAgICAgICAgICBvcy5yZW1vdmUoc3JjcmV2ZmlsZSkKCmRlZiBw
YWNrYWdlX3FhX3dyaXRlX2Vycm9yKHR5cGUsIGVycm9yLCBkKToKICAgIGxvZ2ZpbGUgPSBkLmdl
dFZhcignUUFfTE9HRklMRScpCiAgICBpZiBsb2dmaWxlOgogICAgICAgIHAgPSBkLmdldFZhcign
UCcpCiAgICAgICAgd2l0aCBvcGVuKGxvZ2ZpbGUsICJhKyIpIGFzIGY6CiAgICAgICAgICAgIGYu
d3JpdGUoIiVzOiAlcyBbJXNdXG4iICUgKHAsIGVycm9yLCB0eXBlKSkKCmRlZiBfZ2V0X3NyY3Jl
dl92YWx1ZXMoZCk6CiAgICAiIiIKICAgIFJldHVybiB0aGUgdmVyc2lvbiBzdHJpbmdzIGZvciB0
aGUgY3VycmVudCByZWNpcGUKICAgICIiIgoKICAgIHNjbXMgPSBbXQogICAgZmV0Y2hlciA9IGJi
LmZldGNoLkZldGNoKGQuZ2V0VmFyKCdTUkNfVVJJJykuc3BsaXQoKSwgZCkKICAgIHVybGRhdGEg
PSBmZXRjaGVyLnVkCiAgICBmb3IgdSBpbiB1cmxkYXRhOgogICAgICAgIGlmIHVybGRhdGFbdV0u
bWV0aG9kLnN1cHBvcnRzX3NyY3JldigpOgogICAgICAgICAgICBzY21zLmFwcGVuZCh1KQoKICAg
IGF1dG9pbmNfdGVtcGwgPSAnQVVUT0lOQysnCiAgICBkaWN0X3NyY3JldnMgPSB7fQogICAgZGlj
dF90YWdfc3JjcmV2cyA9IHt9CiAgICBmb3Igc2NtIGluIHNjbXM6CiAgICAgICAgdWQgPSB1cmxk
YXRhW3NjbV0KICAgICAgICBmb3IgbmFtZSBpbiB1ZC5uYW1lczoKICAgICAgICAgICAgdHJ5Ogog
ICAgICAgICAgICAgICAgcmV2ID0gdWQubWV0aG9kLnNvcnRhYmxlX3JldmlzaW9uKHVkLCBkLCBu
YW1lKQogICAgICAgICAgICBleGNlcHQgVHlwZUVycm9yOgogICAgICAgICAgICAgICAgIyBzdXBw
b3J0IG9sZCBiaXRiYWtlIHZlcnNpb25zCiAgICAgICAgICAgICAgICByZXYgPSB1ZC5tZXRob2Qu
c29ydGFibGVfcmV2aXNpb24oc2NtLCB1ZCwgZCwgbmFtZSkKICAgICAgICAgICAgIyBDbGVhbiB0
aGlzIHVwIHdoZW4gd2UgbmV4dCBidW1wIGJpdGJha2UgdmVyc2lvbgogICAgICAgICAgICBpZiB0
eXBlKHJldikgIT0gc3RyOgogICAgICAgICAgICAgICAgYXV0b2luYywgcmV2ID0gcmV2CiAgICAg
ICAgICAgIGVsaWYgcmV2LnN0YXJ0c3dpdGgoYXV0b2luY190ZW1wbCk6CiAgICAgICAgICAgICAg
ICByZXYgPSByZXZbbGVuKGF1dG9pbmNfdGVtcGwpOl0KICAgICAgICAgICAgZGljdF9zcmNyZXZz
W25hbWVdID0gcmV2CiAgICAgICAgICAgIGlmICd0YWcnIGluIHVkLnBhcm06CiAgICAgICAgICAg
ICAgICB0YWcgPSB1ZC5wYXJtWyd0YWcnXTsKICAgICAgICAgICAgICAgIGtleSA9IG5hbWUrJ18n
K3RhZwogICAgICAgICAgICAgICAgZGljdF90YWdfc3JjcmV2c1trZXldID0gcmV2CiAgICByZXR1
cm4gKGRpY3Rfc3JjcmV2cywgZGljdF90YWdfc3JjcmV2cykKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_compile"
Content-Disposition: attachment; filename="run.do_compile"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39d23>
X-Attachment-Id: f_jz9oy39d23

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbXBpbGUoKSB7CiAgIG9l
X3J1bm1ha2UgVj0wIFwKICAgICAgICBDUk9TU19DT01QSUxFPWFybS1vZS1saW51eC1nbnVlYWJp
LSBcCiAgICAgICAgS0RJUj0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtYnVp
bGQtYXJ0aWZhY3RzCgogICBjZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L3Rvb2xzCiAgIGV4cG9ydCBKQUlMSE9VU0VfVkVSU0lP
Tj0kKGNhdCAuLi9WRVJTSU9OKQogICBvZV9ydW5tYWtlIFY9MCBcCiAgIAkgICAgICAgQ0ZMQUdT
PSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXBy
ZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAg
ICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEt
cjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmU9ICAtRExJQkVYRUNESVI9XFxcIi91c3IvbGliZXhlY1xcXCIgCQkgIC1ESkFJTEhP
VVNFX1ZFUlNJT049XFxcIiRKQUlMSE9VU0VfVkVSU0lPTlxcXCIgCQkgIC1XYWxsIC1XZXh0cmEg
LVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV21pc3NpbmctcHJvdG90eXBlcyAtV2Vycm9yIAkJICAt
SS4uL2RyaXZlciIgXAogICAgICAgICAgICAgICBzcmM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29scyBvYmo9L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cyBcCgkgICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC90b29scy9qYWlsaG91c2UtY29uZmlnLWNvbGxlY3QgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cy9qYWlsaG91c2UKfQoKb2VfcnVubWFrZSgpIHsKCW9lX3J1bm1ha2VfY2FsbCAiJEAiIHx8IGRp
ZSAib2VfcnVubWFrZSBmYWlsZWQiCn0KCm9lX3J1bm1ha2VfY2FsbCgpIHsKCWJibm90ZSBtYWtl
IC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8va2VybmVsLXNv
dXJjZSAiJEAiCgltYWtlIC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBp
LXplcm8va2VybmVsLXNvdXJjZSAiJEAiCn0KCmRpZSgpIHsKCWJiZmF0YWxfbG9nICIkKiIKfQoK
YmJmYXRhbF9sb2coKSB7CglpZiBbIC1wIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2ZpZm8uMTQ1OTggXSA7IHRoZW4KCQlwcmlu
dGYgIiViXDAiICJiYmZhdGFsX2xvZyAkKiIgPiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvdGVtcC9maWZvLjE0NTk4CgllbHNlCgkJZWNo
byAiRVJST1I6ICQqIgoJZmkKCWV4aXQgMQp9CgpiYm5vdGUoKSB7CglpZiBbIC1wIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2Zp
Zm8uMTQ1OTggXSA7IHRoZW4KCQlwcmludGYgIiViXDAiICJiYm5vdGUgJCoiID4gL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3RlbXAvZmlm
by4xNDU5OAoJZWxzZQoJCWVjaG8gIk5PVEU6ICQqIgoJZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbXBp
bGUKCiMgY2xlYW51cApyZXQ9JD8KdHJhcCAnJyAwCmV4aXQgJHJldAo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_compile.14598"
Content-Disposition: attachment; filename="run.do_compile.14598"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39h24>
X-Attachment-Id: f_jz9oy39h24

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbXBpbGUoKSB7CiAgIG9l
X3J1bm1ha2UgVj0wIFwKICAgICAgICBDUk9TU19DT01QSUxFPWFybS1vZS1saW51eC1nbnVlYWJp
LSBcCiAgICAgICAgS0RJUj0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtYnVp
bGQtYXJ0aWZhY3RzCgogICBjZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L3Rvb2xzCiAgIGV4cG9ydCBKQUlMSE9VU0VfVkVSU0lP
Tj0kKGNhdCAuLi9WRVJTSU9OKQogICBvZV9ydW5tYWtlIFY9MCBcCiAgIAkgICAgICAgQ0ZMQUdT
PSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXBy
ZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAg
ICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEt
cjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmU9ICAtRExJQkVYRUNESVI9XFxcIi91c3IvbGliZXhlY1xcXCIgCQkgIC1ESkFJTEhP
VVNFX1ZFUlNJT049XFxcIiRKQUlMSE9VU0VfVkVSU0lPTlxcXCIgCQkgIC1XYWxsIC1XZXh0cmEg
LVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV21pc3NpbmctcHJvdG90eXBlcyAtV2Vycm9yIAkJICAt
SS4uL2RyaXZlciIgXAogICAgICAgICAgICAgICBzcmM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29scyBvYmo9L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cyBcCgkgICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC90b29scy9qYWlsaG91c2UtY29uZmlnLWNvbGxlY3QgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cy9qYWlsaG91c2UKfQoKb2VfcnVubWFrZSgpIHsKCW9lX3J1bm1ha2VfY2FsbCAiJEAiIHx8IGRp
ZSAib2VfcnVubWFrZSBmYWlsZWQiCn0KCm9lX3J1bm1ha2VfY2FsbCgpIHsKCWJibm90ZSBtYWtl
IC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8va2VybmVsLXNv
dXJjZSAiJEAiCgltYWtlIC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBp
LXplcm8va2VybmVsLXNvdXJjZSAiJEAiCn0KCmRpZSgpIHsKCWJiZmF0YWxfbG9nICIkKiIKfQoK
YmJmYXRhbF9sb2coKSB7CglpZiBbIC1wIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2ZpZm8uMTQ1OTggXSA7IHRoZW4KCQlwcmlu
dGYgIiViXDAiICJiYmZhdGFsX2xvZyAkKiIgPiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvdGVtcC9maWZvLjE0NTk4CgllbHNlCgkJZWNo
byAiRVJST1I6ICQqIgoJZmkKCWV4aXQgMQp9CgpiYm5vdGUoKSB7CglpZiBbIC1wIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2Zp
Zm8uMTQ1OTggXSA7IHRoZW4KCQlwcmludGYgIiViXDAiICJiYm5vdGUgJCoiID4gL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3RlbXAvZmlm
by4xNDU5OAoJZWxzZQoJCWVjaG8gIk5PVEU6ICQqIgoJZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbXBp
bGUKCiMgY2xlYW51cApyZXQ9JD8KdHJhcCAnJyAwCmV4aXQgJHJldAo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_configure.14592"
Content-Disposition: attachment; filename="run.do_configure.14592"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39o26>
X-Attachment-Id: f_jz9oy39o26

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbmZpZ3VyZSgpIHsKICAg
aWYgWyAtZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29uZmlncyBdOwog
ICB0aGVuCiAgICAgIGNwICIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29u
Zmlncy8iKi5jIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvY29uZmlncy8KICAgZmkKCiAgIGlmIFsgISAteiAvaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5n
ZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NpL2phaWxo
b3VzZS1jb25maWctYmFuYW5hLXBpLmggXTsKICAgdGhlbgogICAgICBjcCAtYXYgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jaS9q
YWlsaG91c2UtY29uZmlnLWJhbmFuYS1waS5oIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5jbHVkZS9qYWlsaG91c2UvY29uZmln
LmgKICAgZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbmZpZ3VyZQoKIyBjbGVhbnVwCnJldD0kPwp0cmFw
ICcnIDAKZXhpdCAkcmV0Cg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_configure"
Content-Disposition: attachment; filename="run.do_configure"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39l25>
X-Attachment-Id: f_jz9oy39l25

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbmZpZ3VyZSgpIHsKICAg
aWYgWyAtZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29uZmlncyBdOwog
ICB0aGVuCiAgICAgIGNwICIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29u
Zmlncy8iKi5jIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvY29uZmlncy8KICAgZmkKCiAgIGlmIFsgISAteiAvaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5n
ZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NpL2phaWxo
b3VzZS1jb25maWctYmFuYW5hLXBpLmggXTsKICAgdGhlbgogICAgICBjcCAtYXYgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jaS9q
YWlsaG91c2UtY29uZmlnLWJhbmFuYS1waS5oIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5jbHVkZS9qYWlsaG91c2UvY29uZmln
LmgKICAgZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbmZpZ3VyZQoKIyBjbGVhbnVwCnJldD0kPwp0cmFw
ICcnIDAKZXhpdCAkcmV0Cg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_fetch"
Content-Disposition: attachment; filename="run.do_fetch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39s27>
X-Attachment-Id: f_jz9oy39s27

ZGVmIGRvX2ZldGNoKGQpOgogICAgYmIuYnVpbGQuZXhlY19mdW5jKCdiYXNlX2RvX2ZldGNoJywg
ZCkKCmRvX2ZldGNoKGQpCgpkZWYgYmFzZV9kb19mZXRjaChkKToKCiAgICBzcmNfdXJpID0gKGQu
Z2V0VmFyKCdTUkNfVVJJJykgb3IgIiIpLnNwbGl0KCkKICAgIGlmIGxlbihzcmNfdXJpKSA9PSAw
OgogICAgICAgIHJldHVybgoKICAgIHRyeToKICAgICAgICBmZXRjaGVyID0gYmIuZmV0Y2gyLkZl
dGNoKHNyY191cmksIGQpCiAgICAgICAgZmV0Y2hlci5kb3dubG9hZCgpCiAgICBleGNlcHQgYmIu
ZmV0Y2gyLkJCRmV0Y2hFeGNlcHRpb24gYXMgZToKICAgICAgICBiYi5mYXRhbChzdHIoZSkpCgo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_fetch.14470"
Content-Disposition: attachment; filename="run.do_fetch.14470"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39w28>
X-Attachment-Id: f_jz9oy39w28

ZGVmIGRvX2ZldGNoKGQpOgogICAgYmIuYnVpbGQuZXhlY19mdW5jKCdiYXNlX2RvX2ZldGNoJywg
ZCkKCmRvX2ZldGNoKGQpCgpkZWYgYmFzZV9kb19mZXRjaChkKToKCiAgICBzcmNfdXJpID0gKGQu
Z2V0VmFyKCdTUkNfVVJJJykgb3IgIiIpLnNwbGl0KCkKICAgIGlmIGxlbihzcmNfdXJpKSA9PSAw
OgogICAgICAgIHJldHVybgoKICAgIHRyeToKICAgICAgICBmZXRjaGVyID0gYmIuZmV0Y2gyLkZl
dGNoKHNyY191cmksIGQpCiAgICAgICAgZmV0Y2hlci5kb3dubG9hZCgpCiAgICBleGNlcHQgYmIu
ZmV0Y2gyLkJCRmV0Y2hFeGNlcHRpb24gYXMgZToKICAgICAgICBiYi5mYXRhbChzdHIoZSkpCgo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_patch"
Content-Disposition: attachment; filename="run.do_patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy39z29>
X-Attachment-Id: f_jz9oy39z29

ZGVmIGRvX3BhdGNoKGQpOgogICAgYmIuYnVpbGQuZXhlY19mdW5jKCdwYXRjaF9kb19wYXRjaCcs
IGQpCgpkb19wYXRjaChkKQoKZGVmIHBhdGNoX2RvX3BhdGNoKGQpOgogICAgaW1wb3J0IG9lLnBh
dGNoCgogICAgcGF0Y2hzZXRtYXAgPSB7CiAgICAgICAgInBhdGNoIjogb2UucGF0Y2guUGF0Y2hU
cmVlLAogICAgICAgICJxdWlsdCI6IG9lLnBhdGNoLlF1aWx0VHJlZSwKICAgICAgICAiZ2l0Ijog
b2UucGF0Y2guR2l0QXBwbHlUcmVlLAogICAgfQoKICAgIGNscyA9IHBhdGNoc2V0bWFwW2QuZ2V0
VmFyKCdQQVRDSFRPT0wnKSBvciAncXVpbHQnXQoKICAgIHJlc29sdmVybWFwID0gewogICAgICAg
ICJub29wIjogb2UucGF0Y2guTk9PUFJlc29sdmVyLAogICAgICAgICJ1c2VyIjogb2UucGF0Y2gu
VXNlclJlc29sdmVyLAogICAgfQoKICAgIHJjbHMgPSByZXNvbHZlcm1hcFtkLmdldFZhcignUEFU
Q0hSRVNPTFZFJykgb3IgJ3VzZXInXQoKICAgIGNsYXNzZXMgPSB7fQoKICAgIHMgPSBkLmdldFZh
cignUycpCgogICAgb3MucHV0ZW52KCdQQVRIJywgZC5nZXRWYXIoJ1BBVEgnKSkKCiAgICAjIFdl
IG11c3QgdXNlIG9uZSBUTVBESVIgcGVyIHByb2Nlc3Mgc28gdGhhdCB0aGUgInBhdGNoIiBwcm9j
ZXNzZXMKICAgICMgZG9uJ3QgZ2VuZXJhdGUgdGhlIHNhbWUgdGVtcCBmaWxlIG5hbWUuCgogICAg
aW1wb3J0IHRlbXBmaWxlCiAgICBwcm9jZXNzX3RtcGRpciA9IHRlbXBmaWxlLm1rZHRlbXAoKQog
ICAgb3MuZW52aXJvblsnVE1QRElSJ10gPSBwcm9jZXNzX3RtcGRpcgoKICAgIGZvciBwYXRjaCBp
biBzcmNfcGF0Y2hlcyhkKToKICAgICAgICBfLCBfLCBsb2NhbCwgXywgXywgcGFybSA9IGJiLmZl
dGNoLmRlY29kZXVybChwYXRjaCkKCiAgICAgICAgaWYgInBhdGNoZGlyIiBpbiBwYXJtOgogICAg
ICAgICAgICBwYXRjaGRpciA9IHBhcm1bInBhdGNoZGlyIl0KICAgICAgICAgICAgaWYgbm90IG9z
LnBhdGguaXNhYnMocGF0Y2hkaXIpOgogICAgICAgICAgICAgICAgcGF0Y2hkaXIgPSBvcy5wYXRo
LmpvaW4ocywgcGF0Y2hkaXIpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgcGF0Y2hkaXIgPSBz
CgogICAgICAgIGlmIG5vdCBwYXRjaGRpciBpbiBjbGFzc2VzOgogICAgICAgICAgICBwYXRjaHNl
dCA9IGNscyhwYXRjaGRpciwgZCkKICAgICAgICAgICAgcmVzb2x2ZXIgPSByY2xzKHBhdGNoc2V0
LCBvZV90ZXJtaW5hbCkKICAgICAgICAgICAgY2xhc3Nlc1twYXRjaGRpcl0gPSAocGF0Y2hzZXQs
IHJlc29sdmVyKQogICAgICAgICAgICBwYXRjaHNldC5DbGVhbigpCiAgICAgICAgZWxzZToKICAg
ICAgICAgICAgcGF0Y2hzZXQsIHJlc29sdmVyID0gY2xhc3Nlc1twYXRjaGRpcl0KCiAgICAgICAg
YmIubm90ZSgiQXBwbHlpbmcgcGF0Y2ggJyVzJyAoJXMpIiAlIChwYXJtWydwYXRjaG5hbWUnXSwg
b2UucGF0aC5mb3JtYXRfZGlzcGxheShsb2NhbCwgZCkpKQogICAgICAgIHRyeToKICAgICAgICAg
ICAgcGF0Y2hzZXQuSW1wb3J0KHsiZmlsZSI6bG9jYWwsICJzdHJpcHBhdGgiOiBwYXJtWydzdHJp
cGxldmVsJ119LCBUcnVlKQogICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZXhjOgogICAgICAg
ICAgICBiYi51dGlscy5yZW1vdmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAgICAgICAgICAgIGJi
LmZhdGFsKHN0cihleGMpKQogICAgICAgIHRyeToKICAgICAgICAgICAgcmVzb2x2ZXIuUmVzb2x2
ZSgpCiAgICAgICAgZXhjZXB0IGJiLkJCSGFuZGxlZEV4Y2VwdGlvbiBhcyBlOgogICAgICAgICAg
ICBiYi51dGlscy5yZW1vdmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAgICAgICAgICAgIGJiLmZh
dGFsKHN0cihlKSkKCiAgICBiYi51dGlscy5yZW1vdmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAg
ICBkZWwgb3MuZW52aXJvblsnVE1QRElSJ10KCmRlZiBzcmNfcGF0Y2hlcyhkLCBhbGw9RmFsc2Us
IGV4cGFuZD1UcnVlKToKICAgIGltcG9ydCBvZS5wYXRjaAogICAgcmV0dXJuIG9lLnBhdGNoLnNy
Y19wYXRjaGVzKGQsIGFsbCwgZXhwYW5kKQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_patch.14518"
Content-Disposition: attachment; filename="run.do_patch.14518"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3a330>
X-Attachment-Id: f_jz9oy3a330

ZGVmIGRvX3BhdGNoKGQpOgogICAgYmIuYnVpbGQuZXhlY19mdW5jKCdwYXRjaF9kb19wYXRjaCcs
IGQpCgpkb19wYXRjaChkKQoKZGVmIHBhdGNoX2RvX3BhdGNoKGQpOgogICAgaW1wb3J0IG9lLnBh
dGNoCgogICAgcGF0Y2hzZXRtYXAgPSB7CiAgICAgICAgInBhdGNoIjogb2UucGF0Y2guUGF0Y2hU
cmVlLAogICAgICAgICJxdWlsdCI6IG9lLnBhdGNoLlF1aWx0VHJlZSwKICAgICAgICAiZ2l0Ijog
b2UucGF0Y2guR2l0QXBwbHlUcmVlLAogICAgfQoKICAgIGNscyA9IHBhdGNoc2V0bWFwW2QuZ2V0
VmFyKCdQQVRDSFRPT0wnKSBvciAncXVpbHQnXQoKICAgIHJlc29sdmVybWFwID0gewogICAgICAg
ICJub29wIjogb2UucGF0Y2guTk9PUFJlc29sdmVyLAogICAgICAgICJ1c2VyIjogb2UucGF0Y2gu
VXNlclJlc29sdmVyLAogICAgfQoKICAgIHJjbHMgPSByZXNvbHZlcm1hcFtkLmdldFZhcignUEFU
Q0hSRVNPTFZFJykgb3IgJ3VzZXInXQoKICAgIGNsYXNzZXMgPSB7fQoKICAgIHMgPSBkLmdldFZh
cignUycpCgogICAgb3MucHV0ZW52KCdQQVRIJywgZC5nZXRWYXIoJ1BBVEgnKSkKCiAgICAjIFdl
IG11c3QgdXNlIG9uZSBUTVBESVIgcGVyIHByb2Nlc3Mgc28gdGhhdCB0aGUgInBhdGNoIiBwcm9j
ZXNzZXMKICAgICMgZG9uJ3QgZ2VuZXJhdGUgdGhlIHNhbWUgdGVtcCBmaWxlIG5hbWUuCgogICAg
aW1wb3J0IHRlbXBmaWxlCiAgICBwcm9jZXNzX3RtcGRpciA9IHRlbXBmaWxlLm1rZHRlbXAoKQog
ICAgb3MuZW52aXJvblsnVE1QRElSJ10gPSBwcm9jZXNzX3RtcGRpcgoKICAgIGZvciBwYXRjaCBp
biBzcmNfcGF0Y2hlcyhkKToKICAgICAgICBfLCBfLCBsb2NhbCwgXywgXywgcGFybSA9IGJiLmZl
dGNoLmRlY29kZXVybChwYXRjaCkKCiAgICAgICAgaWYgInBhdGNoZGlyIiBpbiBwYXJtOgogICAg
ICAgICAgICBwYXRjaGRpciA9IHBhcm1bInBhdGNoZGlyIl0KICAgICAgICAgICAgaWYgbm90IG9z
LnBhdGguaXNhYnMocGF0Y2hkaXIpOgogICAgICAgICAgICAgICAgcGF0Y2hkaXIgPSBvcy5wYXRo
LmpvaW4ocywgcGF0Y2hkaXIpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgcGF0Y2hkaXIgPSBz
CgogICAgICAgIGlmIG5vdCBwYXRjaGRpciBpbiBjbGFzc2VzOgogICAgICAgICAgICBwYXRjaHNl
dCA9IGNscyhwYXRjaGRpciwgZCkKICAgICAgICAgICAgcmVzb2x2ZXIgPSByY2xzKHBhdGNoc2V0
LCBvZV90ZXJtaW5hbCkKICAgICAgICAgICAgY2xhc3Nlc1twYXRjaGRpcl0gPSAocGF0Y2hzZXQs
IHJlc29sdmVyKQogICAgICAgICAgICBwYXRjaHNldC5DbGVhbigpCiAgICAgICAgZWxzZToKICAg
ICAgICAgICAgcGF0Y2hzZXQsIHJlc29sdmVyID0gY2xhc3Nlc1twYXRjaGRpcl0KCiAgICAgICAg
YmIubm90ZSgiQXBwbHlpbmcgcGF0Y2ggJyVzJyAoJXMpIiAlIChwYXJtWydwYXRjaG5hbWUnXSwg
b2UucGF0aC5mb3JtYXRfZGlzcGxheShsb2NhbCwgZCkpKQogICAgICAgIHRyeToKICAgICAgICAg
ICAgcGF0Y2hzZXQuSW1wb3J0KHsiZmlsZSI6bG9jYWwsICJzdHJpcHBhdGgiOiBwYXJtWydzdHJp
cGxldmVsJ119LCBUcnVlKQogICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZXhjOgogICAgICAg
ICAgICBiYi51dGlscy5yZW1vdmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAgICAgICAgICAgIGJi
LmZhdGFsKHN0cihleGMpKQogICAgICAgIHRyeToKICAgICAgICAgICAgcmVzb2x2ZXIuUmVzb2x2
ZSgpCiAgICAgICAgZXhjZXB0IGJiLkJCSGFuZGxlZEV4Y2VwdGlvbiBhcyBlOgogICAgICAgICAg
ICBiYi51dGlscy5yZW1vdmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAgICAgICAgICAgIGJiLmZh
dGFsKHN0cihlKSkKCiAgICBiYi51dGlscy5yZW1vdmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAg
ICBkZWwgb3MuZW52aXJvblsnVE1QRElSJ10KCmRlZiBzcmNfcGF0Y2hlcyhkLCBhbGw9RmFsc2Us
IGV4cGFuZD1UcnVlKToKICAgIGltcG9ydCBvZS5wYXRjaAogICAgcmV0dXJuIG9lLnBhdGNoLnNy
Y19wYXRjaGVzKGQsIGFsbCwgZXhwYW5kKQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_populate_lic.14593"
Content-Disposition: attachment; filename="run.do_populate_lic.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3aa32>
X-Attachment-Id: f_jz9oy3aa32

ZGVmIGRvX3BvcHVsYXRlX2xpYyhkKToKICAgICIiIgogICAgUG9wdWxhdGUgTElDRU5TRV9ESVJF
Q1RPUlkgd2l0aCBsaWNlbnNlcy4KICAgICIiIgogICAgbGljX2ZpbGVzX3BhdGhzID0gZmluZF9s
aWNlbnNlX2ZpbGVzKGQpCgogICAgIyBUaGUgYmFzZSBkaXJlY3Rvcnkgd2Ugd3JhbmdsZSBsaWNl
bnNlcyB0bwogICAgZGVzdGRpciA9IG9zLnBhdGguam9pbihkLmdldFZhcignTElDU1NUQVRFRElS
JyksIGQuZ2V0VmFyKCdQTicpKQogICAgY29weV9saWNlbnNlX2ZpbGVzKGxpY19maWxlc19wYXRo
cywgZGVzdGRpcikKICAgIGluZm8gPSBnZXRfcmVjaXBlX2luZm8oZCkKICAgIHdpdGggb3Blbihv
cy5wYXRoLmpvaW4oZGVzdGRpciwgInJlY2lwZWluZm8iKSwgInciKSBhcyBmOgogICAgICAgIGZv
ciBrZXkgaW4gc29ydGVkKGluZm8ua2V5cygpKToKICAgICAgICAgICAgZi53cml0ZSgiJXM6ICVz
XG4iICUgKGtleSwgaW5mb1trZXldKSkKCmRvX3BvcHVsYXRlX2xpYyhkKQoKZGVmIGNvcHlfbGlj
ZW5zZV9maWxlcyhsaWNfZmlsZXNfcGF0aHMsIGRlc3RkaXIpOgogICAgaW1wb3J0IHNodXRpbAog
ICAgaW1wb3J0IGVycm5vCgogICAgYmIudXRpbHMubWtkaXJoaWVyKGRlc3RkaXIpCiAgICBmb3Ig
KGJhc2VuYW1lLCBwYXRoLCBiZWdpbmxpbmUsIGVuZGxpbmUpIGluIGxpY19maWxlc19wYXRoczoK
ICAgICAgICB0cnk6CiAgICAgICAgICAgIHNyYyA9IHBhdGgKICAgICAgICAgICAgZHN0ID0gb3Mu
cGF0aC5qb2luKGRlc3RkaXIsIGJhc2VuYW1lKQogICAgICAgICAgICBpZiBvcy5wYXRoLmV4aXN0
cyhkc3QpOgogICAgICAgICAgICAgICAgb3MucmVtb3ZlKGRzdCkKICAgICAgICAgICAgaWYgb3Mu
cGF0aC5pc2xpbmsoc3JjKToKICAgICAgICAgICAgICAgIHNyYyA9IG9zLnBhdGgucmVhbHBhdGgo
c3JjKQogICAgICAgICAgICBjYW5saW5rID0gb3MuYWNjZXNzKHNyYywgb3MuV19PSykgYW5kIChv
cy5zdGF0KHNyYykuc3RfZGV2ID09IG9zLnN0YXQoZGVzdGRpcikuc3RfZGV2KSBhbmQgYmVnaW5s
aW5lIGlzIE5vbmUgYW5kIGVuZGxpbmUgaXMgTm9uZQogICAgICAgICAgICBpZiBjYW5saW5rOgog
ICAgICAgICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgICAgIG9zLmxpbmsoc3JjLCBkc3Qp
CiAgICAgICAgICAgICAgICBleGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgICAgICAg
ICAgaWYgZXJyLmVycm5vID09IGVycm5vLkVYREVWOgogICAgICAgICAgICAgICAgICAgICAgICAj
IENvcHkgbGljZW5zZSBmaWxlcyBpZiBoYXJkLWxpbmsgaXMgbm90IHBvc3NpYmxlIGV2ZW4gaWYg
c3RfZGV2IGlzIHRoZQogICAgICAgICAgICAgICAgICAgICAgICAjIHNhbWUgb24gc291cmNlIGFu
ZCBkZXN0aW5hdGlvbiAoZG9ja2VyIGNvbnRhaW5lciB3aXRoIGRldmljZS1tYXBwZXI/KQogICAg
ICAgICAgICAgICAgICAgICAgICBjYW5saW5rID0gRmFsc2UKICAgICAgICAgICAgICAgICAgICBl
bHNlOgogICAgICAgICAgICAgICAgICAgICAgICByYWlzZQogICAgICAgICAgICAgICAgIyBPbmx5
IGNob3duIGlmIHdlIGRpZCBoYXJkbGluZywgYW5kLCB3ZSdyZSBydW5uaW5nIHVuZGVyIHBzZXVk
bwogICAgICAgICAgICAgICAgaWYgY2FubGluayBhbmQgb3MuZW52aXJvbi5nZXQoJ1BTRVVET19E
SVNBQkxFRCcpID09ICcwJzoKICAgICAgICAgICAgICAgICAgICBvcy5jaG93bihkc3QsMCwwKQog
ICAgICAgICAgICBpZiBub3QgY2FubGluazoKICAgICAgICAgICAgICAgIGJlZ2luX2lkeCA9IGlu
dChiZWdpbmxpbmUpLTEgaWYgYmVnaW5saW5lIGlzIG5vdCBOb25lIGVsc2UgTm9uZQogICAgICAg
ICAgICAgICAgZW5kX2lkeCA9IGludChlbmRsaW5lKSBpZiBlbmRsaW5lIGlzIG5vdCBOb25lIGVs
c2UgTm9uZQogICAgICAgICAgICAgICAgaWYgYmVnaW5faWR4IGlzIE5vbmUgYW5kIGVuZF9pZHgg
aXMgTm9uZToKICAgICAgICAgICAgICAgICAgICBzaHV0aWwuY29weWZpbGUoc3JjLCBkc3QpCiAg
ICAgICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgICAgIHdpdGggb3BlbihzcmMsICdy
YicpIGFzIHNyY19mOgogICAgICAgICAgICAgICAgICAgICAgICB3aXRoIG9wZW4oZHN0LCAnd2In
KSBhcyBkc3RfZjoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRzdF9mLndyaXRlKGInJy5q
b2luKHNyY19mLnJlYWRsaW5lcygpW2JlZ2luX2lkeDplbmRfaWR4XSkpCgogICAgICAgIGV4Y2Vw
dCBFeGNlcHRpb24gYXMgZToKICAgICAgICAgICAgYmIud2FybigiQ291bGQgbm90IGNvcHkgbGlj
ZW5zZSBmaWxlICVzIHRvICVzOiAlcyIgJSAoc3JjLCBkc3QsIGUpKQoKZGVmIGdldF9yZWNpcGVf
aW5mbyhkKToKICAgIGluZm8gPSB7fQogICAgaW5mb1siUFYiXSA9IGQuZ2V0VmFyKCJQViIpCiAg
ICBpbmZvWyJQUiJdID0gZC5nZXRWYXIoIlBSIikKICAgIGluZm9bIkxJQ0VOU0UiXSA9IGQuZ2V0
VmFyKCJMSUNFTlNFIikKICAgIHJldHVybiBpbmZvCgpkZWYgZmluZF9saWNlbnNlX2ZpbGVzKGQp
OgogICAgIiIiCiAgICBDcmVhdGVzIGxpc3Qgb2YgZmlsZXMgdXNlZCBpbiBMSUNfRklMRVNfQ0hL
U1VNIGFuZCBnZW5lcmljIExJQ0VOU0UgZmlsZXMuCiAgICAiIiIKICAgIGltcG9ydCBzaHV0aWwK
ICAgIGltcG9ydCBvZS5saWNlbnNlCiAgICBmcm9tIGNvbGxlY3Rpb25zIGltcG9ydCBkZWZhdWx0
ZGljdCwgT3JkZXJlZERpY3QKCiAgICAjIEFsbCB0aGUgbGljZW5zZSBmaWxlcyBmb3IgdGhlIHBh
Y2thZ2UKICAgIGxpY19maWxlcyA9IGQuZ2V0VmFyKCdMSUNfRklMRVNfQ0hLU1VNJykgb3IgIiIK
ICAgIHBuID0gZC5nZXRWYXIoJ1BOJykKICAgICMgVGhlIGxpY2Vuc2UgZmlsZXMgYXJlIGxvY2F0
ZWQgaW4gUy9MSUNfRklMRV9DSEVDS1NVTS4KICAgIHNyY2RpciA9IGQuZ2V0VmFyKCdTJykKICAg
ICMgRGlyZWN0b3J5IHdlIHN0b3JlIHRoZSBnZW5lcmljIGxpY2Vuc2VzIGFzIHNldCBpbiB0aGUg
ZGlzdHJvIGNvbmZpZ3VyYXRpb24KICAgIGdlbmVyaWNfZGlyZWN0b3J5ID0gZC5nZXRWYXIoJ0NP
TU1PTl9MSUNFTlNFX0RJUicpCiAgICAjIExpc3Qgb2YgYmFzZW5hbWUsIHBhdGggdHVwbGVzCiAg
ICBsaWNfZmlsZXNfcGF0aHMgPSBbXQogICAgIyBoYXNoIGZvciBrZWVwIHRyYWNrIGdlbmVyaWMg
bGljcyBtYXBwaW5ncwogICAgbm9uX2dlbmVyaWNfbGljcyA9IHt9CiAgICAjIEVudHJpZXMgZnJv
bSBMSUNfRklMRVNfQ0hLU1VNCiAgICBsaWNfY2hrc3VtcyA9IHt9CiAgICBsaWNlbnNlX3NvdXJj
ZV9kaXJzID0gW10KICAgIGxpY2Vuc2Vfc291cmNlX2RpcnMuYXBwZW5kKGdlbmVyaWNfZGlyZWN0
b3J5KQogICAgdHJ5OgogICAgICAgIGFkZGl0aW9uYWxfbGljX2RpcnMgPSBkLmdldFZhcignTElD
RU5TRV9QQVRIJykuc3BsaXQoKQogICAgICAgIGZvciBsaWNfZGlyIGluIGFkZGl0aW9uYWxfbGlj
X2RpcnM6CiAgICAgICAgICAgIGxpY2Vuc2Vfc291cmNlX2RpcnMuYXBwZW5kKGxpY19kaXIpCiAg
ICBleGNlcHQ6CiAgICAgICAgcGFzcwoKICAgIGNsYXNzIEZpbmRWaXNpdG9yKG9lLmxpY2Vuc2Uu
TGljZW5zZVZpc2l0b3IpOgogICAgICAgIGRlZiB2aXNpdF9TdHIoc2VsZiwgbm9kZSk6CiAgICAg
ICAgICAgICMKICAgICAgICAgICAgIyBVbnRpbCBJIGZpZ3VyZSBvdXQgd2hhdCB0byBkbyB3aXRo
CiAgICAgICAgICAgICMgdGhlIHR3byBtb2RpZmllcnMgSSBzdXBwb3J0IChvciBncmVhdGVyID0g
KwogICAgICAgICAgICAjIGFuZCAid2l0aCBleGNlcHRpb25zIiBiZWluZyAqCiAgICAgICAgICAg
ICMgd2UnbGwganVzdCBzdHJpcCBvdXQgdGhlIG1vZGlmaWVyIGFuZCBwdXQKICAgICAgICAgICAg
IyB0aGUgYmFzZSBsaWNlbnNlLgogICAgICAgICAgICBmaW5kX2xpY2Vuc2Uobm9kZS5zLnJlcGxh
Y2UoIisiLCAiIikucmVwbGFjZSgiKiIsICIiKSkKICAgICAgICAgICAgc2VsZi5nZW5lcmljX3Zp
c2l0KG5vZGUpCgogICAgZGVmIGZpbmRfbGljZW5zZShsaWNlbnNlX3R5cGUpOgogICAgICAgIHRy
eToKICAgICAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKGdlbl9saWNfZGVzdCkKICAgICAgICBl
eGNlcHQ6CiAgICAgICAgICAgIHBhc3MKICAgICAgICBzcGR4X2dlbmVyaWMgPSBOb25lCiAgICAg
ICAgbGljZW5zZV9zb3VyY2UgPSBOb25lCiAgICAgICAgIyBJZiB0aGUgZ2VuZXJpYyBkb2VzIG5v
dCBleGlzdCB3ZSBuZWVkIHRvIGNoZWNrIHRvIHNlZSBpZiB0aGVyZSBpcyBhbiBTUERYIG1hcHBp
bmcgdG8gaXQsCiAgICAgICAgIyB1bmxlc3MgTk9fR0VORVJJQ19MSUNFTlNFIGlzIHNldC4KICAg
ICAgICBmb3IgbGljX2RpciBpbiBsaWNlbnNlX3NvdXJjZV9kaXJzOgogICAgICAgICAgICBpZiBu
b3Qgb3MucGF0aC5pc2ZpbGUob3MucGF0aC5qb2luKGxpY19kaXIsIGxpY2Vuc2VfdHlwZSkpOgog
ICAgICAgICAgICAgICAgaWYgZC5nZXRWYXJGbGFnKCdTUERYTElDRU5TRU1BUCcsIGxpY2Vuc2Vf
dHlwZSkgIT0gTm9uZToKICAgICAgICAgICAgICAgICAgICAjIEdyZWF0LCB0aGVyZSBpcyBhbiBT
UERYTElDRU5TRU1BUC4gV2UgY2FuIGNvcHkhCiAgICAgICAgICAgICAgICAgICAgYmIuZGVidWco
MSwgIldlIG5lZWQgdG8gdXNlIGEgU1BEWExJQ0VOU0VNQVAgZm9yICVzIiAlIChsaWNlbnNlX3R5
cGUpKQogICAgICAgICAgICAgICAgICAgIHNwZHhfZ2VuZXJpYyA9IGQuZ2V0VmFyRmxhZygnU1BE
WExJQ0VOU0VNQVAnLCBsaWNlbnNlX3R5cGUpCiAgICAgICAgICAgICAgICAgICAgbGljZW5zZV9z
b3VyY2UgPSBsaWNfZGlyCiAgICAgICAgICAgICAgICAgICAgYnJlYWsKICAgICAgICAgICAgZWxp
ZiBvcy5wYXRoLmlzZmlsZShvcy5wYXRoLmpvaW4obGljX2RpciwgbGljZW5zZV90eXBlKSk6CiAg
ICAgICAgICAgICAgICBzcGR4X2dlbmVyaWMgPSBsaWNlbnNlX3R5cGUKICAgICAgICAgICAgICAg
IGxpY2Vuc2Vfc291cmNlID0gbGljX2RpcgogICAgICAgICAgICAgICAgYnJlYWsKCiAgICAgICAg
bm9uX2dlbmVyaWNfbGljID0gZC5nZXRWYXJGbGFnKCdOT19HRU5FUklDX0xJQ0VOU0UnLCBsaWNl
bnNlX3R5cGUpCiAgICAgICAgaWYgc3BkeF9nZW5lcmljIGFuZCBsaWNlbnNlX3NvdXJjZToKICAg
ICAgICAgICAgIyB3ZSByZWFsbHkgc2hvdWxkIGNvcHkgdG8gZ2VuZXJpY18gKyBzcGR4X2dlbmVy
aWMsIGhvd2V2ZXIsIHRoYXQgZW5kcyB1cCBtZXNzaW5nIHRoZSBtYW5pZmVzdAogICAgICAgICAg
ICAjIGF1ZGl0IHVwLiBUaGlzIHNob3VsZCBiZSBmaXhlZCBpbiBlbWl0X3BrZ2RhdGEgKG9yLCB3
ZSBhY3R1YWxseSBnb3QgYW5kIGZpeCBhbGwgdGhlIHJlY2lwZXMpCgogICAgICAgICAgICBsaWNf
ZmlsZXNfcGF0aHMuYXBwZW5kKCgiZ2VuZXJpY18iICsgbGljZW5zZV90eXBlLCBvcy5wYXRoLmpv
aW4obGljZW5zZV9zb3VyY2UsIHNwZHhfZ2VuZXJpYyksCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE5vbmUsIE5vbmUpKQoKICAgICAgICAgICAgIyBUaGUgdXNlciBtYXkgYXR0
ZW1wdCB0byB1c2UgTk9fR0VORVJJQ19MSUNFTlNFIGZvciBhIGdlbmVyaWMgbGljZW5zZSB3aGlj
aCBkb2Vzbid0IG1ha2Ugc2Vuc2UKICAgICAgICAgICAgIyBhbmQgc2hvdWxkIG5vdCBiZSBhbGxv
d2VkLCB3YXJuIHRoZSB1c2VyIGluIHRoaXMgY2FzZS4KICAgICAgICAgICAgaWYgZC5nZXRWYXJG
bGFnKCdOT19HRU5FUklDX0xJQ0VOU0UnLCBsaWNlbnNlX3R5cGUpOgogICAgICAgICAgICAgICAg
YmIud2FybigiJXM6ICVzIGlzIGEgZ2VuZXJpYyBsaWNlbnNlLCBwbGVhc2UgZG9uJ3QgdXNlIE5P
X0dFTkVSSUNfTElDRU5TRSBmb3IgaXQuIiAlIChwbiwgbGljZW5zZV90eXBlKSkKCiAgICAgICAg
ZWxpZiBub25fZ2VuZXJpY19saWMgYW5kIG5vbl9nZW5lcmljX2xpYyBpbiBsaWNfY2hrc3VtczoK
ICAgICAgICAgICAgIyBpZiBOT19HRU5FUklDX0xJQ0VOU0UgaXMgc2V0LCB3ZSBjb3B5IHRoZSBs
aWNlbnNlIGZpbGVzIGZyb20gdGhlIGZldGNoZWQgc291cmNlCiAgICAgICAgICAgICMgb2YgdGhl
IHBhY2thZ2UgcmF0aGVyIHRoYW4gdGhlIGxpY2Vuc2Vfc291cmNlX2RpcnMuCiAgICAgICAgICAg
IGxpY19maWxlc19wYXRocy5hcHBlbmQoKCJnZW5lcmljXyIgKyBsaWNlbnNlX3R5cGUsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9zLnBhdGguam9pbihzcmNkaXIsIG5vbl9n
ZW5lcmljX2xpYyksIE5vbmUsIE5vbmUpKQogICAgICAgICAgICBub25fZ2VuZXJpY19saWNzW25v
bl9nZW5lcmljX2xpY10gPSBsaWNlbnNlX3R5cGUKICAgICAgICBlbHNlOgogICAgICAgICAgICAj
IEFkZCBleHBsaWNpdHkgYXZvaWQgb2YgQ0xPU0VEIGxpY2Vuc2UgYmVjYXVzZSB0aGlzIGlzbid0
IGdlbmVyaWMKICAgICAgICAgICAgaWYgbGljZW5zZV90eXBlICE9ICdDTE9TRUQnOgogICAgICAg
ICAgICAgICAgIyBBbmQgaGVyZSBpcyB3aGVyZSB3ZSB3YXJuIHBlb3BsZSB0aGF0IHRoZWlyIGxp
Y2Vuc2VzIGFyZSBsb3VzeQogICAgICAgICAgICAgICAgYmIud2FybigiJXM6IE5vIGdlbmVyaWMg
bGljZW5zZSBmaWxlIGV4aXN0cyBmb3I6ICVzIGluIGFueSBwcm92aWRlciIgJSAocG4sIGxpY2Vu
c2VfdHlwZSkpCiAgICAgICAgICAgIHBhc3MKCiAgICBpZiBub3QgZ2VuZXJpY19kaXJlY3Rvcnk6
CiAgICAgICAgYmIuZmF0YWwoIkNPTU1PTl9MSUNFTlNFX0RJUiBpcyB1bnNldC4gUGxlYXNlIHNl
dCB0aGlzIGluIHlvdXIgZGlzdHJvIGNvbmZpZyIpCgogICAgZm9yIHVybCBpbiBsaWNfZmlsZXMu
c3BsaXQoKToKICAgICAgICB0cnk6CiAgICAgICAgICAgIChtZXRob2QsIGhvc3QsIHBhdGgsIHVz
ZXIsIHBzd2QsIHBhcm0pID0gYmIuZmV0Y2guZGVjb2RldXJsKHVybCkKICAgICAgICAgICAgaWYg
bWV0aG9kICE9ICJmaWxlIiBvciBub3QgcGF0aDoKICAgICAgICAgICAgICAgIHJhaXNlIGJiLmZl
dGNoLk1hbGZvcm1lZFVybCgpCiAgICAgICAgZXhjZXB0IGJiLmZldGNoLk1hbGZvcm1lZFVybDoK
ICAgICAgICAgICAgYmIuZmF0YWwoIiVzOiBMSUNfRklMRVNfQ0hLU1VNIGNvbnRhaW5zIGFuIGlu
dmFsaWQgVVJMOiAgJXMiICUgKGQuZ2V0VmFyKCdQRicpLCB1cmwpKQogICAgICAgICMgV2Ugd2Fu
dCB0aGUgbGljZW5zZSBmaWxlbmFtZSBhbmQgcGF0aAogICAgICAgIGNoa3N1bSA9IHBhcm0uZ2V0
KCdtZDUnLCBOb25lKQogICAgICAgIGJlZ2lubGluZSA9IHBhcm0uZ2V0KCdiZWdpbmxpbmUnKQog
ICAgICAgIGVuZGxpbmUgPSBwYXJtLmdldCgnZW5kbGluZScpCiAgICAgICAgbGljX2Noa3N1bXNb
cGF0aF0gPSAoY2hrc3VtLCBiZWdpbmxpbmUsIGVuZGxpbmUpCgogICAgdiA9IEZpbmRWaXNpdG9y
KCkKICAgIHRyeToKICAgICAgICB2LnZpc2l0X3N0cmluZyhkLmdldFZhcignTElDRU5TRScpKQog
ICAgZXhjZXB0IG9lLmxpY2Vuc2UuSW52YWxpZExpY2Vuc2UgYXMgZXhjOgogICAgICAgIGJiLmZh
dGFsKCclczogJXMnICUgKGQuZ2V0VmFyKCdQRicpLCBleGMpKQogICAgZXhjZXB0IFN5bnRheEVy
cm9yOgogICAgICAgIGJiLndhcm4oIiVzOiBGYWlsZWQgdG8gcGFyc2UgaXQncyBMSUNFTlNFIGZp
ZWxkLiIgJSAoZC5nZXRWYXIoJ1BGJykpKQogICAgIyBBZGQgZmlsZXMgZnJvbSBMSUNfRklMRVNf
Q0hLU1VNIHRvIGxpc3Qgb2YgbGljZW5zZSBmaWxlcwogICAgbGljX2Noa3N1bV9wYXRocyA9IGRl
ZmF1bHRkaWN0KE9yZGVyZWREaWN0KQogICAgZm9yIHBhdGgsIGRhdGEgaW4gc29ydGVkKGxpY19j
aGtzdW1zLml0ZW1zKCkpOgogICAgICAgIGxpY19jaGtzdW1fcGF0aHNbb3MucGF0aC5iYXNlbmFt
ZShwYXRoKV1bZGF0YV0gPSAob3MucGF0aC5qb2luKHNyY2RpciwgcGF0aCksIGRhdGFbMV0sIGRh
dGFbMl0pCiAgICBmb3IgYmFzZW5hbWUsIGZpbGVzIGluIGxpY19jaGtzdW1fcGF0aHMuaXRlbXMo
KToKICAgICAgICBpZiBsZW4oZmlsZXMpID09IDE6CiAgICAgICAgICAgICMgRG9uJ3QgY29weSBh
Z2FpbiBhIExJQ0VOU0UgYWxyZWFkeSBoYW5kbGVkIGFzIG5vbi1nZW5lcmljCiAgICAgICAgICAg
IGlmIGJhc2VuYW1lIGluIG5vbl9nZW5lcmljX2xpY3M6CiAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICBkYXRhID0gbGlzdChmaWxlcy52YWx1ZXMoKSlbMF0KICAgICAgICAgICAg
bGljX2ZpbGVzX3BhdGhzLmFwcGVuZCh0dXBsZShbYmFzZW5hbWVdICsgbGlzdChkYXRhKSkpCiAg
ICAgICAgZWxzZToKICAgICAgICAgICAgIyBJZiB0aGVyZSBhcmUgbXVsdGlwbGUgZGlmZmVyZW50
IGxpY2Vuc2UgZmlsZXMgd2l0aCBpZGVudGljYWwKICAgICAgICAgICAgIyBiYXNlbmFtZXMgd2Ug
cmVuYW1lIHRoZW0gdG8gPGZpbGU+LjAsIDxmaWxlPi4xLCAuLi4KICAgICAgICAgICAgZm9yIGks
IGRhdGEgaW4gZW51bWVyYXRlKGZpbGVzLnZhbHVlcygpKToKICAgICAgICAgICAgICAgIGxpY19m
aWxlc19wYXRocy5hcHBlbmQodHVwbGUoWyIlcy4lZCIgJSAoYmFzZW5hbWUsIGkpXSArIGxpc3Qo
ZGF0YSkpKQoKICAgIHJldHVybiBsaWNfZmlsZXNfcGF0aHMKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_populate_lic"
Content-Disposition: attachment; filename="run.do_populate_lic"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3a631>
X-Attachment-Id: f_jz9oy3a631

ZGVmIGRvX3BvcHVsYXRlX2xpYyhkKToKICAgICIiIgogICAgUG9wdWxhdGUgTElDRU5TRV9ESVJF
Q1RPUlkgd2l0aCBsaWNlbnNlcy4KICAgICIiIgogICAgbGljX2ZpbGVzX3BhdGhzID0gZmluZF9s
aWNlbnNlX2ZpbGVzKGQpCgogICAgIyBUaGUgYmFzZSBkaXJlY3Rvcnkgd2Ugd3JhbmdsZSBsaWNl
bnNlcyB0bwogICAgZGVzdGRpciA9IG9zLnBhdGguam9pbihkLmdldFZhcignTElDU1NUQVRFRElS
JyksIGQuZ2V0VmFyKCdQTicpKQogICAgY29weV9saWNlbnNlX2ZpbGVzKGxpY19maWxlc19wYXRo
cywgZGVzdGRpcikKICAgIGluZm8gPSBnZXRfcmVjaXBlX2luZm8oZCkKICAgIHdpdGggb3Blbihv
cy5wYXRoLmpvaW4oZGVzdGRpciwgInJlY2lwZWluZm8iKSwgInciKSBhcyBmOgogICAgICAgIGZv
ciBrZXkgaW4gc29ydGVkKGluZm8ua2V5cygpKToKICAgICAgICAgICAgZi53cml0ZSgiJXM6ICVz
XG4iICUgKGtleSwgaW5mb1trZXldKSkKCmRvX3BvcHVsYXRlX2xpYyhkKQoKZGVmIGNvcHlfbGlj
ZW5zZV9maWxlcyhsaWNfZmlsZXNfcGF0aHMsIGRlc3RkaXIpOgogICAgaW1wb3J0IHNodXRpbAog
ICAgaW1wb3J0IGVycm5vCgogICAgYmIudXRpbHMubWtkaXJoaWVyKGRlc3RkaXIpCiAgICBmb3Ig
KGJhc2VuYW1lLCBwYXRoLCBiZWdpbmxpbmUsIGVuZGxpbmUpIGluIGxpY19maWxlc19wYXRoczoK
ICAgICAgICB0cnk6CiAgICAgICAgICAgIHNyYyA9IHBhdGgKICAgICAgICAgICAgZHN0ID0gb3Mu
cGF0aC5qb2luKGRlc3RkaXIsIGJhc2VuYW1lKQogICAgICAgICAgICBpZiBvcy5wYXRoLmV4aXN0
cyhkc3QpOgogICAgICAgICAgICAgICAgb3MucmVtb3ZlKGRzdCkKICAgICAgICAgICAgaWYgb3Mu
cGF0aC5pc2xpbmsoc3JjKToKICAgICAgICAgICAgICAgIHNyYyA9IG9zLnBhdGgucmVhbHBhdGgo
c3JjKQogICAgICAgICAgICBjYW5saW5rID0gb3MuYWNjZXNzKHNyYywgb3MuV19PSykgYW5kIChv
cy5zdGF0KHNyYykuc3RfZGV2ID09IG9zLnN0YXQoZGVzdGRpcikuc3RfZGV2KSBhbmQgYmVnaW5s
aW5lIGlzIE5vbmUgYW5kIGVuZGxpbmUgaXMgTm9uZQogICAgICAgICAgICBpZiBjYW5saW5rOgog
ICAgICAgICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgICAgIG9zLmxpbmsoc3JjLCBkc3Qp
CiAgICAgICAgICAgICAgICBleGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgICAgICAg
ICAgaWYgZXJyLmVycm5vID09IGVycm5vLkVYREVWOgogICAgICAgICAgICAgICAgICAgICAgICAj
IENvcHkgbGljZW5zZSBmaWxlcyBpZiBoYXJkLWxpbmsgaXMgbm90IHBvc3NpYmxlIGV2ZW4gaWYg
c3RfZGV2IGlzIHRoZQogICAgICAgICAgICAgICAgICAgICAgICAjIHNhbWUgb24gc291cmNlIGFu
ZCBkZXN0aW5hdGlvbiAoZG9ja2VyIGNvbnRhaW5lciB3aXRoIGRldmljZS1tYXBwZXI/KQogICAg
ICAgICAgICAgICAgICAgICAgICBjYW5saW5rID0gRmFsc2UKICAgICAgICAgICAgICAgICAgICBl
bHNlOgogICAgICAgICAgICAgICAgICAgICAgICByYWlzZQogICAgICAgICAgICAgICAgIyBPbmx5
IGNob3duIGlmIHdlIGRpZCBoYXJkbGluZywgYW5kLCB3ZSdyZSBydW5uaW5nIHVuZGVyIHBzZXVk
bwogICAgICAgICAgICAgICAgaWYgY2FubGluayBhbmQgb3MuZW52aXJvbi5nZXQoJ1BTRVVET19E
SVNBQkxFRCcpID09ICcwJzoKICAgICAgICAgICAgICAgICAgICBvcy5jaG93bihkc3QsMCwwKQog
ICAgICAgICAgICBpZiBub3QgY2FubGluazoKICAgICAgICAgICAgICAgIGJlZ2luX2lkeCA9IGlu
dChiZWdpbmxpbmUpLTEgaWYgYmVnaW5saW5lIGlzIG5vdCBOb25lIGVsc2UgTm9uZQogICAgICAg
ICAgICAgICAgZW5kX2lkeCA9IGludChlbmRsaW5lKSBpZiBlbmRsaW5lIGlzIG5vdCBOb25lIGVs
c2UgTm9uZQogICAgICAgICAgICAgICAgaWYgYmVnaW5faWR4IGlzIE5vbmUgYW5kIGVuZF9pZHgg
aXMgTm9uZToKICAgICAgICAgICAgICAgICAgICBzaHV0aWwuY29weWZpbGUoc3JjLCBkc3QpCiAg
ICAgICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgICAgIHdpdGggb3BlbihzcmMsICdy
YicpIGFzIHNyY19mOgogICAgICAgICAgICAgICAgICAgICAgICB3aXRoIG9wZW4oZHN0LCAnd2In
KSBhcyBkc3RfZjoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRzdF9mLndyaXRlKGInJy5q
b2luKHNyY19mLnJlYWRsaW5lcygpW2JlZ2luX2lkeDplbmRfaWR4XSkpCgogICAgICAgIGV4Y2Vw
dCBFeGNlcHRpb24gYXMgZToKICAgICAgICAgICAgYmIud2FybigiQ291bGQgbm90IGNvcHkgbGlj
ZW5zZSBmaWxlICVzIHRvICVzOiAlcyIgJSAoc3JjLCBkc3QsIGUpKQoKZGVmIGdldF9yZWNpcGVf
aW5mbyhkKToKICAgIGluZm8gPSB7fQogICAgaW5mb1siUFYiXSA9IGQuZ2V0VmFyKCJQViIpCiAg
ICBpbmZvWyJQUiJdID0gZC5nZXRWYXIoIlBSIikKICAgIGluZm9bIkxJQ0VOU0UiXSA9IGQuZ2V0
VmFyKCJMSUNFTlNFIikKICAgIHJldHVybiBpbmZvCgpkZWYgZmluZF9saWNlbnNlX2ZpbGVzKGQp
OgogICAgIiIiCiAgICBDcmVhdGVzIGxpc3Qgb2YgZmlsZXMgdXNlZCBpbiBMSUNfRklMRVNfQ0hL
U1VNIGFuZCBnZW5lcmljIExJQ0VOU0UgZmlsZXMuCiAgICAiIiIKICAgIGltcG9ydCBzaHV0aWwK
ICAgIGltcG9ydCBvZS5saWNlbnNlCiAgICBmcm9tIGNvbGxlY3Rpb25zIGltcG9ydCBkZWZhdWx0
ZGljdCwgT3JkZXJlZERpY3QKCiAgICAjIEFsbCB0aGUgbGljZW5zZSBmaWxlcyBmb3IgdGhlIHBh
Y2thZ2UKICAgIGxpY19maWxlcyA9IGQuZ2V0VmFyKCdMSUNfRklMRVNfQ0hLU1VNJykgb3IgIiIK
ICAgIHBuID0gZC5nZXRWYXIoJ1BOJykKICAgICMgVGhlIGxpY2Vuc2UgZmlsZXMgYXJlIGxvY2F0
ZWQgaW4gUy9MSUNfRklMRV9DSEVDS1NVTS4KICAgIHNyY2RpciA9IGQuZ2V0VmFyKCdTJykKICAg
ICMgRGlyZWN0b3J5IHdlIHN0b3JlIHRoZSBnZW5lcmljIGxpY2Vuc2VzIGFzIHNldCBpbiB0aGUg
ZGlzdHJvIGNvbmZpZ3VyYXRpb24KICAgIGdlbmVyaWNfZGlyZWN0b3J5ID0gZC5nZXRWYXIoJ0NP
TU1PTl9MSUNFTlNFX0RJUicpCiAgICAjIExpc3Qgb2YgYmFzZW5hbWUsIHBhdGggdHVwbGVzCiAg
ICBsaWNfZmlsZXNfcGF0aHMgPSBbXQogICAgIyBoYXNoIGZvciBrZWVwIHRyYWNrIGdlbmVyaWMg
bGljcyBtYXBwaW5ncwogICAgbm9uX2dlbmVyaWNfbGljcyA9IHt9CiAgICAjIEVudHJpZXMgZnJv
bSBMSUNfRklMRVNfQ0hLU1VNCiAgICBsaWNfY2hrc3VtcyA9IHt9CiAgICBsaWNlbnNlX3NvdXJj
ZV9kaXJzID0gW10KICAgIGxpY2Vuc2Vfc291cmNlX2RpcnMuYXBwZW5kKGdlbmVyaWNfZGlyZWN0
b3J5KQogICAgdHJ5OgogICAgICAgIGFkZGl0aW9uYWxfbGljX2RpcnMgPSBkLmdldFZhcignTElD
RU5TRV9QQVRIJykuc3BsaXQoKQogICAgICAgIGZvciBsaWNfZGlyIGluIGFkZGl0aW9uYWxfbGlj
X2RpcnM6CiAgICAgICAgICAgIGxpY2Vuc2Vfc291cmNlX2RpcnMuYXBwZW5kKGxpY19kaXIpCiAg
ICBleGNlcHQ6CiAgICAgICAgcGFzcwoKICAgIGNsYXNzIEZpbmRWaXNpdG9yKG9lLmxpY2Vuc2Uu
TGljZW5zZVZpc2l0b3IpOgogICAgICAgIGRlZiB2aXNpdF9TdHIoc2VsZiwgbm9kZSk6CiAgICAg
ICAgICAgICMKICAgICAgICAgICAgIyBVbnRpbCBJIGZpZ3VyZSBvdXQgd2hhdCB0byBkbyB3aXRo
CiAgICAgICAgICAgICMgdGhlIHR3byBtb2RpZmllcnMgSSBzdXBwb3J0IChvciBncmVhdGVyID0g
KwogICAgICAgICAgICAjIGFuZCAid2l0aCBleGNlcHRpb25zIiBiZWluZyAqCiAgICAgICAgICAg
ICMgd2UnbGwganVzdCBzdHJpcCBvdXQgdGhlIG1vZGlmaWVyIGFuZCBwdXQKICAgICAgICAgICAg
IyB0aGUgYmFzZSBsaWNlbnNlLgogICAgICAgICAgICBmaW5kX2xpY2Vuc2Uobm9kZS5zLnJlcGxh
Y2UoIisiLCAiIikucmVwbGFjZSgiKiIsICIiKSkKICAgICAgICAgICAgc2VsZi5nZW5lcmljX3Zp
c2l0KG5vZGUpCgogICAgZGVmIGZpbmRfbGljZW5zZShsaWNlbnNlX3R5cGUpOgogICAgICAgIHRy
eToKICAgICAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKGdlbl9saWNfZGVzdCkKICAgICAgICBl
eGNlcHQ6CiAgICAgICAgICAgIHBhc3MKICAgICAgICBzcGR4X2dlbmVyaWMgPSBOb25lCiAgICAg
ICAgbGljZW5zZV9zb3VyY2UgPSBOb25lCiAgICAgICAgIyBJZiB0aGUgZ2VuZXJpYyBkb2VzIG5v
dCBleGlzdCB3ZSBuZWVkIHRvIGNoZWNrIHRvIHNlZSBpZiB0aGVyZSBpcyBhbiBTUERYIG1hcHBp
bmcgdG8gaXQsCiAgICAgICAgIyB1bmxlc3MgTk9fR0VORVJJQ19MSUNFTlNFIGlzIHNldC4KICAg
ICAgICBmb3IgbGljX2RpciBpbiBsaWNlbnNlX3NvdXJjZV9kaXJzOgogICAgICAgICAgICBpZiBu
b3Qgb3MucGF0aC5pc2ZpbGUob3MucGF0aC5qb2luKGxpY19kaXIsIGxpY2Vuc2VfdHlwZSkpOgog
ICAgICAgICAgICAgICAgaWYgZC5nZXRWYXJGbGFnKCdTUERYTElDRU5TRU1BUCcsIGxpY2Vuc2Vf
dHlwZSkgIT0gTm9uZToKICAgICAgICAgICAgICAgICAgICAjIEdyZWF0LCB0aGVyZSBpcyBhbiBT
UERYTElDRU5TRU1BUC4gV2UgY2FuIGNvcHkhCiAgICAgICAgICAgICAgICAgICAgYmIuZGVidWco
MSwgIldlIG5lZWQgdG8gdXNlIGEgU1BEWExJQ0VOU0VNQVAgZm9yICVzIiAlIChsaWNlbnNlX3R5
cGUpKQogICAgICAgICAgICAgICAgICAgIHNwZHhfZ2VuZXJpYyA9IGQuZ2V0VmFyRmxhZygnU1BE
WExJQ0VOU0VNQVAnLCBsaWNlbnNlX3R5cGUpCiAgICAgICAgICAgICAgICAgICAgbGljZW5zZV9z
b3VyY2UgPSBsaWNfZGlyCiAgICAgICAgICAgICAgICAgICAgYnJlYWsKICAgICAgICAgICAgZWxp
ZiBvcy5wYXRoLmlzZmlsZShvcy5wYXRoLmpvaW4obGljX2RpciwgbGljZW5zZV90eXBlKSk6CiAg
ICAgICAgICAgICAgICBzcGR4X2dlbmVyaWMgPSBsaWNlbnNlX3R5cGUKICAgICAgICAgICAgICAg
IGxpY2Vuc2Vfc291cmNlID0gbGljX2RpcgogICAgICAgICAgICAgICAgYnJlYWsKCiAgICAgICAg
bm9uX2dlbmVyaWNfbGljID0gZC5nZXRWYXJGbGFnKCdOT19HRU5FUklDX0xJQ0VOU0UnLCBsaWNl
bnNlX3R5cGUpCiAgICAgICAgaWYgc3BkeF9nZW5lcmljIGFuZCBsaWNlbnNlX3NvdXJjZToKICAg
ICAgICAgICAgIyB3ZSByZWFsbHkgc2hvdWxkIGNvcHkgdG8gZ2VuZXJpY18gKyBzcGR4X2dlbmVy
aWMsIGhvd2V2ZXIsIHRoYXQgZW5kcyB1cCBtZXNzaW5nIHRoZSBtYW5pZmVzdAogICAgICAgICAg
ICAjIGF1ZGl0IHVwLiBUaGlzIHNob3VsZCBiZSBmaXhlZCBpbiBlbWl0X3BrZ2RhdGEgKG9yLCB3
ZSBhY3R1YWxseSBnb3QgYW5kIGZpeCBhbGwgdGhlIHJlY2lwZXMpCgogICAgICAgICAgICBsaWNf
ZmlsZXNfcGF0aHMuYXBwZW5kKCgiZ2VuZXJpY18iICsgbGljZW5zZV90eXBlLCBvcy5wYXRoLmpv
aW4obGljZW5zZV9zb3VyY2UsIHNwZHhfZ2VuZXJpYyksCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE5vbmUsIE5vbmUpKQoKICAgICAgICAgICAgIyBUaGUgdXNlciBtYXkgYXR0
ZW1wdCB0byB1c2UgTk9fR0VORVJJQ19MSUNFTlNFIGZvciBhIGdlbmVyaWMgbGljZW5zZSB3aGlj
aCBkb2Vzbid0IG1ha2Ugc2Vuc2UKICAgICAgICAgICAgIyBhbmQgc2hvdWxkIG5vdCBiZSBhbGxv
d2VkLCB3YXJuIHRoZSB1c2VyIGluIHRoaXMgY2FzZS4KICAgICAgICAgICAgaWYgZC5nZXRWYXJG
bGFnKCdOT19HRU5FUklDX0xJQ0VOU0UnLCBsaWNlbnNlX3R5cGUpOgogICAgICAgICAgICAgICAg
YmIud2FybigiJXM6ICVzIGlzIGEgZ2VuZXJpYyBsaWNlbnNlLCBwbGVhc2UgZG9uJ3QgdXNlIE5P
X0dFTkVSSUNfTElDRU5TRSBmb3IgaXQuIiAlIChwbiwgbGljZW5zZV90eXBlKSkKCiAgICAgICAg
ZWxpZiBub25fZ2VuZXJpY19saWMgYW5kIG5vbl9nZW5lcmljX2xpYyBpbiBsaWNfY2hrc3VtczoK
ICAgICAgICAgICAgIyBpZiBOT19HRU5FUklDX0xJQ0VOU0UgaXMgc2V0LCB3ZSBjb3B5IHRoZSBs
aWNlbnNlIGZpbGVzIGZyb20gdGhlIGZldGNoZWQgc291cmNlCiAgICAgICAgICAgICMgb2YgdGhl
IHBhY2thZ2UgcmF0aGVyIHRoYW4gdGhlIGxpY2Vuc2Vfc291cmNlX2RpcnMuCiAgICAgICAgICAg
IGxpY19maWxlc19wYXRocy5hcHBlbmQoKCJnZW5lcmljXyIgKyBsaWNlbnNlX3R5cGUsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9zLnBhdGguam9pbihzcmNkaXIsIG5vbl9n
ZW5lcmljX2xpYyksIE5vbmUsIE5vbmUpKQogICAgICAgICAgICBub25fZ2VuZXJpY19saWNzW25v
bl9nZW5lcmljX2xpY10gPSBsaWNlbnNlX3R5cGUKICAgICAgICBlbHNlOgogICAgICAgICAgICAj
IEFkZCBleHBsaWNpdHkgYXZvaWQgb2YgQ0xPU0VEIGxpY2Vuc2UgYmVjYXVzZSB0aGlzIGlzbid0
IGdlbmVyaWMKICAgICAgICAgICAgaWYgbGljZW5zZV90eXBlICE9ICdDTE9TRUQnOgogICAgICAg
ICAgICAgICAgIyBBbmQgaGVyZSBpcyB3aGVyZSB3ZSB3YXJuIHBlb3BsZSB0aGF0IHRoZWlyIGxp
Y2Vuc2VzIGFyZSBsb3VzeQogICAgICAgICAgICAgICAgYmIud2FybigiJXM6IE5vIGdlbmVyaWMg
bGljZW5zZSBmaWxlIGV4aXN0cyBmb3I6ICVzIGluIGFueSBwcm92aWRlciIgJSAocG4sIGxpY2Vu
c2VfdHlwZSkpCiAgICAgICAgICAgIHBhc3MKCiAgICBpZiBub3QgZ2VuZXJpY19kaXJlY3Rvcnk6
CiAgICAgICAgYmIuZmF0YWwoIkNPTU1PTl9MSUNFTlNFX0RJUiBpcyB1bnNldC4gUGxlYXNlIHNl
dCB0aGlzIGluIHlvdXIgZGlzdHJvIGNvbmZpZyIpCgogICAgZm9yIHVybCBpbiBsaWNfZmlsZXMu
c3BsaXQoKToKICAgICAgICB0cnk6CiAgICAgICAgICAgIChtZXRob2QsIGhvc3QsIHBhdGgsIHVz
ZXIsIHBzd2QsIHBhcm0pID0gYmIuZmV0Y2guZGVjb2RldXJsKHVybCkKICAgICAgICAgICAgaWYg
bWV0aG9kICE9ICJmaWxlIiBvciBub3QgcGF0aDoKICAgICAgICAgICAgICAgIHJhaXNlIGJiLmZl
dGNoLk1hbGZvcm1lZFVybCgpCiAgICAgICAgZXhjZXB0IGJiLmZldGNoLk1hbGZvcm1lZFVybDoK
ICAgICAgICAgICAgYmIuZmF0YWwoIiVzOiBMSUNfRklMRVNfQ0hLU1VNIGNvbnRhaW5zIGFuIGlu
dmFsaWQgVVJMOiAgJXMiICUgKGQuZ2V0VmFyKCdQRicpLCB1cmwpKQogICAgICAgICMgV2Ugd2Fu
dCB0aGUgbGljZW5zZSBmaWxlbmFtZSBhbmQgcGF0aAogICAgICAgIGNoa3N1bSA9IHBhcm0uZ2V0
KCdtZDUnLCBOb25lKQogICAgICAgIGJlZ2lubGluZSA9IHBhcm0uZ2V0KCdiZWdpbmxpbmUnKQog
ICAgICAgIGVuZGxpbmUgPSBwYXJtLmdldCgnZW5kbGluZScpCiAgICAgICAgbGljX2Noa3N1bXNb
cGF0aF0gPSAoY2hrc3VtLCBiZWdpbmxpbmUsIGVuZGxpbmUpCgogICAgdiA9IEZpbmRWaXNpdG9y
KCkKICAgIHRyeToKICAgICAgICB2LnZpc2l0X3N0cmluZyhkLmdldFZhcignTElDRU5TRScpKQog
ICAgZXhjZXB0IG9lLmxpY2Vuc2UuSW52YWxpZExpY2Vuc2UgYXMgZXhjOgogICAgICAgIGJiLmZh
dGFsKCclczogJXMnICUgKGQuZ2V0VmFyKCdQRicpLCBleGMpKQogICAgZXhjZXB0IFN5bnRheEVy
cm9yOgogICAgICAgIGJiLndhcm4oIiVzOiBGYWlsZWQgdG8gcGFyc2UgaXQncyBMSUNFTlNFIGZp
ZWxkLiIgJSAoZC5nZXRWYXIoJ1BGJykpKQogICAgIyBBZGQgZmlsZXMgZnJvbSBMSUNfRklMRVNf
Q0hLU1VNIHRvIGxpc3Qgb2YgbGljZW5zZSBmaWxlcwogICAgbGljX2Noa3N1bV9wYXRocyA9IGRl
ZmF1bHRkaWN0KE9yZGVyZWREaWN0KQogICAgZm9yIHBhdGgsIGRhdGEgaW4gc29ydGVkKGxpY19j
aGtzdW1zLml0ZW1zKCkpOgogICAgICAgIGxpY19jaGtzdW1fcGF0aHNbb3MucGF0aC5iYXNlbmFt
ZShwYXRoKV1bZGF0YV0gPSAob3MucGF0aC5qb2luKHNyY2RpciwgcGF0aCksIGRhdGFbMV0sIGRh
dGFbMl0pCiAgICBmb3IgYmFzZW5hbWUsIGZpbGVzIGluIGxpY19jaGtzdW1fcGF0aHMuaXRlbXMo
KToKICAgICAgICBpZiBsZW4oZmlsZXMpID09IDE6CiAgICAgICAgICAgICMgRG9uJ3QgY29weSBh
Z2FpbiBhIExJQ0VOU0UgYWxyZWFkeSBoYW5kbGVkIGFzIG5vbi1nZW5lcmljCiAgICAgICAgICAg
IGlmIGJhc2VuYW1lIGluIG5vbl9nZW5lcmljX2xpY3M6CiAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICBkYXRhID0gbGlzdChmaWxlcy52YWx1ZXMoKSlbMF0KICAgICAgICAgICAg
bGljX2ZpbGVzX3BhdGhzLmFwcGVuZCh0dXBsZShbYmFzZW5hbWVdICsgbGlzdChkYXRhKSkpCiAg
ICAgICAgZWxzZToKICAgICAgICAgICAgIyBJZiB0aGVyZSBhcmUgbXVsdGlwbGUgZGlmZmVyZW50
IGxpY2Vuc2UgZmlsZXMgd2l0aCBpZGVudGljYWwKICAgICAgICAgICAgIyBiYXNlbmFtZXMgd2Ug
cmVuYW1lIHRoZW0gdG8gPGZpbGU+LjAsIDxmaWxlPi4xLCAuLi4KICAgICAgICAgICAgZm9yIGks
IGRhdGEgaW4gZW51bWVyYXRlKGZpbGVzLnZhbHVlcygpKToKICAgICAgICAgICAgICAgIGxpY19m
aWxlc19wYXRocy5hcHBlbmQodHVwbGUoWyIlcy4lZCIgJSAoYmFzZW5hbWUsIGkpXSArIGxpc3Qo
ZGF0YSkpKQoKICAgIHJldHVybiBsaWNfZmlsZXNfcGF0aHMKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_prepare_recipe_sysroot"
Content-Disposition: attachment; filename="run.do_prepare_recipe_sysroot"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3ae33>
X-Attachment-Id: f_jz9oy3ae33

ZGVmIGRvX3ByZXBhcmVfcmVjaXBlX3N5c3Jvb3QoZCk6CiAgICBiYi5idWlsZC5leGVjX2Z1bmMo
ImV4dGVuZF9yZWNpcGVfc3lzcm9vdCIsIGQpCgpkb19wcmVwYXJlX3JlY2lwZV9zeXNyb290KGQp
CgpkZWYgZXh0ZW5kX3JlY2lwZV9zeXNyb290KGQpOgogICAgaW1wb3J0IGNvcHkKICAgIGltcG9y
dCBzdWJwcm9jZXNzCiAgICBpbXBvcnQgZXJybm8KICAgIGltcG9ydCBjb2xsZWN0aW9ucwogICAg
aW1wb3J0IGdsb2IKCiAgICB0YXNrZGVwZGF0YSA9IGQuZ2V0VmFyKCJCQl9UQVNLREVQREFUQSIs
IEZhbHNlKQogICAgbXl0YXNrbmFtZSA9IGQuZ2V0VmFyKCJCQl9SVU5UQVNLIikKICAgIGlmIG15
dGFza25hbWUuZW5kc3dpdGgoIl9zZXRzY2VuZSIpOgogICAgICAgIG15dGFza25hbWUgPSBteXRh
c2tuYW1lLnJlcGxhY2UoIl9zZXRzY2VuZSIsICIiKQogICAgd29ya2RpciA9IGQuZ2V0VmFyKCJX
T1JLRElSIikKICAgICNiYi53YXJuKHN0cih0YXNrZGVwZGF0YSkpCiAgICBwbiA9IGQuZ2V0VmFy
KCJQTiIpCiAgICBzdGFnaW5nZGlyID0gZC5nZXRWYXIoIlNUQUdJTkdfRElSIikKICAgIHNoYXJl
ZG1hbmlmZXN0cyA9IGQuZ2V0VmFyKCJDT01QT05FTlRTX0RJUiIpICsgIi9tYW5pZmVzdHMiCiAg
ICByZWNpcGVzeXNyb290ID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UIikKICAgIHJlY2lwZXN5
c3Jvb3RuYXRpdmUgPSBkLmdldFZhcigiUkVDSVBFX1NZU1JPT1RfTkFUSVZFIikKCiAgICAjIERl
dGVjdCBiaXRiYWtlIC1iIHVzYWdlCiAgICBub2RlcHMgPSBkLmdldFZhcigiQkJfTElNSVRFRERF
UFMiKSBvciBGYWxzZQogICAgaWYgbm9kZXBzOgogICAgICAgIGxvY2sgPSBiYi51dGlscy5sb2Nr
ZmlsZShyZWNpcGVzeXNyb290ICsgIi9zeXNyb290LmxvY2siKQogICAgICAgIHN0YWdpbmdfcG9w
dWxhdGVfc3lzcm9vdF9kaXIocmVjaXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgVHJ1
ZSwgZCkKICAgICAgICBzdGFnaW5nX3BvcHVsYXRlX3N5c3Jvb3RfZGlyKHJlY2lwZXN5c3Jvb3Qs
IHJlY2lwZXN5c3Jvb3RuYXRpdmUsIEZhbHNlLCBkKQogICAgICAgIGJiLnV0aWxzLnVubG9ja2Zp
bGUobG9jaykKICAgICAgICByZXR1cm4KCiAgICBzdGFydCA9IE5vbmUKICAgIGNvbmZpZ3VyZWRl
cHMgPSBbXQogICAgZm9yIGRlcCBpbiB0YXNrZGVwZGF0YToKICAgICAgICBkYXRhID0gdGFza2Rl
cGRhdGFbZGVwXQogICAgICAgIGlmIGRhdGFbMV0gPT0gbXl0YXNrbmFtZSBhbmQgZGF0YVswXSA9
PSBwbjoKICAgICAgICAgICAgc3RhcnQgPSBkZXAKICAgICAgICAgICAgYnJlYWsKICAgIGlmIHN0
YXJ0IGlzIE5vbmU6CiAgICAgICAgYmIuZmF0YWwoIkNvdWxkbid0IGZpbmQgb3Vyc2VsZiBpbiBC
Ql9UQVNLREVQREFUQT8iKQoKICAgICMgV2UgbmVlZCB0byBmaWd1cmUgb3V0IHdoaWNoIHN5c3Jv
b3QgZmlsZXMgd2UgbmVlZCB0byBleHBvc2UgdG8gdGhpcyB0YXNrLgogICAgIyBUaGlzIG5lZWRz
IHRvIG1hdGNoIHdoYXQgd291bGQgZ2V0IHJlc3RvcmVkIGZyb20gc3N0YXRlLCB3aGljaCBpcyBj
b250cm9sbGVkCiAgICAjIHVsdGltYXRlbHkgYnkgY2FsbHMgZnJvbSBiaXRiYWtlIHRvIHNldHNj
ZW5lX2RlcHZhbGlkKCkuCiAgICAjIFRoYXQgZnVuY3Rpb24gZXhwZWN0cyBhIHNldHNjZW5lIGRl
cGVuZGVuY3kgdHJlZS4gV2UgYnVpbGQgYSBkZXBlbmRlbmN5IHRyZWUKICAgICMgY29uZGVuc2Vk
IHRvIGludGVyLXNzdGF0ZSB0YXNrIGRlcGVuZGVuY2llcywgc2ltaWxhciB0byB0aGF0IHVzZWQg
Ynkgc2V0c2NlbmUKICAgICMgdGFza3MuIFdlIGNhbiB0aGVuIGNhbGwgaW50byBzZXRzY2VuZV9k
ZXB2YWxpZCgpIGFuZCBkZWNpZGUKICAgICMgd2hpY2ggZGVwZW5kZW5jaWVzIHdlIGNhbiAic2Vl
IiBhbmQgc2hvdWxkIGV4cG9zZSBpbiB0aGUgcmVjaXBlIHNwZWNpZmljIHN5c3Jvb3QuCiAgICBz
ZXRzY2VuZWRlcHMgPSBjb3B5LmRlZXBjb3B5KHRhc2tkZXBkYXRhKQoKICAgIHN0YXJ0ID0gc2V0
KFtzdGFydF0pCgogICAgc3N0YXRldGFza3MgPSBkLmdldFZhcigiU1NUQVRFVEFTS1MiKS5zcGxp
dCgpCiAgICAjIEFkZCByZWNpcGUgc3BlY2lmaWMgdGFza3MgcmVmZXJlbmNlZCBieSBzZXRzY2Vu
ZV9kZXB2YWxpZCgpCiAgICBzc3RhdGV0YXNrcy5hcHBlbmQoImRvX3N0YXNoX2xvY2FsZSIpCgog
ICAgZGVmIHByaW50X2RlcF90cmVlKGRlcHRyZWUpOgogICAgICAgIGRhdGEgPSAiIgogICAgICAg
IGZvciBkZXAgaW4gZGVwdHJlZToKICAgICAgICAgICAgZGVwcyA9ICIgICAgIiArICJcbiAgICAi
LmpvaW4oZGVwdHJlZVtkZXBdWzNdKSArICJcbiIKICAgICAgICAgICAgZGF0YSA9IGRhdGEgKyAi
JXM6XG4gICVzXG4gICVzXG4lcyAgJXNcbiAgJXNcbiIgJSAoZGVwdHJlZVtkZXBdWzBdLCBkZXB0
cmVlW2RlcF1bMV0sIGRlcHRyZWVbZGVwXVsyXSwgZGVwcywgZGVwdHJlZVtkZXBdWzRdLCBkZXB0
cmVlW2RlcF1bNV0pCiAgICAgICAgcmV0dXJuIGRhdGEKCiAgICAjYmIubm90ZSgiRnVsbCBkZXAg
dHJlZSBpczpcbiVzIiAlIHByaW50X2RlcF90cmVlKHRhc2tkZXBkYXRhKSkKCiAgICAjYmIubm90
ZSgiIHN0YXJ0MiBpcyAlcyIgJSBzdHIoc3RhcnQpKQoKICAgICMgSWYgc3RhcnQgaXMgYW4gc3N0
YXRlIHRhc2sgKGxpa2UgZG9fcGFja2FnZSkgd2UgbmVlZCB0byBhZGQgaW4gaXRzIGRpcmVjdCBk
ZXBlbmRlbmNpZXMKICAgICMgZWxzZSB0aGUgY29kZSBiZWxvdyB3b24ndCByZWN1cnNlIGludG8g
dGhlbS4KICAgIGZvciBkZXAgaW4gc2V0KHN0YXJ0KToKICAgICAgICBmb3IgZGVwMiBpbiBzZXRz
Y2VuZWRlcHNbZGVwXVszXToKICAgICAgICAgICAgc3RhcnQuYWRkKGRlcDIpCiAgICAgICAgc3Rh
cnQucmVtb3ZlKGRlcCkKCiAgICAjYmIubm90ZSgiIHN0YXJ0MyBpcyAlcyIgJSBzdHIoc3RhcnQp
KQoKICAgICMgQ3JlYXRlIGNvbGxhcHNlZCBkb19wb3B1bGF0ZV9zeXNyb290IC0+IGRvX3BvcHVs
YXRlX3N5c3Jvb3QgdHJlZQogICAgZm9yIGRlcCBpbiB0YXNrZGVwZGF0YToKICAgICAgICBkYXRh
ID0gc2V0c2NlbmVkZXBzW2RlcF0KICAgICAgICBpZiBkYXRhWzFdIG5vdCBpbiBzc3RhdGV0YXNr
czoKICAgICAgICAgICAgZm9yIGRlcDIgaW4gc2V0c2NlbmVkZXBzOgogICAgICAgICAgICAgICAg
ZGF0YTIgPSBzZXRzY2VuZWRlcHNbZGVwMl0KICAgICAgICAgICAgICAgIGlmIGRlcCBpbiBkYXRh
MlszXToKICAgICAgICAgICAgICAgICAgICBkYXRhMlszXS51cGRhdGUoc2V0c2NlbmVkZXBzW2Rl
cF1bM10pCiAgICAgICAgICAgICAgICAgICAgZGF0YTJbM10ucmVtb3ZlKGRlcCkKICAgICAgICAg
ICAgaWYgZGVwIGluIHN0YXJ0OgogICAgICAgICAgICAgICAgc3RhcnQudXBkYXRlKHNldHNjZW5l
ZGVwc1tkZXBdWzNdKQogICAgICAgICAgICAgICAgc3RhcnQucmVtb3ZlKGRlcCkKICAgICAgICAg
ICAgZGVsIHNldHNjZW5lZGVwc1tkZXBdCgogICAgIyBSZW1vdmUgY2lyY3VsYXIgcmVmZXJlbmNl
cwogICAgZm9yIGRlcCBpbiBzZXRzY2VuZWRlcHM6CiAgICAgICAgaWYgZGVwIGluIHNldHNjZW5l
ZGVwc1tkZXBdWzNdOgogICAgICAgICAgICBzZXRzY2VuZWRlcHNbZGVwXVszXS5yZW1vdmUoZGVw
KQoKICAgICNiYi5ub3RlKCJDb21wdXRlZCBkZXAgdHJlZSBpczpcbiVzIiAlIHByaW50X2RlcF90
cmVlKHNldHNjZW5lZGVwcykpCiAgICAjYmIubm90ZSgiIHN0YXJ0IGlzICVzIiAlIHN0cihzdGFy
dCkpCgogICAgIyBEaXJlY3QgZGVwZW5kZW5jaWVzIHNob3VsZCBiZSBwcmVzZW50IGFuZCBjYW4g
YmUgZGVwZW5kZWQgdXBvbgogICAgZm9yIGRlcCBpbiBzZXQoc3RhcnQpOgogICAgICAgIGlmIHNl
dHNjZW5lZGVwc1tkZXBdWzFdID09ICJkb19wb3B1bGF0ZV9zeXNyb290IjoKICAgICAgICAgICAg
aWYgZGVwIG5vdCBpbiBjb25maWd1cmVkZXBzOgogICAgICAgICAgICAgICAgY29uZmlndXJlZGVw
cy5hcHBlbmQoZGVwKQogICAgYmIubm90ZSgiRGlyZWN0IGRlcGVuZGVuY2llcyBhcmUgJXMiICUg
c3RyKGNvbmZpZ3VyZWRlcHMpKQogICAgI2JiLm5vdGUoIiBvciAlcyIgJSBzdHIoc3RhcnQpKQoK
ICAgIG1zZ2J1ZiA9IFtdCiAgICAjIENhbGwgaW50byBzZXRzY2VuZV9kZXB2YWxpZCBmb3IgZWFj
aCBzdWItZGVwZW5kZW5jeSBhbmQgb25seSBjb3B5IHN5c3Jvb3QgZmlsZXMKICAgICMgZm9yIG9u
ZXMgdGhhdCB3b3VsZCBiZSByZXN0b3JlZCBmcm9tIHNzdGF0ZS4KICAgIGRvbmUgPSBsaXN0KHN0
YXJ0KQogICAgbmV4dCA9IGxpc3Qoc3RhcnQpCiAgICB3aGlsZSBuZXh0OgogICAgICAgIG5ldyA9
IFtdCiAgICAgICAgZm9yIGRlcCBpbiBuZXh0OgogICAgICAgICAgICBkYXRhID0gc2V0c2NlbmVk
ZXBzW2RlcF0KICAgICAgICAgICAgZm9yIGRhdGFkZXAgaW4gZGF0YVszXToKICAgICAgICAgICAg
ICAgIGlmIGRhdGFkZXAgaW4gZG9uZToKICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAg
ICAgICAgICAgICAgdGFza2RlcHMgPSB7fQogICAgICAgICAgICAgICAgdGFza2RlcHNbZGVwXSA9
IHNldHNjZW5lZGVwc1tkZXBdWzoyXQogICAgICAgICAgICAgICAgdGFza2RlcHNbZGF0YWRlcF0g
PSBzZXRzY2VuZWRlcHNbZGF0YWRlcF1bOjJdCiAgICAgICAgICAgICAgICByZXR2YWwgPSBzZXRz
Y2VuZV9kZXB2YWxpZChkYXRhZGVwLCB0YXNrZGVwcywgW10sIGQsIG1zZ2J1ZikKICAgICAgICAg
ICAgICAgIGlmIHJldHZhbDoKICAgICAgICAgICAgICAgICAgICBtc2didWYuYXBwZW5kKCJTa2lw
cGluZyBzZXRzY2VuZSBkZXBlbmRlbmN5ICVzIGZvciBpbnN0YWxsYXRpb24gaW50byB0aGUgc3lz
cm9vdCIgJSBkYXRhZGVwKQogICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAg
ICAgICBkb25lLmFwcGVuZChkYXRhZGVwKQogICAgICAgICAgICAgICAgbmV3LmFwcGVuZChkYXRh
ZGVwKQogICAgICAgICAgICAgICAgaWYgZGF0YWRlcCBub3QgaW4gY29uZmlndXJlZGVwcyBhbmQg
c2V0c2NlbmVkZXBzW2RhdGFkZXBdWzFdID09ICJkb19wb3B1bGF0ZV9zeXNyb290IjoKICAgICAg
ICAgICAgICAgICAgICBjb25maWd1cmVkZXBzLmFwcGVuZChkYXRhZGVwKQogICAgICAgICAgICAg
ICAgICAgIG1zZ2J1Zi5hcHBlbmQoIkFkZGluZyBkZXBlbmRlbmN5IG9uICVzIiAlIHNldHNjZW5l
ZGVwc1tkYXRhZGVwXVswXSkKICAgICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAg
ICAgbXNnYnVmLmFwcGVuZCgiRm9sbG93aW5nIGRlcGVuZGVuY3kgb24gJXMiICUgc2V0c2NlbmVk
ZXBzW2RhdGFkZXBdWzBdKQogICAgICAgIG5leHQgPSBuZXcKCiAgICAjIFRoaXMgbG9nZ2luZyBp
cyB0b28gdmVyYm9zZSBmb3IgZGF5IHRvIGRheSB1c2Ugc2FkbHkKICAgICNiYi5kZWJ1ZygyLCAi
XG4iLmpvaW4obXNnYnVmKSkKCiAgICBkZXBkaXIgPSByZWNpcGVzeXNyb290bmF0aXZlICsgIi9p
bnN0YWxsZWRkZXBzIgogICAgYmIudXRpbHMubWtkaXJoaWVyKGRlcGRpcikKICAgIGJiLnV0aWxz
Lm1rZGlyaGllcihzaGFyZWRtYW5pZmVzdHMpCgogICAgbG9jayA9IGJiLnV0aWxzLmxvY2tmaWxl
KHJlY2lwZXN5c3Jvb3QgKyAiL3N5c3Jvb3QubG9jayIpCgogICAgZml4bWUgPSB7fQogICAgc2Vl
bmRpcnMgPSBzZXQoKQogICAgcG9zdGluc3RzID0gW10KICAgIG11bHRpbGlicyA9IHt9CiAgICBt
YW5pZmVzdHMgPSB7fQogICAgIyBBbGwgZmlsZXMgdGhhdCB3ZSdyZSBnb2luZyB0byBiZSBpbnN0
YWxsaW5nLCB0byBmaW5kIGNvbmZsaWN0cy4KICAgIGZpbGVzZXQgPSB7fQoKICAgIGZvciBmIGlu
IG9zLmxpc3RkaXIoZGVwZGlyKToKICAgICAgICBpZiBub3QgZi5lbmRzd2l0aCgiLmNvbXBsZXRl
Iik6CiAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgZiA9IGRlcGRpciArICIvIiArIGYKICAg
ICAgICBpZiBvcy5wYXRoLmlzbGluayhmKSBhbmQgbm90IG9zLnBhdGguZXhpc3RzKGYpOgogICAg
ICAgICAgICBiYi5ub3RlKCIlcyBubyBsb25nZXIgZXhpc3RzLCByZW1vdmluZyBmcm9tIHN5c3Jv
b3QiICUgZikKICAgICAgICAgICAgbG5rID0gb3MucmVhZGxpbmsoZi5yZXBsYWNlKCIuY29tcGxl
dGUiLCAiIikpCiAgICAgICAgICAgIHNzdGF0ZV9jbGVhbl9tYW5pZmVzdChkZXBkaXIgKyAiLyIg
KyBsbmssIGQsIHdvcmtkaXIpCiAgICAgICAgICAgIG9zLnVubGluayhmKQogICAgICAgICAgICBv
cy51bmxpbmsoZi5yZXBsYWNlKCIuY29tcGxldGUiLCAiIikpCgogICAgaW5zdGFsbGVkID0gW10K
ICAgIGZvciBkZXAgaW4gY29uZmlndXJlZGVwczoKICAgICAgICBjID0gc2V0c2NlbmVkZXBzW2Rl
cF1bMF0KICAgICAgICBpZiBteXRhc2tuYW1lIGluIFsiZG9fc2RrX2RlcGVuZHMiLCAiZG9fcG9w
dWxhdGVfc2RrX2V4dCJdIGFuZCBjLmVuZHN3aXRoKCItaW5pdGlhbCIpOgogICAgICAgICAgICBi
Yi5ub3RlKCJTa2lwcGluZyBpbml0aWFsIHNldHNjZW5lIGRlcGVuZGVuY3kgJXMgZm9yIGluc3Rh
bGxhdGlvbiBpbnRvIHRoZSBzeXNyb290IiAlIGMpCiAgICAgICAgICAgIGNvbnRpbnVlCiAgICAg
ICAgaW5zdGFsbGVkLmFwcGVuZChjKQoKICAgICMgV2Ugd2FudCB0byByZW1vdmUgYW55dGhpbmcg
d2hpY2ggdGhpcyB0YXNrIHByZXZpb3VzbHkgaW5zdGFsbGVkIGJ1dCBpcyBubyBsb25nZXIgYSBk
ZXBlbmRlbmN5CiAgICB0YXNraW5kZXggPSBkZXBkaXIgKyAiLyIgKyAiaW5kZXguIiArIG15dGFz
a25hbWUKICAgIGlmIG9zLnBhdGguZXhpc3RzKHRhc2tpbmRleCk6CiAgICAgICAgcG90ZW50aWFs
ID0gW10KICAgICAgICB3aXRoIG9wZW4odGFza2luZGV4LCAiciIpIGFzIGY6CiAgICAgICAgICAg
IGZvciBsIGluIGY6CiAgICAgICAgICAgICAgICBsID0gbC5zdHJpcCgpCiAgICAgICAgICAgICAg
ICBpZiBsIG5vdCBpbiBpbnN0YWxsZWQ6CiAgICAgICAgICAgICAgICAgICAgZmwgPSBkZXBkaXIg
KyAiLyIgKyBsCiAgICAgICAgICAgICAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKGZsKToK
ICAgICAgICAgICAgICAgICAgICAgICAgIyBXYXMgbGlrZWx5IGFscmVhZHkgdW5pbnN0YWxsZWQK
ICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgICAgICAgICBwb3Rl
bnRpYWwuYXBwZW5kKGwpCiAgICAgICAgIyBXZSBuZWVkIHRvIGVuc3VyZSBub3Qgb3RoZXIgdGFz
ayBuZWVkcyB0aGlzIGRlcGVuZGVuY3kuIFdlIGhvbGQgdGhlIHN5c3Jvb3QKICAgICAgICAjIGxv
Y2sgc28gd2UgY2Egc2VhcmNoIHRoZSBpbmRleGVzIHRvIGNoZWNrCiAgICAgICAgaWYgcG90ZW50
aWFsOgogICAgICAgICAgICBmb3IgaSBpbiBnbG9iLmdsb2IoZGVwZGlyICsgIi9pbmRleC4qIik6
CiAgICAgICAgICAgICAgICBpZiBpLmVuZHN3aXRoKCIuIiArIG15dGFza25hbWUpOgogICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICB3aXRoIG9wZW4oaSwgInIiKSBh
cyBmOgogICAgICAgICAgICAgICAgICAgIGZvciBsIGluIGY6CiAgICAgICAgICAgICAgICAgICAg
ICAgIGwgPSBsLnN0cmlwKCkKICAgICAgICAgICAgICAgICAgICAgICAgaWYgbCBpbiBwb3RlbnRp
YWw6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3RlbnRpYWwucmVtb3ZlKGwpCiAgICAg
ICAgZm9yIGwgaW4gcG90ZW50aWFsOgogICAgICAgICAgICBmbCA9IGRlcGRpciArICIvIiArIGwK
ICAgICAgICAgICAgYmIubm90ZSgiVGFzayAlcyBubyBsb25nZXIgZGVwZW5kcyBvbiAlcywgcmVt
b3ZpbmcgZnJvbSBzeXNyb290IiAlIChteXRhc2tuYW1lLCBsKSkKICAgICAgICAgICAgbG5rID0g
b3MucmVhZGxpbmsoZmwpCiAgICAgICAgICAgIHNzdGF0ZV9jbGVhbl9tYW5pZmVzdChkZXBkaXIg
KyAiLyIgKyBsbmssIGQsIHdvcmtkaXIpCiAgICAgICAgICAgIG9zLnVubGluayhmbCkKICAgICAg
ICAgICAgb3MudW5saW5rKGZsICsgIi5jb21wbGV0ZSIpCgogICAgbXNnX2V4aXN0cyA9IFtdCiAg
ICBtc2dfYWRkaW5nID0gW10KCiAgICBmb3IgZGVwIGluIGNvbmZpZ3VyZWRlcHM6CiAgICAgICAg
YyA9IHNldHNjZW5lZGVwc1tkZXBdWzBdCiAgICAgICAgaWYgYyBub3QgaW4gaW5zdGFsbGVkOgog
ICAgICAgICAgICBjb250aW51ZQogICAgICAgIHRhc2toYXNoID0gc2V0c2NlbmVkZXBzW2RlcF1b
NV0KICAgICAgICB0YXNrbWFuaWZlc3QgPSBkZXBkaXIgKyAiLyIgKyBjICsgIi4iICsgdGFza2hh
c2gKCiAgICAgICAgaWYgb3MucGF0aC5leGlzdHMoZGVwZGlyICsgIi8iICsgYyk6CiAgICAgICAg
ICAgIGxuayA9IG9zLnJlYWRsaW5rKGRlcGRpciArICIvIiArIGMpCiAgICAgICAgICAgIGlmIGxu
ayA9PSBjICsgIi4iICsgdGFza2hhc2ggYW5kIG9zLnBhdGguZXhpc3RzKGRlcGRpciArICIvIiAr
IGMgKyAiLmNvbXBsZXRlIik6CiAgICAgICAgICAgICAgICBtc2dfZXhpc3RzLmFwcGVuZChjKQog
ICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAg
IGJiLm5vdGUoIiVzIGV4aXN0cyBpbiBzeXNyb290LCBidXQgaXMgc3RhbGUgKCVzIHZzLiAlcyks
IHJlbW92aW5nLiIgJSAoYywgbG5rLCBjICsgIi4iICsgdGFza2hhc2gpKQogICAgICAgICAgICAg
ICAgc3N0YXRlX2NsZWFuX21hbmlmZXN0KGRlcGRpciArICIvIiArIGxuaywgZCwgd29ya2RpcikK
ICAgICAgICAgICAgICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjKQogICAgICAgICAgICAg
ICAgaWYgb3MucGF0aC5sZXhpc3RzKGRlcGRpciArICIvIiArIGMgKyAiLmNvbXBsZXRlIik6CiAg
ICAgICAgICAgICAgICAgICAgb3MudW5saW5rKGRlcGRpciArICIvIiArIGMgKyAiLmNvbXBsZXRl
IikKICAgICAgICBlbGlmIG9zLnBhdGgubGV4aXN0cyhkZXBkaXIgKyAiLyIgKyBjKToKICAgICAg
ICAgICAgb3MudW5saW5rKGRlcGRpciArICIvIiArIGMpCgogICAgICAgIG1zZ19hZGRpbmcuYXBw
ZW5kKGMpCgogICAgICAgIG9zLnN5bWxpbmsoYyArICIuIiArIHRhc2toYXNoLCBkZXBkaXIgKyAi
LyIgKyBjKQoKICAgICAgICBtYW5pZmVzdCwgZDIgPSBvZS5zc3RhdGVzaWcuZmluZF9zc3RhdGVf
bWFuaWZlc3QoYywgc2V0c2NlbmVkZXBzW2RlcF1bMl0sICJwb3B1bGF0ZV9zeXNyb290IiwgZCwg
bXVsdGlsaWJzKQogICAgICAgIGlmIGQyIGlzIG5vdCBkOgogICAgICAgICAgICAjIElmIHdlIGRv
bid0IGRvIHRoaXMsIHRoZSByZWNpcGUgc3lzcm9vdCB3aWxsIGJlIHBsYWNlZCBpbiB0aGUgd3Jv
bmcgV09SS0RJUiBmb3IgbXVsdGlsaWJzCiAgICAgICAgICAgICMgV2UgbmVlZCBhIGNvbnNpc3Rl
bnQgV09SS0RJUiBmb3IgdGhlIGltYWdlCiAgICAgICAgICAgIGQyLnNldFZhcigiV09SS0RJUiIs
IGQuZ2V0VmFyKCJXT1JLRElSIikpCiAgICAgICAgZGVzdHN5c3Jvb3QgPSBkMi5nZXRWYXIoIlJF
Q0lQRV9TWVNST09UIikKICAgICAgICAjIFdlIHB1dCBhbGxhcmNoIHJlY2lwZXMgaW50byB0aGUg
ZGVmYXVsdCBzeXNyb290CiAgICAgICAgaWYgbWFuaWZlc3QgYW5kICJhbGxhcmNoIiBpbiBtYW5p
ZmVzdDoKICAgICAgICAgICAgZGVzdHN5c3Jvb3QgPSBkLmdldFZhcigiUkVDSVBFX1NZU1JPT1Qi
KQoKICAgICAgICBuYXRpdmUgPSBGYWxzZQogICAgICAgIGlmIGMuZW5kc3dpdGgoIi1uYXRpdmUi
KSBvciAiLWNyb3NzLSIgaW4gYyBvciAiLWNyb3Nzc2RrIiBpbiBjOgogICAgICAgICAgICBuYXRp
dmUgPSBUcnVlCgogICAgICAgIGlmIG1hbmlmZXN0OgogICAgICAgICAgICBuZXdtYW5pZmVzdCA9
IGNvbGxlY3Rpb25zLk9yZGVyZWREaWN0KCkKICAgICAgICAgICAgdGFyZ2V0ZGlyID0gZGVzdHN5
c3Jvb3QKICAgICAgICAgICAgaWYgbmF0aXZlOgogICAgICAgICAgICAgICAgdGFyZ2V0ZGlyID0g
cmVjaXBlc3lzcm9vdG5hdGl2ZQogICAgICAgICAgICBpZiB0YXJnZXRkaXIgbm90IGluIGZpeG1l
OgogICAgICAgICAgICAgICAgZml4bWVbdGFyZ2V0ZGlyXSA9IFtdCiAgICAgICAgICAgIGZtID0g
Zml4bWVbdGFyZ2V0ZGlyXQoKICAgICAgICAgICAgd2l0aCBvcGVuKG1hbmlmZXN0LCAiciIpIGFz
IGY6CiAgICAgICAgICAgICAgICBtYW5pZmVzdHNbZGVwXSA9IG1hbmlmZXN0CiAgICAgICAgICAg
ICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgIGwgPSBsLnN0cmlwKCkKICAgICAg
ICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoIik6CiAgICAgICAgICAgICAg
ICAgICAgICAgIGZtLmFwcGVuZChsKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZQog
ICAgICAgICAgICAgICAgICAgIGlmIGwuZW5kc3dpdGgoIi9maXhtZXBhdGguY21kIik6CiAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAgICAgZGVzdCA9IGwu
cmVwbGFjZShzdGFnaW5nZGlyLCAiIikKICAgICAgICAgICAgICAgICAgICBkZXN0ID0gIi8iICsg
Ii8iLmpvaW4oZGVzdC5zcGxpdCgiLyIpWzM6XSkKICAgICAgICAgICAgICAgICAgICBuZXdtYW5p
ZmVzdFtsXSA9IHRhcmdldGRpciArIGRlc3QKCiAgICAgICAgICAgICAgICAgICAgIyBDaGVjayBp
ZiBmaWxlcyBoYXZlIGFscmVhZHkgYmVlbiBpbnN0YWxsZWQgYnkgYW5vdGhlcgogICAgICAgICAg
ICAgICAgICAgICMgcmVjaXBlIGFuZCBhYm9ydCBpZiB0aGV5IGhhdmUsIGV4cGxhaW5pbmcgd2hh
dCByZWNpcGVzIGFyZQogICAgICAgICAgICAgICAgICAgICMgY29uZmxpY3RpbmcuCiAgICAgICAg
ICAgICAgICAgICAgaGFzaG5hbWUgPSB0YXJnZXRkaXIgKyBkZXN0CiAgICAgICAgICAgICAgICAg
ICAgaWYgbm90IGhhc2huYW1lLmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAgICAg
IGlmIGhhc2huYW1lIGluIGZpbGVzZXQ6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBiYi5m
YXRhbCgiVGhlIGZpbGUgJXMgaXMgaW5zdGFsbGVkIGJ5IGJvdGggJXMgYW5kICVzLCBhYm9ydGlu
ZyIgJSAoZGVzdCwgYywgZmlsZXNldFtoYXNobmFtZV0pKQogICAgICAgICAgICAgICAgICAgICAg
ICBlbHNlOgogICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZXNldFtoYXNobmFtZV0gPSBj
CgogICAgICAgICAgICAjIEhhdmluZyBtdWx0aXBsZSBpZGVudGljYWwgbWFuaWZlc3RzIGluIGVh
Y2ggc3lzcm9vdCBlYXRzIGRpc2tzcGFjZSBzbwogICAgICAgICAgICAjIGNyZWF0ZSBhIHNoYXJl
ZCBwb29sIG9mIHRoZW0gYW5kIGhhcmRsaW5rIGlmIHdlIGNhbi4KICAgICAgICAgICAgIyBXZSBj
cmVhdGUgdGhlIG1hbmlmZXN0IGluIGFkdmFuY2Ugc28gdGhhdCBpZiBzb21ldGhpbmcgZmFpbHMg
ZHVyaW5nIGluc3RhbGxhdGlvbiwKICAgICAgICAgICAgIyBvciB0aGUgYnVpbGQgaXMgaW50ZXJy
dXB0ZWQsIHN1YnNlcXVlbnQgZXhldWN0aW9uIGNhbiBjbGVhbnVwLgogICAgICAgICAgICBzaGFy
ZWRtID0gc2hhcmVkbWFuaWZlc3RzICsgIi8iICsgb3MucGF0aC5iYXNlbmFtZSh0YXNrbWFuaWZl
c3QpCiAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhzaGFyZWRtKToKICAgICAgICAg
ICAgICAgIHNtbG9jayA9IGJiLnV0aWxzLmxvY2tmaWxlKHNoYXJlZG0gKyAiLmxvY2siKQogICAg
ICAgICAgICAgICAgIyBDYW4gcmFjZSBoZXJlLiBZb3UnZCB0aGluayBpdCBqdXN0IG1lYW5zIHdl
IG1heSBub3QgZW5kIHVwIHdpdGggYWxsIGNvcGllcyBoYXJkbGlua2VkIHRvIGVhY2ggb3RoZXIK
ICAgICAgICAgICAgICAgICMgYnV0IHB5dGhvbiBjYW4gbG9zZSBmaWxlIGhhbmRsZXMgc28gd2Ug
bmVlZCB0byBkbyB0aGlzIHVuZGVyIGEgbG9jay4KICAgICAgICAgICAgICAgIGlmIG5vdCBvcy5w
YXRoLmV4aXN0cyhzaGFyZWRtKToKICAgICAgICAgICAgICAgICAgICB3aXRoIG9wZW4oc2hhcmVk
bSwgJ3cnKSBhcyBtOgogICAgICAgICAgICAgICAgICAgICAgIGZvciBsIGluIG5ld21hbmlmZXN0
OgogICAgICAgICAgICAgICAgICAgICAgICAgICBkZXN0ID0gbmV3bWFuaWZlc3RbbF0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbS53cml0ZShkZXN0LnJlcGxhY2Uod29ya2RpciArICIvIiwg
IiIpICsgIlxuIikKICAgICAgICAgICAgICAgIGJiLnV0aWxzLnVubG9ja2ZpbGUoc21sb2NrKQog
ICAgICAgICAgICB0cnk6CiAgICAgICAgICAgICAgICBvcy5saW5rKHNoYXJlZG0sIHRhc2ttYW5p
ZmVzdCkKICAgICAgICAgICAgZXhjZXB0IE9TRXJyb3IgYXMgZXJyOgogICAgICAgICAgICAgICAg
aWYgZXJyLmVycm5vID09IGVycm5vLkVYREVWOgogICAgICAgICAgICAgICAgICAgIGJiLnV0aWxz
LmNvcHlmaWxlKHNoYXJlZG0sIHRhc2ttYW5pZmVzdCkKICAgICAgICAgICAgICAgIGVsc2U6CiAg
ICAgICAgICAgICAgICAgICAgcmFpc2UKICAgICAgICAgICAgIyBGaW5hbGx5IGFjdHVhbGx5IGlu
c3RhbGwgdGhlIGZpbGVzCiAgICAgICAgICAgIGZvciBsIGluIG5ld21hbmlmZXN0OgogICAgICAg
ICAgICAgICAgICAgIGRlc3QgPSBuZXdtYW5pZmVzdFtsXQogICAgICAgICAgICAgICAgICAgIGlm
IGwuZW5kc3dpdGgoIi8iKToKICAgICAgICAgICAgICAgICAgICAgICAgc3RhZ2luZ19jb3B5ZGly
KGwsIHRhcmdldGRpciwgZGVzdCwgc2VlbmRpcnMpCiAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlCiAgICAgICAgICAgICAgICAgICAgc3RhZ2luZ19jb3B5ZmlsZShsLCB0YXJnZXRkaXIs
IGRlc3QsIHBvc3RpbnN0cywgc2VlbmRpcnMpCgogICAgYmIubm90ZSgiSW5zdGFsbGVkIGludG8g
c3lzcm9vdDogJXMiICUgc3RyKG1zZ19hZGRpbmcpKQogICAgYmIubm90ZSgiU2tpcHBpbmcgYXMg
YWxyZWFkeSBleGlzdHMgaW4gc3lzcm9vdDogJXMiICUgc3RyKG1zZ19leGlzdHMpKQoKICAgIGZv
ciBmIGluIGZpeG1lOgogICAgICAgIHN0YWdpbmdfcHJvY2Vzc2ZpeG1lKGZpeG1lW2ZdLCBmLCBy
ZWNpcGVzeXNyb290LCByZWNpcGVzeXNyb290bmF0aXZlLCBkKQoKICAgIGZvciBwIGluIHBvc3Rp
bnN0czoKICAgICAgICBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChwLCBzaGVsbD1UcnVlLCBzdGRl
cnI9c3VicHJvY2Vzcy5TVERPVVQpCgogICAgZm9yIGRlcCBpbiBtYW5pZmVzdHM6CiAgICAgICAg
YyA9IHNldHNjZW5lZGVwc1tkZXBdWzBdCiAgICAgICAgb3Muc3ltbGluayhtYW5pZmVzdHNbZGVw
XSwgZGVwZGlyICsgIi8iICsgYyArICIuY29tcGxldGUiKQoKICAgIHdpdGggb3Blbih0YXNraW5k
ZXgsICJ3IikgYXMgZjoKICAgICAgICBmb3IgbCBpbiBzb3J0ZWQoaW5zdGFsbGVkKToKICAgICAg
ICAgICAgZi53cml0ZShsICsgIlxuIikKCiAgICBiYi51dGlscy51bmxvY2tmaWxlKGxvY2spCgpk
ZWYgc3RhZ2luZ19wcm9jZXNzZml4bWUoZml4bWUsIHRhcmdldCwgcmVjaXBlc3lzcm9vdCwgcmVj
aXBlc3lzcm9vdG5hdGl2ZSwgZCk6CiAgICBpbXBvcnQgc3VicHJvY2VzcwoKICAgIGlmIG5vdCBm
aXhtZToKICAgICAgICByZXR1cm4KICAgIGNtZCA9ICJzZWQgLWUgJ3M6XlteL10qLzolcy86Zycg
JXMgfCB4YXJncyBzZWQgLWkgLWUgJ3M6RklYTUVTVEFHSU5HRElSVEFSR0VUOiVzOmc7IHM6RklY
TUVTVEFHSU5HRElSSE9TVDolczpnJyIgJSAodGFyZ2V0LCAiICIuam9pbihmaXhtZSksIHJlY2lw
ZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUpCiAgICBmb3IgZml4bWV2YXIgaW4gWydQU0VV
RE9fU1lTUk9PVCcsICdIT1NUVE9PTFNfRElSJywgJ1BLR0RBVEFfRElSJywgJ1BTRVVET19MT0NB
TFNUQVRFRElSJywgJ0xPR0ZJRk8nXToKICAgICAgICBmaXhtZV9wYXRoID0gZC5nZXRWYXIoZml4
bWV2YXIpCiAgICAgICAgY21kICs9ICIgLWUgJ3M6RklYTUVfJXM6JXM6ZyciICUgKGZpeG1ldmFy
LCBmaXhtZV9wYXRoKQogICAgYmIuZGVidWcoMiwgY21kKQogICAgc3VicHJvY2Vzcy5jaGVja19v
dXRwdXQoY21kLCBzaGVsbD1UcnVlLCBzdGRlcnI9c3VicHJvY2Vzcy5TVERPVVQpCgpkZWYgc3Rh
Z2luZ19jb3B5ZGlyKGMsIHRhcmdldCwgZGVzdCwgc2VlbmRpcnMpOgogICAgaWYgZGVzdCBub3Qg
aW4gc2VlbmRpcnM6CiAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKGRlc3QpCiAgICAgICAgc2Vl
bmRpcnMuYWRkKGRlc3QpCgpkZWYgc3RhZ2luZ19wb3B1bGF0ZV9zeXNyb290X2Rpcih0YXJnZXRz
eXNyb290LCBuYXRpdmVzeXNyb290LCBuYXRpdmUsIGQpOgogICAgaW1wb3J0IGdsb2IKICAgIGlt
cG9ydCBzdWJwcm9jZXNzCiAgICBpbXBvcnQgZXJybm8KCiAgICBmaXhtZSA9IFtdCiAgICBwb3N0
aW5zdHMgPSBbXQogICAgc2VlbmRpcnMgPSBzZXQoKQogICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFy
KCJTVEFHSU5HX0RJUiIpCiAgICBpZiBuYXRpdmU6CiAgICAgICAgcGtnYXJjaHMgPSBbJyR7QlVJ
TERfQVJDSH0nLCAnJHtCVUlMRF9BUkNIfV8qJ10KICAgICAgICB0YXJnZXRkaXIgPSBuYXRpdmVz
eXNyb290CiAgICBlbHNlOgogICAgICAgIHBrZ2FyY2hzID0gWycke01BQ0hJTkVfQVJDSH0nXQog
ICAgICAgIHBrZ2FyY2hzID0gcGtnYXJjaHMgKyBsaXN0KHJldmVyc2VkKGQuZ2V0VmFyKCJQQUNL
QUdFX0VYVFJBX0FSQ0hTIikuc3BsaXQoKSkpCiAgICAgICAgcGtnYXJjaHMuYXBwZW5kKCdhbGxh
cmNoJykKICAgICAgICB0YXJnZXRkaXIgPSB0YXJnZXRzeXNyb290CgogICAgYmIudXRpbHMubWtk
aXJoaWVyKHRhcmdldGRpcikKICAgIGZvciBwa2dhcmNoIGluIHBrZ2FyY2hzOgogICAgICAgIGZv
ciBtYW5pZmVzdCBpbiBnbG9iLmdsb2IoZC5leHBhbmQoIiR7U1NUQVRFX01BTklGRVNUU30vbWFu
aWZlc3QtJXMtKi5wb3B1bGF0ZV9zeXNyb290IiAlIHBrZ2FyY2gpKToKICAgICAgICAgICAgaWYg
bWFuaWZlc3QuZW5kc3dpdGgoIi1pbml0aWFsLnBvcHVsYXRlX3N5c3Jvb3QiKToKICAgICAgICAg
ICAgICAgICMgc2tpcCBnbGliYy1pbml0aWFsIGFuZCBsaWJnY2MtaW5pdGlhbCBkdWUgdG8gZmls
ZSBvdmVybGFwCiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICBpZiBub3QgbmF0
aXZlIGFuZCAobWFuaWZlc3QuZW5kc3dpdGgoIi1uYXRpdmUucG9wdWxhdGVfc3lzcm9vdCIpIG9y
ICJuYXRpdmVzZGstIiBpbiBtYW5pZmVzdCk6CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAg
ICAgICAgICBpZiBuYXRpdmUgYW5kIG5vdCAobWFuaWZlc3QuZW5kc3dpdGgoIi1uYXRpdmUucG9w
dWxhdGVfc3lzcm9vdCIpIG9yIG1hbmlmZXN0LmVuZHN3aXRoKCItY3Jvc3MucG9wdWxhdGVfc3lz
cm9vdCIpIG9yICItY3Jvc3MtIiBpbiBtYW5pZmVzdCk6CiAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICB0bWFuaWZlc3QgPSB0YXJnZXRkaXIgKyAiLyIgKyBvcy5wYXRoLmJhc2Vu
YW1lKG1hbmlmZXN0KQogICAgICAgICAgICBpZiBvcy5wYXRoLmV4aXN0cyh0bWFuaWZlc3QpOgog
ICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAg
b3MubGluayhtYW5pZmVzdCwgdG1hbmlmZXN0KQogICAgICAgICAgICBleGNlcHQgT1NFcnJvciBh
cyBlcnI6CiAgICAgICAgICAgICAgICBpZiBlcnIuZXJybm8gPT0gZXJybm8uRVhERVY6CiAgICAg
ICAgICAgICAgICAgICAgYmIudXRpbHMuY29weWZpbGUobWFuaWZlc3QsIHRtYW5pZmVzdCkKICAg
ICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAgICAgcmFpc2UKICAgICAgICAgICAg
d2l0aCBvcGVuKG1hbmlmZXN0LCAiciIpIGFzIGY6CiAgICAgICAgICAgICAgICBmb3IgbCBpbiBm
OgogICAgICAgICAgICAgICAgICAgIGwgPSBsLnN0cmlwKCkKICAgICAgICAgICAgICAgICAgICBp
ZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoIik6CiAgICAgICAgICAgICAgICAgICAgICAgIGZpeG1l
LmFwcGVuZChsKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAg
ICAgICAgIGlmIGwuZW5kc3dpdGgoIi9maXhtZXBhdGguY21kIik6CiAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAgICAgZGVzdCA9IGwucmVwbGFjZShzdGFn
aW5nZGlyLCAiIikKICAgICAgICAgICAgICAgICAgICBkZXN0ID0gdGFyZ2V0ZGlyICsgIi8iICsg
Ii8iLmpvaW4oZGVzdC5zcGxpdCgiLyIpWzM6XSkKICAgICAgICAgICAgICAgICAgICBpZiBsLmVu
ZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWRpcihsLCB0
YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAgICAgICAgICAgc3RhZ2lu
Z19jb3B5ZmlsZShsLCB0YXJnZXRkaXIsIGRlc3QsIHBvc3RpbnN0cywgc2VlbmRpcnMpCiAgICAg
ICAgICAgICAgICAgICAgZXhjZXB0IEZpbGVFeGlzdHNFcnJvcjoKICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWUKCiAgICBzdGFnaW5nX3Byb2Nlc3NmaXhtZShmaXhtZSwgdGFyZ2V0ZGly
LCB0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBkKQogICAgZm9yIHAgaW4gcG9zdGluc3Rz
OgogICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KHAsIHNoZWxsPVRydWUsIHN0ZGVycj1z
dWJwcm9jZXNzLlNURE9VVCkKCiMKIyBNYW5pZmVzdHMgaGVyZSBhcmUgY29tcGxpY2F0ZWQuIFRo
ZSBtYWluIHN5c3Jvb3QgYXJlYSBoYXMgdGhlIHVucGFja2VkIHNzdGF0ZQojIHdoaWNoIHVzIHVu
cmVsb2NhdGVkIGFuZCB0cmFja2VkIGJ5IHRoZSBtYWluIHNzdGF0ZSBtYW5pZmVzdHMuIEVhY2gg
cmVjaXBlCiMgc3BlY2lmaWMgc3lzcm9vdCBoYXMgbWFuaWZlc3RzIGZvciBlYWNoIGRlcGVuZGVu
Y3kgdGhhdCBpcyBpbnN0YWxsZWQgdGhlcmUuCiMgVGhlIHRhc2sgaGFzaCBpcyB1c2VkIHRvIHRl
bGwgd2hldGhlciB0aGUgZGF0YSBuZWVkcyB0byBiZSByZWluc3RhbGxlZC4gV2UKIyB1c2UgYSBz
eW1saW5rIHRvIHBvaW50IHRvIHRoZSBjdXJyZW50bHkgaW5zdGFsbGVkIGhhc2guIFRoZXJlIGlz
IGFsc28gYQojICJjb21wbGV0ZSIgc3RhbXAgZmlsZSB3aGljaCBpcyB1c2VkIHRvIG1hcmsgaWYg
aW5zdGFsbGF0aW9uIGNvbXBsZXRlZC4gSWYKIyBzb21ldGhpbmcgZmFpbHMgKGUuZy4gYSBwb3N0
aW5zdCksIHRoaXMgd29uJ3QgZ2V0IHdyaXR0ZW4gYW5kIHdlIHdvdWxkCiMgcmVtb3ZlIGFuZCBy
ZWluc3RhbGwgdGhlIGRlcGVuZGVuY3kuIFRoaXMgYWxzbyBtZWFucyBwYXJ0aWFsbHkgaW5zdGFs
bGVkCiMgZGVwZW5kZW5jaWVzIHNob3VsZCBnZXQgY2xlYW5lZCB1cCBjb3JyZWN0bHkuCiMKCmRl
ZiBzdGFnaW5nX2NvcHlmaWxlKGMsIHRhcmdldCwgZGVzdCwgcG9zdGluc3RzLCBzZWVuZGlycyk6
CiAgICBpbXBvcnQgZXJybm8KCiAgICBkZXN0ZGlyID0gb3MucGF0aC5kaXJuYW1lKGRlc3QpCiAg
ICBpZiBkZXN0ZGlyIG5vdCBpbiBzZWVuZGlyczoKICAgICAgICBiYi51dGlscy5ta2RpcmhpZXIo
ZGVzdGRpcikKICAgICAgICBzZWVuZGlycy5hZGQoZGVzdGRpcikKICAgIGlmICIvdXNyL2Jpbi9w
b3N0aW5zdC0iIGluIGM6CiAgICAgICAgcG9zdGluc3RzLmFwcGVuZChkZXN0KQogICAgaWYgb3Mu
cGF0aC5pc2xpbmsoYyk6CiAgICAgICAgbGlua3RvID0gb3MucmVhZGxpbmsoYykKICAgICAgICBp
ZiBvcy5wYXRoLmxleGlzdHMoZGVzdCk6CiAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmlzbGlu
ayhkZXN0KToKICAgICAgICAgICAgICAgIHJhaXNlIE9TRXJyb3IoZXJybm8uRUVYSVNULCAiTGlu
ayAlcyBhbHJlYWR5IGV4aXN0cyBhcyBhIGZpbGUiICUgZGVzdCwgZGVzdCkKICAgICAgICAgICAg
aWYgb3MucmVhZGxpbmsoZGVzdCkgPT0gbGlua3RvOgogICAgICAgICAgICAgICAgcmV0dXJuIGRl
c3QKICAgICAgICAgICAgcmFpc2UgT1NFcnJvcihlcnJuby5FRVhJU1QsICJMaW5rICVzIGFscmVh
ZHkgZXhpc3RzIHRvIGEgZGlmZmVyZW50IGxvY2F0aW9uPyAoJXMgdnMgJXMpIiAlIChkZXN0LCBv
cy5yZWFkbGluayhkZXN0KSwgbGlua3RvKSwgZGVzdCkKICAgICAgICBvcy5zeW1saW5rKGxpbmt0
bywgZGVzdCkKICAgICAgICAjYmIud2FybihjKQogICAgZWxzZToKICAgICAgICB0cnk6CiAgICAg
ICAgICAgIG9zLmxpbmsoYywgZGVzdCkKICAgICAgICBleGNlcHQgT1NFcnJvciBhcyBlcnI6CiAg
ICAgICAgICAgIGlmIGVyci5lcnJubyA9PSBlcnJuby5FWERFVjoKICAgICAgICAgICAgICAgIGJi
LnV0aWxzLmNvcHlmaWxlKGMsIGRlc3QpCiAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAg
ICByYWlzZQogICAgcmV0dXJuIGRlc3QKCmRlZiBzc3RhdGVfY2xlYW5fbWFuaWZlc3QobWFuaWZl
c3QsIGQsIHByZWZpeD1Ob25lKToKICAgIGltcG9ydCBvZS5wYXRoCgogICAgbWZpbGUgPSBvcGVu
KG1hbmlmZXN0KQogICAgZW50cmllcyA9IG1maWxlLnJlYWRsaW5lcygpCiAgICBtZmlsZS5jbG9z
ZSgpCgogICAgZm9yIGVudHJ5IGluIGVudHJpZXM6CiAgICAgICAgZW50cnkgPSBlbnRyeS5zdHJp
cCgpCiAgICAgICAgaWYgcHJlZml4IGFuZCBub3QgZW50cnkuc3RhcnRzd2l0aCgiLyIpOgogICAg
ICAgICAgICBlbnRyeSA9IHByZWZpeCArICIvIiArIGVudHJ5CiAgICAgICAgYmIuZGVidWcoMiwg
IlJlbW92aW5nIG1hbmlmZXN0OiAlcyIgJSBlbnRyeSkKICAgICAgICAjIFdlIGNhbiByYWNlIGFn
YWluc3QgYW5vdGhlciBwYWNrYWdlIHBvcHVsYXRpbmcgZGlyZWN0b3JpZXMgYXMgd2UncmUgcmVt
b3ZpbmcgdGhlbQogICAgICAgICMgc28gd2UgaWdub3JlIGVycm9ycyBoZXJlLgogICAgICAgIHRy
eToKICAgICAgICAgICAgaWYgZW50cnkuZW5kc3dpdGgoIi8iKToKICAgICAgICAgICAgICAgIGlm
IG9zLnBhdGguaXNsaW5rKGVudHJ5WzotMV0pOgogICAgICAgICAgICAgICAgICAgIG9zLnJlbW92
ZShlbnRyeVs6LTFdKQogICAgICAgICAgICAgICAgZWxpZiBvcy5wYXRoLmV4aXN0cyhlbnRyeSkg
YW5kIGxlbihvcy5saXN0ZGlyKGVudHJ5KSkgPT0gMDoKICAgICAgICAgICAgICAgICAgICBvcy5y
bWRpcihlbnRyeVs6LTFdKQogICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgb3MucmVt
b3ZlKGVudHJ5KQogICAgICAgIGV4Y2VwdCBPU0Vycm9yOgogICAgICAgICAgICBwYXNzCgogICAg
cG9zdHJtID0gbWFuaWZlc3QgKyAiLnBvc3RybSIKICAgIGlmIG9zLnBhdGguZXhpc3RzKG1hbmlm
ZXN0ICsgIi5wb3N0cm0iKToKICAgICAgICBpbXBvcnQgc3VicHJvY2VzcwogICAgICAgIG9zLmNo
bW9kKHBvc3RybSwgMG83NTUpCiAgICAgICAgc3VicHJvY2Vzcy5jaGVja19jYWxsKHBvc3RybSwg
c2hlbGw9VHJ1ZSkKICAgICAgICBvZS5wYXRoLnJlbW92ZShwb3N0cm0pCgogICAgb2UucGF0aC5y
ZW1vdmUobWFuaWZlc3QpCgpkZWYgc2V0c2NlbmVfZGVwdmFsaWQodGFzaywgdGFza2RlcGVuZGVl
cywgbm90bmVlZGVkLCBkLCBsb2c9Tm9uZSk6CiAgICAjIHRhc2tkZXBlbmRlZXMgaXMgYSBkaWN0
IG9mIHRhc2tzIHdoaWNoIGRlcGVuZCBvbiB0YXNrLCBlYWNoIGJlaW5nIGEgMyBpdGVtIGxpc3Qg
b2YgW1BOLCBUQVNLTkFNRSwgRklMRU5BTUVdCiAgICAjIHRhc2sgaXMgaW5jbHVkZWQgaW4gdGFz
a2RlcGVuZGVlcyB0b28KICAgICMgUmV0dXJuIC0gRmFsc2UgLSBXZSBuZWVkIHRoaXMgZGVwZW5k
ZW5jeQogICAgIyAgICAgICAgLSBUcnVlIC0gV2UgY2FuIHNraXAgdGhpcyBkZXBlbmRlbmN5CiAg
ICBpbXBvcnQgcmUKCiAgICBkZWYgbG9naXQobXNnLCBsb2cpOgogICAgICAgIGlmIGxvZyBpcyBu
b3QgTm9uZToKICAgICAgICAgICAgbG9nLmFwcGVuZChtc2cpCiAgICAgICAgZWxzZToKICAgICAg
ICAgICAgYmIuZGVidWcoMiwgbXNnKQoKICAgIGxvZ2l0KCJDb25zaWRlcmluZyBzZXRzY2VuZSB0
YXNrOiAlcyIgJSAoc3RyKHRhc2tkZXBlbmRlZXNbdGFza10pKSwgbG9nKQoKICAgIGRlZiBpc05h
dGl2ZUNyb3NzKHgpOgogICAgICAgIHJldHVybiB4LmVuZHN3aXRoKCItbmF0aXZlIikgb3IgIi1j
cm9zcy0iIGluIHggb3IgIi1jcm9zc3NkayIgaW4geCBvciB4LmVuZHN3aXRoKCItY3Jvc3MiKQoK
ICAgICMgV2Ugb25seSBuZWVkIHRvIHRyaWdnZXIgcG9wdWxhdGVfbGljIHRocm91Z2ggZGlyZWN0
IGRlcGVuZGVuY2llcwogICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcG9wdWxh
dGVfbGljIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAgICMgc3Rhc2hfbG9jYWxlIGFuZCBnY2Nf
c3Rhc2hfYnVpbGRkaXIgYXJlIG5ldmVyIG5lZWRlZCBhcyBhIGRlcGVuZGVuY3kgZm9yIGJ1aWx0
IG9iamVjdHMKICAgIGlmIHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0gImRvX3N0YXNoX2xvY2Fs
ZSIgb3IgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fZ2NjX3N0YXNoX2J1aWxkZGlyIjoK
ICAgICAgICByZXR1cm4gVHJ1ZQoKICAgICMgV2Ugb25seSBuZWVkIHRvIHRyaWdnZXIgcGFja2Fn
ZWRhdGEgdGhyb3VnaCBkaXJlY3QgZGVwZW5kZW5jaWVzCiAgICAjIGJ1dCBuZWVkIHRvIHByZXNl
cnZlIHBhY2thZ2VkYXRhIG9uIHBhY2thZ2VkYXRhIGxpbmtzCiAgICBpZiB0YXNrZGVwZW5kZWVz
W3Rhc2tdWzFdID09ICJkb19wYWNrYWdlZGF0YSI6CiAgICAgICAgZm9yIGRlcCBpbiB0YXNrZGVw
ZW5kZWVzOgogICAgICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW2RlcF1bMV0gPT0gImRvX3BhY2th
Z2VkYXRhIjoKICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgIHJldHVybiBUcnVl
CgogICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgogICAgICAgIGxvZ2l0KCIgIGNvbnNpZGVy
aW5nIGRlcGVuZGVuY3k6ICVzIiAlIChzdHIodGFza2RlcGVuZGVlc1tkZXBdKSksIGxvZykKICAg
ICAgICBpZiB0YXNrID09IGRlcDoKICAgICAgICAgICAgY29udGludWUKICAgICAgICBpZiBkZXAg
aW4gbm90bmVlZGVkOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgICMgZG9fcGFja2FnZV93
cml0ZV8qIGFuZCBkb19wYWNrYWdlIGRvZXNuJ3QgbmVlZCBkb19wYWNrYWdlCiAgICAgICAgaWYg
dGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcGFja2FnZSIgYW5kIHRhc2tkZXBlbmRlZXNb
ZGVwXVsxXSBpbiBbJ2RvX3BhY2thZ2UnLCAnZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFj
a2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0nLCAnZG9fcGFja2FnZWRhdGEn
LCAnZG9fcGFja2FnZV9xYSddOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgICMgZG9fcGFj
a2FnZV93cml0ZV8qIG5lZWQgZG9fcG9wdWxhdGVfc3lzcm9vdCBhcyB0aGV5J3JlIG1haW5seSBw
b3N0aW5zdGFsbCBkZXBlbmRlbmNpZXMKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFd
ID09ICJkb19wb3B1bGF0ZV9zeXNyb290IiBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdIGluIFsn
ZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2Fn
ZV93cml0ZV9ycG0nXToKICAgICAgICAgICAgcmV0dXJuIEZhbHNlCiAgICAgICAgIyBkb19wYWNr
YWdlL3BhY2thZ2VkYXRhL3BhY2thZ2VfcWEgZG9uJ3QgbmVlZCBkb19wb3B1bGF0ZV9zeXNyb290
CiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9v
dCIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBbJ2RvX3BhY2thZ2UnLCAnZG9fcGFja2Fn
ZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgICMg
TmF0aXZlL0Nyb3NzIHBhY2thZ2VzIGRvbid0IGV4aXN0IGFuZCBhcmUgbm9leGVjIGFueXdheQog
ICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKSBhbmQgdGFza2Rl
cGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2FnZV93
cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0nLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9f
cGFja2FnZScsICdkb19wYWNrYWdlX3FhJ106CiAgICAgICAgICAgIGNvbnRpbnVlCgogICAgICAg
ICMgVGhpcyBpcyBkdWUgdG8gdGhlIFtkZXBlbmRzXSBpbiB1c2VyYWRkLmJiY2xhc3MgY29tcGxp
Y2F0aW5nIG1hdHRlcnMKICAgICAgICAjIFRoZSBsb2dpYyAqaXMqIHJldmVyc2VkIGhlcmUgZHVl
IHRvIHRoZSB3YXkgaGFyZCBzZXRzY2VuZSBkZXBlbmRlbmNpZXMgYXJlIGluamVjdGVkCiAgICAg
ICAgaWYgKHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0gJ2RvX3BhY2thZ2UnIG9yIHRhc2tkZXBl
bmRlZXNbdGFza11bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5c3Jvb3QnKSBhbmQgdGFza2RlcGVuZGVl
c1tkZXBdWzBdLmVuZHN3aXRoKCgnc2hhZG93LW5hdGl2ZScsICdzaGFkb3ctc3lzcm9vdCcsICdi
YXNlLXBhc3N3ZCcsICdwc2V1ZG8tbmF0aXZlJykpIGFuZCB0YXNrZGVwZW5kZWVzW2RlcF1bMV0g
PT0gJ2RvX3BvcHVsYXRlX3N5c3Jvb3QnOgogICAgICAgICAgICBjb250aW51ZQoKICAgICAgICAj
IENvbnNpZGVyIHN5c3Jvb3QgZGVwZW5kaW5nIG9uIHN5c3Jvb3QgdGFza3MKICAgICAgICBpZiB0
YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19wb3B1bGF0ZV9zeXNyb290JyBhbmQgdGFza2Rl
cGVuZGVlc1tkZXBdWzFdID09ICdkb19wb3B1bGF0ZV9zeXNyb290JzoKICAgICAgICAgICAgIyBB
bGxvdyBleGNsdWRpbmcgY2VydGFpbiByZWN1cnNpdmUgZGVwZW5kZW5jaWVzLiBJZiBhIHJlY2lw
ZSBuZWVkcyBpdCBzaG91bGQgYWRkIGEKICAgICAgICAgICAgIyBzcGVjaWZpYyBkZXBlbmRlbmN5
IGl0c2VsZiwgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBvbmUgb2YgaXRzIGRlcGVuZGVlcyB0byBw
dWxsCiAgICAgICAgICAgICMgdGhlbSBpbi4KICAgICAgICAgICAgIyBTZWUgYWxzbyBodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1K
YW51YXJ5LzE0NjMyNC5odG1sCiAgICAgICAgICAgIG5vdF9uZWVkZWQgPSBGYWxzZQogICAgICAg
ICAgICBleGNsdWRlZGVwcyA9IGQuZ2V0VmFyKCdfU1NUQVRFX0VYQ0xVREVERVBTX1NZU1JPT1Qn
KQogICAgICAgICAgICBpZiBleGNsdWRlZGVwcyBpcyBOb25lOgogICAgICAgICAgICAgICAgIyBD
YWNoZSB0aGUgcmVndWxhciBleHByZXNzaW9ucyBmb3Igc3BlZWQKICAgICAgICAgICAgICAgIGV4
Y2x1ZGVkZXBzID0gW10KICAgICAgICAgICAgICAgIGZvciBleGNsIGluIChkLmdldFZhcignU1NU
QVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKSBvciAiIikuc3BsaXQoKToKICAgICAgICAgICAgICAg
ICAgICBleGNsdWRlZGVwcy5hcHBlbmQoKHJlLmNvbXBpbGUoZXhjbC5zcGxpdCgnLT4nLCAxKVsw
XSksIHJlLmNvbXBpbGUoZXhjbC5zcGxpdCgnLT4nLCAxKVsxXSkpKQogICAgICAgICAgICAgICAg
ZC5zZXRWYXIoJ19TU1RBVEVfRVhDTFVERURFUFNfU1lTUk9PVCcsIGV4Y2x1ZGVkZXBzKQogICAg
ICAgICAgICBmb3IgZXhjbCBpbiBleGNsdWRlZGVwczoKICAgICAgICAgICAgICAgIGlmIGV4Y2xb
MF0ubWF0Y2godGFza2RlcGVuZGVlc1tkZXBdWzBdKToKICAgICAgICAgICAgICAgICAgICBpZiBl
eGNsWzFdLm1hdGNoKHRhc2tkZXBlbmRlZXNbdGFza11bMF0pOgogICAgICAgICAgICAgICAgICAg
ICAgICBub3RfbmVlZGVkID0gVHJ1ZQogICAgICAgICAgICAgICAgICAgICAgICBicmVhawogICAg
ICAgICAgICBpZiBub3RfbmVlZGVkOgogICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAg
ICAgIyBGb3IgbWV0YS1leHRzZGstdG9vbGNoYWluIHdlIHdhbnQgYWxsIHN5c3Jvb3QgZGVwZW5k
ZW5jaWVzCiAgICAgICAgICAgIGlmIHRhc2tkZXBlbmRlZXNbZGVwXVswXSA9PSAnbWV0YS1leHRz
ZGstdG9vbGNoYWluJzoKICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAj
IE5hdGl2ZS9Dcm9zcyBwb3B1bGF0ZV9zeXNyb290IG5lZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAg
ICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1t0YXNrXVswXSkgYW5kIGlz
TmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKToKICAgICAgICAgICAgICAgIHJldHVy
biBGYWxzZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1bGF0ZV9zeXNyb290IGRlcGVuZGVkIG9u
IGJ5IGNyb3NzIHRvb2xzIG5lZWQgdG8gYmUgaW5zdGFsbGVkCiAgICAgICAgICAgIGlmIGlzTmF0
aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKToKICAgICAgICAgICAgICAgIHJldHVybiBG
YWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9jcm9zcyB0b29scyBkZXBlbmRlZCB1cG9uIGJ5IHRh
cmdldCBzeXNyb290IGFyZSBub3QgbmVlZGVkCiAgICAgICAgICAgICMgQWRkIGFuIGV4Y2VwdGlv
biBmb3Igc2hhZG93LW5hdGl2ZSBhcyByZXF1aXJlZCBieSB1c2VyYWRkLmJiY2xhc3MKICAgICAg
ICAgICAgaWYgaXNOYXRpdmVDcm9zcyh0YXNrZGVwZW5kZWVzW3Rhc2tdWzBdKSBhbmQgdGFza2Rl
cGVuZGVlc1t0YXNrXVswXSAhPSAnc2hhZG93LW5hdGl2ZSc6CiAgICAgICAgICAgICAgICBjb250
aW51ZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1bGF0ZV9zeXNyb290IG5lZWQgdGhlaXIgZGVw
ZW5kZW5jaWVzCiAgICAgICAgICAgIHJldHVybiBGYWxzZQoKICAgICAgICBpZiB0YXNrZGVwZW5k
ZWVzW3Rhc2tdWzFdID09ICdkb19zaGFyZWRfd29ya2Rpcic6CiAgICAgICAgICAgIGNvbnRpbnVl
CgogICAgICAgIGlmIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfbGljIjoK
ICAgICAgICAgICAgY29udGludWUKCgogICAgICAgICMgU2FmZSBmYWxsdGhyb3VnaCBkZWZhdWx0
CiAgICAgICAgbG9naXQoIiBEZWZhdWx0IHNldHNjZW5lIGRlcGVuZGVuY3kgZmFsbCB0aHJvdWdo
IGR1ZSB0byBkZXBlbmRlbmN5OiAlcyIgJSAoc3RyKHRhc2tkZXBlbmRlZXNbZGVwXSkpLCBsb2cp
CiAgICAgICAgcmV0dXJuIEZhbHNlCiAgICByZXR1cm4gVHJ1ZQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.do_prepare_recipe_sysroot.14489"
Content-Disposition: attachment; 
	filename="run.do_prepare_recipe_sysroot.14489"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3ah34>
X-Attachment-Id: f_jz9oy3ah34

ZGVmIGRvX3ByZXBhcmVfcmVjaXBlX3N5c3Jvb3QoZCk6CiAgICBiYi5idWlsZC5leGVjX2Z1bmMo
ImV4dGVuZF9yZWNpcGVfc3lzcm9vdCIsIGQpCgpkb19wcmVwYXJlX3JlY2lwZV9zeXNyb290KGQp
CgpkZWYgZXh0ZW5kX3JlY2lwZV9zeXNyb290KGQpOgogICAgaW1wb3J0IGNvcHkKICAgIGltcG9y
dCBzdWJwcm9jZXNzCiAgICBpbXBvcnQgZXJybm8KICAgIGltcG9ydCBjb2xsZWN0aW9ucwogICAg
aW1wb3J0IGdsb2IKCiAgICB0YXNrZGVwZGF0YSA9IGQuZ2V0VmFyKCJCQl9UQVNLREVQREFUQSIs
IEZhbHNlKQogICAgbXl0YXNrbmFtZSA9IGQuZ2V0VmFyKCJCQl9SVU5UQVNLIikKICAgIGlmIG15
dGFza25hbWUuZW5kc3dpdGgoIl9zZXRzY2VuZSIpOgogICAgICAgIG15dGFza25hbWUgPSBteXRh
c2tuYW1lLnJlcGxhY2UoIl9zZXRzY2VuZSIsICIiKQogICAgd29ya2RpciA9IGQuZ2V0VmFyKCJX
T1JLRElSIikKICAgICNiYi53YXJuKHN0cih0YXNrZGVwZGF0YSkpCiAgICBwbiA9IGQuZ2V0VmFy
KCJQTiIpCiAgICBzdGFnaW5nZGlyID0gZC5nZXRWYXIoIlNUQUdJTkdfRElSIikKICAgIHNoYXJl
ZG1hbmlmZXN0cyA9IGQuZ2V0VmFyKCJDT01QT05FTlRTX0RJUiIpICsgIi9tYW5pZmVzdHMiCiAg
ICByZWNpcGVzeXNyb290ID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UIikKICAgIHJlY2lwZXN5
c3Jvb3RuYXRpdmUgPSBkLmdldFZhcigiUkVDSVBFX1NZU1JPT1RfTkFUSVZFIikKCiAgICAjIERl
dGVjdCBiaXRiYWtlIC1iIHVzYWdlCiAgICBub2RlcHMgPSBkLmdldFZhcigiQkJfTElNSVRFRERF
UFMiKSBvciBGYWxzZQogICAgaWYgbm9kZXBzOgogICAgICAgIGxvY2sgPSBiYi51dGlscy5sb2Nr
ZmlsZShyZWNpcGVzeXNyb290ICsgIi9zeXNyb290LmxvY2siKQogICAgICAgIHN0YWdpbmdfcG9w
dWxhdGVfc3lzcm9vdF9kaXIocmVjaXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgVHJ1
ZSwgZCkKICAgICAgICBzdGFnaW5nX3BvcHVsYXRlX3N5c3Jvb3RfZGlyKHJlY2lwZXN5c3Jvb3Qs
IHJlY2lwZXN5c3Jvb3RuYXRpdmUsIEZhbHNlLCBkKQogICAgICAgIGJiLnV0aWxzLnVubG9ja2Zp
bGUobG9jaykKICAgICAgICByZXR1cm4KCiAgICBzdGFydCA9IE5vbmUKICAgIGNvbmZpZ3VyZWRl
cHMgPSBbXQogICAgZm9yIGRlcCBpbiB0YXNrZGVwZGF0YToKICAgICAgICBkYXRhID0gdGFza2Rl
cGRhdGFbZGVwXQogICAgICAgIGlmIGRhdGFbMV0gPT0gbXl0YXNrbmFtZSBhbmQgZGF0YVswXSA9
PSBwbjoKICAgICAgICAgICAgc3RhcnQgPSBkZXAKICAgICAgICAgICAgYnJlYWsKICAgIGlmIHN0
YXJ0IGlzIE5vbmU6CiAgICAgICAgYmIuZmF0YWwoIkNvdWxkbid0IGZpbmQgb3Vyc2VsZiBpbiBC
Ql9UQVNLREVQREFUQT8iKQoKICAgICMgV2UgbmVlZCB0byBmaWd1cmUgb3V0IHdoaWNoIHN5c3Jv
b3QgZmlsZXMgd2UgbmVlZCB0byBleHBvc2UgdG8gdGhpcyB0YXNrLgogICAgIyBUaGlzIG5lZWRz
IHRvIG1hdGNoIHdoYXQgd291bGQgZ2V0IHJlc3RvcmVkIGZyb20gc3N0YXRlLCB3aGljaCBpcyBj
b250cm9sbGVkCiAgICAjIHVsdGltYXRlbHkgYnkgY2FsbHMgZnJvbSBiaXRiYWtlIHRvIHNldHNj
ZW5lX2RlcHZhbGlkKCkuCiAgICAjIFRoYXQgZnVuY3Rpb24gZXhwZWN0cyBhIHNldHNjZW5lIGRl
cGVuZGVuY3kgdHJlZS4gV2UgYnVpbGQgYSBkZXBlbmRlbmN5IHRyZWUKICAgICMgY29uZGVuc2Vk
IHRvIGludGVyLXNzdGF0ZSB0YXNrIGRlcGVuZGVuY2llcywgc2ltaWxhciB0byB0aGF0IHVzZWQg
Ynkgc2V0c2NlbmUKICAgICMgdGFza3MuIFdlIGNhbiB0aGVuIGNhbGwgaW50byBzZXRzY2VuZV9k
ZXB2YWxpZCgpIGFuZCBkZWNpZGUKICAgICMgd2hpY2ggZGVwZW5kZW5jaWVzIHdlIGNhbiAic2Vl
IiBhbmQgc2hvdWxkIGV4cG9zZSBpbiB0aGUgcmVjaXBlIHNwZWNpZmljIHN5c3Jvb3QuCiAgICBz
ZXRzY2VuZWRlcHMgPSBjb3B5LmRlZXBjb3B5KHRhc2tkZXBkYXRhKQoKICAgIHN0YXJ0ID0gc2V0
KFtzdGFydF0pCgogICAgc3N0YXRldGFza3MgPSBkLmdldFZhcigiU1NUQVRFVEFTS1MiKS5zcGxp
dCgpCiAgICAjIEFkZCByZWNpcGUgc3BlY2lmaWMgdGFza3MgcmVmZXJlbmNlZCBieSBzZXRzY2Vu
ZV9kZXB2YWxpZCgpCiAgICBzc3RhdGV0YXNrcy5hcHBlbmQoImRvX3N0YXNoX2xvY2FsZSIpCgog
ICAgZGVmIHByaW50X2RlcF90cmVlKGRlcHRyZWUpOgogICAgICAgIGRhdGEgPSAiIgogICAgICAg
IGZvciBkZXAgaW4gZGVwdHJlZToKICAgICAgICAgICAgZGVwcyA9ICIgICAgIiArICJcbiAgICAi
LmpvaW4oZGVwdHJlZVtkZXBdWzNdKSArICJcbiIKICAgICAgICAgICAgZGF0YSA9IGRhdGEgKyAi
JXM6XG4gICVzXG4gICVzXG4lcyAgJXNcbiAgJXNcbiIgJSAoZGVwdHJlZVtkZXBdWzBdLCBkZXB0
cmVlW2RlcF1bMV0sIGRlcHRyZWVbZGVwXVsyXSwgZGVwcywgZGVwdHJlZVtkZXBdWzRdLCBkZXB0
cmVlW2RlcF1bNV0pCiAgICAgICAgcmV0dXJuIGRhdGEKCiAgICAjYmIubm90ZSgiRnVsbCBkZXAg
dHJlZSBpczpcbiVzIiAlIHByaW50X2RlcF90cmVlKHRhc2tkZXBkYXRhKSkKCiAgICAjYmIubm90
ZSgiIHN0YXJ0MiBpcyAlcyIgJSBzdHIoc3RhcnQpKQoKICAgICMgSWYgc3RhcnQgaXMgYW4gc3N0
YXRlIHRhc2sgKGxpa2UgZG9fcGFja2FnZSkgd2UgbmVlZCB0byBhZGQgaW4gaXRzIGRpcmVjdCBk
ZXBlbmRlbmNpZXMKICAgICMgZWxzZSB0aGUgY29kZSBiZWxvdyB3b24ndCByZWN1cnNlIGludG8g
dGhlbS4KICAgIGZvciBkZXAgaW4gc2V0KHN0YXJ0KToKICAgICAgICBmb3IgZGVwMiBpbiBzZXRz
Y2VuZWRlcHNbZGVwXVszXToKICAgICAgICAgICAgc3RhcnQuYWRkKGRlcDIpCiAgICAgICAgc3Rh
cnQucmVtb3ZlKGRlcCkKCiAgICAjYmIubm90ZSgiIHN0YXJ0MyBpcyAlcyIgJSBzdHIoc3RhcnQp
KQoKICAgICMgQ3JlYXRlIGNvbGxhcHNlZCBkb19wb3B1bGF0ZV9zeXNyb290IC0+IGRvX3BvcHVs
YXRlX3N5c3Jvb3QgdHJlZQogICAgZm9yIGRlcCBpbiB0YXNrZGVwZGF0YToKICAgICAgICBkYXRh
ID0gc2V0c2NlbmVkZXBzW2RlcF0KICAgICAgICBpZiBkYXRhWzFdIG5vdCBpbiBzc3RhdGV0YXNr
czoKICAgICAgICAgICAgZm9yIGRlcDIgaW4gc2V0c2NlbmVkZXBzOgogICAgICAgICAgICAgICAg
ZGF0YTIgPSBzZXRzY2VuZWRlcHNbZGVwMl0KICAgICAgICAgICAgICAgIGlmIGRlcCBpbiBkYXRh
MlszXToKICAgICAgICAgICAgICAgICAgICBkYXRhMlszXS51cGRhdGUoc2V0c2NlbmVkZXBzW2Rl
cF1bM10pCiAgICAgICAgICAgICAgICAgICAgZGF0YTJbM10ucmVtb3ZlKGRlcCkKICAgICAgICAg
ICAgaWYgZGVwIGluIHN0YXJ0OgogICAgICAgICAgICAgICAgc3RhcnQudXBkYXRlKHNldHNjZW5l
ZGVwc1tkZXBdWzNdKQogICAgICAgICAgICAgICAgc3RhcnQucmVtb3ZlKGRlcCkKICAgICAgICAg
ICAgZGVsIHNldHNjZW5lZGVwc1tkZXBdCgogICAgIyBSZW1vdmUgY2lyY3VsYXIgcmVmZXJlbmNl
cwogICAgZm9yIGRlcCBpbiBzZXRzY2VuZWRlcHM6CiAgICAgICAgaWYgZGVwIGluIHNldHNjZW5l
ZGVwc1tkZXBdWzNdOgogICAgICAgICAgICBzZXRzY2VuZWRlcHNbZGVwXVszXS5yZW1vdmUoZGVw
KQoKICAgICNiYi5ub3RlKCJDb21wdXRlZCBkZXAgdHJlZSBpczpcbiVzIiAlIHByaW50X2RlcF90
cmVlKHNldHNjZW5lZGVwcykpCiAgICAjYmIubm90ZSgiIHN0YXJ0IGlzICVzIiAlIHN0cihzdGFy
dCkpCgogICAgIyBEaXJlY3QgZGVwZW5kZW5jaWVzIHNob3VsZCBiZSBwcmVzZW50IGFuZCBjYW4g
YmUgZGVwZW5kZWQgdXBvbgogICAgZm9yIGRlcCBpbiBzZXQoc3RhcnQpOgogICAgICAgIGlmIHNl
dHNjZW5lZGVwc1tkZXBdWzFdID09ICJkb19wb3B1bGF0ZV9zeXNyb290IjoKICAgICAgICAgICAg
aWYgZGVwIG5vdCBpbiBjb25maWd1cmVkZXBzOgogICAgICAgICAgICAgICAgY29uZmlndXJlZGVw
cy5hcHBlbmQoZGVwKQogICAgYmIubm90ZSgiRGlyZWN0IGRlcGVuZGVuY2llcyBhcmUgJXMiICUg
c3RyKGNvbmZpZ3VyZWRlcHMpKQogICAgI2JiLm5vdGUoIiBvciAlcyIgJSBzdHIoc3RhcnQpKQoK
ICAgIG1zZ2J1ZiA9IFtdCiAgICAjIENhbGwgaW50byBzZXRzY2VuZV9kZXB2YWxpZCBmb3IgZWFj
aCBzdWItZGVwZW5kZW5jeSBhbmQgb25seSBjb3B5IHN5c3Jvb3QgZmlsZXMKICAgICMgZm9yIG9u
ZXMgdGhhdCB3b3VsZCBiZSByZXN0b3JlZCBmcm9tIHNzdGF0ZS4KICAgIGRvbmUgPSBsaXN0KHN0
YXJ0KQogICAgbmV4dCA9IGxpc3Qoc3RhcnQpCiAgICB3aGlsZSBuZXh0OgogICAgICAgIG5ldyA9
IFtdCiAgICAgICAgZm9yIGRlcCBpbiBuZXh0OgogICAgICAgICAgICBkYXRhID0gc2V0c2NlbmVk
ZXBzW2RlcF0KICAgICAgICAgICAgZm9yIGRhdGFkZXAgaW4gZGF0YVszXToKICAgICAgICAgICAg
ICAgIGlmIGRhdGFkZXAgaW4gZG9uZToKICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAg
ICAgICAgICAgICAgdGFza2RlcHMgPSB7fQogICAgICAgICAgICAgICAgdGFza2RlcHNbZGVwXSA9
IHNldHNjZW5lZGVwc1tkZXBdWzoyXQogICAgICAgICAgICAgICAgdGFza2RlcHNbZGF0YWRlcF0g
PSBzZXRzY2VuZWRlcHNbZGF0YWRlcF1bOjJdCiAgICAgICAgICAgICAgICByZXR2YWwgPSBzZXRz
Y2VuZV9kZXB2YWxpZChkYXRhZGVwLCB0YXNrZGVwcywgW10sIGQsIG1zZ2J1ZikKICAgICAgICAg
ICAgICAgIGlmIHJldHZhbDoKICAgICAgICAgICAgICAgICAgICBtc2didWYuYXBwZW5kKCJTa2lw
cGluZyBzZXRzY2VuZSBkZXBlbmRlbmN5ICVzIGZvciBpbnN0YWxsYXRpb24gaW50byB0aGUgc3lz
cm9vdCIgJSBkYXRhZGVwKQogICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAg
ICAgICBkb25lLmFwcGVuZChkYXRhZGVwKQogICAgICAgICAgICAgICAgbmV3LmFwcGVuZChkYXRh
ZGVwKQogICAgICAgICAgICAgICAgaWYgZGF0YWRlcCBub3QgaW4gY29uZmlndXJlZGVwcyBhbmQg
c2V0c2NlbmVkZXBzW2RhdGFkZXBdWzFdID09ICJkb19wb3B1bGF0ZV9zeXNyb290IjoKICAgICAg
ICAgICAgICAgICAgICBjb25maWd1cmVkZXBzLmFwcGVuZChkYXRhZGVwKQogICAgICAgICAgICAg
ICAgICAgIG1zZ2J1Zi5hcHBlbmQoIkFkZGluZyBkZXBlbmRlbmN5IG9uICVzIiAlIHNldHNjZW5l
ZGVwc1tkYXRhZGVwXVswXSkKICAgICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAg
ICAgbXNnYnVmLmFwcGVuZCgiRm9sbG93aW5nIGRlcGVuZGVuY3kgb24gJXMiICUgc2V0c2NlbmVk
ZXBzW2RhdGFkZXBdWzBdKQogICAgICAgIG5leHQgPSBuZXcKCiAgICAjIFRoaXMgbG9nZ2luZyBp
cyB0b28gdmVyYm9zZSBmb3IgZGF5IHRvIGRheSB1c2Ugc2FkbHkKICAgICNiYi5kZWJ1ZygyLCAi
XG4iLmpvaW4obXNnYnVmKSkKCiAgICBkZXBkaXIgPSByZWNpcGVzeXNyb290bmF0aXZlICsgIi9p
bnN0YWxsZWRkZXBzIgogICAgYmIudXRpbHMubWtkaXJoaWVyKGRlcGRpcikKICAgIGJiLnV0aWxz
Lm1rZGlyaGllcihzaGFyZWRtYW5pZmVzdHMpCgogICAgbG9jayA9IGJiLnV0aWxzLmxvY2tmaWxl
KHJlY2lwZXN5c3Jvb3QgKyAiL3N5c3Jvb3QubG9jayIpCgogICAgZml4bWUgPSB7fQogICAgc2Vl
bmRpcnMgPSBzZXQoKQogICAgcG9zdGluc3RzID0gW10KICAgIG11bHRpbGlicyA9IHt9CiAgICBt
YW5pZmVzdHMgPSB7fQogICAgIyBBbGwgZmlsZXMgdGhhdCB3ZSdyZSBnb2luZyB0byBiZSBpbnN0
YWxsaW5nLCB0byBmaW5kIGNvbmZsaWN0cy4KICAgIGZpbGVzZXQgPSB7fQoKICAgIGZvciBmIGlu
IG9zLmxpc3RkaXIoZGVwZGlyKToKICAgICAgICBpZiBub3QgZi5lbmRzd2l0aCgiLmNvbXBsZXRl
Iik6CiAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgZiA9IGRlcGRpciArICIvIiArIGYKICAg
ICAgICBpZiBvcy5wYXRoLmlzbGluayhmKSBhbmQgbm90IG9zLnBhdGguZXhpc3RzKGYpOgogICAg
ICAgICAgICBiYi5ub3RlKCIlcyBubyBsb25nZXIgZXhpc3RzLCByZW1vdmluZyBmcm9tIHN5c3Jv
b3QiICUgZikKICAgICAgICAgICAgbG5rID0gb3MucmVhZGxpbmsoZi5yZXBsYWNlKCIuY29tcGxl
dGUiLCAiIikpCiAgICAgICAgICAgIHNzdGF0ZV9jbGVhbl9tYW5pZmVzdChkZXBkaXIgKyAiLyIg
KyBsbmssIGQsIHdvcmtkaXIpCiAgICAgICAgICAgIG9zLnVubGluayhmKQogICAgICAgICAgICBv
cy51bmxpbmsoZi5yZXBsYWNlKCIuY29tcGxldGUiLCAiIikpCgogICAgaW5zdGFsbGVkID0gW10K
ICAgIGZvciBkZXAgaW4gY29uZmlndXJlZGVwczoKICAgICAgICBjID0gc2V0c2NlbmVkZXBzW2Rl
cF1bMF0KICAgICAgICBpZiBteXRhc2tuYW1lIGluIFsiZG9fc2RrX2RlcGVuZHMiLCAiZG9fcG9w
dWxhdGVfc2RrX2V4dCJdIGFuZCBjLmVuZHN3aXRoKCItaW5pdGlhbCIpOgogICAgICAgICAgICBi
Yi5ub3RlKCJTa2lwcGluZyBpbml0aWFsIHNldHNjZW5lIGRlcGVuZGVuY3kgJXMgZm9yIGluc3Rh
bGxhdGlvbiBpbnRvIHRoZSBzeXNyb290IiAlIGMpCiAgICAgICAgICAgIGNvbnRpbnVlCiAgICAg
ICAgaW5zdGFsbGVkLmFwcGVuZChjKQoKICAgICMgV2Ugd2FudCB0byByZW1vdmUgYW55dGhpbmcg
d2hpY2ggdGhpcyB0YXNrIHByZXZpb3VzbHkgaW5zdGFsbGVkIGJ1dCBpcyBubyBsb25nZXIgYSBk
ZXBlbmRlbmN5CiAgICB0YXNraW5kZXggPSBkZXBkaXIgKyAiLyIgKyAiaW5kZXguIiArIG15dGFz
a25hbWUKICAgIGlmIG9zLnBhdGguZXhpc3RzKHRhc2tpbmRleCk6CiAgICAgICAgcG90ZW50aWFs
ID0gW10KICAgICAgICB3aXRoIG9wZW4odGFza2luZGV4LCAiciIpIGFzIGY6CiAgICAgICAgICAg
IGZvciBsIGluIGY6CiAgICAgICAgICAgICAgICBsID0gbC5zdHJpcCgpCiAgICAgICAgICAgICAg
ICBpZiBsIG5vdCBpbiBpbnN0YWxsZWQ6CiAgICAgICAgICAgICAgICAgICAgZmwgPSBkZXBkaXIg
KyAiLyIgKyBsCiAgICAgICAgICAgICAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKGZsKToK
ICAgICAgICAgICAgICAgICAgICAgICAgIyBXYXMgbGlrZWx5IGFscmVhZHkgdW5pbnN0YWxsZWQK
ICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgICAgICAgICBwb3Rl
bnRpYWwuYXBwZW5kKGwpCiAgICAgICAgIyBXZSBuZWVkIHRvIGVuc3VyZSBub3Qgb3RoZXIgdGFz
ayBuZWVkcyB0aGlzIGRlcGVuZGVuY3kuIFdlIGhvbGQgdGhlIHN5c3Jvb3QKICAgICAgICAjIGxv
Y2sgc28gd2UgY2Egc2VhcmNoIHRoZSBpbmRleGVzIHRvIGNoZWNrCiAgICAgICAgaWYgcG90ZW50
aWFsOgogICAgICAgICAgICBmb3IgaSBpbiBnbG9iLmdsb2IoZGVwZGlyICsgIi9pbmRleC4qIik6
CiAgICAgICAgICAgICAgICBpZiBpLmVuZHN3aXRoKCIuIiArIG15dGFza25hbWUpOgogICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICB3aXRoIG9wZW4oaSwgInIiKSBh
cyBmOgogICAgICAgICAgICAgICAgICAgIGZvciBsIGluIGY6CiAgICAgICAgICAgICAgICAgICAg
ICAgIGwgPSBsLnN0cmlwKCkKICAgICAgICAgICAgICAgICAgICAgICAgaWYgbCBpbiBwb3RlbnRp
YWw6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3RlbnRpYWwucmVtb3ZlKGwpCiAgICAg
ICAgZm9yIGwgaW4gcG90ZW50aWFsOgogICAgICAgICAgICBmbCA9IGRlcGRpciArICIvIiArIGwK
ICAgICAgICAgICAgYmIubm90ZSgiVGFzayAlcyBubyBsb25nZXIgZGVwZW5kcyBvbiAlcywgcmVt
b3ZpbmcgZnJvbSBzeXNyb290IiAlIChteXRhc2tuYW1lLCBsKSkKICAgICAgICAgICAgbG5rID0g
b3MucmVhZGxpbmsoZmwpCiAgICAgICAgICAgIHNzdGF0ZV9jbGVhbl9tYW5pZmVzdChkZXBkaXIg
KyAiLyIgKyBsbmssIGQsIHdvcmtkaXIpCiAgICAgICAgICAgIG9zLnVubGluayhmbCkKICAgICAg
ICAgICAgb3MudW5saW5rKGZsICsgIi5jb21wbGV0ZSIpCgogICAgbXNnX2V4aXN0cyA9IFtdCiAg
ICBtc2dfYWRkaW5nID0gW10KCiAgICBmb3IgZGVwIGluIGNvbmZpZ3VyZWRlcHM6CiAgICAgICAg
YyA9IHNldHNjZW5lZGVwc1tkZXBdWzBdCiAgICAgICAgaWYgYyBub3QgaW4gaW5zdGFsbGVkOgog
ICAgICAgICAgICBjb250aW51ZQogICAgICAgIHRhc2toYXNoID0gc2V0c2NlbmVkZXBzW2RlcF1b
NV0KICAgICAgICB0YXNrbWFuaWZlc3QgPSBkZXBkaXIgKyAiLyIgKyBjICsgIi4iICsgdGFza2hh
c2gKCiAgICAgICAgaWYgb3MucGF0aC5leGlzdHMoZGVwZGlyICsgIi8iICsgYyk6CiAgICAgICAg
ICAgIGxuayA9IG9zLnJlYWRsaW5rKGRlcGRpciArICIvIiArIGMpCiAgICAgICAgICAgIGlmIGxu
ayA9PSBjICsgIi4iICsgdGFza2hhc2ggYW5kIG9zLnBhdGguZXhpc3RzKGRlcGRpciArICIvIiAr
IGMgKyAiLmNvbXBsZXRlIik6CiAgICAgICAgICAgICAgICBtc2dfZXhpc3RzLmFwcGVuZChjKQog
ICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAg
IGJiLm5vdGUoIiVzIGV4aXN0cyBpbiBzeXNyb290LCBidXQgaXMgc3RhbGUgKCVzIHZzLiAlcyks
IHJlbW92aW5nLiIgJSAoYywgbG5rLCBjICsgIi4iICsgdGFza2hhc2gpKQogICAgICAgICAgICAg
ICAgc3N0YXRlX2NsZWFuX21hbmlmZXN0KGRlcGRpciArICIvIiArIGxuaywgZCwgd29ya2RpcikK
ICAgICAgICAgICAgICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjKQogICAgICAgICAgICAg
ICAgaWYgb3MucGF0aC5sZXhpc3RzKGRlcGRpciArICIvIiArIGMgKyAiLmNvbXBsZXRlIik6CiAg
ICAgICAgICAgICAgICAgICAgb3MudW5saW5rKGRlcGRpciArICIvIiArIGMgKyAiLmNvbXBsZXRl
IikKICAgICAgICBlbGlmIG9zLnBhdGgubGV4aXN0cyhkZXBkaXIgKyAiLyIgKyBjKToKICAgICAg
ICAgICAgb3MudW5saW5rKGRlcGRpciArICIvIiArIGMpCgogICAgICAgIG1zZ19hZGRpbmcuYXBw
ZW5kKGMpCgogICAgICAgIG9zLnN5bWxpbmsoYyArICIuIiArIHRhc2toYXNoLCBkZXBkaXIgKyAi
LyIgKyBjKQoKICAgICAgICBtYW5pZmVzdCwgZDIgPSBvZS5zc3RhdGVzaWcuZmluZF9zc3RhdGVf
bWFuaWZlc3QoYywgc2V0c2NlbmVkZXBzW2RlcF1bMl0sICJwb3B1bGF0ZV9zeXNyb290IiwgZCwg
bXVsdGlsaWJzKQogICAgICAgIGlmIGQyIGlzIG5vdCBkOgogICAgICAgICAgICAjIElmIHdlIGRv
bid0IGRvIHRoaXMsIHRoZSByZWNpcGUgc3lzcm9vdCB3aWxsIGJlIHBsYWNlZCBpbiB0aGUgd3Jv
bmcgV09SS0RJUiBmb3IgbXVsdGlsaWJzCiAgICAgICAgICAgICMgV2UgbmVlZCBhIGNvbnNpc3Rl
bnQgV09SS0RJUiBmb3IgdGhlIGltYWdlCiAgICAgICAgICAgIGQyLnNldFZhcigiV09SS0RJUiIs
IGQuZ2V0VmFyKCJXT1JLRElSIikpCiAgICAgICAgZGVzdHN5c3Jvb3QgPSBkMi5nZXRWYXIoIlJF
Q0lQRV9TWVNST09UIikKICAgICAgICAjIFdlIHB1dCBhbGxhcmNoIHJlY2lwZXMgaW50byB0aGUg
ZGVmYXVsdCBzeXNyb290CiAgICAgICAgaWYgbWFuaWZlc3QgYW5kICJhbGxhcmNoIiBpbiBtYW5p
ZmVzdDoKICAgICAgICAgICAgZGVzdHN5c3Jvb3QgPSBkLmdldFZhcigiUkVDSVBFX1NZU1JPT1Qi
KQoKICAgICAgICBuYXRpdmUgPSBGYWxzZQogICAgICAgIGlmIGMuZW5kc3dpdGgoIi1uYXRpdmUi
KSBvciAiLWNyb3NzLSIgaW4gYyBvciAiLWNyb3Nzc2RrIiBpbiBjOgogICAgICAgICAgICBuYXRp
dmUgPSBUcnVlCgogICAgICAgIGlmIG1hbmlmZXN0OgogICAgICAgICAgICBuZXdtYW5pZmVzdCA9
IGNvbGxlY3Rpb25zLk9yZGVyZWREaWN0KCkKICAgICAgICAgICAgdGFyZ2V0ZGlyID0gZGVzdHN5
c3Jvb3QKICAgICAgICAgICAgaWYgbmF0aXZlOgogICAgICAgICAgICAgICAgdGFyZ2V0ZGlyID0g
cmVjaXBlc3lzcm9vdG5hdGl2ZQogICAgICAgICAgICBpZiB0YXJnZXRkaXIgbm90IGluIGZpeG1l
OgogICAgICAgICAgICAgICAgZml4bWVbdGFyZ2V0ZGlyXSA9IFtdCiAgICAgICAgICAgIGZtID0g
Zml4bWVbdGFyZ2V0ZGlyXQoKICAgICAgICAgICAgd2l0aCBvcGVuKG1hbmlmZXN0LCAiciIpIGFz
IGY6CiAgICAgICAgICAgICAgICBtYW5pZmVzdHNbZGVwXSA9IG1hbmlmZXN0CiAgICAgICAgICAg
ICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgIGwgPSBsLnN0cmlwKCkKICAgICAg
ICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoIik6CiAgICAgICAgICAgICAg
ICAgICAgICAgIGZtLmFwcGVuZChsKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZQog
ICAgICAgICAgICAgICAgICAgIGlmIGwuZW5kc3dpdGgoIi9maXhtZXBhdGguY21kIik6CiAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAgICAgZGVzdCA9IGwu
cmVwbGFjZShzdGFnaW5nZGlyLCAiIikKICAgICAgICAgICAgICAgICAgICBkZXN0ID0gIi8iICsg
Ii8iLmpvaW4oZGVzdC5zcGxpdCgiLyIpWzM6XSkKICAgICAgICAgICAgICAgICAgICBuZXdtYW5p
ZmVzdFtsXSA9IHRhcmdldGRpciArIGRlc3QKCiAgICAgICAgICAgICAgICAgICAgIyBDaGVjayBp
ZiBmaWxlcyBoYXZlIGFscmVhZHkgYmVlbiBpbnN0YWxsZWQgYnkgYW5vdGhlcgogICAgICAgICAg
ICAgICAgICAgICMgcmVjaXBlIGFuZCBhYm9ydCBpZiB0aGV5IGhhdmUsIGV4cGxhaW5pbmcgd2hh
dCByZWNpcGVzIGFyZQogICAgICAgICAgICAgICAgICAgICMgY29uZmxpY3RpbmcuCiAgICAgICAg
ICAgICAgICAgICAgaGFzaG5hbWUgPSB0YXJnZXRkaXIgKyBkZXN0CiAgICAgICAgICAgICAgICAg
ICAgaWYgbm90IGhhc2huYW1lLmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAgICAg
IGlmIGhhc2huYW1lIGluIGZpbGVzZXQ6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBiYi5m
YXRhbCgiVGhlIGZpbGUgJXMgaXMgaW5zdGFsbGVkIGJ5IGJvdGggJXMgYW5kICVzLCBhYm9ydGlu
ZyIgJSAoZGVzdCwgYywgZmlsZXNldFtoYXNobmFtZV0pKQogICAgICAgICAgICAgICAgICAgICAg
ICBlbHNlOgogICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZXNldFtoYXNobmFtZV0gPSBj
CgogICAgICAgICAgICAjIEhhdmluZyBtdWx0aXBsZSBpZGVudGljYWwgbWFuaWZlc3RzIGluIGVh
Y2ggc3lzcm9vdCBlYXRzIGRpc2tzcGFjZSBzbwogICAgICAgICAgICAjIGNyZWF0ZSBhIHNoYXJl
ZCBwb29sIG9mIHRoZW0gYW5kIGhhcmRsaW5rIGlmIHdlIGNhbi4KICAgICAgICAgICAgIyBXZSBj
cmVhdGUgdGhlIG1hbmlmZXN0IGluIGFkdmFuY2Ugc28gdGhhdCBpZiBzb21ldGhpbmcgZmFpbHMg
ZHVyaW5nIGluc3RhbGxhdGlvbiwKICAgICAgICAgICAgIyBvciB0aGUgYnVpbGQgaXMgaW50ZXJy
dXB0ZWQsIHN1YnNlcXVlbnQgZXhldWN0aW9uIGNhbiBjbGVhbnVwLgogICAgICAgICAgICBzaGFy
ZWRtID0gc2hhcmVkbWFuaWZlc3RzICsgIi8iICsgb3MucGF0aC5iYXNlbmFtZSh0YXNrbWFuaWZl
c3QpCiAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhzaGFyZWRtKToKICAgICAgICAg
ICAgICAgIHNtbG9jayA9IGJiLnV0aWxzLmxvY2tmaWxlKHNoYXJlZG0gKyAiLmxvY2siKQogICAg
ICAgICAgICAgICAgIyBDYW4gcmFjZSBoZXJlLiBZb3UnZCB0aGluayBpdCBqdXN0IG1lYW5zIHdl
IG1heSBub3QgZW5kIHVwIHdpdGggYWxsIGNvcGllcyBoYXJkbGlua2VkIHRvIGVhY2ggb3RoZXIK
ICAgICAgICAgICAgICAgICMgYnV0IHB5dGhvbiBjYW4gbG9zZSBmaWxlIGhhbmRsZXMgc28gd2Ug
bmVlZCB0byBkbyB0aGlzIHVuZGVyIGEgbG9jay4KICAgICAgICAgICAgICAgIGlmIG5vdCBvcy5w
YXRoLmV4aXN0cyhzaGFyZWRtKToKICAgICAgICAgICAgICAgICAgICB3aXRoIG9wZW4oc2hhcmVk
bSwgJ3cnKSBhcyBtOgogICAgICAgICAgICAgICAgICAgICAgIGZvciBsIGluIG5ld21hbmlmZXN0
OgogICAgICAgICAgICAgICAgICAgICAgICAgICBkZXN0ID0gbmV3bWFuaWZlc3RbbF0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbS53cml0ZShkZXN0LnJlcGxhY2Uod29ya2RpciArICIvIiwg
IiIpICsgIlxuIikKICAgICAgICAgICAgICAgIGJiLnV0aWxzLnVubG9ja2ZpbGUoc21sb2NrKQog
ICAgICAgICAgICB0cnk6CiAgICAgICAgICAgICAgICBvcy5saW5rKHNoYXJlZG0sIHRhc2ttYW5p
ZmVzdCkKICAgICAgICAgICAgZXhjZXB0IE9TRXJyb3IgYXMgZXJyOgogICAgICAgICAgICAgICAg
aWYgZXJyLmVycm5vID09IGVycm5vLkVYREVWOgogICAgICAgICAgICAgICAgICAgIGJiLnV0aWxz
LmNvcHlmaWxlKHNoYXJlZG0sIHRhc2ttYW5pZmVzdCkKICAgICAgICAgICAgICAgIGVsc2U6CiAg
ICAgICAgICAgICAgICAgICAgcmFpc2UKICAgICAgICAgICAgIyBGaW5hbGx5IGFjdHVhbGx5IGlu
c3RhbGwgdGhlIGZpbGVzCiAgICAgICAgICAgIGZvciBsIGluIG5ld21hbmlmZXN0OgogICAgICAg
ICAgICAgICAgICAgIGRlc3QgPSBuZXdtYW5pZmVzdFtsXQogICAgICAgICAgICAgICAgICAgIGlm
IGwuZW5kc3dpdGgoIi8iKToKICAgICAgICAgICAgICAgICAgICAgICAgc3RhZ2luZ19jb3B5ZGly
KGwsIHRhcmdldGRpciwgZGVzdCwgc2VlbmRpcnMpCiAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlCiAgICAgICAgICAgICAgICAgICAgc3RhZ2luZ19jb3B5ZmlsZShsLCB0YXJnZXRkaXIs
IGRlc3QsIHBvc3RpbnN0cywgc2VlbmRpcnMpCgogICAgYmIubm90ZSgiSW5zdGFsbGVkIGludG8g
c3lzcm9vdDogJXMiICUgc3RyKG1zZ19hZGRpbmcpKQogICAgYmIubm90ZSgiU2tpcHBpbmcgYXMg
YWxyZWFkeSBleGlzdHMgaW4gc3lzcm9vdDogJXMiICUgc3RyKG1zZ19leGlzdHMpKQoKICAgIGZv
ciBmIGluIGZpeG1lOgogICAgICAgIHN0YWdpbmdfcHJvY2Vzc2ZpeG1lKGZpeG1lW2ZdLCBmLCBy
ZWNpcGVzeXNyb290LCByZWNpcGVzeXNyb290bmF0aXZlLCBkKQoKICAgIGZvciBwIGluIHBvc3Rp
bnN0czoKICAgICAgICBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChwLCBzaGVsbD1UcnVlLCBzdGRl
cnI9c3VicHJvY2Vzcy5TVERPVVQpCgogICAgZm9yIGRlcCBpbiBtYW5pZmVzdHM6CiAgICAgICAg
YyA9IHNldHNjZW5lZGVwc1tkZXBdWzBdCiAgICAgICAgb3Muc3ltbGluayhtYW5pZmVzdHNbZGVw
XSwgZGVwZGlyICsgIi8iICsgYyArICIuY29tcGxldGUiKQoKICAgIHdpdGggb3Blbih0YXNraW5k
ZXgsICJ3IikgYXMgZjoKICAgICAgICBmb3IgbCBpbiBzb3J0ZWQoaW5zdGFsbGVkKToKICAgICAg
ICAgICAgZi53cml0ZShsICsgIlxuIikKCiAgICBiYi51dGlscy51bmxvY2tmaWxlKGxvY2spCgpk
ZWYgc3RhZ2luZ19wcm9jZXNzZml4bWUoZml4bWUsIHRhcmdldCwgcmVjaXBlc3lzcm9vdCwgcmVj
aXBlc3lzcm9vdG5hdGl2ZSwgZCk6CiAgICBpbXBvcnQgc3VicHJvY2VzcwoKICAgIGlmIG5vdCBm
aXhtZToKICAgICAgICByZXR1cm4KICAgIGNtZCA9ICJzZWQgLWUgJ3M6XlteL10qLzolcy86Zycg
JXMgfCB4YXJncyBzZWQgLWkgLWUgJ3M6RklYTUVTVEFHSU5HRElSVEFSR0VUOiVzOmc7IHM6RklY
TUVTVEFHSU5HRElSSE9TVDolczpnJyIgJSAodGFyZ2V0LCAiICIuam9pbihmaXhtZSksIHJlY2lw
ZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUpCiAgICBmb3IgZml4bWV2YXIgaW4gWydQU0VV
RE9fU1lTUk9PVCcsICdIT1NUVE9PTFNfRElSJywgJ1BLR0RBVEFfRElSJywgJ1BTRVVET19MT0NB
TFNUQVRFRElSJywgJ0xPR0ZJRk8nXToKICAgICAgICBmaXhtZV9wYXRoID0gZC5nZXRWYXIoZml4
bWV2YXIpCiAgICAgICAgY21kICs9ICIgLWUgJ3M6RklYTUVfJXM6JXM6ZyciICUgKGZpeG1ldmFy
LCBmaXhtZV9wYXRoKQogICAgYmIuZGVidWcoMiwgY21kKQogICAgc3VicHJvY2Vzcy5jaGVja19v
dXRwdXQoY21kLCBzaGVsbD1UcnVlLCBzdGRlcnI9c3VicHJvY2Vzcy5TVERPVVQpCgpkZWYgc3Rh
Z2luZ19jb3B5ZGlyKGMsIHRhcmdldCwgZGVzdCwgc2VlbmRpcnMpOgogICAgaWYgZGVzdCBub3Qg
aW4gc2VlbmRpcnM6CiAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKGRlc3QpCiAgICAgICAgc2Vl
bmRpcnMuYWRkKGRlc3QpCgpkZWYgc3RhZ2luZ19wb3B1bGF0ZV9zeXNyb290X2Rpcih0YXJnZXRz
eXNyb290LCBuYXRpdmVzeXNyb290LCBuYXRpdmUsIGQpOgogICAgaW1wb3J0IGdsb2IKICAgIGlt
cG9ydCBzdWJwcm9jZXNzCiAgICBpbXBvcnQgZXJybm8KCiAgICBmaXhtZSA9IFtdCiAgICBwb3N0
aW5zdHMgPSBbXQogICAgc2VlbmRpcnMgPSBzZXQoKQogICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFy
KCJTVEFHSU5HX0RJUiIpCiAgICBpZiBuYXRpdmU6CiAgICAgICAgcGtnYXJjaHMgPSBbJyR7QlVJ
TERfQVJDSH0nLCAnJHtCVUlMRF9BUkNIfV8qJ10KICAgICAgICB0YXJnZXRkaXIgPSBuYXRpdmVz
eXNyb290CiAgICBlbHNlOgogICAgICAgIHBrZ2FyY2hzID0gWycke01BQ0hJTkVfQVJDSH0nXQog
ICAgICAgIHBrZ2FyY2hzID0gcGtnYXJjaHMgKyBsaXN0KHJldmVyc2VkKGQuZ2V0VmFyKCJQQUNL
QUdFX0VYVFJBX0FSQ0hTIikuc3BsaXQoKSkpCiAgICAgICAgcGtnYXJjaHMuYXBwZW5kKCdhbGxh
cmNoJykKICAgICAgICB0YXJnZXRkaXIgPSB0YXJnZXRzeXNyb290CgogICAgYmIudXRpbHMubWtk
aXJoaWVyKHRhcmdldGRpcikKICAgIGZvciBwa2dhcmNoIGluIHBrZ2FyY2hzOgogICAgICAgIGZv
ciBtYW5pZmVzdCBpbiBnbG9iLmdsb2IoZC5leHBhbmQoIiR7U1NUQVRFX01BTklGRVNUU30vbWFu
aWZlc3QtJXMtKi5wb3B1bGF0ZV9zeXNyb290IiAlIHBrZ2FyY2gpKToKICAgICAgICAgICAgaWYg
bWFuaWZlc3QuZW5kc3dpdGgoIi1pbml0aWFsLnBvcHVsYXRlX3N5c3Jvb3QiKToKICAgICAgICAg
ICAgICAgICMgc2tpcCBnbGliYy1pbml0aWFsIGFuZCBsaWJnY2MtaW5pdGlhbCBkdWUgdG8gZmls
ZSBvdmVybGFwCiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICBpZiBub3QgbmF0
aXZlIGFuZCAobWFuaWZlc3QuZW5kc3dpdGgoIi1uYXRpdmUucG9wdWxhdGVfc3lzcm9vdCIpIG9y
ICJuYXRpdmVzZGstIiBpbiBtYW5pZmVzdCk6CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAg
ICAgICAgICBpZiBuYXRpdmUgYW5kIG5vdCAobWFuaWZlc3QuZW5kc3dpdGgoIi1uYXRpdmUucG9w
dWxhdGVfc3lzcm9vdCIpIG9yIG1hbmlmZXN0LmVuZHN3aXRoKCItY3Jvc3MucG9wdWxhdGVfc3lz
cm9vdCIpIG9yICItY3Jvc3MtIiBpbiBtYW5pZmVzdCk6CiAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICB0bWFuaWZlc3QgPSB0YXJnZXRkaXIgKyAiLyIgKyBvcy5wYXRoLmJhc2Vu
YW1lKG1hbmlmZXN0KQogICAgICAgICAgICBpZiBvcy5wYXRoLmV4aXN0cyh0bWFuaWZlc3QpOgog
ICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAg
b3MubGluayhtYW5pZmVzdCwgdG1hbmlmZXN0KQogICAgICAgICAgICBleGNlcHQgT1NFcnJvciBh
cyBlcnI6CiAgICAgICAgICAgICAgICBpZiBlcnIuZXJybm8gPT0gZXJybm8uRVhERVY6CiAgICAg
ICAgICAgICAgICAgICAgYmIudXRpbHMuY29weWZpbGUobWFuaWZlc3QsIHRtYW5pZmVzdCkKICAg
ICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAgICAgcmFpc2UKICAgICAgICAgICAg
d2l0aCBvcGVuKG1hbmlmZXN0LCAiciIpIGFzIGY6CiAgICAgICAgICAgICAgICBmb3IgbCBpbiBm
OgogICAgICAgICAgICAgICAgICAgIGwgPSBsLnN0cmlwKCkKICAgICAgICAgICAgICAgICAgICBp
ZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoIik6CiAgICAgICAgICAgICAgICAgICAgICAgIGZpeG1l
LmFwcGVuZChsKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAg
ICAgICAgIGlmIGwuZW5kc3dpdGgoIi9maXhtZXBhdGguY21kIik6CiAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAgICAgZGVzdCA9IGwucmVwbGFjZShzdGFn
aW5nZGlyLCAiIikKICAgICAgICAgICAgICAgICAgICBkZXN0ID0gdGFyZ2V0ZGlyICsgIi8iICsg
Ii8iLmpvaW4oZGVzdC5zcGxpdCgiLyIpWzM6XSkKICAgICAgICAgICAgICAgICAgICBpZiBsLmVu
ZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWRpcihsLCB0
YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAgICAgICAgICAgc3RhZ2lu
Z19jb3B5ZmlsZShsLCB0YXJnZXRkaXIsIGRlc3QsIHBvc3RpbnN0cywgc2VlbmRpcnMpCiAgICAg
ICAgICAgICAgICAgICAgZXhjZXB0IEZpbGVFeGlzdHNFcnJvcjoKICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWUKCiAgICBzdGFnaW5nX3Byb2Nlc3NmaXhtZShmaXhtZSwgdGFyZ2V0ZGly
LCB0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBkKQogICAgZm9yIHAgaW4gcG9zdGluc3Rz
OgogICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KHAsIHNoZWxsPVRydWUsIHN0ZGVycj1z
dWJwcm9jZXNzLlNURE9VVCkKCiMKIyBNYW5pZmVzdHMgaGVyZSBhcmUgY29tcGxpY2F0ZWQuIFRo
ZSBtYWluIHN5c3Jvb3QgYXJlYSBoYXMgdGhlIHVucGFja2VkIHNzdGF0ZQojIHdoaWNoIHVzIHVu
cmVsb2NhdGVkIGFuZCB0cmFja2VkIGJ5IHRoZSBtYWluIHNzdGF0ZSBtYW5pZmVzdHMuIEVhY2gg
cmVjaXBlCiMgc3BlY2lmaWMgc3lzcm9vdCBoYXMgbWFuaWZlc3RzIGZvciBlYWNoIGRlcGVuZGVu
Y3kgdGhhdCBpcyBpbnN0YWxsZWQgdGhlcmUuCiMgVGhlIHRhc2sgaGFzaCBpcyB1c2VkIHRvIHRl
bGwgd2hldGhlciB0aGUgZGF0YSBuZWVkcyB0byBiZSByZWluc3RhbGxlZC4gV2UKIyB1c2UgYSBz
eW1saW5rIHRvIHBvaW50IHRvIHRoZSBjdXJyZW50bHkgaW5zdGFsbGVkIGhhc2guIFRoZXJlIGlz
IGFsc28gYQojICJjb21wbGV0ZSIgc3RhbXAgZmlsZSB3aGljaCBpcyB1c2VkIHRvIG1hcmsgaWYg
aW5zdGFsbGF0aW9uIGNvbXBsZXRlZC4gSWYKIyBzb21ldGhpbmcgZmFpbHMgKGUuZy4gYSBwb3N0
aW5zdCksIHRoaXMgd29uJ3QgZ2V0IHdyaXR0ZW4gYW5kIHdlIHdvdWxkCiMgcmVtb3ZlIGFuZCBy
ZWluc3RhbGwgdGhlIGRlcGVuZGVuY3kuIFRoaXMgYWxzbyBtZWFucyBwYXJ0aWFsbHkgaW5zdGFs
bGVkCiMgZGVwZW5kZW5jaWVzIHNob3VsZCBnZXQgY2xlYW5lZCB1cCBjb3JyZWN0bHkuCiMKCmRl
ZiBzdGFnaW5nX2NvcHlmaWxlKGMsIHRhcmdldCwgZGVzdCwgcG9zdGluc3RzLCBzZWVuZGlycyk6
CiAgICBpbXBvcnQgZXJybm8KCiAgICBkZXN0ZGlyID0gb3MucGF0aC5kaXJuYW1lKGRlc3QpCiAg
ICBpZiBkZXN0ZGlyIG5vdCBpbiBzZWVuZGlyczoKICAgICAgICBiYi51dGlscy5ta2RpcmhpZXIo
ZGVzdGRpcikKICAgICAgICBzZWVuZGlycy5hZGQoZGVzdGRpcikKICAgIGlmICIvdXNyL2Jpbi9w
b3N0aW5zdC0iIGluIGM6CiAgICAgICAgcG9zdGluc3RzLmFwcGVuZChkZXN0KQogICAgaWYgb3Mu
cGF0aC5pc2xpbmsoYyk6CiAgICAgICAgbGlua3RvID0gb3MucmVhZGxpbmsoYykKICAgICAgICBp
ZiBvcy5wYXRoLmxleGlzdHMoZGVzdCk6CiAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmlzbGlu
ayhkZXN0KToKICAgICAgICAgICAgICAgIHJhaXNlIE9TRXJyb3IoZXJybm8uRUVYSVNULCAiTGlu
ayAlcyBhbHJlYWR5IGV4aXN0cyBhcyBhIGZpbGUiICUgZGVzdCwgZGVzdCkKICAgICAgICAgICAg
aWYgb3MucmVhZGxpbmsoZGVzdCkgPT0gbGlua3RvOgogICAgICAgICAgICAgICAgcmV0dXJuIGRl
c3QKICAgICAgICAgICAgcmFpc2UgT1NFcnJvcihlcnJuby5FRVhJU1QsICJMaW5rICVzIGFscmVh
ZHkgZXhpc3RzIHRvIGEgZGlmZmVyZW50IGxvY2F0aW9uPyAoJXMgdnMgJXMpIiAlIChkZXN0LCBv
cy5yZWFkbGluayhkZXN0KSwgbGlua3RvKSwgZGVzdCkKICAgICAgICBvcy5zeW1saW5rKGxpbmt0
bywgZGVzdCkKICAgICAgICAjYmIud2FybihjKQogICAgZWxzZToKICAgICAgICB0cnk6CiAgICAg
ICAgICAgIG9zLmxpbmsoYywgZGVzdCkKICAgICAgICBleGNlcHQgT1NFcnJvciBhcyBlcnI6CiAg
ICAgICAgICAgIGlmIGVyci5lcnJubyA9PSBlcnJuby5FWERFVjoKICAgICAgICAgICAgICAgIGJi
LnV0aWxzLmNvcHlmaWxlKGMsIGRlc3QpCiAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAg
ICByYWlzZQogICAgcmV0dXJuIGRlc3QKCmRlZiBzc3RhdGVfY2xlYW5fbWFuaWZlc3QobWFuaWZl
c3QsIGQsIHByZWZpeD1Ob25lKToKICAgIGltcG9ydCBvZS5wYXRoCgogICAgbWZpbGUgPSBvcGVu
KG1hbmlmZXN0KQogICAgZW50cmllcyA9IG1maWxlLnJlYWRsaW5lcygpCiAgICBtZmlsZS5jbG9z
ZSgpCgogICAgZm9yIGVudHJ5IGluIGVudHJpZXM6CiAgICAgICAgZW50cnkgPSBlbnRyeS5zdHJp
cCgpCiAgICAgICAgaWYgcHJlZml4IGFuZCBub3QgZW50cnkuc3RhcnRzd2l0aCgiLyIpOgogICAg
ICAgICAgICBlbnRyeSA9IHByZWZpeCArICIvIiArIGVudHJ5CiAgICAgICAgYmIuZGVidWcoMiwg
IlJlbW92aW5nIG1hbmlmZXN0OiAlcyIgJSBlbnRyeSkKICAgICAgICAjIFdlIGNhbiByYWNlIGFn
YWluc3QgYW5vdGhlciBwYWNrYWdlIHBvcHVsYXRpbmcgZGlyZWN0b3JpZXMgYXMgd2UncmUgcmVt
b3ZpbmcgdGhlbQogICAgICAgICMgc28gd2UgaWdub3JlIGVycm9ycyBoZXJlLgogICAgICAgIHRy
eToKICAgICAgICAgICAgaWYgZW50cnkuZW5kc3dpdGgoIi8iKToKICAgICAgICAgICAgICAgIGlm
IG9zLnBhdGguaXNsaW5rKGVudHJ5WzotMV0pOgogICAgICAgICAgICAgICAgICAgIG9zLnJlbW92
ZShlbnRyeVs6LTFdKQogICAgICAgICAgICAgICAgZWxpZiBvcy5wYXRoLmV4aXN0cyhlbnRyeSkg
YW5kIGxlbihvcy5saXN0ZGlyKGVudHJ5KSkgPT0gMDoKICAgICAgICAgICAgICAgICAgICBvcy5y
bWRpcihlbnRyeVs6LTFdKQogICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgb3MucmVt
b3ZlKGVudHJ5KQogICAgICAgIGV4Y2VwdCBPU0Vycm9yOgogICAgICAgICAgICBwYXNzCgogICAg
cG9zdHJtID0gbWFuaWZlc3QgKyAiLnBvc3RybSIKICAgIGlmIG9zLnBhdGguZXhpc3RzKG1hbmlm
ZXN0ICsgIi5wb3N0cm0iKToKICAgICAgICBpbXBvcnQgc3VicHJvY2VzcwogICAgICAgIG9zLmNo
bW9kKHBvc3RybSwgMG83NTUpCiAgICAgICAgc3VicHJvY2Vzcy5jaGVja19jYWxsKHBvc3RybSwg
c2hlbGw9VHJ1ZSkKICAgICAgICBvZS5wYXRoLnJlbW92ZShwb3N0cm0pCgogICAgb2UucGF0aC5y
ZW1vdmUobWFuaWZlc3QpCgpkZWYgc2V0c2NlbmVfZGVwdmFsaWQodGFzaywgdGFza2RlcGVuZGVl
cywgbm90bmVlZGVkLCBkLCBsb2c9Tm9uZSk6CiAgICAjIHRhc2tkZXBlbmRlZXMgaXMgYSBkaWN0
IG9mIHRhc2tzIHdoaWNoIGRlcGVuZCBvbiB0YXNrLCBlYWNoIGJlaW5nIGEgMyBpdGVtIGxpc3Qg
b2YgW1BOLCBUQVNLTkFNRSwgRklMRU5BTUVdCiAgICAjIHRhc2sgaXMgaW5jbHVkZWQgaW4gdGFz
a2RlcGVuZGVlcyB0b28KICAgICMgUmV0dXJuIC0gRmFsc2UgLSBXZSBuZWVkIHRoaXMgZGVwZW5k
ZW5jeQogICAgIyAgICAgICAgLSBUcnVlIC0gV2UgY2FuIHNraXAgdGhpcyBkZXBlbmRlbmN5CiAg
ICBpbXBvcnQgcmUKCiAgICBkZWYgbG9naXQobXNnLCBsb2cpOgogICAgICAgIGlmIGxvZyBpcyBu
b3QgTm9uZToKICAgICAgICAgICAgbG9nLmFwcGVuZChtc2cpCiAgICAgICAgZWxzZToKICAgICAg
ICAgICAgYmIuZGVidWcoMiwgbXNnKQoKICAgIGxvZ2l0KCJDb25zaWRlcmluZyBzZXRzY2VuZSB0
YXNrOiAlcyIgJSAoc3RyKHRhc2tkZXBlbmRlZXNbdGFza10pKSwgbG9nKQoKICAgIGRlZiBpc05h
dGl2ZUNyb3NzKHgpOgogICAgICAgIHJldHVybiB4LmVuZHN3aXRoKCItbmF0aXZlIikgb3IgIi1j
cm9zcy0iIGluIHggb3IgIi1jcm9zc3NkayIgaW4geCBvciB4LmVuZHN3aXRoKCItY3Jvc3MiKQoK
ICAgICMgV2Ugb25seSBuZWVkIHRvIHRyaWdnZXIgcG9wdWxhdGVfbGljIHRocm91Z2ggZGlyZWN0
IGRlcGVuZGVuY2llcwogICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcG9wdWxh
dGVfbGljIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAgICMgc3Rhc2hfbG9jYWxlIGFuZCBnY2Nf
c3Rhc2hfYnVpbGRkaXIgYXJlIG5ldmVyIG5lZWRlZCBhcyBhIGRlcGVuZGVuY3kgZm9yIGJ1aWx0
IG9iamVjdHMKICAgIGlmIHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0gImRvX3N0YXNoX2xvY2Fs
ZSIgb3IgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fZ2NjX3N0YXNoX2J1aWxkZGlyIjoK
ICAgICAgICByZXR1cm4gVHJ1ZQoKICAgICMgV2Ugb25seSBuZWVkIHRvIHRyaWdnZXIgcGFja2Fn
ZWRhdGEgdGhyb3VnaCBkaXJlY3QgZGVwZW5kZW5jaWVzCiAgICAjIGJ1dCBuZWVkIHRvIHByZXNl
cnZlIHBhY2thZ2VkYXRhIG9uIHBhY2thZ2VkYXRhIGxpbmtzCiAgICBpZiB0YXNrZGVwZW5kZWVz
W3Rhc2tdWzFdID09ICJkb19wYWNrYWdlZGF0YSI6CiAgICAgICAgZm9yIGRlcCBpbiB0YXNrZGVw
ZW5kZWVzOgogICAgICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW2RlcF1bMV0gPT0gImRvX3BhY2th
Z2VkYXRhIjoKICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgIHJldHVybiBUcnVl
CgogICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgogICAgICAgIGxvZ2l0KCIgIGNvbnNpZGVy
aW5nIGRlcGVuZGVuY3k6ICVzIiAlIChzdHIodGFza2RlcGVuZGVlc1tkZXBdKSksIGxvZykKICAg
ICAgICBpZiB0YXNrID09IGRlcDoKICAgICAgICAgICAgY29udGludWUKICAgICAgICBpZiBkZXAg
aW4gbm90bmVlZGVkOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgICMgZG9fcGFja2FnZV93
cml0ZV8qIGFuZCBkb19wYWNrYWdlIGRvZXNuJ3QgbmVlZCBkb19wYWNrYWdlCiAgICAgICAgaWYg
dGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcGFja2FnZSIgYW5kIHRhc2tkZXBlbmRlZXNb
ZGVwXVsxXSBpbiBbJ2RvX3BhY2thZ2UnLCAnZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFj
a2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0nLCAnZG9fcGFja2FnZWRhdGEn
LCAnZG9fcGFja2FnZV9xYSddOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgICMgZG9fcGFj
a2FnZV93cml0ZV8qIG5lZWQgZG9fcG9wdWxhdGVfc3lzcm9vdCBhcyB0aGV5J3JlIG1haW5seSBw
b3N0aW5zdGFsbCBkZXBlbmRlbmNpZXMKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFd
ID09ICJkb19wb3B1bGF0ZV9zeXNyb290IiBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdIGluIFsn
ZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2Fn
ZV93cml0ZV9ycG0nXToKICAgICAgICAgICAgcmV0dXJuIEZhbHNlCiAgICAgICAgIyBkb19wYWNr
YWdlL3BhY2thZ2VkYXRhL3BhY2thZ2VfcWEgZG9uJ3QgbmVlZCBkb19wb3B1bGF0ZV9zeXNyb290
CiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9v
dCIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBbJ2RvX3BhY2thZ2UnLCAnZG9fcGFja2Fn
ZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgICMg
TmF0aXZlL0Nyb3NzIHBhY2thZ2VzIGRvbid0IGV4aXN0IGFuZCBhcmUgbm9leGVjIGFueXdheQog
ICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKSBhbmQgdGFza2Rl
cGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2FnZV93
cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0nLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9f
cGFja2FnZScsICdkb19wYWNrYWdlX3FhJ106CiAgICAgICAgICAgIGNvbnRpbnVlCgogICAgICAg
ICMgVGhpcyBpcyBkdWUgdG8gdGhlIFtkZXBlbmRzXSBpbiB1c2VyYWRkLmJiY2xhc3MgY29tcGxp
Y2F0aW5nIG1hdHRlcnMKICAgICAgICAjIFRoZSBsb2dpYyAqaXMqIHJldmVyc2VkIGhlcmUgZHVl
IHRvIHRoZSB3YXkgaGFyZCBzZXRzY2VuZSBkZXBlbmRlbmNpZXMgYXJlIGluamVjdGVkCiAgICAg
ICAgaWYgKHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0gJ2RvX3BhY2thZ2UnIG9yIHRhc2tkZXBl
bmRlZXNbdGFza11bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5c3Jvb3QnKSBhbmQgdGFza2RlcGVuZGVl
c1tkZXBdWzBdLmVuZHN3aXRoKCgnc2hhZG93LW5hdGl2ZScsICdzaGFkb3ctc3lzcm9vdCcsICdi
YXNlLXBhc3N3ZCcsICdwc2V1ZG8tbmF0aXZlJykpIGFuZCB0YXNrZGVwZW5kZWVzW2RlcF1bMV0g
PT0gJ2RvX3BvcHVsYXRlX3N5c3Jvb3QnOgogICAgICAgICAgICBjb250aW51ZQoKICAgICAgICAj
IENvbnNpZGVyIHN5c3Jvb3QgZGVwZW5kaW5nIG9uIHN5c3Jvb3QgdGFza3MKICAgICAgICBpZiB0
YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19wb3B1bGF0ZV9zeXNyb290JyBhbmQgdGFza2Rl
cGVuZGVlc1tkZXBdWzFdID09ICdkb19wb3B1bGF0ZV9zeXNyb290JzoKICAgICAgICAgICAgIyBB
bGxvdyBleGNsdWRpbmcgY2VydGFpbiByZWN1cnNpdmUgZGVwZW5kZW5jaWVzLiBJZiBhIHJlY2lw
ZSBuZWVkcyBpdCBzaG91bGQgYWRkIGEKICAgICAgICAgICAgIyBzcGVjaWZpYyBkZXBlbmRlbmN5
IGl0c2VsZiwgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBvbmUgb2YgaXRzIGRlcGVuZGVlcyB0byBw
dWxsCiAgICAgICAgICAgICMgdGhlbSBpbi4KICAgICAgICAgICAgIyBTZWUgYWxzbyBodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1K
YW51YXJ5LzE0NjMyNC5odG1sCiAgICAgICAgICAgIG5vdF9uZWVkZWQgPSBGYWxzZQogICAgICAg
ICAgICBleGNsdWRlZGVwcyA9IGQuZ2V0VmFyKCdfU1NUQVRFX0VYQ0xVREVERVBTX1NZU1JPT1Qn
KQogICAgICAgICAgICBpZiBleGNsdWRlZGVwcyBpcyBOb25lOgogICAgICAgICAgICAgICAgIyBD
YWNoZSB0aGUgcmVndWxhciBleHByZXNzaW9ucyBmb3Igc3BlZWQKICAgICAgICAgICAgICAgIGV4
Y2x1ZGVkZXBzID0gW10KICAgICAgICAgICAgICAgIGZvciBleGNsIGluIChkLmdldFZhcignU1NU
QVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKSBvciAiIikuc3BsaXQoKToKICAgICAgICAgICAgICAg
ICAgICBleGNsdWRlZGVwcy5hcHBlbmQoKHJlLmNvbXBpbGUoZXhjbC5zcGxpdCgnLT4nLCAxKVsw
XSksIHJlLmNvbXBpbGUoZXhjbC5zcGxpdCgnLT4nLCAxKVsxXSkpKQogICAgICAgICAgICAgICAg
ZC5zZXRWYXIoJ19TU1RBVEVfRVhDTFVERURFUFNfU1lTUk9PVCcsIGV4Y2x1ZGVkZXBzKQogICAg
ICAgICAgICBmb3IgZXhjbCBpbiBleGNsdWRlZGVwczoKICAgICAgICAgICAgICAgIGlmIGV4Y2xb
MF0ubWF0Y2godGFza2RlcGVuZGVlc1tkZXBdWzBdKToKICAgICAgICAgICAgICAgICAgICBpZiBl
eGNsWzFdLm1hdGNoKHRhc2tkZXBlbmRlZXNbdGFza11bMF0pOgogICAgICAgICAgICAgICAgICAg
ICAgICBub3RfbmVlZGVkID0gVHJ1ZQogICAgICAgICAgICAgICAgICAgICAgICBicmVhawogICAg
ICAgICAgICBpZiBub3RfbmVlZGVkOgogICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAg
ICAgIyBGb3IgbWV0YS1leHRzZGstdG9vbGNoYWluIHdlIHdhbnQgYWxsIHN5c3Jvb3QgZGVwZW5k
ZW5jaWVzCiAgICAgICAgICAgIGlmIHRhc2tkZXBlbmRlZXNbZGVwXVswXSA9PSAnbWV0YS1leHRz
ZGstdG9vbGNoYWluJzoKICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAj
IE5hdGl2ZS9Dcm9zcyBwb3B1bGF0ZV9zeXNyb290IG5lZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAg
ICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1t0YXNrXVswXSkgYW5kIGlz
TmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKToKICAgICAgICAgICAgICAgIHJldHVy
biBGYWxzZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1bGF0ZV9zeXNyb290IGRlcGVuZGVkIG9u
IGJ5IGNyb3NzIHRvb2xzIG5lZWQgdG8gYmUgaW5zdGFsbGVkCiAgICAgICAgICAgIGlmIGlzTmF0
aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKToKICAgICAgICAgICAgICAgIHJldHVybiBG
YWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9jcm9zcyB0b29scyBkZXBlbmRlZCB1cG9uIGJ5IHRh
cmdldCBzeXNyb290IGFyZSBub3QgbmVlZGVkCiAgICAgICAgICAgICMgQWRkIGFuIGV4Y2VwdGlv
biBmb3Igc2hhZG93LW5hdGl2ZSBhcyByZXF1aXJlZCBieSB1c2VyYWRkLmJiY2xhc3MKICAgICAg
ICAgICAgaWYgaXNOYXRpdmVDcm9zcyh0YXNrZGVwZW5kZWVzW3Rhc2tdWzBdKSBhbmQgdGFza2Rl
cGVuZGVlc1t0YXNrXVswXSAhPSAnc2hhZG93LW5hdGl2ZSc6CiAgICAgICAgICAgICAgICBjb250
aW51ZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1bGF0ZV9zeXNyb290IG5lZWQgdGhlaXIgZGVw
ZW5kZW5jaWVzCiAgICAgICAgICAgIHJldHVybiBGYWxzZQoKICAgICAgICBpZiB0YXNrZGVwZW5k
ZWVzW3Rhc2tdWzFdID09ICdkb19zaGFyZWRfd29ya2Rpcic6CiAgICAgICAgICAgIGNvbnRpbnVl
CgogICAgICAgIGlmIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfbGljIjoK
ICAgICAgICAgICAgY29udGludWUKCgogICAgICAgICMgU2FmZSBmYWxsdGhyb3VnaCBkZWZhdWx0
CiAgICAgICAgbG9naXQoIiBEZWZhdWx0IHNldHNjZW5lIGRlcGVuZGVuY3kgZmFsbCB0aHJvdWdo
IGR1ZSB0byBkZXBlbmRlbmN5OiAlcyIgJSAoc3RyKHRhc2tkZXBlbmRlZXNbZGVwXSkpLCBsb2cp
CiAgICAgICAgcmV0dXJuIEZhbHNlCiAgICByZXR1cm4gVHJ1ZQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_qa_configure.14592"
Content-Disposition: attachment; filename="run.do_qa_configure.14592"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3al35>
X-Attachment-Id: f_jz9oy3al35

ZGVmIGRvX3FhX2NvbmZpZ3VyZShkKToKICAgIGltcG9ydCBzdWJwcm9jZXNzCgogICAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCiAgICAjIENoZWNrIGNvbmZpZy5sb2cgZm9yIGNyb3NzIGNvbXBpbGUgaXNz
dWVzCiAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCiAgICBjb25maWdzID0gW10KICAgIHdvcmtkaXIg
PSBkLmdldFZhcignV09SS0RJUicpCgogICAgc2tpcCA9IChkLmdldFZhcignSU5TQU5FX1NLSVAn
KSBvciAiIikuc3BsaXQoKQogICAgc2tpcF9jb25maWd1cmVfdW5zYWZlID0gRmFsc2UKICAgIGlm
ICdjb25maWd1cmUtdW5zYWZlJyBpbiBza2lwOgogICAgICAgIGJiLm5vdGUoIlJlY2lwZSAlcyBz
a2lwcGluZyBxYSBjaGVja2luZzogY29uZmlndXJlLXVuc2FmZSIgJSBkLmdldFZhcignUE4nKSkK
ICAgICAgICBza2lwX2NvbmZpZ3VyZV91bnNhZmUgPSBUcnVlCgogICAgaWYgYmIuZGF0YS5pbmhl
cml0c19jbGFzcygnYXV0b3Rvb2xzJywgZCkgYW5kIG5vdCBza2lwX2NvbmZpZ3VyZV91bnNhZmU6
CiAgICAgICAgYmIubm90ZSgiQ2hlY2tpbmcgYXV0b3Rvb2xzIGVudmlyb25tZW50IGZvciBjb21t
b24gbWlzY29uZmlndXJhdGlvbiIpCiAgICAgICAgZm9yIHJvb3QsIGRpcnMsIGZpbGVzIGluIG9z
LndhbGsod29ya2Rpcik6CiAgICAgICAgICAgIHN0YXRlbWVudCA9ICJncmVwIC1xIC1GIC1lICdD
Uk9TUyBDT01QSUxFIEJhZG5lc3M6JyAtZSAnaXMgdW5zYWZlIGZvciBjcm9zcy1jb21waWxhdGlv
bicgJXMiICUgXAogICAgICAgICAgICAgICAgICAgICAgICBvcy5wYXRoLmpvaW4ocm9vdCwiY29u
ZmlnLmxvZyIpCiAgICAgICAgICAgIGlmICJjb25maWcubG9nIiBpbiBmaWxlczoKICAgICAgICAg
ICAgICAgIGlmIHN1YnByb2Nlc3MuY2FsbChzdGF0ZW1lbnQsIHNoZWxsPVRydWUpID09IDA6CiAg
ICAgICAgICAgICAgICAgICAgZXJyb3JfbXNnID0gIiIiVGhpcyBhdXRvY29uZiBsb2cgaW5kaWNh
dGVzIGVycm9ycywgaXQgbG9va2VkIGF0IGhvc3QgaW5jbHVkZSBhbmQvb3IgbGlicmFyeSBwYXRo
cyB3aGlsZSBkZXRlcm1pbmluZyBzeXN0ZW0gY2FwYWJpbGl0aWVzLgpSZXJ1biBjb25maWd1cmUg
dGFzayBhZnRlciBmaXhpbmcgdGhpcy4iIiIKICAgICAgICAgICAgICAgICAgICBwYWNrYWdlX3Fh
X2hhbmRsZV9lcnJvcigiY29uZmlndXJlLXVuc2FmZSIsIGVycm9yX21zZywgZCkKCiAgICAgICAg
ICAgIGlmICJjb25maWd1cmUuYWMiIGluIGZpbGVzOgogICAgICAgICAgICAgICAgY29uZmlncy5h
cHBlbmQob3MucGF0aC5qb2luKHJvb3QsImNvbmZpZ3VyZS5hYyIpKQogICAgICAgICAgICBpZiAi
Y29uZmlndXJlLmluIiBpbiBmaWxlczoKICAgICAgICAgICAgICAgIGNvbmZpZ3MuYXBwZW5kKG9z
LnBhdGguam9pbihyb290LCAiY29uZmlndXJlLmluIikpCgogICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAgICAjIENoZWNrIGdldHRleHQgY29uZmlndXJhdGlvbiBhbmQgZGVwZW5kZW5jaWVzIGFyZSBj
b3JyZWN0CiAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCiAgICBza2lwX2NvbmZpZ3VyZV9nZXR0ZXh0
ID0gRmFsc2UKICAgIGlmICdjb25maWd1cmUtZ2V0dGV4dCcgaW4gc2tpcDoKICAgICAgICBiYi5u
b3RlKCJSZWNpcGUgJXMgc2tpcHBpbmcgcWEgY2hlY2tpbmc6IGNvbmZpZ3VyZS1nZXR0ZXh0IiAl
IGQuZ2V0VmFyKCdQTicpKQogICAgICAgIHNraXBfY29uZmlndXJlX2dldHRleHQgPSBUcnVlCgog
ICAgY25mID0gZC5nZXRWYXIoJ0VYVFJBX09FQ09ORicpIG9yICIiCiAgICBpZiBub3QgKCJnZXR0
ZXh0IiBpbiBkLmdldFZhcignUCcpIG9yICJnY2MtcnVudGltZSIgaW4gZC5nZXRWYXIoJ1AnKSBv
ciBcCiAgICAgICAgICAgICItLWRpc2FibGUtbmxzIiBpbiBjbmYgb3Igc2tpcF9jb25maWd1cmVf
Z2V0dGV4dCk6CiAgICAgICAgbWwgPSBkLmdldFZhcigiTUxQUkVGSVgiKSBvciAiIgogICAgICAg
IGlmIGJiLmRhdGEuaW5oZXJpdHNfY2xhc3MoJ2Nyb3NzLWNhbmFkaWFuJywgZCk6CiAgICAgICAg
ICAgIGd0ID0gIm5hdGl2ZXNkay1nZXR0ZXh0IgogICAgICAgIGVsc2U6CiAgICAgICAgICAgIGd0
ID0gImdldHRleHQtbmF0aXZlIgogICAgICAgIGRlcHMgPSBiYi51dGlscy5leHBsb2RlX2RlcHMo
ZC5nZXRWYXIoJ0RFUEVORFMnKSBvciAiIikKICAgICAgICBpZiBndCBub3QgaW4gZGVwczoKICAg
ICAgICAgICAgZm9yIGNvbmZpZyBpbiBjb25maWdzOgogICAgICAgICAgICAgICAgZ251ID0gImdy
ZXAgXCJeW1s6c3BhY2U6XV0qQU1fR05VX0dFVFRFWFRcIiAlcyA+L2Rldi9udWxsIiAlIGNvbmZp
ZwogICAgICAgICAgICAgICAgaWYgc3VicHJvY2Vzcy5jYWxsKGdudSwgc2hlbGw9VHJ1ZSkgPT0g
MDoKICAgICAgICAgICAgICAgICAgICBlcnJvcl9tc2cgPSAiQU1fR05VX0dFVFRFWFQgdXNlZCBi
dXQgbm8gaW5oZXJpdCBnZXR0ZXh0IgogICAgICAgICAgICAgICAgICAgIHBhY2thZ2VfcWFfaGFu
ZGxlX2Vycm9yKCJjb25maWd1cmUtZ2V0dGV4dCIsIGVycm9yX21zZywgZCkKCiAgICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKICAgICMgQ2hlY2sgdW5yZWNvZ25pc2VkIGNvbmZpZ3VyZSBvcHRpb25zICh3
aXRoIGEgd2hpdGUgbGlzdCkKICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogICAgaWYgYmIuZGF0YS5p
bmhlcml0c19jbGFzcygiYXV0b3Rvb2xzIiwgZCkgb3IgYmIuZGF0YS5pbmhlcml0c19jbGFzcygi
bWVzb24iLCBkKToKICAgICAgICBiYi5ub3RlKCJDaGVja2luZyBjb25maWd1cmUgb3V0cHV0IGZv
ciB1bnJlY29nbmlzZWQgb3B0aW9ucyIpCiAgICAgICAgdHJ5OgogICAgICAgICAgICBpZiBiYi5k
YXRhLmluaGVyaXRzX2NsYXNzKCJhdXRvdG9vbHMiLCBkKToKICAgICAgICAgICAgICAgIGZsYWcg
PSAiV0FSTklORzogdW5yZWNvZ25pemVkIG9wdGlvbnM6IgogICAgICAgICAgICAgICAgbG9nID0g
b3MucGF0aC5qb2luKGQuZ2V0VmFyKCdCJyksICdjb25maWcubG9nJykKICAgICAgICAgICAgaWYg
YmIuZGF0YS5pbmhlcml0c19jbGFzcygibWVzb24iLCBkKToKICAgICAgICAgICAgICAgIGZsYWcg
PSAiV0FSTklORzogVW5rbm93biBvcHRpb25zOiIKICAgICAgICAgICAgICAgIGxvZyA9IG9zLnBh
dGguam9pbihkLmdldFZhcignVCcpLCAnbG9nLmRvX2NvbmZpZ3VyZScpCiAgICAgICAgICAgIG91
dHB1dCA9IHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KFsnZ3JlcCcsICctRicsIGZsYWcsIGxvZ10p
LmRlY29kZSgidXRmLTgiKS5yZXBsYWNlKCcsICcsICcgJykucmVwbGFjZSgnIicsICcnKQogICAg
ICAgICAgICBvcHRpb25zID0gc2V0KCkKICAgICAgICAgICAgZm9yIGxpbmUgaW4gb3V0cHV0LnNw
bGl0bGluZXMoKToKICAgICAgICAgICAgICAgIG9wdGlvbnMgfD0gc2V0KGxpbmUucGFydGl0aW9u
KGZsYWcpWzJdLnNwbGl0KCkpCiAgICAgICAgICAgIHdoaXRlbGlzdCA9IHNldChkLmdldFZhcigi
VU5LTk9XTl9DT05GSUdVUkVfV0hJVEVMSVNUIikuc3BsaXQoKSkKICAgICAgICAgICAgb3B0aW9u
cyAtPSB3aGl0ZWxpc3QKICAgICAgICAgICAgaWYgb3B0aW9uczoKICAgICAgICAgICAgICAgIHBu
ID0gZC5nZXRWYXIoJ1BOJykKICAgICAgICAgICAgICAgIGVycm9yX21zZyA9IHBuICsgIjogY29u
ZmlndXJlIHdhcyBwYXNzZWQgdW5yZWNvZ25pc2VkIG9wdGlvbnM6ICIgKyAiICIuam9pbihvcHRp
b25zKQogICAgICAgICAgICAgICAgcGFja2FnZV9xYV9oYW5kbGVfZXJyb3IoInVua25vd24tY29u
ZmlndXJlLW9wdGlvbiIsIGVycm9yX21zZywgZCkKICAgICAgICBleGNlcHQgc3VicHJvY2Vzcy5D
YWxsZWRQcm9jZXNzRXJyb3I6CiAgICAgICAgICAgIHBhc3MKCiAgICAjIENoZWNrIGludmFsaWQg
UEFDS0FHRUNPTkZJRwogICAgcGtnY29uZmlnID0gKGQuZ2V0VmFyKCJQQUNLQUdFQ09ORklHIikg
b3IgIiIpLnNwbGl0KCkKICAgIGlmIHBrZ2NvbmZpZzoKICAgICAgICBwa2djb25maWdmbGFncyA9
IGQuZ2V0VmFyRmxhZ3MoIlBBQ0tBR0VDT05GSUciKSBvciB7fQogICAgICAgIGZvciBwY29uZmln
IGluIHBrZ2NvbmZpZzoKICAgICAgICAgICAgaWYgcGNvbmZpZyBub3QgaW4gcGtnY29uZmlnZmxh
Z3M6CiAgICAgICAgICAgICAgICBwbiA9IGQuZ2V0VmFyKCdQTicpCiAgICAgICAgICAgICAgICBl
cnJvcl9tc2cgPSAiJXM6IGludmFsaWQgUEFDS0FHRUNPTkZJRzogJXMiICUgKHBuLCBwY29uZmln
KQogICAgICAgICAgICAgICAgcGFja2FnZV9xYV9oYW5kbGVfZXJyb3IoImludmFsaWQtcGFja2Fn
ZWNvbmZpZyIsIGVycm9yX21zZywgZCkKCiAgICBxYV9zYW5lID0gZC5nZXRWYXIoIlFBX1NBTkUi
KQogICAgaWYgbm90IHFhX3NhbmU6CiAgICAgICAgYmIuZmF0YWwoIkZhdGFsIFFBIGVycm9ycyBm
b3VuZCwgZmFpbGluZyB0YXNrLiIpCgpkb19xYV9jb25maWd1cmUoZCkKCmRlZiBwYWNrYWdlX3Fh
X2hhbmRsZV9lcnJvcihlcnJvcl9jbGFzcywgZXJyb3JfbXNnLCBkKToKICAgIGlmIGVycm9yX2Ns
YXNzIGluIChkLmdldFZhcigiRVJST1JfUUEiKSBvciAiIikuc3BsaXQoKToKICAgICAgICBwYWNr
YWdlX3FhX3dyaXRlX2Vycm9yKGVycm9yX2NsYXNzLCBlcnJvcl9tc2csIGQpCiAgICAgICAgYmIu
ZXJyb3IoIlFBIElzc3VlOiAlcyBbJXNdIiAlIChlcnJvcl9tc2csIGVycm9yX2NsYXNzKSkKICAg
ICAgICBkLnNldFZhcigiUUFfU0FORSIsIEZhbHNlKQogICAgICAgIHJldHVybiBGYWxzZQogICAg
ZWxpZiBlcnJvcl9jbGFzcyBpbiAoZC5nZXRWYXIoIldBUk5fUUEiKSBvciAiIikuc3BsaXQoKToK
ICAgICAgICBwYWNrYWdlX3FhX3dyaXRlX2Vycm9yKGVycm9yX2NsYXNzLCBlcnJvcl9tc2csIGQp
CiAgICAgICAgYmIud2FybigiUUEgSXNzdWU6ICVzIFslc10iICUgKGVycm9yX21zZywgZXJyb3Jf
Y2xhc3MpKQogICAgZWxzZToKICAgICAgICBiYi5ub3RlKCJRQSBJc3N1ZTogJXMgWyVzXSIgJSAo
ZXJyb3JfbXNnLCBlcnJvcl9jbGFzcykpCiAgICByZXR1cm4gVHJ1ZQoKZGVmIHBhY2thZ2VfcWFf
d3JpdGVfZXJyb3IodHlwZSwgZXJyb3IsIGQpOgogICAgbG9nZmlsZSA9IGQuZ2V0VmFyKCdRQV9M
T0dGSUxFJykKICAgIGlmIGxvZ2ZpbGU6CiAgICAgICAgcCA9IGQuZ2V0VmFyKCdQJykKICAgICAg
ICB3aXRoIG9wZW4obG9nZmlsZSwgImErIikgYXMgZjoKICAgICAgICAgICAgZi53cml0ZSgiJXM6
ICVzIFslc11cbiIgJSAocCwgZXJyb3IsIHR5cGUpKQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_qa_patch.14518"
Content-Disposition: attachment; filename="run.do_qa_patch.14518"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3ao36>
X-Attachment-Id: f_jz9oy3ao36

ZGVmIGRvX3FhX3BhdGNoKGQpOgogICAgaW1wb3J0IHN1YnByb2Nlc3MKCiAgICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKICAgICMgQ2hlY2sgcGF0Y2gubG9nIGZvciBmdXp6IHdhcm5pbmdzCiAgICAjCiAg
ICAjIEZ1cnRoZXIgaW5mb3JtYXRpb24gb24gd2h5IHdlIGNoZWNrIGZvciBwYXRjaCBmdXp6IHdh
cm5pbmdzOgogICAgIyBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3Bl
bmVtYmVkZGVkLWNvcmUvMjAxOC1NYXJjaC8xNDg2NzUuaHRtbAogICAgIyBodHRwczovL2J1Z3pp
bGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNDUwCiAgICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKCiAgICBsb2dkaXIgPSBkLmdldFZhcignVCcpCiAgICBwYXRjaGxvZyA9IG9zLnBh
dGguam9pbihsb2dkaXIsImxvZy5kb19wYXRjaCIpCgogICAgaWYgb3MucGF0aC5leGlzdHMocGF0
Y2hsb2cpOgogICAgICAgIGZ1enpoZWFkZXIgPSAnLS0tIFBhdGNoIGZ1enogc3RhcnQgLS0tJwog
ICAgICAgIGZ1enpmb290ZXIgPSAnLS0tIFBhdGNoIGZ1enogZW5kIC0tLScKICAgICAgICBzdGF0
ZW1lbnQgPSAiZ3JlcCAtZSAnJXMnICVzID4gL2Rldi9udWxsIiAlIChmdXp6aGVhZGVyLCBwYXRj
aGxvZykKICAgICAgICBpZiBzdWJwcm9jZXNzLmNhbGwoc3RhdGVtZW50LCBzaGVsbD1UcnVlKSA9
PSAwOgogICAgICAgICAgICBtc2cgPSAiRnV6eiBkZXRlY3RlZDpcblxuIgogICAgICAgICAgICBm
dXp6bXNnID0gIiIKICAgICAgICAgICAgaW5GdXp6SW5mbyA9IEZhbHNlCiAgICAgICAgICAgIGYg
PSBvcGVuKHBhdGNobG9nLCAiciIpCiAgICAgICAgICAgIGZvciBsaW5lIGluIGY6CiAgICAgICAg
ICAgICAgICBpZiBmdXp6aGVhZGVyIGluIGxpbmU6CiAgICAgICAgICAgICAgICAgICAgaW5GdXp6
SW5mbyA9IFRydWUKICAgICAgICAgICAgICAgICAgICBmdXp6bXNnID0gIiIKICAgICAgICAgICAg
ICAgIGVsaWYgZnV6emZvb3RlciBpbiBsaW5lOgogICAgICAgICAgICAgICAgICAgIGZ1enptc2cg
PSBmdXp6bXNnLnJlcGxhY2UoJ1xuXG4nLCAnXG4nKQogICAgICAgICAgICAgICAgICAgIG1zZyAr
PSBmdXp6bXNnCiAgICAgICAgICAgICAgICAgICAgbXNnICs9ICJcbiIKICAgICAgICAgICAgICAg
ICAgICBpbkZ1enpJbmZvID0gRmFsc2UKICAgICAgICAgICAgICAgIGVsaWYgaW5GdXp6SW5mbyBh
bmQgbm90ICdOb3cgYXQgcGF0Y2gnIGluIGxpbmU6CiAgICAgICAgICAgICAgICAgICAgZnV6em1z
ZyArPSBsaW5lCiAgICAgICAgICAgIGYuY2xvc2UoKQogICAgICAgICAgICBtc2cgKz0gIlRoZSBj
b250ZXh0IGxpbmVzIGluIHRoZSBwYXRjaGVzIGNhbiBiZSB1cGRhdGVkIHdpdGggZGV2dG9vbDpc
biIKICAgICAgICAgICAgbXNnICs9ICJcbiIKICAgICAgICAgICAgbXNnICs9ICIgICAgZGV2dG9v
bCBtb2RpZnkgJXNcbiIgJSBkLmdldFZhcignUE4nKQogICAgICAgICAgICBtc2cgKz0gIiAgICBk
ZXZ0b29sIGZpbmlzaCAtLWZvcmNlLXBhdGNoLXJlZnJlc2ggJXMgPGxheWVyX3BhdGg+XG5cbiIg
JSBkLmdldFZhcignUE4nKQogICAgICAgICAgICBtc2cgKz0gIkRvbid0IGZvcmdldCB0byByZXZp
ZXcgY2hhbmdlcyBkb25lIGJ5IGRldnRvb2whXG4iCiAgICAgICAgICAgIGlmICdwYXRjaC1mdXp6
JyBpbiBkLmdldFZhcignRVJST1JfUUEnKToKICAgICAgICAgICAgICAgIGJiLmVycm9yKG1zZykK
ICAgICAgICAgICAgZWxpZiAncGF0Y2gtZnV6eicgaW4gZC5nZXRWYXIoJ1dBUk5fUUEnKToKICAg
ICAgICAgICAgICAgIGJiLndhcm4obXNnKQogICAgICAgICAgICBtc2cgPSAiUGF0Y2ggbG9nIGlu
ZGljYXRlcyB0aGF0IHBhdGNoZXMgZG8gbm90IGFwcGx5IGNsZWFubHkuIgogICAgICAgICAgICBw
YWNrYWdlX3FhX2hhbmRsZV9lcnJvcigicGF0Y2gtZnV6eiIsIG1zZywgZCkKCmRvX3FhX3BhdGNo
KGQpCgpkZWYgcGFja2FnZV9xYV9oYW5kbGVfZXJyb3IoZXJyb3JfY2xhc3MsIGVycm9yX21zZywg
ZCk6CiAgICBpZiBlcnJvcl9jbGFzcyBpbiAoZC5nZXRWYXIoIkVSUk9SX1FBIikgb3IgIiIpLnNw
bGl0KCk6CiAgICAgICAgcGFja2FnZV9xYV93cml0ZV9lcnJvcihlcnJvcl9jbGFzcywgZXJyb3Jf
bXNnLCBkKQogICAgICAgIGJiLmVycm9yKCJRQSBJc3N1ZTogJXMgWyVzXSIgJSAoZXJyb3JfbXNn
LCBlcnJvcl9jbGFzcykpCiAgICAgICAgZC5zZXRWYXIoIlFBX1NBTkUiLCBGYWxzZSkKICAgICAg
ICByZXR1cm4gRmFsc2UKICAgIGVsaWYgZXJyb3JfY2xhc3MgaW4gKGQuZ2V0VmFyKCJXQVJOX1FB
Iikgb3IgIiIpLnNwbGl0KCk6CiAgICAgICAgcGFja2FnZV9xYV93cml0ZV9lcnJvcihlcnJvcl9j
bGFzcywgZXJyb3JfbXNnLCBkKQogICAgICAgIGJiLndhcm4oIlFBIElzc3VlOiAlcyBbJXNdIiAl
IChlcnJvcl9tc2csIGVycm9yX2NsYXNzKSkKICAgIGVsc2U6CiAgICAgICAgYmIubm90ZSgiUUEg
SXNzdWU6ICVzIFslc10iICUgKGVycm9yX21zZywgZXJyb3JfY2xhc3MpKQogICAgcmV0dXJuIFRy
dWUKCmRlZiBwYWNrYWdlX3FhX3dyaXRlX2Vycm9yKHR5cGUsIGVycm9yLCBkKToKICAgIGxvZ2Zp
bGUgPSBkLmdldFZhcignUUFfTE9HRklMRScpCiAgICBpZiBsb2dmaWxlOgogICAgICAgIHAgPSBk
LmdldFZhcignUCcpCiAgICAgICAgd2l0aCBvcGVuKGxvZ2ZpbGUsICJhKyIpIGFzIGY6CiAgICAg
ICAgICAgIGYud3JpdGUoIiVzOiAlcyBbJXNdXG4iICUgKHAsIGVycm9yLCB0eXBlKSkKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_qa_unpack.14488"
Content-Disposition: attachment; filename="run.do_qa_unpack.14488"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3as37>
X-Attachment-Id: f_jz9oy3as37

ZGVmIGRvX3FhX3VucGFjayhkKToKICAgIHNyY191cmkgPSBkLmdldFZhcignU1JDX1VSSScpCiAg
ICBzX2RpciA9IGQuZ2V0VmFyKCdTJykKICAgIGlmIHNyY191cmkgYW5kIG5vdCBvcy5wYXRoLmV4
aXN0cyhzX2Rpcik6CiAgICAgICAgYmIud2FybignJXM6IHRoZSBkaXJlY3RvcnkgJXMgKCVzKSBw
b2ludGVkIHRvIGJ5IHRoZSBTIHZhcmlhYmxlIGRvZXNuXCd0IGV4aXN0IC0gcGxlYXNlIHNldCBT
IHdpdGhpbiB0aGUgcmVjaXBlIHRvIHBvaW50IHRvIHdoZXJlIHRoZSBzb3VyY2UgaGFzIGJlZW4g
dW5wYWNrZWQgdG8nICUgKGQuZ2V0VmFyKCdQTicpLCBkLmdldFZhcignUycsIEZhbHNlKSwgc19k
aXIpKQoKZG9fcWFfdW5wYWNrKGQpCgo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_unpack"
Content-Disposition: attachment; filename="run.do_unpack"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3aw38>
X-Attachment-Id: f_jz9oy3aw38

ZGVmIGRvX3VucGFjayhkKToKICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygnYmFzZV9kb191bnBhY2sn
LCBkKQoKZG9fdW5wYWNrKGQpCgpkZWYgYmFzZV9kb191bnBhY2soZCk6CiAgICBzcmNfdXJpID0g
KGQuZ2V0VmFyKCdTUkNfVVJJJykgb3IgIiIpLnNwbGl0KCkKICAgIGlmIGxlbihzcmNfdXJpKSA9
PSAwOgogICAgICAgIHJldHVybgoKICAgIHRyeToKICAgICAgICBmZXRjaGVyID0gYmIuZmV0Y2gy
LkZldGNoKHNyY191cmksIGQpCiAgICAgICAgZmV0Y2hlci51bnBhY2soZC5nZXRWYXIoJ1dPUktE
SVInKSkKICAgIGV4Y2VwdCBiYi5mZXRjaDIuQkJGZXRjaEV4Y2VwdGlvbiBhcyBlOgogICAgICAg
IGJiLmZhdGFsKHN0cihlKSkKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.do_unpack.14488"
Content-Disposition: attachment; filename="run.do_unpack.14488"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3b039>
X-Attachment-Id: f_jz9oy3b039

ZGVmIGRvX3VucGFjayhkKToKICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygnYmFzZV9kb191bnBhY2sn
LCBkKQoKZG9fdW5wYWNrKGQpCgpkZWYgYmFzZV9kb191bnBhY2soZCk6CiAgICBzcmNfdXJpID0g
KGQuZ2V0VmFyKCdTUkNfVVJJJykgb3IgIiIpLnNwbGl0KCkKICAgIGlmIGxlbihzcmNfdXJpKSA9
PSAwOgogICAgICAgIHJldHVybgoKICAgIHRyeToKICAgICAgICBmZXRjaGVyID0gYmIuZmV0Y2gy
LkZldGNoKHNyY191cmksIGQpCiAgICAgICAgZmV0Y2hlci51bnBhY2soZC5nZXRWYXIoJ1dPUktE
SVInKSkKICAgIGV4Y2VwdCBiYi5mZXRjaDIuQkJGZXRjaEV4Y2VwdGlvbiBhcyBlOgogICAgICAg
IGJiLmZhdGFsKHN0cihlKSkKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.extend_recipe_sysroot.14470"
Content-Disposition: attachment; filename="run.extend_recipe_sysroot.14470"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3b440>
X-Attachment-Id: f_jz9oy3b440

ZGVmIGV4dGVuZF9yZWNpcGVfc3lzcm9vdChkKToKICAgIGltcG9ydCBjb3B5CiAgICBpbXBvcnQg
c3VicHJvY2VzcwogICAgaW1wb3J0IGVycm5vCiAgICBpbXBvcnQgY29sbGVjdGlvbnMKICAgIGlt
cG9ydCBnbG9iCgogICAgdGFza2RlcGRhdGEgPSBkLmdldFZhcigiQkJfVEFTS0RFUERBVEEiLCBG
YWxzZSkKICAgIG15dGFza25hbWUgPSBkLmdldFZhcigiQkJfUlVOVEFTSyIpCiAgICBpZiBteXRh
c2tuYW1lLmVuZHN3aXRoKCJfc2V0c2NlbmUiKToKICAgICAgICBteXRhc2tuYW1lID0gbXl0YXNr
bmFtZS5yZXBsYWNlKCJfc2V0c2NlbmUiLCAiIikKICAgIHdvcmtkaXIgPSBkLmdldFZhcigiV09S
S0RJUiIpCiAgICAjYmIud2FybihzdHIodGFza2RlcGRhdGEpKQogICAgcG4gPSBkLmdldFZhcigi
UE4iKQogICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFyKCJTVEFHSU5HX0RJUiIpCiAgICBzaGFyZWRt
YW5pZmVzdHMgPSBkLmdldFZhcigiQ09NUE9ORU5UU19ESVIiKSArICIvbWFuaWZlc3RzIgogICAg
cmVjaXBlc3lzcm9vdCA9IGQuZ2V0VmFyKCJSRUNJUEVfU1lTUk9PVCIpCiAgICByZWNpcGVzeXNy
b290bmF0aXZlID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UX05BVElWRSIpCgogICAgIyBEZXRl
Y3QgYml0YmFrZSAtYiB1c2FnZQogICAgbm9kZXBzID0gZC5nZXRWYXIoIkJCX0xJTUlURURERVBT
Iikgb3IgRmFsc2UKICAgIGlmIG5vZGVwczoKICAgICAgICBsb2NrID0gYmIudXRpbHMubG9ja2Zp
bGUocmVjaXBlc3lzcm9vdCArICIvc3lzcm9vdC5sb2NrIikKICAgICAgICBzdGFnaW5nX3BvcHVs
YXRlX3N5c3Jvb3RfZGlyKHJlY2lwZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUsIFRydWUs
IGQpCiAgICAgICAgc3RhZ2luZ19wb3B1bGF0ZV9zeXNyb290X2RpcihyZWNpcGVzeXNyb290LCBy
ZWNpcGVzeXNyb290bmF0aXZlLCBGYWxzZSwgZCkKICAgICAgICBiYi51dGlscy51bmxvY2tmaWxl
KGxvY2spCiAgICAgICAgcmV0dXJuCgogICAgc3RhcnQgPSBOb25lCiAgICBjb25maWd1cmVkZXBz
ID0gW10KICAgIGZvciBkZXAgaW4gdGFza2RlcGRhdGE6CiAgICAgICAgZGF0YSA9IHRhc2tkZXBk
YXRhW2RlcF0KICAgICAgICBpZiBkYXRhWzFdID09IG15dGFza25hbWUgYW5kIGRhdGFbMF0gPT0g
cG46CiAgICAgICAgICAgIHN0YXJ0ID0gZGVwCiAgICAgICAgICAgIGJyZWFrCiAgICBpZiBzdGFy
dCBpcyBOb25lOgogICAgICAgIGJiLmZhdGFsKCJDb3VsZG4ndCBmaW5kIG91cnNlbGYgaW4gQkJf
VEFTS0RFUERBVEE/IikKCiAgICAjIFdlIG5lZWQgdG8gZmlndXJlIG91dCB3aGljaCBzeXNyb290
IGZpbGVzIHdlIG5lZWQgdG8gZXhwb3NlIHRvIHRoaXMgdGFzay4KICAgICMgVGhpcyBuZWVkcyB0
byBtYXRjaCB3aGF0IHdvdWxkIGdldCByZXN0b3JlZCBmcm9tIHNzdGF0ZSwgd2hpY2ggaXMgY29u
dHJvbGxlZAogICAgIyB1bHRpbWF0ZWx5IGJ5IGNhbGxzIGZyb20gYml0YmFrZSB0byBzZXRzY2Vu
ZV9kZXB2YWxpZCgpLgogICAgIyBUaGF0IGZ1bmN0aW9uIGV4cGVjdHMgYSBzZXRzY2VuZSBkZXBl
bmRlbmN5IHRyZWUuIFdlIGJ1aWxkIGEgZGVwZW5kZW5jeSB0cmVlCiAgICAjIGNvbmRlbnNlZCB0
byBpbnRlci1zc3RhdGUgdGFzayBkZXBlbmRlbmNpZXMsIHNpbWlsYXIgdG8gdGhhdCB1c2VkIGJ5
IHNldHNjZW5lCiAgICAjIHRhc2tzLiBXZSBjYW4gdGhlbiBjYWxsIGludG8gc2V0c2NlbmVfZGVw
dmFsaWQoKSBhbmQgZGVjaWRlCiAgICAjIHdoaWNoIGRlcGVuZGVuY2llcyB3ZSBjYW4gInNlZSIg
YW5kIHNob3VsZCBleHBvc2UgaW4gdGhlIHJlY2lwZSBzcGVjaWZpYyBzeXNyb290LgogICAgc2V0
c2NlbmVkZXBzID0gY29weS5kZWVwY29weSh0YXNrZGVwZGF0YSkKCiAgICBzdGFydCA9IHNldChb
c3RhcnRdKQoKICAgIHNzdGF0ZXRhc2tzID0gZC5nZXRWYXIoIlNTVEFURVRBU0tTIikuc3BsaXQo
KQogICAgIyBBZGQgcmVjaXBlIHNwZWNpZmljIHRhc2tzIHJlZmVyZW5jZWQgYnkgc2V0c2NlbmVf
ZGVwdmFsaWQoKQogICAgc3N0YXRldGFza3MuYXBwZW5kKCJkb19zdGFzaF9sb2NhbGUiKQoKICAg
IGRlZiBwcmludF9kZXBfdHJlZShkZXB0cmVlKToKICAgICAgICBkYXRhID0gIiIKICAgICAgICBm
b3IgZGVwIGluIGRlcHRyZWU6CiAgICAgICAgICAgIGRlcHMgPSAiICAgICIgKyAiXG4gICAgIi5q
b2luKGRlcHRyZWVbZGVwXVszXSkgKyAiXG4iCiAgICAgICAgICAgIGRhdGEgPSBkYXRhICsgIiVz
OlxuICAlc1xuICAlc1xuJXMgICVzXG4gICVzXG4iICUgKGRlcHRyZWVbZGVwXVswXSwgZGVwdHJl
ZVtkZXBdWzFdLCBkZXB0cmVlW2RlcF1bMl0sIGRlcHMsIGRlcHRyZWVbZGVwXVs0XSwgZGVwdHJl
ZVtkZXBdWzVdKQogICAgICAgIHJldHVybiBkYXRhCgogICAgI2JiLm5vdGUoIkZ1bGwgZGVwIHRy
ZWUgaXM6XG4lcyIgJSBwcmludF9kZXBfdHJlZSh0YXNrZGVwZGF0YSkpCgogICAgI2JiLm5vdGUo
IiBzdGFydDIgaXMgJXMiICUgc3RyKHN0YXJ0KSkKCiAgICAjIElmIHN0YXJ0IGlzIGFuIHNzdGF0
ZSB0YXNrIChsaWtlIGRvX3BhY2thZ2UpIHdlIG5lZWQgdG8gYWRkIGluIGl0cyBkaXJlY3QgZGVw
ZW5kZW5jaWVzCiAgICAjIGVsc2UgdGhlIGNvZGUgYmVsb3cgd29uJ3QgcmVjdXJzZSBpbnRvIHRo
ZW0uCiAgICBmb3IgZGVwIGluIHNldChzdGFydCk6CiAgICAgICAgZm9yIGRlcDIgaW4gc2V0c2Nl
bmVkZXBzW2RlcF1bM106CiAgICAgICAgICAgIHN0YXJ0LmFkZChkZXAyKQogICAgICAgIHN0YXJ0
LnJlbW92ZShkZXApCgogICAgI2JiLm5vdGUoIiBzdGFydDMgaXMgJXMiICUgc3RyKHN0YXJ0KSkK
CiAgICAjIENyZWF0ZSBjb2xsYXBzZWQgZG9fcG9wdWxhdGVfc3lzcm9vdCAtPiBkb19wb3B1bGF0
ZV9zeXNyb290IHRyZWUKICAgIGZvciBkZXAgaW4gdGFza2RlcGRhdGE6CiAgICAgICAgZGF0YSA9
IHNldHNjZW5lZGVwc1tkZXBdCiAgICAgICAgaWYgZGF0YVsxXSBub3QgaW4gc3N0YXRldGFza3M6
CiAgICAgICAgICAgIGZvciBkZXAyIGluIHNldHNjZW5lZGVwczoKICAgICAgICAgICAgICAgIGRh
dGEyID0gc2V0c2NlbmVkZXBzW2RlcDJdCiAgICAgICAgICAgICAgICBpZiBkZXAgaW4gZGF0YTJb
M106CiAgICAgICAgICAgICAgICAgICAgZGF0YTJbM10udXBkYXRlKHNldHNjZW5lZGVwc1tkZXBd
WzNdKQogICAgICAgICAgICAgICAgICAgIGRhdGEyWzNdLnJlbW92ZShkZXApCiAgICAgICAgICAg
IGlmIGRlcCBpbiBzdGFydDoKICAgICAgICAgICAgICAgIHN0YXJ0LnVwZGF0ZShzZXRzY2VuZWRl
cHNbZGVwXVszXSkKICAgICAgICAgICAgICAgIHN0YXJ0LnJlbW92ZShkZXApCiAgICAgICAgICAg
IGRlbCBzZXRzY2VuZWRlcHNbZGVwXQoKICAgICMgUmVtb3ZlIGNpcmN1bGFyIHJlZmVyZW5jZXMK
ICAgIGZvciBkZXAgaW4gc2V0c2NlbmVkZXBzOgogICAgICAgIGlmIGRlcCBpbiBzZXRzY2VuZWRl
cHNbZGVwXVszXToKICAgICAgICAgICAgc2V0c2NlbmVkZXBzW2RlcF1bM10ucmVtb3ZlKGRlcCkK
CiAgICAjYmIubm90ZSgiQ29tcHV0ZWQgZGVwIHRyZWUgaXM6XG4lcyIgJSBwcmludF9kZXBfdHJl
ZShzZXRzY2VuZWRlcHMpKQogICAgI2JiLm5vdGUoIiBzdGFydCBpcyAlcyIgJSBzdHIoc3RhcnQp
KQoKICAgICMgRGlyZWN0IGRlcGVuZGVuY2llcyBzaG91bGQgYmUgcHJlc2VudCBhbmQgY2FuIGJl
IGRlcGVuZGVkIHVwb24KICAgIGZvciBkZXAgaW4gc2V0KHN0YXJ0KToKICAgICAgICBpZiBzZXRz
Y2VuZWRlcHNbZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCI6CiAgICAgICAgICAgIGlm
IGRlcCBub3QgaW4gY29uZmlndXJlZGVwczoKICAgICAgICAgICAgICAgIGNvbmZpZ3VyZWRlcHMu
YXBwZW5kKGRlcCkKICAgIGJiLm5vdGUoIkRpcmVjdCBkZXBlbmRlbmNpZXMgYXJlICVzIiAlIHN0
cihjb25maWd1cmVkZXBzKSkKICAgICNiYi5ub3RlKCIgb3IgJXMiICUgc3RyKHN0YXJ0KSkKCiAg
ICBtc2didWYgPSBbXQogICAgIyBDYWxsIGludG8gc2V0c2NlbmVfZGVwdmFsaWQgZm9yIGVhY2gg
c3ViLWRlcGVuZGVuY3kgYW5kIG9ubHkgY29weSBzeXNyb290IGZpbGVzCiAgICAjIGZvciBvbmVz
IHRoYXQgd291bGQgYmUgcmVzdG9yZWQgZnJvbSBzc3RhdGUuCiAgICBkb25lID0gbGlzdChzdGFy
dCkKICAgIG5leHQgPSBsaXN0KHN0YXJ0KQogICAgd2hpbGUgbmV4dDoKICAgICAgICBuZXcgPSBb
XQogICAgICAgIGZvciBkZXAgaW4gbmV4dDoKICAgICAgICAgICAgZGF0YSA9IHNldHNjZW5lZGVw
c1tkZXBdCiAgICAgICAgICAgIGZvciBkYXRhZGVwIGluIGRhdGFbM106CiAgICAgICAgICAgICAg
ICBpZiBkYXRhZGVwIGluIGRvbmU6CiAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAg
ICAgICAgICAgIHRhc2tkZXBzID0ge30KICAgICAgICAgICAgICAgIHRhc2tkZXBzW2RlcF0gPSBz
ZXRzY2VuZWRlcHNbZGVwXVs6Ml0KICAgICAgICAgICAgICAgIHRhc2tkZXBzW2RhdGFkZXBdID0g
c2V0c2NlbmVkZXBzW2RhdGFkZXBdWzoyXQogICAgICAgICAgICAgICAgcmV0dmFsID0gc2V0c2Nl
bmVfZGVwdmFsaWQoZGF0YWRlcCwgdGFza2RlcHMsIFtdLCBkLCBtc2didWYpCiAgICAgICAgICAg
ICAgICBpZiByZXR2YWw6CiAgICAgICAgICAgICAgICAgICAgbXNnYnVmLmFwcGVuZCgiU2tpcHBp
bmcgc2V0c2NlbmUgZGVwZW5kZW5jeSAlcyBmb3IgaW5zdGFsbGF0aW9uIGludG8gdGhlIHN5c3Jv
b3QiICUgZGF0YWRlcCkKICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAg
ICAgZG9uZS5hcHBlbmQoZGF0YWRlcCkKICAgICAgICAgICAgICAgIG5ldy5hcHBlbmQoZGF0YWRl
cCkKICAgICAgICAgICAgICAgIGlmIGRhdGFkZXAgbm90IGluIGNvbmZpZ3VyZWRlcHMgYW5kIHNl
dHNjZW5lZGVwc1tkYXRhZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCI6CiAgICAgICAg
ICAgICAgICAgICAgY29uZmlndXJlZGVwcy5hcHBlbmQoZGF0YWRlcCkKICAgICAgICAgICAgICAg
ICAgICBtc2didWYuYXBwZW5kKCJBZGRpbmcgZGVwZW5kZW5jeSBvbiAlcyIgJSBzZXRzY2VuZWRl
cHNbZGF0YWRlcF1bMF0pCiAgICAgICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgICAg
IG1zZ2J1Zi5hcHBlbmQoIkZvbGxvd2luZyBkZXBlbmRlbmN5IG9uICVzIiAlIHNldHNjZW5lZGVw
c1tkYXRhZGVwXVswXSkKICAgICAgICBuZXh0ID0gbmV3CgogICAgIyBUaGlzIGxvZ2dpbmcgaXMg
dG9vIHZlcmJvc2UgZm9yIGRheSB0byBkYXkgdXNlIHNhZGx5CiAgICAjYmIuZGVidWcoMiwgIlxu
Ii5qb2luKG1zZ2J1ZikpCgogICAgZGVwZGlyID0gcmVjaXBlc3lzcm9vdG5hdGl2ZSArICIvaW5z
dGFsbGVkZGVwcyIKICAgIGJiLnV0aWxzLm1rZGlyaGllcihkZXBkaXIpCiAgICBiYi51dGlscy5t
a2RpcmhpZXIoc2hhcmVkbWFuaWZlc3RzKQoKICAgIGxvY2sgPSBiYi51dGlscy5sb2NrZmlsZShy
ZWNpcGVzeXNyb290ICsgIi9zeXNyb290LmxvY2siKQoKICAgIGZpeG1lID0ge30KICAgIHNlZW5k
aXJzID0gc2V0KCkKICAgIHBvc3RpbnN0cyA9IFtdCiAgICBtdWx0aWxpYnMgPSB7fQogICAgbWFu
aWZlc3RzID0ge30KICAgICMgQWxsIGZpbGVzIHRoYXQgd2UncmUgZ29pbmcgdG8gYmUgaW5zdGFs
bGluZywgdG8gZmluZCBjb25mbGljdHMuCiAgICBmaWxlc2V0ID0ge30KCiAgICBmb3IgZiBpbiBv
cy5saXN0ZGlyKGRlcGRpcik6CiAgICAgICAgaWYgbm90IGYuZW5kc3dpdGgoIi5jb21wbGV0ZSIp
OgogICAgICAgICAgICBjb250aW51ZQogICAgICAgIGYgPSBkZXBkaXIgKyAiLyIgKyBmCiAgICAg
ICAgaWYgb3MucGF0aC5pc2xpbmsoZikgYW5kIG5vdCBvcy5wYXRoLmV4aXN0cyhmKToKICAgICAg
ICAgICAgYmIubm90ZSgiJXMgbm8gbG9uZ2VyIGV4aXN0cywgcmVtb3ZpbmcgZnJvbSBzeXNyb290
IiAlIGYpCiAgICAgICAgICAgIGxuayA9IG9zLnJlYWRsaW5rKGYucmVwbGFjZSgiLmNvbXBsZXRl
IiwgIiIpKQogICAgICAgICAgICBzc3RhdGVfY2xlYW5fbWFuaWZlc3QoZGVwZGlyICsgIi8iICsg
bG5rLCBkLCB3b3JrZGlyKQogICAgICAgICAgICBvcy51bmxpbmsoZikKICAgICAgICAgICAgb3Mu
dW5saW5rKGYucmVwbGFjZSgiLmNvbXBsZXRlIiwgIiIpKQoKICAgIGluc3RhbGxlZCA9IFtdCiAg
ICBmb3IgZGVwIGluIGNvbmZpZ3VyZWRlcHM6CiAgICAgICAgYyA9IHNldHNjZW5lZGVwc1tkZXBd
WzBdCiAgICAgICAgaWYgbXl0YXNrbmFtZSBpbiBbImRvX3Nka19kZXBlbmRzIiwgImRvX3BvcHVs
YXRlX3Nka19leHQiXSBhbmQgYy5lbmRzd2l0aCgiLWluaXRpYWwiKToKICAgICAgICAgICAgYmIu
bm90ZSgiU2tpcHBpbmcgaW5pdGlhbCBzZXRzY2VuZSBkZXBlbmRlbmN5ICVzIGZvciBpbnN0YWxs
YXRpb24gaW50byB0aGUgc3lzcm9vdCIgJSBjKQogICAgICAgICAgICBjb250aW51ZQogICAgICAg
IGluc3RhbGxlZC5hcHBlbmQoYykKCiAgICAjIFdlIHdhbnQgdG8gcmVtb3ZlIGFueXRoaW5nIHdo
aWNoIHRoaXMgdGFzayBwcmV2aW91c2x5IGluc3RhbGxlZCBidXQgaXMgbm8gbG9uZ2VyIGEgZGVw
ZW5kZW5jeQogICAgdGFza2luZGV4ID0gZGVwZGlyICsgIi8iICsgImluZGV4LiIgKyBteXRhc2tu
YW1lCiAgICBpZiBvcy5wYXRoLmV4aXN0cyh0YXNraW5kZXgpOgogICAgICAgIHBvdGVudGlhbCA9
IFtdCiAgICAgICAgd2l0aCBvcGVuKHRhc2tpbmRleCwgInIiKSBhcyBmOgogICAgICAgICAgICBm
b3IgbCBpbiBmOgogICAgICAgICAgICAgICAgbCA9IGwuc3RyaXAoKQogICAgICAgICAgICAgICAg
aWYgbCBub3QgaW4gaW5zdGFsbGVkOgogICAgICAgICAgICAgICAgICAgIGZsID0gZGVwZGlyICsg
Ii8iICsgbAogICAgICAgICAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhmbCk6CiAg
ICAgICAgICAgICAgICAgICAgICAgICMgV2FzIGxpa2VseSBhbHJlYWR5IHVuaW5zdGFsbGVkCiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAgICAgcG90ZW50
aWFsLmFwcGVuZChsKQogICAgICAgICMgV2UgbmVlZCB0byBlbnN1cmUgbm90IG90aGVyIHRhc2sg
bmVlZHMgdGhpcyBkZXBlbmRlbmN5LiBXZSBob2xkIHRoZSBzeXNyb290CiAgICAgICAgIyBsb2Nr
IHNvIHdlIGNhIHNlYXJjaCB0aGUgaW5kZXhlcyB0byBjaGVjawogICAgICAgIGlmIHBvdGVudGlh
bDoKICAgICAgICAgICAgZm9yIGkgaW4gZ2xvYi5nbG9iKGRlcGRpciArICIvaW5kZXguKiIpOgog
ICAgICAgICAgICAgICAgaWYgaS5lbmRzd2l0aCgiLiIgKyBteXRhc2tuYW1lKToKICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgd2l0aCBvcGVuKGksICJyIikgYXMg
ZjoKICAgICAgICAgICAgICAgICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgICAg
ICBsID0gbC5zdHJpcCgpCiAgICAgICAgICAgICAgICAgICAgICAgIGlmIGwgaW4gcG90ZW50aWFs
OgogICAgICAgICAgICAgICAgICAgICAgICAgICAgcG90ZW50aWFsLnJlbW92ZShsKQogICAgICAg
IGZvciBsIGluIHBvdGVudGlhbDoKICAgICAgICAgICAgZmwgPSBkZXBkaXIgKyAiLyIgKyBsCiAg
ICAgICAgICAgIGJiLm5vdGUoIlRhc2sgJXMgbm8gbG9uZ2VyIGRlcGVuZHMgb24gJXMsIHJlbW92
aW5nIGZyb20gc3lzcm9vdCIgJSAobXl0YXNrbmFtZSwgbCkpCiAgICAgICAgICAgIGxuayA9IG9z
LnJlYWRsaW5rKGZsKQogICAgICAgICAgICBzc3RhdGVfY2xlYW5fbWFuaWZlc3QoZGVwZGlyICsg
Ii8iICsgbG5rLCBkLCB3b3JrZGlyKQogICAgICAgICAgICBvcy51bmxpbmsoZmwpCiAgICAgICAg
ICAgIG9zLnVubGluayhmbCArICIuY29tcGxldGUiKQoKICAgIG1zZ19leGlzdHMgPSBbXQogICAg
bXNnX2FkZGluZyA9IFtdCgogICAgZm9yIGRlcCBpbiBjb25maWd1cmVkZXBzOgogICAgICAgIGMg
PSBzZXRzY2VuZWRlcHNbZGVwXVswXQogICAgICAgIGlmIGMgbm90IGluIGluc3RhbGxlZDoKICAg
ICAgICAgICAgY29udGludWUKICAgICAgICB0YXNraGFzaCA9IHNldHNjZW5lZGVwc1tkZXBdWzVd
CiAgICAgICAgdGFza21hbmlmZXN0ID0gZGVwZGlyICsgIi8iICsgYyArICIuIiArIHRhc2toYXNo
CgogICAgICAgIGlmIG9zLnBhdGguZXhpc3RzKGRlcGRpciArICIvIiArIGMpOgogICAgICAgICAg
ICBsbmsgPSBvcy5yZWFkbGluayhkZXBkaXIgKyAiLyIgKyBjKQogICAgICAgICAgICBpZiBsbmsg
PT0gYyArICIuIiArIHRhc2toYXNoIGFuZCBvcy5wYXRoLmV4aXN0cyhkZXBkaXIgKyAiLyIgKyBj
ICsgIi5jb21wbGV0ZSIpOgogICAgICAgICAgICAgICAgbXNnX2V4aXN0cy5hcHBlbmQoYykKICAg
ICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICBi
Yi5ub3RlKCIlcyBleGlzdHMgaW4gc3lzcm9vdCwgYnV0IGlzIHN0YWxlICglcyB2cy4gJXMpLCBy
ZW1vdmluZy4iICUgKGMsIGxuaywgYyArICIuIiArIHRhc2toYXNoKSkKICAgICAgICAgICAgICAg
IHNzdGF0ZV9jbGVhbl9tYW5pZmVzdChkZXBkaXIgKyAiLyIgKyBsbmssIGQsIHdvcmtkaXIpCiAg
ICAgICAgICAgICAgICBvcy51bmxpbmsoZGVwZGlyICsgIi8iICsgYykKICAgICAgICAgICAgICAg
IGlmIG9zLnBhdGgubGV4aXN0cyhkZXBkaXIgKyAiLyIgKyBjICsgIi5jb21wbGV0ZSIpOgogICAg
ICAgICAgICAgICAgICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjICsgIi5jb21wbGV0ZSIp
CiAgICAgICAgZWxpZiBvcy5wYXRoLmxleGlzdHMoZGVwZGlyICsgIi8iICsgYyk6CiAgICAgICAg
ICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjKQoKICAgICAgICBtc2dfYWRkaW5nLmFwcGVu
ZChjKQoKICAgICAgICBvcy5zeW1saW5rKGMgKyAiLiIgKyB0YXNraGFzaCwgZGVwZGlyICsgIi8i
ICsgYykKCiAgICAgICAgbWFuaWZlc3QsIGQyID0gb2Uuc3N0YXRlc2lnLmZpbmRfc3N0YXRlX21h
bmlmZXN0KGMsIHNldHNjZW5lZGVwc1tkZXBdWzJdLCAicG9wdWxhdGVfc3lzcm9vdCIsIGQsIG11
bHRpbGlicykKICAgICAgICBpZiBkMiBpcyBub3QgZDoKICAgICAgICAgICAgIyBJZiB3ZSBkb24n
dCBkbyB0aGlzLCB0aGUgcmVjaXBlIHN5c3Jvb3Qgd2lsbCBiZSBwbGFjZWQgaW4gdGhlIHdyb25n
IFdPUktESVIgZm9yIG11bHRpbGlicwogICAgICAgICAgICAjIFdlIG5lZWQgYSBjb25zaXN0ZW50
IFdPUktESVIgZm9yIHRoZSBpbWFnZQogICAgICAgICAgICBkMi5zZXRWYXIoIldPUktESVIiLCBk
LmdldFZhcigiV09SS0RJUiIpKQogICAgICAgIGRlc3RzeXNyb290ID0gZDIuZ2V0VmFyKCJSRUNJ
UEVfU1lTUk9PVCIpCiAgICAgICAgIyBXZSBwdXQgYWxsYXJjaCByZWNpcGVzIGludG8gdGhlIGRl
ZmF1bHQgc3lzcm9vdAogICAgICAgIGlmIG1hbmlmZXN0IGFuZCAiYWxsYXJjaCIgaW4gbWFuaWZl
c3Q6CiAgICAgICAgICAgIGRlc3RzeXNyb290ID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UIikK
CiAgICAgICAgbmF0aXZlID0gRmFsc2UKICAgICAgICBpZiBjLmVuZHN3aXRoKCItbmF0aXZlIikg
b3IgIi1jcm9zcy0iIGluIGMgb3IgIi1jcm9zc3NkayIgaW4gYzoKICAgICAgICAgICAgbmF0aXZl
ID0gVHJ1ZQoKICAgICAgICBpZiBtYW5pZmVzdDoKICAgICAgICAgICAgbmV3bWFuaWZlc3QgPSBj
b2xsZWN0aW9ucy5PcmRlcmVkRGljdCgpCiAgICAgICAgICAgIHRhcmdldGRpciA9IGRlc3RzeXNy
b290CiAgICAgICAgICAgIGlmIG5hdGl2ZToKICAgICAgICAgICAgICAgIHRhcmdldGRpciA9IHJl
Y2lwZXN5c3Jvb3RuYXRpdmUKICAgICAgICAgICAgaWYgdGFyZ2V0ZGlyIG5vdCBpbiBmaXhtZToK
ICAgICAgICAgICAgICAgIGZpeG1lW3RhcmdldGRpcl0gPSBbXQogICAgICAgICAgICBmbSA9IGZp
eG1lW3RhcmdldGRpcl0KCiAgICAgICAgICAgIHdpdGggb3BlbihtYW5pZmVzdCwgInIiKSBhcyBm
OgogICAgICAgICAgICAgICAgbWFuaWZlc3RzW2RlcF0gPSBtYW5pZmVzdAogICAgICAgICAgICAg
ICAgZm9yIGwgaW4gZjoKICAgICAgICAgICAgICAgICAgICBsID0gbC5zdHJpcCgpCiAgICAgICAg
ICAgICAgICAgICAgaWYgbC5lbmRzd2l0aCgiL2ZpeG1lcGF0aCIpOgogICAgICAgICAgICAgICAg
ICAgICAgICBmbS5hcHBlbmQobCkKICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAg
ICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoLmNtZCIpOgogICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIGRlc3QgPSBsLnJl
cGxhY2Uoc3RhZ2luZ2RpciwgIiIpCiAgICAgICAgICAgICAgICAgICAgZGVzdCA9ICIvIiArICIv
Ii5qb2luKGRlc3Quc3BsaXQoIi8iKVszOl0pCiAgICAgICAgICAgICAgICAgICAgbmV3bWFuaWZl
c3RbbF0gPSB0YXJnZXRkaXIgKyBkZXN0CgogICAgICAgICAgICAgICAgICAgICMgQ2hlY2sgaWYg
ZmlsZXMgaGF2ZSBhbHJlYWR5IGJlZW4gaW5zdGFsbGVkIGJ5IGFub3RoZXIKICAgICAgICAgICAg
ICAgICAgICAjIHJlY2lwZSBhbmQgYWJvcnQgaWYgdGhleSBoYXZlLCBleHBsYWluaW5nIHdoYXQg
cmVjaXBlcyBhcmUKICAgICAgICAgICAgICAgICAgICAjIGNvbmZsaWN0aW5nLgogICAgICAgICAg
ICAgICAgICAgIGhhc2huYW1lID0gdGFyZ2V0ZGlyICsgZGVzdAogICAgICAgICAgICAgICAgICAg
IGlmIG5vdCBoYXNobmFtZS5lbmRzd2l0aCgiLyIpOgogICAgICAgICAgICAgICAgICAgICAgICBp
ZiBoYXNobmFtZSBpbiBmaWxlc2V0OgogICAgICAgICAgICAgICAgICAgICAgICAgICAgYmIuZmF0
YWwoIlRoZSBmaWxlICVzIGlzIGluc3RhbGxlZCBieSBib3RoICVzIGFuZCAlcywgYWJvcnRpbmci
ICUgKGRlc3QsIGMsIGZpbGVzZXRbaGFzaG5hbWVdKSkKICAgICAgICAgICAgICAgICAgICAgICAg
ZWxzZToKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGVzZXRbaGFzaG5hbWVdID0gYwoK
ICAgICAgICAgICAgIyBIYXZpbmcgbXVsdGlwbGUgaWRlbnRpY2FsIG1hbmlmZXN0cyBpbiBlYWNo
IHN5c3Jvb3QgZWF0cyBkaXNrc3BhY2Ugc28KICAgICAgICAgICAgIyBjcmVhdGUgYSBzaGFyZWQg
cG9vbCBvZiB0aGVtIGFuZCBoYXJkbGluayBpZiB3ZSBjYW4uCiAgICAgICAgICAgICMgV2UgY3Jl
YXRlIHRoZSBtYW5pZmVzdCBpbiBhZHZhbmNlIHNvIHRoYXQgaWYgc29tZXRoaW5nIGZhaWxzIGR1
cmluZyBpbnN0YWxsYXRpb24sCiAgICAgICAgICAgICMgb3IgdGhlIGJ1aWxkIGlzIGludGVycnVw
dGVkLCBzdWJzZXF1ZW50IGV4ZXVjdGlvbiBjYW4gY2xlYW51cC4KICAgICAgICAgICAgc2hhcmVk
bSA9IHNoYXJlZG1hbmlmZXN0cyArICIvIiArIG9zLnBhdGguYmFzZW5hbWUodGFza21hbmlmZXN0
KQogICAgICAgICAgICBpZiBub3Qgb3MucGF0aC5leGlzdHMoc2hhcmVkbSk6CiAgICAgICAgICAg
ICAgICBzbWxvY2sgPSBiYi51dGlscy5sb2NrZmlsZShzaGFyZWRtICsgIi5sb2NrIikKICAgICAg
ICAgICAgICAgICMgQ2FuIHJhY2UgaGVyZS4gWW91J2QgdGhpbmsgaXQganVzdCBtZWFucyB3ZSBt
YXkgbm90IGVuZCB1cCB3aXRoIGFsbCBjb3BpZXMgaGFyZGxpbmtlZCB0byBlYWNoIG90aGVyCiAg
ICAgICAgICAgICAgICAjIGJ1dCBweXRob24gY2FuIGxvc2UgZmlsZSBoYW5kbGVzIHNvIHdlIG5l
ZWQgdG8gZG8gdGhpcyB1bmRlciBhIGxvY2suCiAgICAgICAgICAgICAgICBpZiBub3Qgb3MucGF0
aC5leGlzdHMoc2hhcmVkbSk6CiAgICAgICAgICAgICAgICAgICAgd2l0aCBvcGVuKHNoYXJlZG0s
ICd3JykgYXMgbToKICAgICAgICAgICAgICAgICAgICAgICBmb3IgbCBpbiBuZXdtYW5pZmVzdDoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVzdCA9IG5ld21hbmlmZXN0W2xdCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG0ud3JpdGUoZGVzdC5yZXBsYWNlKHdvcmtkaXIgKyAiLyIsICIi
KSArICJcbiIpCiAgICAgICAgICAgICAgICBiYi51dGlscy51bmxvY2tmaWxlKHNtbG9jaykKICAg
ICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgb3MubGluayhzaGFyZWRtLCB0YXNrbWFuaWZl
c3QpCiAgICAgICAgICAgIGV4Y2VwdCBPU0Vycm9yIGFzIGVycjoKICAgICAgICAgICAgICAgIGlm
IGVyci5lcnJubyA9PSBlcnJuby5FWERFVjoKICAgICAgICAgICAgICAgICAgICBiYi51dGlscy5j
b3B5ZmlsZShzaGFyZWRtLCB0YXNrbWFuaWZlc3QpCiAgICAgICAgICAgICAgICBlbHNlOgogICAg
ICAgICAgICAgICAgICAgIHJhaXNlCiAgICAgICAgICAgICMgRmluYWxseSBhY3R1YWxseSBpbnN0
YWxsIHRoZSBmaWxlcwogICAgICAgICAgICBmb3IgbCBpbiBuZXdtYW5pZmVzdDoKICAgICAgICAg
ICAgICAgICAgICBkZXN0ID0gbmV3bWFuaWZlc3RbbF0KICAgICAgICAgICAgICAgICAgICBpZiBs
LmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWRpcihs
LCB0YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZQogICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWZpbGUobCwgdGFyZ2V0ZGlyLCBk
ZXN0LCBwb3N0aW5zdHMsIHNlZW5kaXJzKQoKICAgIGJiLm5vdGUoIkluc3RhbGxlZCBpbnRvIHN5
c3Jvb3Q6ICVzIiAlIHN0cihtc2dfYWRkaW5nKSkKICAgIGJiLm5vdGUoIlNraXBwaW5nIGFzIGFs
cmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6ICVzIiAlIHN0cihtc2dfZXhpc3RzKSkKCiAgICBmb3Ig
ZiBpbiBmaXhtZToKICAgICAgICBzdGFnaW5nX3Byb2Nlc3NmaXhtZShmaXhtZVtmXSwgZiwgcmVj
aXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgZCkKCiAgICBmb3IgcCBpbiBwb3N0aW5z
dHM6CiAgICAgICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQocCwgc2hlbGw9VHJ1ZSwgc3RkZXJy
PXN1YnByb2Nlc3MuU1RET1VUKQoKICAgIGZvciBkZXAgaW4gbWFuaWZlc3RzOgogICAgICAgIGMg
PSBzZXRzY2VuZWRlcHNbZGVwXVswXQogICAgICAgIG9zLnN5bWxpbmsobWFuaWZlc3RzW2RlcF0s
IGRlcGRpciArICIvIiArIGMgKyAiLmNvbXBsZXRlIikKCiAgICB3aXRoIG9wZW4odGFza2luZGV4
LCAidyIpIGFzIGY6CiAgICAgICAgZm9yIGwgaW4gc29ydGVkKGluc3RhbGxlZCk6CiAgICAgICAg
ICAgIGYud3JpdGUobCArICJcbiIpCgogICAgYmIudXRpbHMudW5sb2NrZmlsZShsb2NrKQoKZXh0
ZW5kX3JlY2lwZV9zeXNyb290KGQpCgpkZWYgc3RhZ2luZ19wcm9jZXNzZml4bWUoZml4bWUsIHRh
cmdldCwgcmVjaXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgZCk6CiAgICBpbXBvcnQg
c3VicHJvY2VzcwoKICAgIGlmIG5vdCBmaXhtZToKICAgICAgICByZXR1cm4KICAgIGNtZCA9ICJz
ZWQgLWUgJ3M6XlteL10qLzolcy86ZycgJXMgfCB4YXJncyBzZWQgLWkgLWUgJ3M6RklYTUVTVEFH
SU5HRElSVEFSR0VUOiVzOmc7IHM6RklYTUVTVEFHSU5HRElSSE9TVDolczpnJyIgJSAodGFyZ2V0
LCAiICIuam9pbihmaXhtZSksIHJlY2lwZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUpCiAg
ICBmb3IgZml4bWV2YXIgaW4gWydQU0VVRE9fU1lTUk9PVCcsICdIT1NUVE9PTFNfRElSJywgJ1BL
R0RBVEFfRElSJywgJ1BTRVVET19MT0NBTFNUQVRFRElSJywgJ0xPR0ZJRk8nXToKICAgICAgICBm
aXhtZV9wYXRoID0gZC5nZXRWYXIoZml4bWV2YXIpCiAgICAgICAgY21kICs9ICIgLWUgJ3M6RklY
TUVfJXM6JXM6ZyciICUgKGZpeG1ldmFyLCBmaXhtZV9wYXRoKQogICAgYmIuZGVidWcoMiwgY21k
KQogICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoY21kLCBzaGVsbD1UcnVlLCBzdGRlcnI9c3Vi
cHJvY2Vzcy5TVERPVVQpCgpkZWYgc3RhZ2luZ19jb3B5ZGlyKGMsIHRhcmdldCwgZGVzdCwgc2Vl
bmRpcnMpOgogICAgaWYgZGVzdCBub3QgaW4gc2VlbmRpcnM6CiAgICAgICAgYmIudXRpbHMubWtk
aXJoaWVyKGRlc3QpCiAgICAgICAgc2VlbmRpcnMuYWRkKGRlc3QpCgpkZWYgc3RhZ2luZ19wb3B1
bGF0ZV9zeXNyb290X2Rpcih0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBuYXRpdmUsIGQp
OgogICAgaW1wb3J0IGdsb2IKICAgIGltcG9ydCBzdWJwcm9jZXNzCiAgICBpbXBvcnQgZXJybm8K
CiAgICBmaXhtZSA9IFtdCiAgICBwb3N0aW5zdHMgPSBbXQogICAgc2VlbmRpcnMgPSBzZXQoKQog
ICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFyKCJTVEFHSU5HX0RJUiIpCiAgICBpZiBuYXRpdmU6CiAg
ICAgICAgcGtnYXJjaHMgPSBbJyR7QlVJTERfQVJDSH0nLCAnJHtCVUlMRF9BUkNIfV8qJ10KICAg
ICAgICB0YXJnZXRkaXIgPSBuYXRpdmVzeXNyb290CiAgICBlbHNlOgogICAgICAgIHBrZ2FyY2hz
ID0gWycke01BQ0hJTkVfQVJDSH0nXQogICAgICAgIHBrZ2FyY2hzID0gcGtnYXJjaHMgKyBsaXN0
KHJldmVyc2VkKGQuZ2V0VmFyKCJQQUNLQUdFX0VYVFJBX0FSQ0hTIikuc3BsaXQoKSkpCiAgICAg
ICAgcGtnYXJjaHMuYXBwZW5kKCdhbGxhcmNoJykKICAgICAgICB0YXJnZXRkaXIgPSB0YXJnZXRz
eXNyb290CgogICAgYmIudXRpbHMubWtkaXJoaWVyKHRhcmdldGRpcikKICAgIGZvciBwa2dhcmNo
IGluIHBrZ2FyY2hzOgogICAgICAgIGZvciBtYW5pZmVzdCBpbiBnbG9iLmdsb2IoZC5leHBhbmQo
IiR7U1NUQVRFX01BTklGRVNUU30vbWFuaWZlc3QtJXMtKi5wb3B1bGF0ZV9zeXNyb290IiAlIHBr
Z2FyY2gpKToKICAgICAgICAgICAgaWYgbWFuaWZlc3QuZW5kc3dpdGgoIi1pbml0aWFsLnBvcHVs
YXRlX3N5c3Jvb3QiKToKICAgICAgICAgICAgICAgICMgc2tpcCBnbGliYy1pbml0aWFsIGFuZCBs
aWJnY2MtaW5pdGlhbCBkdWUgdG8gZmlsZSBvdmVybGFwCiAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICBpZiBub3QgbmF0aXZlIGFuZCAobWFuaWZlc3QuZW5kc3dpdGgoIi1uYXRp
dmUucG9wdWxhdGVfc3lzcm9vdCIpIG9yICJuYXRpdmVzZGstIiBpbiBtYW5pZmVzdCk6CiAgICAg
ICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICBpZiBuYXRpdmUgYW5kIG5vdCAobWFuaWZl
c3QuZW5kc3dpdGgoIi1uYXRpdmUucG9wdWxhdGVfc3lzcm9vdCIpIG9yIG1hbmlmZXN0LmVuZHN3
aXRoKCItY3Jvc3MucG9wdWxhdGVfc3lzcm9vdCIpIG9yICItY3Jvc3MtIiBpbiBtYW5pZmVzdCk6
CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICB0bWFuaWZlc3QgPSB0YXJnZXRk
aXIgKyAiLyIgKyBvcy5wYXRoLmJhc2VuYW1lKG1hbmlmZXN0KQogICAgICAgICAgICBpZiBvcy5w
YXRoLmV4aXN0cyh0bWFuaWZlc3QpOgogICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAg
ICAgdHJ5OgogICAgICAgICAgICAgICAgb3MubGluayhtYW5pZmVzdCwgdG1hbmlmZXN0KQogICAg
ICAgICAgICBleGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgICAgICBpZiBlcnIuZXJy
bm8gPT0gZXJybm8uRVhERVY6CiAgICAgICAgICAgICAgICAgICAgYmIudXRpbHMuY29weWZpbGUo
bWFuaWZlc3QsIHRtYW5pZmVzdCkKICAgICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAg
ICAgICAgcmFpc2UKICAgICAgICAgICAgd2l0aCBvcGVuKG1hbmlmZXN0LCAiciIpIGFzIGY6CiAg
ICAgICAgICAgICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgIGwgPSBsLnN0cmlw
KCkKICAgICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoIik6CiAgICAg
ICAgICAgICAgICAgICAgICAgIGZpeG1lLmFwcGVuZChsKQogICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIGlmIGwuZW5kc3dpdGgoIi9maXhtZXBhdGgu
Y21kIik6CiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAg
ICAgZGVzdCA9IGwucmVwbGFjZShzdGFnaW5nZGlyLCAiIikKICAgICAgICAgICAgICAgICAgICBk
ZXN0ID0gdGFyZ2V0ZGlyICsgIi8iICsgIi8iLmpvaW4oZGVzdC5zcGxpdCgiLyIpWzM6XSkKICAg
ICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YWdpbmdfY29weWRpcihsLCB0YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIHRyeToKICAgICAg
ICAgICAgICAgICAgICAgICAgc3RhZ2luZ19jb3B5ZmlsZShsLCB0YXJnZXRkaXIsIGRlc3QsIHBv
c3RpbnN0cywgc2VlbmRpcnMpCiAgICAgICAgICAgICAgICAgICAgZXhjZXB0IEZpbGVFeGlzdHNF
cnJvcjoKICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKCiAgICBzdGFnaW5nX3Byb2Nl
c3NmaXhtZShmaXhtZSwgdGFyZ2V0ZGlyLCB0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBk
KQogICAgZm9yIHAgaW4gcG9zdGluc3RzOgogICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0
KHAsIHNoZWxsPVRydWUsIHN0ZGVycj1zdWJwcm9jZXNzLlNURE9VVCkKCiMKIyBNYW5pZmVzdHMg
aGVyZSBhcmUgY29tcGxpY2F0ZWQuIFRoZSBtYWluIHN5c3Jvb3QgYXJlYSBoYXMgdGhlIHVucGFj
a2VkIHNzdGF0ZQojIHdoaWNoIHVzIHVucmVsb2NhdGVkIGFuZCB0cmFja2VkIGJ5IHRoZSBtYWlu
IHNzdGF0ZSBtYW5pZmVzdHMuIEVhY2ggcmVjaXBlCiMgc3BlY2lmaWMgc3lzcm9vdCBoYXMgbWFu
aWZlc3RzIGZvciBlYWNoIGRlcGVuZGVuY3kgdGhhdCBpcyBpbnN0YWxsZWQgdGhlcmUuCiMgVGhl
IHRhc2sgaGFzaCBpcyB1c2VkIHRvIHRlbGwgd2hldGhlciB0aGUgZGF0YSBuZWVkcyB0byBiZSBy
ZWluc3RhbGxlZC4gV2UKIyB1c2UgYSBzeW1saW5rIHRvIHBvaW50IHRvIHRoZSBjdXJyZW50bHkg
aW5zdGFsbGVkIGhhc2guIFRoZXJlIGlzIGFsc28gYQojICJjb21wbGV0ZSIgc3RhbXAgZmlsZSB3
aGljaCBpcyB1c2VkIHRvIG1hcmsgaWYgaW5zdGFsbGF0aW9uIGNvbXBsZXRlZC4gSWYKIyBzb21l
dGhpbmcgZmFpbHMgKGUuZy4gYSBwb3N0aW5zdCksIHRoaXMgd29uJ3QgZ2V0IHdyaXR0ZW4gYW5k
IHdlIHdvdWxkCiMgcmVtb3ZlIGFuZCByZWluc3RhbGwgdGhlIGRlcGVuZGVuY3kuIFRoaXMgYWxz
byBtZWFucyBwYXJ0aWFsbHkgaW5zdGFsbGVkCiMgZGVwZW5kZW5jaWVzIHNob3VsZCBnZXQgY2xl
YW5lZCB1cCBjb3JyZWN0bHkuCiMKCmRlZiBzdGFnaW5nX2NvcHlmaWxlKGMsIHRhcmdldCwgZGVz
dCwgcG9zdGluc3RzLCBzZWVuZGlycyk6CiAgICBpbXBvcnQgZXJybm8KCiAgICBkZXN0ZGlyID0g
b3MucGF0aC5kaXJuYW1lKGRlc3QpCiAgICBpZiBkZXN0ZGlyIG5vdCBpbiBzZWVuZGlyczoKICAg
ICAgICBiYi51dGlscy5ta2RpcmhpZXIoZGVzdGRpcikKICAgICAgICBzZWVuZGlycy5hZGQoZGVz
dGRpcikKICAgIGlmICIvdXNyL2Jpbi9wb3N0aW5zdC0iIGluIGM6CiAgICAgICAgcG9zdGluc3Rz
LmFwcGVuZChkZXN0KQogICAgaWYgb3MucGF0aC5pc2xpbmsoYyk6CiAgICAgICAgbGlua3RvID0g
b3MucmVhZGxpbmsoYykKICAgICAgICBpZiBvcy5wYXRoLmxleGlzdHMoZGVzdCk6CiAgICAgICAg
ICAgIGlmIG5vdCBvcy5wYXRoLmlzbGluayhkZXN0KToKICAgICAgICAgICAgICAgIHJhaXNlIE9T
RXJyb3IoZXJybm8uRUVYSVNULCAiTGluayAlcyBhbHJlYWR5IGV4aXN0cyBhcyBhIGZpbGUiICUg
ZGVzdCwgZGVzdCkKICAgICAgICAgICAgaWYgb3MucmVhZGxpbmsoZGVzdCkgPT0gbGlua3RvOgog
ICAgICAgICAgICAgICAgcmV0dXJuIGRlc3QKICAgICAgICAgICAgcmFpc2UgT1NFcnJvcihlcnJu
by5FRVhJU1QsICJMaW5rICVzIGFscmVhZHkgZXhpc3RzIHRvIGEgZGlmZmVyZW50IGxvY2F0aW9u
PyAoJXMgdnMgJXMpIiAlIChkZXN0LCBvcy5yZWFkbGluayhkZXN0KSwgbGlua3RvKSwgZGVzdCkK
ICAgICAgICBvcy5zeW1saW5rKGxpbmt0bywgZGVzdCkKICAgICAgICAjYmIud2FybihjKQogICAg
ZWxzZToKICAgICAgICB0cnk6CiAgICAgICAgICAgIG9zLmxpbmsoYywgZGVzdCkKICAgICAgICBl
eGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgIGlmIGVyci5lcnJubyA9PSBlcnJuby5F
WERFVjoKICAgICAgICAgICAgICAgIGJiLnV0aWxzLmNvcHlmaWxlKGMsIGRlc3QpCiAgICAgICAg
ICAgIGVsc2U6CiAgICAgICAgICAgICAgICByYWlzZQogICAgcmV0dXJuIGRlc3QKCmRlZiBzc3Rh
dGVfY2xlYW5fbWFuaWZlc3QobWFuaWZlc3QsIGQsIHByZWZpeD1Ob25lKToKICAgIGltcG9ydCBv
ZS5wYXRoCgogICAgbWZpbGUgPSBvcGVuKG1hbmlmZXN0KQogICAgZW50cmllcyA9IG1maWxlLnJl
YWRsaW5lcygpCiAgICBtZmlsZS5jbG9zZSgpCgogICAgZm9yIGVudHJ5IGluIGVudHJpZXM6CiAg
ICAgICAgZW50cnkgPSBlbnRyeS5zdHJpcCgpCiAgICAgICAgaWYgcHJlZml4IGFuZCBub3QgZW50
cnkuc3RhcnRzd2l0aCgiLyIpOgogICAgICAgICAgICBlbnRyeSA9IHByZWZpeCArICIvIiArIGVu
dHJ5CiAgICAgICAgYmIuZGVidWcoMiwgIlJlbW92aW5nIG1hbmlmZXN0OiAlcyIgJSBlbnRyeSkK
ICAgICAgICAjIFdlIGNhbiByYWNlIGFnYWluc3QgYW5vdGhlciBwYWNrYWdlIHBvcHVsYXRpbmcg
ZGlyZWN0b3JpZXMgYXMgd2UncmUgcmVtb3ZpbmcgdGhlbQogICAgICAgICMgc28gd2UgaWdub3Jl
IGVycm9ycyBoZXJlLgogICAgICAgIHRyeToKICAgICAgICAgICAgaWYgZW50cnkuZW5kc3dpdGgo
Ii8iKToKICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguaXNsaW5rKGVudHJ5WzotMV0pOgogICAg
ICAgICAgICAgICAgICAgIG9zLnJlbW92ZShlbnRyeVs6LTFdKQogICAgICAgICAgICAgICAgZWxp
ZiBvcy5wYXRoLmV4aXN0cyhlbnRyeSkgYW5kIGxlbihvcy5saXN0ZGlyKGVudHJ5KSkgPT0gMDoK
ICAgICAgICAgICAgICAgICAgICBvcy5ybWRpcihlbnRyeVs6LTFdKQogICAgICAgICAgICBlbHNl
OgogICAgICAgICAgICAgICAgb3MucmVtb3ZlKGVudHJ5KQogICAgICAgIGV4Y2VwdCBPU0Vycm9y
OgogICAgICAgICAgICBwYXNzCgogICAgcG9zdHJtID0gbWFuaWZlc3QgKyAiLnBvc3RybSIKICAg
IGlmIG9zLnBhdGguZXhpc3RzKG1hbmlmZXN0ICsgIi5wb3N0cm0iKToKICAgICAgICBpbXBvcnQg
c3VicHJvY2VzcwogICAgICAgIG9zLmNobW9kKHBvc3RybSwgMG83NTUpCiAgICAgICAgc3VicHJv
Y2Vzcy5jaGVja19jYWxsKHBvc3RybSwgc2hlbGw9VHJ1ZSkKICAgICAgICBvZS5wYXRoLnJlbW92
ZShwb3N0cm0pCgogICAgb2UucGF0aC5yZW1vdmUobWFuaWZlc3QpCgpkZWYgc2V0c2NlbmVfZGVw
dmFsaWQodGFzaywgdGFza2RlcGVuZGVlcywgbm90bmVlZGVkLCBkLCBsb2c9Tm9uZSk6CiAgICAj
IHRhc2tkZXBlbmRlZXMgaXMgYSBkaWN0IG9mIHRhc2tzIHdoaWNoIGRlcGVuZCBvbiB0YXNrLCBl
YWNoIGJlaW5nIGEgMyBpdGVtIGxpc3Qgb2YgW1BOLCBUQVNLTkFNRSwgRklMRU5BTUVdCiAgICAj
IHRhc2sgaXMgaW5jbHVkZWQgaW4gdGFza2RlcGVuZGVlcyB0b28KICAgICMgUmV0dXJuIC0gRmFs
c2UgLSBXZSBuZWVkIHRoaXMgZGVwZW5kZW5jeQogICAgIyAgICAgICAgLSBUcnVlIC0gV2UgY2Fu
IHNraXAgdGhpcyBkZXBlbmRlbmN5CiAgICBpbXBvcnQgcmUKCiAgICBkZWYgbG9naXQobXNnLCBs
b2cpOgogICAgICAgIGlmIGxvZyBpcyBub3QgTm9uZToKICAgICAgICAgICAgbG9nLmFwcGVuZCht
c2cpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgYmIuZGVidWcoMiwgbXNnKQoKICAgIGxvZ2l0
KCJDb25zaWRlcmluZyBzZXRzY2VuZSB0YXNrOiAlcyIgJSAoc3RyKHRhc2tkZXBlbmRlZXNbdGFz
a10pKSwgbG9nKQoKICAgIGRlZiBpc05hdGl2ZUNyb3NzKHgpOgogICAgICAgIHJldHVybiB4LmVu
ZHN3aXRoKCItbmF0aXZlIikgb3IgIi1jcm9zcy0iIGluIHggb3IgIi1jcm9zc3NkayIgaW4geCBv
ciB4LmVuZHN3aXRoKCItY3Jvc3MiKQoKICAgICMgV2Ugb25seSBuZWVkIHRvIHRyaWdnZXIgcG9w
dWxhdGVfbGljIHRocm91Z2ggZGlyZWN0IGRlcGVuZGVuY2llcwogICAgaWYgdGFza2RlcGVuZGVl
c1t0YXNrXVsxXSA9PSAiZG9fcG9wdWxhdGVfbGljIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAg
ICMgc3Rhc2hfbG9jYWxlIGFuZCBnY2Nfc3Rhc2hfYnVpbGRkaXIgYXJlIG5ldmVyIG5lZWRlZCBh
cyBhIGRlcGVuZGVuY3kgZm9yIGJ1aWx0IG9iamVjdHMKICAgIGlmIHRhc2tkZXBlbmRlZXNbdGFz
a11bMV0gPT0gImRvX3N0YXNoX2xvY2FsZSIgb3IgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAi
ZG9fZ2NjX3N0YXNoX2J1aWxkZGlyIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAgICMgV2Ugb25s
eSBuZWVkIHRvIHRyaWdnZXIgcGFja2FnZWRhdGEgdGhyb3VnaCBkaXJlY3QgZGVwZW5kZW5jaWVz
CiAgICAjIGJ1dCBuZWVkIHRvIHByZXNlcnZlIHBhY2thZ2VkYXRhIG9uIHBhY2thZ2VkYXRhIGxp
bmtzCiAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICJkb19wYWNrYWdlZGF0YSI6CiAg
ICAgICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgogICAgICAgICAgICBpZiB0YXNrZGVwZW5k
ZWVzW2RlcF1bMV0gPT0gImRvX3BhY2thZ2VkYXRhIjoKICAgICAgICAgICAgICAgIHJldHVybiBG
YWxzZQogICAgICAgIHJldHVybiBUcnVlCgogICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgog
ICAgICAgIGxvZ2l0KCIgIGNvbnNpZGVyaW5nIGRlcGVuZGVuY3k6ICVzIiAlIChzdHIodGFza2Rl
cGVuZGVlc1tkZXBdKSksIGxvZykKICAgICAgICBpZiB0YXNrID09IGRlcDoKICAgICAgICAgICAg
Y29udGludWUKICAgICAgICBpZiBkZXAgaW4gbm90bmVlZGVkOgogICAgICAgICAgICBjb250aW51
ZQogICAgICAgICMgZG9fcGFja2FnZV93cml0ZV8qIGFuZCBkb19wYWNrYWdlIGRvZXNuJ3QgbmVl
ZCBkb19wYWNrYWdlCiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcGFj
a2FnZSIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBbJ2RvX3BhY2thZ2UnLCAnZG9fcGFj
a2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0
ZV9ycG0nLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAgICAgICBj
b250aW51ZQogICAgICAgICMgZG9fcGFja2FnZV93cml0ZV8qIG5lZWQgZG9fcG9wdWxhdGVfc3lz
cm9vdCBhcyB0aGV5J3JlIG1haW5seSBwb3N0aW5zdGFsbCBkZXBlbmRlbmNpZXMKICAgICAgICBp
ZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICJkb19wb3B1bGF0ZV9zeXNyb290IiBhbmQgdGFz
a2RlcGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2Fn
ZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0nXToKICAgICAgICAgICAgcmV0dXJu
IEZhbHNlCiAgICAgICAgIyBkb19wYWNrYWdlL3BhY2thZ2VkYXRhL3BhY2thZ2VfcWEgZG9uJ3Qg
bmVlZCBkb19wb3B1bGF0ZV9zeXNyb290CiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsx
XSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBb
J2RvX3BhY2thZ2UnLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAg
ICAgICBjb250aW51ZQogICAgICAgICMgTmF0aXZlL0Nyb3NzIHBhY2thZ2VzIGRvbid0IGV4aXN0
IGFuZCBhcmUgbm9leGVjIGFueXdheQogICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVu
ZGVlc1tkZXBdWzBdKSBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93
cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0n
LCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZScsICdkb19wYWNrYWdlX3FhJ106CiAgICAg
ICAgICAgIGNvbnRpbnVlCgogICAgICAgICMgVGhpcyBpcyBkdWUgdG8gdGhlIFtkZXBlbmRzXSBp
biB1c2VyYWRkLmJiY2xhc3MgY29tcGxpY2F0aW5nIG1hdHRlcnMKICAgICAgICAjIFRoZSBsb2dp
YyAqaXMqIHJldmVyc2VkIGhlcmUgZHVlIHRvIHRoZSB3YXkgaGFyZCBzZXRzY2VuZSBkZXBlbmRl
bmNpZXMgYXJlIGluamVjdGVkCiAgICAgICAgaWYgKHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0g
J2RvX3BhY2thZ2UnIG9yIHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5
c3Jvb3QnKSBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzBdLmVuZHN3aXRoKCgnc2hhZG93LW5hdGl2
ZScsICdzaGFkb3ctc3lzcm9vdCcsICdiYXNlLXBhc3N3ZCcsICdwc2V1ZG8tbmF0aXZlJykpIGFu
ZCB0YXNrZGVwZW5kZWVzW2RlcF1bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5c3Jvb3QnOgogICAgICAg
ICAgICBjb250aW51ZQoKICAgICAgICAjIENvbnNpZGVyIHN5c3Jvb3QgZGVwZW5kaW5nIG9uIHN5
c3Jvb3QgdGFza3MKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19wb3B1
bGF0ZV9zeXNyb290JyBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdID09ICdkb19wb3B1bGF0ZV9z
eXNyb290JzoKICAgICAgICAgICAgIyBBbGxvdyBleGNsdWRpbmcgY2VydGFpbiByZWN1cnNpdmUg
ZGVwZW5kZW5jaWVzLiBJZiBhIHJlY2lwZSBuZWVkcyBpdCBzaG91bGQgYWRkIGEKICAgICAgICAg
ICAgIyBzcGVjaWZpYyBkZXBlbmRlbmN5IGl0c2VsZiwgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBv
bmUgb2YgaXRzIGRlcGVuZGVlcyB0byBwdWxsCiAgICAgICAgICAgICMgdGhlbSBpbi4KICAgICAg
ICAgICAgIyBTZWUgYWxzbyBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwv
b3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1KYW51YXJ5LzE0NjMyNC5odG1sCiAgICAgICAgICAgIG5v
dF9uZWVkZWQgPSBGYWxzZQogICAgICAgICAgICBleGNsdWRlZGVwcyA9IGQuZ2V0VmFyKCdfU1NU
QVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKQogICAgICAgICAgICBpZiBleGNsdWRlZGVwcyBpcyBO
b25lOgogICAgICAgICAgICAgICAgIyBDYWNoZSB0aGUgcmVndWxhciBleHByZXNzaW9ucyBmb3Ig
c3BlZWQKICAgICAgICAgICAgICAgIGV4Y2x1ZGVkZXBzID0gW10KICAgICAgICAgICAgICAgIGZv
ciBleGNsIGluIChkLmdldFZhcignU1NUQVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKSBvciAiIiku
c3BsaXQoKToKICAgICAgICAgICAgICAgICAgICBleGNsdWRlZGVwcy5hcHBlbmQoKHJlLmNvbXBp
bGUoZXhjbC5zcGxpdCgnLT4nLCAxKVswXSksIHJlLmNvbXBpbGUoZXhjbC5zcGxpdCgnLT4nLCAx
KVsxXSkpKQogICAgICAgICAgICAgICAgZC5zZXRWYXIoJ19TU1RBVEVfRVhDTFVERURFUFNfU1lT
Uk9PVCcsIGV4Y2x1ZGVkZXBzKQogICAgICAgICAgICBmb3IgZXhjbCBpbiBleGNsdWRlZGVwczoK
ICAgICAgICAgICAgICAgIGlmIGV4Y2xbMF0ubWF0Y2godGFza2RlcGVuZGVlc1tkZXBdWzBdKToK
ICAgICAgICAgICAgICAgICAgICBpZiBleGNsWzFdLm1hdGNoKHRhc2tkZXBlbmRlZXNbdGFza11b
MF0pOgogICAgICAgICAgICAgICAgICAgICAgICBub3RfbmVlZGVkID0gVHJ1ZQogICAgICAgICAg
ICAgICAgICAgICAgICBicmVhawogICAgICAgICAgICBpZiBub3RfbmVlZGVkOgogICAgICAgICAg
ICAgICAgY29udGludWUKICAgICAgICAgICAgIyBGb3IgbWV0YS1leHRzZGstdG9vbGNoYWluIHdl
IHdhbnQgYWxsIHN5c3Jvb3QgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIGlmIHRhc2tkZXBlbmRl
ZXNbZGVwXVswXSA9PSAnbWV0YS1leHRzZGstdG9vbGNoYWluJzoKICAgICAgICAgICAgICAgIHJl
dHVybiBGYWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9Dcm9zcyBwb3B1bGF0ZV9zeXNyb290IG5l
ZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2Rl
cGVuZGVlc1t0YXNrXVswXSkgYW5kIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBd
KToKICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1
bGF0ZV9zeXNyb290IGRlcGVuZGVkIG9uIGJ5IGNyb3NzIHRvb2xzIG5lZWQgdG8gYmUgaW5zdGFs
bGVkCiAgICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKToK
ICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9jcm9zcyB0
b29scyBkZXBlbmRlZCB1cG9uIGJ5IHRhcmdldCBzeXNyb290IGFyZSBub3QgbmVlZGVkCiAgICAg
ICAgICAgICMgQWRkIGFuIGV4Y2VwdGlvbiBmb3Igc2hhZG93LW5hdGl2ZSBhcyByZXF1aXJlZCBi
eSB1c2VyYWRkLmJiY2xhc3MKICAgICAgICAgICAgaWYgaXNOYXRpdmVDcm9zcyh0YXNrZGVwZW5k
ZWVzW3Rhc2tdWzBdKSBhbmQgdGFza2RlcGVuZGVlc1t0YXNrXVswXSAhPSAnc2hhZG93LW5hdGl2
ZSc6CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1bGF0
ZV9zeXNyb290IG5lZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIHJldHVybiBGYWxz
ZQoKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19zaGFyZWRfd29ya2Rp
cic6CiAgICAgICAgICAgIGNvbnRpbnVlCgogICAgICAgIGlmIHRhc2tkZXBlbmRlZXNbZGVwXVsx
XSA9PSAiZG9fcG9wdWxhdGVfbGljIjoKICAgICAgICAgICAgY29udGludWUKCgogICAgICAgICMg
U2FmZSBmYWxsdGhyb3VnaCBkZWZhdWx0CiAgICAgICAgbG9naXQoIiBEZWZhdWx0IHNldHNjZW5l
IGRlcGVuZGVuY3kgZmFsbCB0aHJvdWdoIGR1ZSB0byBkZXBlbmRlbmN5OiAlcyIgJSAoc3RyKHRh
c2tkZXBlbmRlZXNbZGVwXSkpLCBsb2cpCiAgICAgICAgcmV0dXJuIEZhbHNlCiAgICByZXR1cm4g
VHJ1ZQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.extend_recipe_sysroot.14489"
Content-Disposition: attachment; filename="run.extend_recipe_sysroot.14489"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3b941>
X-Attachment-Id: f_jz9oy3b941

ZGVmIGV4dGVuZF9yZWNpcGVfc3lzcm9vdChkKToKICAgIGltcG9ydCBjb3B5CiAgICBpbXBvcnQg
c3VicHJvY2VzcwogICAgaW1wb3J0IGVycm5vCiAgICBpbXBvcnQgY29sbGVjdGlvbnMKICAgIGlt
cG9ydCBnbG9iCgogICAgdGFza2RlcGRhdGEgPSBkLmdldFZhcigiQkJfVEFTS0RFUERBVEEiLCBG
YWxzZSkKICAgIG15dGFza25hbWUgPSBkLmdldFZhcigiQkJfUlVOVEFTSyIpCiAgICBpZiBteXRh
c2tuYW1lLmVuZHN3aXRoKCJfc2V0c2NlbmUiKToKICAgICAgICBteXRhc2tuYW1lID0gbXl0YXNr
bmFtZS5yZXBsYWNlKCJfc2V0c2NlbmUiLCAiIikKICAgIHdvcmtkaXIgPSBkLmdldFZhcigiV09S
S0RJUiIpCiAgICAjYmIud2FybihzdHIodGFza2RlcGRhdGEpKQogICAgcG4gPSBkLmdldFZhcigi
UE4iKQogICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFyKCJTVEFHSU5HX0RJUiIpCiAgICBzaGFyZWRt
YW5pZmVzdHMgPSBkLmdldFZhcigiQ09NUE9ORU5UU19ESVIiKSArICIvbWFuaWZlc3RzIgogICAg
cmVjaXBlc3lzcm9vdCA9IGQuZ2V0VmFyKCJSRUNJUEVfU1lTUk9PVCIpCiAgICByZWNpcGVzeXNy
b290bmF0aXZlID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UX05BVElWRSIpCgogICAgIyBEZXRl
Y3QgYml0YmFrZSAtYiB1c2FnZQogICAgbm9kZXBzID0gZC5nZXRWYXIoIkJCX0xJTUlURURERVBT
Iikgb3IgRmFsc2UKICAgIGlmIG5vZGVwczoKICAgICAgICBsb2NrID0gYmIudXRpbHMubG9ja2Zp
bGUocmVjaXBlc3lzcm9vdCArICIvc3lzcm9vdC5sb2NrIikKICAgICAgICBzdGFnaW5nX3BvcHVs
YXRlX3N5c3Jvb3RfZGlyKHJlY2lwZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUsIFRydWUs
IGQpCiAgICAgICAgc3RhZ2luZ19wb3B1bGF0ZV9zeXNyb290X2RpcihyZWNpcGVzeXNyb290LCBy
ZWNpcGVzeXNyb290bmF0aXZlLCBGYWxzZSwgZCkKICAgICAgICBiYi51dGlscy51bmxvY2tmaWxl
KGxvY2spCiAgICAgICAgcmV0dXJuCgogICAgc3RhcnQgPSBOb25lCiAgICBjb25maWd1cmVkZXBz
ID0gW10KICAgIGZvciBkZXAgaW4gdGFza2RlcGRhdGE6CiAgICAgICAgZGF0YSA9IHRhc2tkZXBk
YXRhW2RlcF0KICAgICAgICBpZiBkYXRhWzFdID09IG15dGFza25hbWUgYW5kIGRhdGFbMF0gPT0g
cG46CiAgICAgICAgICAgIHN0YXJ0ID0gZGVwCiAgICAgICAgICAgIGJyZWFrCiAgICBpZiBzdGFy
dCBpcyBOb25lOgogICAgICAgIGJiLmZhdGFsKCJDb3VsZG4ndCBmaW5kIG91cnNlbGYgaW4gQkJf
VEFTS0RFUERBVEE/IikKCiAgICAjIFdlIG5lZWQgdG8gZmlndXJlIG91dCB3aGljaCBzeXNyb290
IGZpbGVzIHdlIG5lZWQgdG8gZXhwb3NlIHRvIHRoaXMgdGFzay4KICAgICMgVGhpcyBuZWVkcyB0
byBtYXRjaCB3aGF0IHdvdWxkIGdldCByZXN0b3JlZCBmcm9tIHNzdGF0ZSwgd2hpY2ggaXMgY29u
dHJvbGxlZAogICAgIyB1bHRpbWF0ZWx5IGJ5IGNhbGxzIGZyb20gYml0YmFrZSB0byBzZXRzY2Vu
ZV9kZXB2YWxpZCgpLgogICAgIyBUaGF0IGZ1bmN0aW9uIGV4cGVjdHMgYSBzZXRzY2VuZSBkZXBl
bmRlbmN5IHRyZWUuIFdlIGJ1aWxkIGEgZGVwZW5kZW5jeSB0cmVlCiAgICAjIGNvbmRlbnNlZCB0
byBpbnRlci1zc3RhdGUgdGFzayBkZXBlbmRlbmNpZXMsIHNpbWlsYXIgdG8gdGhhdCB1c2VkIGJ5
IHNldHNjZW5lCiAgICAjIHRhc2tzLiBXZSBjYW4gdGhlbiBjYWxsIGludG8gc2V0c2NlbmVfZGVw
dmFsaWQoKSBhbmQgZGVjaWRlCiAgICAjIHdoaWNoIGRlcGVuZGVuY2llcyB3ZSBjYW4gInNlZSIg
YW5kIHNob3VsZCBleHBvc2UgaW4gdGhlIHJlY2lwZSBzcGVjaWZpYyBzeXNyb290LgogICAgc2V0
c2NlbmVkZXBzID0gY29weS5kZWVwY29weSh0YXNrZGVwZGF0YSkKCiAgICBzdGFydCA9IHNldChb
c3RhcnRdKQoKICAgIHNzdGF0ZXRhc2tzID0gZC5nZXRWYXIoIlNTVEFURVRBU0tTIikuc3BsaXQo
KQogICAgIyBBZGQgcmVjaXBlIHNwZWNpZmljIHRhc2tzIHJlZmVyZW5jZWQgYnkgc2V0c2NlbmVf
ZGVwdmFsaWQoKQogICAgc3N0YXRldGFza3MuYXBwZW5kKCJkb19zdGFzaF9sb2NhbGUiKQoKICAg
IGRlZiBwcmludF9kZXBfdHJlZShkZXB0cmVlKToKICAgICAgICBkYXRhID0gIiIKICAgICAgICBm
b3IgZGVwIGluIGRlcHRyZWU6CiAgICAgICAgICAgIGRlcHMgPSAiICAgICIgKyAiXG4gICAgIi5q
b2luKGRlcHRyZWVbZGVwXVszXSkgKyAiXG4iCiAgICAgICAgICAgIGRhdGEgPSBkYXRhICsgIiVz
OlxuICAlc1xuICAlc1xuJXMgICVzXG4gICVzXG4iICUgKGRlcHRyZWVbZGVwXVswXSwgZGVwdHJl
ZVtkZXBdWzFdLCBkZXB0cmVlW2RlcF1bMl0sIGRlcHMsIGRlcHRyZWVbZGVwXVs0XSwgZGVwdHJl
ZVtkZXBdWzVdKQogICAgICAgIHJldHVybiBkYXRhCgogICAgI2JiLm5vdGUoIkZ1bGwgZGVwIHRy
ZWUgaXM6XG4lcyIgJSBwcmludF9kZXBfdHJlZSh0YXNrZGVwZGF0YSkpCgogICAgI2JiLm5vdGUo
IiBzdGFydDIgaXMgJXMiICUgc3RyKHN0YXJ0KSkKCiAgICAjIElmIHN0YXJ0IGlzIGFuIHNzdGF0
ZSB0YXNrIChsaWtlIGRvX3BhY2thZ2UpIHdlIG5lZWQgdG8gYWRkIGluIGl0cyBkaXJlY3QgZGVw
ZW5kZW5jaWVzCiAgICAjIGVsc2UgdGhlIGNvZGUgYmVsb3cgd29uJ3QgcmVjdXJzZSBpbnRvIHRo
ZW0uCiAgICBmb3IgZGVwIGluIHNldChzdGFydCk6CiAgICAgICAgZm9yIGRlcDIgaW4gc2V0c2Nl
bmVkZXBzW2RlcF1bM106CiAgICAgICAgICAgIHN0YXJ0LmFkZChkZXAyKQogICAgICAgIHN0YXJ0
LnJlbW92ZShkZXApCgogICAgI2JiLm5vdGUoIiBzdGFydDMgaXMgJXMiICUgc3RyKHN0YXJ0KSkK
CiAgICAjIENyZWF0ZSBjb2xsYXBzZWQgZG9fcG9wdWxhdGVfc3lzcm9vdCAtPiBkb19wb3B1bGF0
ZV9zeXNyb290IHRyZWUKICAgIGZvciBkZXAgaW4gdGFza2RlcGRhdGE6CiAgICAgICAgZGF0YSA9
IHNldHNjZW5lZGVwc1tkZXBdCiAgICAgICAgaWYgZGF0YVsxXSBub3QgaW4gc3N0YXRldGFza3M6
CiAgICAgICAgICAgIGZvciBkZXAyIGluIHNldHNjZW5lZGVwczoKICAgICAgICAgICAgICAgIGRh
dGEyID0gc2V0c2NlbmVkZXBzW2RlcDJdCiAgICAgICAgICAgICAgICBpZiBkZXAgaW4gZGF0YTJb
M106CiAgICAgICAgICAgICAgICAgICAgZGF0YTJbM10udXBkYXRlKHNldHNjZW5lZGVwc1tkZXBd
WzNdKQogICAgICAgICAgICAgICAgICAgIGRhdGEyWzNdLnJlbW92ZShkZXApCiAgICAgICAgICAg
IGlmIGRlcCBpbiBzdGFydDoKICAgICAgICAgICAgICAgIHN0YXJ0LnVwZGF0ZShzZXRzY2VuZWRl
cHNbZGVwXVszXSkKICAgICAgICAgICAgICAgIHN0YXJ0LnJlbW92ZShkZXApCiAgICAgICAgICAg
IGRlbCBzZXRzY2VuZWRlcHNbZGVwXQoKICAgICMgUmVtb3ZlIGNpcmN1bGFyIHJlZmVyZW5jZXMK
ICAgIGZvciBkZXAgaW4gc2V0c2NlbmVkZXBzOgogICAgICAgIGlmIGRlcCBpbiBzZXRzY2VuZWRl
cHNbZGVwXVszXToKICAgICAgICAgICAgc2V0c2NlbmVkZXBzW2RlcF1bM10ucmVtb3ZlKGRlcCkK
CiAgICAjYmIubm90ZSgiQ29tcHV0ZWQgZGVwIHRyZWUgaXM6XG4lcyIgJSBwcmludF9kZXBfdHJl
ZShzZXRzY2VuZWRlcHMpKQogICAgI2JiLm5vdGUoIiBzdGFydCBpcyAlcyIgJSBzdHIoc3RhcnQp
KQoKICAgICMgRGlyZWN0IGRlcGVuZGVuY2llcyBzaG91bGQgYmUgcHJlc2VudCBhbmQgY2FuIGJl
IGRlcGVuZGVkIHVwb24KICAgIGZvciBkZXAgaW4gc2V0KHN0YXJ0KToKICAgICAgICBpZiBzZXRz
Y2VuZWRlcHNbZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCI6CiAgICAgICAgICAgIGlm
IGRlcCBub3QgaW4gY29uZmlndXJlZGVwczoKICAgICAgICAgICAgICAgIGNvbmZpZ3VyZWRlcHMu
YXBwZW5kKGRlcCkKICAgIGJiLm5vdGUoIkRpcmVjdCBkZXBlbmRlbmNpZXMgYXJlICVzIiAlIHN0
cihjb25maWd1cmVkZXBzKSkKICAgICNiYi5ub3RlKCIgb3IgJXMiICUgc3RyKHN0YXJ0KSkKCiAg
ICBtc2didWYgPSBbXQogICAgIyBDYWxsIGludG8gc2V0c2NlbmVfZGVwdmFsaWQgZm9yIGVhY2gg
c3ViLWRlcGVuZGVuY3kgYW5kIG9ubHkgY29weSBzeXNyb290IGZpbGVzCiAgICAjIGZvciBvbmVz
IHRoYXQgd291bGQgYmUgcmVzdG9yZWQgZnJvbSBzc3RhdGUuCiAgICBkb25lID0gbGlzdChzdGFy
dCkKICAgIG5leHQgPSBsaXN0KHN0YXJ0KQogICAgd2hpbGUgbmV4dDoKICAgICAgICBuZXcgPSBb
XQogICAgICAgIGZvciBkZXAgaW4gbmV4dDoKICAgICAgICAgICAgZGF0YSA9IHNldHNjZW5lZGVw
c1tkZXBdCiAgICAgICAgICAgIGZvciBkYXRhZGVwIGluIGRhdGFbM106CiAgICAgICAgICAgICAg
ICBpZiBkYXRhZGVwIGluIGRvbmU6CiAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAg
ICAgICAgICAgIHRhc2tkZXBzID0ge30KICAgICAgICAgICAgICAgIHRhc2tkZXBzW2RlcF0gPSBz
ZXRzY2VuZWRlcHNbZGVwXVs6Ml0KICAgICAgICAgICAgICAgIHRhc2tkZXBzW2RhdGFkZXBdID0g
c2V0c2NlbmVkZXBzW2RhdGFkZXBdWzoyXQogICAgICAgICAgICAgICAgcmV0dmFsID0gc2V0c2Nl
bmVfZGVwdmFsaWQoZGF0YWRlcCwgdGFza2RlcHMsIFtdLCBkLCBtc2didWYpCiAgICAgICAgICAg
ICAgICBpZiByZXR2YWw6CiAgICAgICAgICAgICAgICAgICAgbXNnYnVmLmFwcGVuZCgiU2tpcHBp
bmcgc2V0c2NlbmUgZGVwZW5kZW5jeSAlcyBmb3IgaW5zdGFsbGF0aW9uIGludG8gdGhlIHN5c3Jv
b3QiICUgZGF0YWRlcCkKICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAg
ICAgZG9uZS5hcHBlbmQoZGF0YWRlcCkKICAgICAgICAgICAgICAgIG5ldy5hcHBlbmQoZGF0YWRl
cCkKICAgICAgICAgICAgICAgIGlmIGRhdGFkZXAgbm90IGluIGNvbmZpZ3VyZWRlcHMgYW5kIHNl
dHNjZW5lZGVwc1tkYXRhZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCI6CiAgICAgICAg
ICAgICAgICAgICAgY29uZmlndXJlZGVwcy5hcHBlbmQoZGF0YWRlcCkKICAgICAgICAgICAgICAg
ICAgICBtc2didWYuYXBwZW5kKCJBZGRpbmcgZGVwZW5kZW5jeSBvbiAlcyIgJSBzZXRzY2VuZWRl
cHNbZGF0YWRlcF1bMF0pCiAgICAgICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgICAg
IG1zZ2J1Zi5hcHBlbmQoIkZvbGxvd2luZyBkZXBlbmRlbmN5IG9uICVzIiAlIHNldHNjZW5lZGVw
c1tkYXRhZGVwXVswXSkKICAgICAgICBuZXh0ID0gbmV3CgogICAgIyBUaGlzIGxvZ2dpbmcgaXMg
dG9vIHZlcmJvc2UgZm9yIGRheSB0byBkYXkgdXNlIHNhZGx5CiAgICAjYmIuZGVidWcoMiwgIlxu
Ii5qb2luKG1zZ2J1ZikpCgogICAgZGVwZGlyID0gcmVjaXBlc3lzcm9vdG5hdGl2ZSArICIvaW5z
dGFsbGVkZGVwcyIKICAgIGJiLnV0aWxzLm1rZGlyaGllcihkZXBkaXIpCiAgICBiYi51dGlscy5t
a2RpcmhpZXIoc2hhcmVkbWFuaWZlc3RzKQoKICAgIGxvY2sgPSBiYi51dGlscy5sb2NrZmlsZShy
ZWNpcGVzeXNyb290ICsgIi9zeXNyb290LmxvY2siKQoKICAgIGZpeG1lID0ge30KICAgIHNlZW5k
aXJzID0gc2V0KCkKICAgIHBvc3RpbnN0cyA9IFtdCiAgICBtdWx0aWxpYnMgPSB7fQogICAgbWFu
aWZlc3RzID0ge30KICAgICMgQWxsIGZpbGVzIHRoYXQgd2UncmUgZ29pbmcgdG8gYmUgaW5zdGFs
bGluZywgdG8gZmluZCBjb25mbGljdHMuCiAgICBmaWxlc2V0ID0ge30KCiAgICBmb3IgZiBpbiBv
cy5saXN0ZGlyKGRlcGRpcik6CiAgICAgICAgaWYgbm90IGYuZW5kc3dpdGgoIi5jb21wbGV0ZSIp
OgogICAgICAgICAgICBjb250aW51ZQogICAgICAgIGYgPSBkZXBkaXIgKyAiLyIgKyBmCiAgICAg
ICAgaWYgb3MucGF0aC5pc2xpbmsoZikgYW5kIG5vdCBvcy5wYXRoLmV4aXN0cyhmKToKICAgICAg
ICAgICAgYmIubm90ZSgiJXMgbm8gbG9uZ2VyIGV4aXN0cywgcmVtb3ZpbmcgZnJvbSBzeXNyb290
IiAlIGYpCiAgICAgICAgICAgIGxuayA9IG9zLnJlYWRsaW5rKGYucmVwbGFjZSgiLmNvbXBsZXRl
IiwgIiIpKQogICAgICAgICAgICBzc3RhdGVfY2xlYW5fbWFuaWZlc3QoZGVwZGlyICsgIi8iICsg
bG5rLCBkLCB3b3JrZGlyKQogICAgICAgICAgICBvcy51bmxpbmsoZikKICAgICAgICAgICAgb3Mu
dW5saW5rKGYucmVwbGFjZSgiLmNvbXBsZXRlIiwgIiIpKQoKICAgIGluc3RhbGxlZCA9IFtdCiAg
ICBmb3IgZGVwIGluIGNvbmZpZ3VyZWRlcHM6CiAgICAgICAgYyA9IHNldHNjZW5lZGVwc1tkZXBd
WzBdCiAgICAgICAgaWYgbXl0YXNrbmFtZSBpbiBbImRvX3Nka19kZXBlbmRzIiwgImRvX3BvcHVs
YXRlX3Nka19leHQiXSBhbmQgYy5lbmRzd2l0aCgiLWluaXRpYWwiKToKICAgICAgICAgICAgYmIu
bm90ZSgiU2tpcHBpbmcgaW5pdGlhbCBzZXRzY2VuZSBkZXBlbmRlbmN5ICVzIGZvciBpbnN0YWxs
YXRpb24gaW50byB0aGUgc3lzcm9vdCIgJSBjKQogICAgICAgICAgICBjb250aW51ZQogICAgICAg
IGluc3RhbGxlZC5hcHBlbmQoYykKCiAgICAjIFdlIHdhbnQgdG8gcmVtb3ZlIGFueXRoaW5nIHdo
aWNoIHRoaXMgdGFzayBwcmV2aW91c2x5IGluc3RhbGxlZCBidXQgaXMgbm8gbG9uZ2VyIGEgZGVw
ZW5kZW5jeQogICAgdGFza2luZGV4ID0gZGVwZGlyICsgIi8iICsgImluZGV4LiIgKyBteXRhc2tu
YW1lCiAgICBpZiBvcy5wYXRoLmV4aXN0cyh0YXNraW5kZXgpOgogICAgICAgIHBvdGVudGlhbCA9
IFtdCiAgICAgICAgd2l0aCBvcGVuKHRhc2tpbmRleCwgInIiKSBhcyBmOgogICAgICAgICAgICBm
b3IgbCBpbiBmOgogICAgICAgICAgICAgICAgbCA9IGwuc3RyaXAoKQogICAgICAgICAgICAgICAg
aWYgbCBub3QgaW4gaW5zdGFsbGVkOgogICAgICAgICAgICAgICAgICAgIGZsID0gZGVwZGlyICsg
Ii8iICsgbAogICAgICAgICAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhmbCk6CiAg
ICAgICAgICAgICAgICAgICAgICAgICMgV2FzIGxpa2VseSBhbHJlYWR5IHVuaW5zdGFsbGVkCiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAgICAgcG90ZW50
aWFsLmFwcGVuZChsKQogICAgICAgICMgV2UgbmVlZCB0byBlbnN1cmUgbm90IG90aGVyIHRhc2sg
bmVlZHMgdGhpcyBkZXBlbmRlbmN5LiBXZSBob2xkIHRoZSBzeXNyb290CiAgICAgICAgIyBsb2Nr
IHNvIHdlIGNhIHNlYXJjaCB0aGUgaW5kZXhlcyB0byBjaGVjawogICAgICAgIGlmIHBvdGVudGlh
bDoKICAgICAgICAgICAgZm9yIGkgaW4gZ2xvYi5nbG9iKGRlcGRpciArICIvaW5kZXguKiIpOgog
ICAgICAgICAgICAgICAgaWYgaS5lbmRzd2l0aCgiLiIgKyBteXRhc2tuYW1lKToKICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgd2l0aCBvcGVuKGksICJyIikgYXMg
ZjoKICAgICAgICAgICAgICAgICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgICAg
ICBsID0gbC5zdHJpcCgpCiAgICAgICAgICAgICAgICAgICAgICAgIGlmIGwgaW4gcG90ZW50aWFs
OgogICAgICAgICAgICAgICAgICAgICAgICAgICAgcG90ZW50aWFsLnJlbW92ZShsKQogICAgICAg
IGZvciBsIGluIHBvdGVudGlhbDoKICAgICAgICAgICAgZmwgPSBkZXBkaXIgKyAiLyIgKyBsCiAg
ICAgICAgICAgIGJiLm5vdGUoIlRhc2sgJXMgbm8gbG9uZ2VyIGRlcGVuZHMgb24gJXMsIHJlbW92
aW5nIGZyb20gc3lzcm9vdCIgJSAobXl0YXNrbmFtZSwgbCkpCiAgICAgICAgICAgIGxuayA9IG9z
LnJlYWRsaW5rKGZsKQogICAgICAgICAgICBzc3RhdGVfY2xlYW5fbWFuaWZlc3QoZGVwZGlyICsg
Ii8iICsgbG5rLCBkLCB3b3JrZGlyKQogICAgICAgICAgICBvcy51bmxpbmsoZmwpCiAgICAgICAg
ICAgIG9zLnVubGluayhmbCArICIuY29tcGxldGUiKQoKICAgIG1zZ19leGlzdHMgPSBbXQogICAg
bXNnX2FkZGluZyA9IFtdCgogICAgZm9yIGRlcCBpbiBjb25maWd1cmVkZXBzOgogICAgICAgIGMg
PSBzZXRzY2VuZWRlcHNbZGVwXVswXQogICAgICAgIGlmIGMgbm90IGluIGluc3RhbGxlZDoKICAg
ICAgICAgICAgY29udGludWUKICAgICAgICB0YXNraGFzaCA9IHNldHNjZW5lZGVwc1tkZXBdWzVd
CiAgICAgICAgdGFza21hbmlmZXN0ID0gZGVwZGlyICsgIi8iICsgYyArICIuIiArIHRhc2toYXNo
CgogICAgICAgIGlmIG9zLnBhdGguZXhpc3RzKGRlcGRpciArICIvIiArIGMpOgogICAgICAgICAg
ICBsbmsgPSBvcy5yZWFkbGluayhkZXBkaXIgKyAiLyIgKyBjKQogICAgICAgICAgICBpZiBsbmsg
PT0gYyArICIuIiArIHRhc2toYXNoIGFuZCBvcy5wYXRoLmV4aXN0cyhkZXBkaXIgKyAiLyIgKyBj
ICsgIi5jb21wbGV0ZSIpOgogICAgICAgICAgICAgICAgbXNnX2V4aXN0cy5hcHBlbmQoYykKICAg
ICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICBi
Yi5ub3RlKCIlcyBleGlzdHMgaW4gc3lzcm9vdCwgYnV0IGlzIHN0YWxlICglcyB2cy4gJXMpLCBy
ZW1vdmluZy4iICUgKGMsIGxuaywgYyArICIuIiArIHRhc2toYXNoKSkKICAgICAgICAgICAgICAg
IHNzdGF0ZV9jbGVhbl9tYW5pZmVzdChkZXBkaXIgKyAiLyIgKyBsbmssIGQsIHdvcmtkaXIpCiAg
ICAgICAgICAgICAgICBvcy51bmxpbmsoZGVwZGlyICsgIi8iICsgYykKICAgICAgICAgICAgICAg
IGlmIG9zLnBhdGgubGV4aXN0cyhkZXBkaXIgKyAiLyIgKyBjICsgIi5jb21wbGV0ZSIpOgogICAg
ICAgICAgICAgICAgICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjICsgIi5jb21wbGV0ZSIp
CiAgICAgICAgZWxpZiBvcy5wYXRoLmxleGlzdHMoZGVwZGlyICsgIi8iICsgYyk6CiAgICAgICAg
ICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjKQoKICAgICAgICBtc2dfYWRkaW5nLmFwcGVu
ZChjKQoKICAgICAgICBvcy5zeW1saW5rKGMgKyAiLiIgKyB0YXNraGFzaCwgZGVwZGlyICsgIi8i
ICsgYykKCiAgICAgICAgbWFuaWZlc3QsIGQyID0gb2Uuc3N0YXRlc2lnLmZpbmRfc3N0YXRlX21h
bmlmZXN0KGMsIHNldHNjZW5lZGVwc1tkZXBdWzJdLCAicG9wdWxhdGVfc3lzcm9vdCIsIGQsIG11
bHRpbGlicykKICAgICAgICBpZiBkMiBpcyBub3QgZDoKICAgICAgICAgICAgIyBJZiB3ZSBkb24n
dCBkbyB0aGlzLCB0aGUgcmVjaXBlIHN5c3Jvb3Qgd2lsbCBiZSBwbGFjZWQgaW4gdGhlIHdyb25n
IFdPUktESVIgZm9yIG11bHRpbGlicwogICAgICAgICAgICAjIFdlIG5lZWQgYSBjb25zaXN0ZW50
IFdPUktESVIgZm9yIHRoZSBpbWFnZQogICAgICAgICAgICBkMi5zZXRWYXIoIldPUktESVIiLCBk
LmdldFZhcigiV09SS0RJUiIpKQogICAgICAgIGRlc3RzeXNyb290ID0gZDIuZ2V0VmFyKCJSRUNJ
UEVfU1lTUk9PVCIpCiAgICAgICAgIyBXZSBwdXQgYWxsYXJjaCByZWNpcGVzIGludG8gdGhlIGRl
ZmF1bHQgc3lzcm9vdAogICAgICAgIGlmIG1hbmlmZXN0IGFuZCAiYWxsYXJjaCIgaW4gbWFuaWZl
c3Q6CiAgICAgICAgICAgIGRlc3RzeXNyb290ID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UIikK
CiAgICAgICAgbmF0aXZlID0gRmFsc2UKICAgICAgICBpZiBjLmVuZHN3aXRoKCItbmF0aXZlIikg
b3IgIi1jcm9zcy0iIGluIGMgb3IgIi1jcm9zc3NkayIgaW4gYzoKICAgICAgICAgICAgbmF0aXZl
ID0gVHJ1ZQoKICAgICAgICBpZiBtYW5pZmVzdDoKICAgICAgICAgICAgbmV3bWFuaWZlc3QgPSBj
b2xsZWN0aW9ucy5PcmRlcmVkRGljdCgpCiAgICAgICAgICAgIHRhcmdldGRpciA9IGRlc3RzeXNy
b290CiAgICAgICAgICAgIGlmIG5hdGl2ZToKICAgICAgICAgICAgICAgIHRhcmdldGRpciA9IHJl
Y2lwZXN5c3Jvb3RuYXRpdmUKICAgICAgICAgICAgaWYgdGFyZ2V0ZGlyIG5vdCBpbiBmaXhtZToK
ICAgICAgICAgICAgICAgIGZpeG1lW3RhcmdldGRpcl0gPSBbXQogICAgICAgICAgICBmbSA9IGZp
eG1lW3RhcmdldGRpcl0KCiAgICAgICAgICAgIHdpdGggb3BlbihtYW5pZmVzdCwgInIiKSBhcyBm
OgogICAgICAgICAgICAgICAgbWFuaWZlc3RzW2RlcF0gPSBtYW5pZmVzdAogICAgICAgICAgICAg
ICAgZm9yIGwgaW4gZjoKICAgICAgICAgICAgICAgICAgICBsID0gbC5zdHJpcCgpCiAgICAgICAg
ICAgICAgICAgICAgaWYgbC5lbmRzd2l0aCgiL2ZpeG1lcGF0aCIpOgogICAgICAgICAgICAgICAg
ICAgICAgICBmbS5hcHBlbmQobCkKICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAg
ICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoLmNtZCIpOgogICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIGRlc3QgPSBsLnJl
cGxhY2Uoc3RhZ2luZ2RpciwgIiIpCiAgICAgICAgICAgICAgICAgICAgZGVzdCA9ICIvIiArICIv
Ii5qb2luKGRlc3Quc3BsaXQoIi8iKVszOl0pCiAgICAgICAgICAgICAgICAgICAgbmV3bWFuaWZl
c3RbbF0gPSB0YXJnZXRkaXIgKyBkZXN0CgogICAgICAgICAgICAgICAgICAgICMgQ2hlY2sgaWYg
ZmlsZXMgaGF2ZSBhbHJlYWR5IGJlZW4gaW5zdGFsbGVkIGJ5IGFub3RoZXIKICAgICAgICAgICAg
ICAgICAgICAjIHJlY2lwZSBhbmQgYWJvcnQgaWYgdGhleSBoYXZlLCBleHBsYWluaW5nIHdoYXQg
cmVjaXBlcyBhcmUKICAgICAgICAgICAgICAgICAgICAjIGNvbmZsaWN0aW5nLgogICAgICAgICAg
ICAgICAgICAgIGhhc2huYW1lID0gdGFyZ2V0ZGlyICsgZGVzdAogICAgICAgICAgICAgICAgICAg
IGlmIG5vdCBoYXNobmFtZS5lbmRzd2l0aCgiLyIpOgogICAgICAgICAgICAgICAgICAgICAgICBp
ZiBoYXNobmFtZSBpbiBmaWxlc2V0OgogICAgICAgICAgICAgICAgICAgICAgICAgICAgYmIuZmF0
YWwoIlRoZSBmaWxlICVzIGlzIGluc3RhbGxlZCBieSBib3RoICVzIGFuZCAlcywgYWJvcnRpbmci
ICUgKGRlc3QsIGMsIGZpbGVzZXRbaGFzaG5hbWVdKSkKICAgICAgICAgICAgICAgICAgICAgICAg
ZWxzZToKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGVzZXRbaGFzaG5hbWVdID0gYwoK
ICAgICAgICAgICAgIyBIYXZpbmcgbXVsdGlwbGUgaWRlbnRpY2FsIG1hbmlmZXN0cyBpbiBlYWNo
IHN5c3Jvb3QgZWF0cyBkaXNrc3BhY2Ugc28KICAgICAgICAgICAgIyBjcmVhdGUgYSBzaGFyZWQg
cG9vbCBvZiB0aGVtIGFuZCBoYXJkbGluayBpZiB3ZSBjYW4uCiAgICAgICAgICAgICMgV2UgY3Jl
YXRlIHRoZSBtYW5pZmVzdCBpbiBhZHZhbmNlIHNvIHRoYXQgaWYgc29tZXRoaW5nIGZhaWxzIGR1
cmluZyBpbnN0YWxsYXRpb24sCiAgICAgICAgICAgICMgb3IgdGhlIGJ1aWxkIGlzIGludGVycnVw
dGVkLCBzdWJzZXF1ZW50IGV4ZXVjdGlvbiBjYW4gY2xlYW51cC4KICAgICAgICAgICAgc2hhcmVk
bSA9IHNoYXJlZG1hbmlmZXN0cyArICIvIiArIG9zLnBhdGguYmFzZW5hbWUodGFza21hbmlmZXN0
KQogICAgICAgICAgICBpZiBub3Qgb3MucGF0aC5leGlzdHMoc2hhcmVkbSk6CiAgICAgICAgICAg
ICAgICBzbWxvY2sgPSBiYi51dGlscy5sb2NrZmlsZShzaGFyZWRtICsgIi5sb2NrIikKICAgICAg
ICAgICAgICAgICMgQ2FuIHJhY2UgaGVyZS4gWW91J2QgdGhpbmsgaXQganVzdCBtZWFucyB3ZSBt
YXkgbm90IGVuZCB1cCB3aXRoIGFsbCBjb3BpZXMgaGFyZGxpbmtlZCB0byBlYWNoIG90aGVyCiAg
ICAgICAgICAgICAgICAjIGJ1dCBweXRob24gY2FuIGxvc2UgZmlsZSBoYW5kbGVzIHNvIHdlIG5l
ZWQgdG8gZG8gdGhpcyB1bmRlciBhIGxvY2suCiAgICAgICAgICAgICAgICBpZiBub3Qgb3MucGF0
aC5leGlzdHMoc2hhcmVkbSk6CiAgICAgICAgICAgICAgICAgICAgd2l0aCBvcGVuKHNoYXJlZG0s
ICd3JykgYXMgbToKICAgICAgICAgICAgICAgICAgICAgICBmb3IgbCBpbiBuZXdtYW5pZmVzdDoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVzdCA9IG5ld21hbmlmZXN0W2xdCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG0ud3JpdGUoZGVzdC5yZXBsYWNlKHdvcmtkaXIgKyAiLyIsICIi
KSArICJcbiIpCiAgICAgICAgICAgICAgICBiYi51dGlscy51bmxvY2tmaWxlKHNtbG9jaykKICAg
ICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgb3MubGluayhzaGFyZWRtLCB0YXNrbWFuaWZl
c3QpCiAgICAgICAgICAgIGV4Y2VwdCBPU0Vycm9yIGFzIGVycjoKICAgICAgICAgICAgICAgIGlm
IGVyci5lcnJubyA9PSBlcnJuby5FWERFVjoKICAgICAgICAgICAgICAgICAgICBiYi51dGlscy5j
b3B5ZmlsZShzaGFyZWRtLCB0YXNrbWFuaWZlc3QpCiAgICAgICAgICAgICAgICBlbHNlOgogICAg
ICAgICAgICAgICAgICAgIHJhaXNlCiAgICAgICAgICAgICMgRmluYWxseSBhY3R1YWxseSBpbnN0
YWxsIHRoZSBmaWxlcwogICAgICAgICAgICBmb3IgbCBpbiBuZXdtYW5pZmVzdDoKICAgICAgICAg
ICAgICAgICAgICBkZXN0ID0gbmV3bWFuaWZlc3RbbF0KICAgICAgICAgICAgICAgICAgICBpZiBs
LmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWRpcihs
LCB0YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZQogICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWZpbGUobCwgdGFyZ2V0ZGlyLCBk
ZXN0LCBwb3N0aW5zdHMsIHNlZW5kaXJzKQoKICAgIGJiLm5vdGUoIkluc3RhbGxlZCBpbnRvIHN5
c3Jvb3Q6ICVzIiAlIHN0cihtc2dfYWRkaW5nKSkKICAgIGJiLm5vdGUoIlNraXBwaW5nIGFzIGFs
cmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6ICVzIiAlIHN0cihtc2dfZXhpc3RzKSkKCiAgICBmb3Ig
ZiBpbiBmaXhtZToKICAgICAgICBzdGFnaW5nX3Byb2Nlc3NmaXhtZShmaXhtZVtmXSwgZiwgcmVj
aXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgZCkKCiAgICBmb3IgcCBpbiBwb3N0aW5z
dHM6CiAgICAgICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQocCwgc2hlbGw9VHJ1ZSwgc3RkZXJy
PXN1YnByb2Nlc3MuU1RET1VUKQoKICAgIGZvciBkZXAgaW4gbWFuaWZlc3RzOgogICAgICAgIGMg
PSBzZXRzY2VuZWRlcHNbZGVwXVswXQogICAgICAgIG9zLnN5bWxpbmsobWFuaWZlc3RzW2RlcF0s
IGRlcGRpciArICIvIiArIGMgKyAiLmNvbXBsZXRlIikKCiAgICB3aXRoIG9wZW4odGFza2luZGV4
LCAidyIpIGFzIGY6CiAgICAgICAgZm9yIGwgaW4gc29ydGVkKGluc3RhbGxlZCk6CiAgICAgICAg
ICAgIGYud3JpdGUobCArICJcbiIpCgogICAgYmIudXRpbHMudW5sb2NrZmlsZShsb2NrKQoKZXh0
ZW5kX3JlY2lwZV9zeXNyb290KGQpCgpkZWYgc3RhZ2luZ19wcm9jZXNzZml4bWUoZml4bWUsIHRh
cmdldCwgcmVjaXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgZCk6CiAgICBpbXBvcnQg
c3VicHJvY2VzcwoKICAgIGlmIG5vdCBmaXhtZToKICAgICAgICByZXR1cm4KICAgIGNtZCA9ICJz
ZWQgLWUgJ3M6XlteL10qLzolcy86ZycgJXMgfCB4YXJncyBzZWQgLWkgLWUgJ3M6RklYTUVTVEFH
SU5HRElSVEFSR0VUOiVzOmc7IHM6RklYTUVTVEFHSU5HRElSSE9TVDolczpnJyIgJSAodGFyZ2V0
LCAiICIuam9pbihmaXhtZSksIHJlY2lwZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUpCiAg
ICBmb3IgZml4bWV2YXIgaW4gWydQU0VVRE9fU1lTUk9PVCcsICdIT1NUVE9PTFNfRElSJywgJ1BL
R0RBVEFfRElSJywgJ1BTRVVET19MT0NBTFNUQVRFRElSJywgJ0xPR0ZJRk8nXToKICAgICAgICBm
aXhtZV9wYXRoID0gZC5nZXRWYXIoZml4bWV2YXIpCiAgICAgICAgY21kICs9ICIgLWUgJ3M6RklY
TUVfJXM6JXM6ZyciICUgKGZpeG1ldmFyLCBmaXhtZV9wYXRoKQogICAgYmIuZGVidWcoMiwgY21k
KQogICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoY21kLCBzaGVsbD1UcnVlLCBzdGRlcnI9c3Vi
cHJvY2Vzcy5TVERPVVQpCgpkZWYgc3RhZ2luZ19jb3B5ZGlyKGMsIHRhcmdldCwgZGVzdCwgc2Vl
bmRpcnMpOgogICAgaWYgZGVzdCBub3QgaW4gc2VlbmRpcnM6CiAgICAgICAgYmIudXRpbHMubWtk
aXJoaWVyKGRlc3QpCiAgICAgICAgc2VlbmRpcnMuYWRkKGRlc3QpCgpkZWYgc3RhZ2luZ19wb3B1
bGF0ZV9zeXNyb290X2Rpcih0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBuYXRpdmUsIGQp
OgogICAgaW1wb3J0IGdsb2IKICAgIGltcG9ydCBzdWJwcm9jZXNzCiAgICBpbXBvcnQgZXJybm8K
CiAgICBmaXhtZSA9IFtdCiAgICBwb3N0aW5zdHMgPSBbXQogICAgc2VlbmRpcnMgPSBzZXQoKQog
ICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFyKCJTVEFHSU5HX0RJUiIpCiAgICBpZiBuYXRpdmU6CiAg
ICAgICAgcGtnYXJjaHMgPSBbJyR7QlVJTERfQVJDSH0nLCAnJHtCVUlMRF9BUkNIfV8qJ10KICAg
ICAgICB0YXJnZXRkaXIgPSBuYXRpdmVzeXNyb290CiAgICBlbHNlOgogICAgICAgIHBrZ2FyY2hz
ID0gWycke01BQ0hJTkVfQVJDSH0nXQogICAgICAgIHBrZ2FyY2hzID0gcGtnYXJjaHMgKyBsaXN0
KHJldmVyc2VkKGQuZ2V0VmFyKCJQQUNLQUdFX0VYVFJBX0FSQ0hTIikuc3BsaXQoKSkpCiAgICAg
ICAgcGtnYXJjaHMuYXBwZW5kKCdhbGxhcmNoJykKICAgICAgICB0YXJnZXRkaXIgPSB0YXJnZXRz
eXNyb290CgogICAgYmIudXRpbHMubWtkaXJoaWVyKHRhcmdldGRpcikKICAgIGZvciBwa2dhcmNo
IGluIHBrZ2FyY2hzOgogICAgICAgIGZvciBtYW5pZmVzdCBpbiBnbG9iLmdsb2IoZC5leHBhbmQo
IiR7U1NUQVRFX01BTklGRVNUU30vbWFuaWZlc3QtJXMtKi5wb3B1bGF0ZV9zeXNyb290IiAlIHBr
Z2FyY2gpKToKICAgICAgICAgICAgaWYgbWFuaWZlc3QuZW5kc3dpdGgoIi1pbml0aWFsLnBvcHVs
YXRlX3N5c3Jvb3QiKToKICAgICAgICAgICAgICAgICMgc2tpcCBnbGliYy1pbml0aWFsIGFuZCBs
aWJnY2MtaW5pdGlhbCBkdWUgdG8gZmlsZSBvdmVybGFwCiAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICBpZiBub3QgbmF0aXZlIGFuZCAobWFuaWZlc3QuZW5kc3dpdGgoIi1uYXRp
dmUucG9wdWxhdGVfc3lzcm9vdCIpIG9yICJuYXRpdmVzZGstIiBpbiBtYW5pZmVzdCk6CiAgICAg
ICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICBpZiBuYXRpdmUgYW5kIG5vdCAobWFuaWZl
c3QuZW5kc3dpdGgoIi1uYXRpdmUucG9wdWxhdGVfc3lzcm9vdCIpIG9yIG1hbmlmZXN0LmVuZHN3
aXRoKCItY3Jvc3MucG9wdWxhdGVfc3lzcm9vdCIpIG9yICItY3Jvc3MtIiBpbiBtYW5pZmVzdCk6
CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICB0bWFuaWZlc3QgPSB0YXJnZXRk
aXIgKyAiLyIgKyBvcy5wYXRoLmJhc2VuYW1lKG1hbmlmZXN0KQogICAgICAgICAgICBpZiBvcy5w
YXRoLmV4aXN0cyh0bWFuaWZlc3QpOgogICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAg
ICAgdHJ5OgogICAgICAgICAgICAgICAgb3MubGluayhtYW5pZmVzdCwgdG1hbmlmZXN0KQogICAg
ICAgICAgICBleGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgICAgICBpZiBlcnIuZXJy
bm8gPT0gZXJybm8uRVhERVY6CiAgICAgICAgICAgICAgICAgICAgYmIudXRpbHMuY29weWZpbGUo
bWFuaWZlc3QsIHRtYW5pZmVzdCkKICAgICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAg
ICAgICAgcmFpc2UKICAgICAgICAgICAgd2l0aCBvcGVuKG1hbmlmZXN0LCAiciIpIGFzIGY6CiAg
ICAgICAgICAgICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgIGwgPSBsLnN0cmlw
KCkKICAgICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoIik6CiAgICAg
ICAgICAgICAgICAgICAgICAgIGZpeG1lLmFwcGVuZChsKQogICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIGlmIGwuZW5kc3dpdGgoIi9maXhtZXBhdGgu
Y21kIik6CiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAg
ICAgZGVzdCA9IGwucmVwbGFjZShzdGFnaW5nZGlyLCAiIikKICAgICAgICAgICAgICAgICAgICBk
ZXN0ID0gdGFyZ2V0ZGlyICsgIi8iICsgIi8iLmpvaW4oZGVzdC5zcGxpdCgiLyIpWzM6XSkKICAg
ICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YWdpbmdfY29weWRpcihsLCB0YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIHRyeToKICAgICAg
ICAgICAgICAgICAgICAgICAgc3RhZ2luZ19jb3B5ZmlsZShsLCB0YXJnZXRkaXIsIGRlc3QsIHBv
c3RpbnN0cywgc2VlbmRpcnMpCiAgICAgICAgICAgICAgICAgICAgZXhjZXB0IEZpbGVFeGlzdHNF
cnJvcjoKICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKCiAgICBzdGFnaW5nX3Byb2Nl
c3NmaXhtZShmaXhtZSwgdGFyZ2V0ZGlyLCB0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBk
KQogICAgZm9yIHAgaW4gcG9zdGluc3RzOgogICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0
KHAsIHNoZWxsPVRydWUsIHN0ZGVycj1zdWJwcm9jZXNzLlNURE9VVCkKCiMKIyBNYW5pZmVzdHMg
aGVyZSBhcmUgY29tcGxpY2F0ZWQuIFRoZSBtYWluIHN5c3Jvb3QgYXJlYSBoYXMgdGhlIHVucGFj
a2VkIHNzdGF0ZQojIHdoaWNoIHVzIHVucmVsb2NhdGVkIGFuZCB0cmFja2VkIGJ5IHRoZSBtYWlu
IHNzdGF0ZSBtYW5pZmVzdHMuIEVhY2ggcmVjaXBlCiMgc3BlY2lmaWMgc3lzcm9vdCBoYXMgbWFu
aWZlc3RzIGZvciBlYWNoIGRlcGVuZGVuY3kgdGhhdCBpcyBpbnN0YWxsZWQgdGhlcmUuCiMgVGhl
IHRhc2sgaGFzaCBpcyB1c2VkIHRvIHRlbGwgd2hldGhlciB0aGUgZGF0YSBuZWVkcyB0byBiZSBy
ZWluc3RhbGxlZC4gV2UKIyB1c2UgYSBzeW1saW5rIHRvIHBvaW50IHRvIHRoZSBjdXJyZW50bHkg
aW5zdGFsbGVkIGhhc2guIFRoZXJlIGlzIGFsc28gYQojICJjb21wbGV0ZSIgc3RhbXAgZmlsZSB3
aGljaCBpcyB1c2VkIHRvIG1hcmsgaWYgaW5zdGFsbGF0aW9uIGNvbXBsZXRlZC4gSWYKIyBzb21l
dGhpbmcgZmFpbHMgKGUuZy4gYSBwb3N0aW5zdCksIHRoaXMgd29uJ3QgZ2V0IHdyaXR0ZW4gYW5k
IHdlIHdvdWxkCiMgcmVtb3ZlIGFuZCByZWluc3RhbGwgdGhlIGRlcGVuZGVuY3kuIFRoaXMgYWxz
byBtZWFucyBwYXJ0aWFsbHkgaW5zdGFsbGVkCiMgZGVwZW5kZW5jaWVzIHNob3VsZCBnZXQgY2xl
YW5lZCB1cCBjb3JyZWN0bHkuCiMKCmRlZiBzdGFnaW5nX2NvcHlmaWxlKGMsIHRhcmdldCwgZGVz
dCwgcG9zdGluc3RzLCBzZWVuZGlycyk6CiAgICBpbXBvcnQgZXJybm8KCiAgICBkZXN0ZGlyID0g
b3MucGF0aC5kaXJuYW1lKGRlc3QpCiAgICBpZiBkZXN0ZGlyIG5vdCBpbiBzZWVuZGlyczoKICAg
ICAgICBiYi51dGlscy5ta2RpcmhpZXIoZGVzdGRpcikKICAgICAgICBzZWVuZGlycy5hZGQoZGVz
dGRpcikKICAgIGlmICIvdXNyL2Jpbi9wb3N0aW5zdC0iIGluIGM6CiAgICAgICAgcG9zdGluc3Rz
LmFwcGVuZChkZXN0KQogICAgaWYgb3MucGF0aC5pc2xpbmsoYyk6CiAgICAgICAgbGlua3RvID0g
b3MucmVhZGxpbmsoYykKICAgICAgICBpZiBvcy5wYXRoLmxleGlzdHMoZGVzdCk6CiAgICAgICAg
ICAgIGlmIG5vdCBvcy5wYXRoLmlzbGluayhkZXN0KToKICAgICAgICAgICAgICAgIHJhaXNlIE9T
RXJyb3IoZXJybm8uRUVYSVNULCAiTGluayAlcyBhbHJlYWR5IGV4aXN0cyBhcyBhIGZpbGUiICUg
ZGVzdCwgZGVzdCkKICAgICAgICAgICAgaWYgb3MucmVhZGxpbmsoZGVzdCkgPT0gbGlua3RvOgog
ICAgICAgICAgICAgICAgcmV0dXJuIGRlc3QKICAgICAgICAgICAgcmFpc2UgT1NFcnJvcihlcnJu
by5FRVhJU1QsICJMaW5rICVzIGFscmVhZHkgZXhpc3RzIHRvIGEgZGlmZmVyZW50IGxvY2F0aW9u
PyAoJXMgdnMgJXMpIiAlIChkZXN0LCBvcy5yZWFkbGluayhkZXN0KSwgbGlua3RvKSwgZGVzdCkK
ICAgICAgICBvcy5zeW1saW5rKGxpbmt0bywgZGVzdCkKICAgICAgICAjYmIud2FybihjKQogICAg
ZWxzZToKICAgICAgICB0cnk6CiAgICAgICAgICAgIG9zLmxpbmsoYywgZGVzdCkKICAgICAgICBl
eGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgIGlmIGVyci5lcnJubyA9PSBlcnJuby5F
WERFVjoKICAgICAgICAgICAgICAgIGJiLnV0aWxzLmNvcHlmaWxlKGMsIGRlc3QpCiAgICAgICAg
ICAgIGVsc2U6CiAgICAgICAgICAgICAgICByYWlzZQogICAgcmV0dXJuIGRlc3QKCmRlZiBzc3Rh
dGVfY2xlYW5fbWFuaWZlc3QobWFuaWZlc3QsIGQsIHByZWZpeD1Ob25lKToKICAgIGltcG9ydCBv
ZS5wYXRoCgogICAgbWZpbGUgPSBvcGVuKG1hbmlmZXN0KQogICAgZW50cmllcyA9IG1maWxlLnJl
YWRsaW5lcygpCiAgICBtZmlsZS5jbG9zZSgpCgogICAgZm9yIGVudHJ5IGluIGVudHJpZXM6CiAg
ICAgICAgZW50cnkgPSBlbnRyeS5zdHJpcCgpCiAgICAgICAgaWYgcHJlZml4IGFuZCBub3QgZW50
cnkuc3RhcnRzd2l0aCgiLyIpOgogICAgICAgICAgICBlbnRyeSA9IHByZWZpeCArICIvIiArIGVu
dHJ5CiAgICAgICAgYmIuZGVidWcoMiwgIlJlbW92aW5nIG1hbmlmZXN0OiAlcyIgJSBlbnRyeSkK
ICAgICAgICAjIFdlIGNhbiByYWNlIGFnYWluc3QgYW5vdGhlciBwYWNrYWdlIHBvcHVsYXRpbmcg
ZGlyZWN0b3JpZXMgYXMgd2UncmUgcmVtb3ZpbmcgdGhlbQogICAgICAgICMgc28gd2UgaWdub3Jl
IGVycm9ycyBoZXJlLgogICAgICAgIHRyeToKICAgICAgICAgICAgaWYgZW50cnkuZW5kc3dpdGgo
Ii8iKToKICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguaXNsaW5rKGVudHJ5WzotMV0pOgogICAg
ICAgICAgICAgICAgICAgIG9zLnJlbW92ZShlbnRyeVs6LTFdKQogICAgICAgICAgICAgICAgZWxp
ZiBvcy5wYXRoLmV4aXN0cyhlbnRyeSkgYW5kIGxlbihvcy5saXN0ZGlyKGVudHJ5KSkgPT0gMDoK
ICAgICAgICAgICAgICAgICAgICBvcy5ybWRpcihlbnRyeVs6LTFdKQogICAgICAgICAgICBlbHNl
OgogICAgICAgICAgICAgICAgb3MucmVtb3ZlKGVudHJ5KQogICAgICAgIGV4Y2VwdCBPU0Vycm9y
OgogICAgICAgICAgICBwYXNzCgogICAgcG9zdHJtID0gbWFuaWZlc3QgKyAiLnBvc3RybSIKICAg
IGlmIG9zLnBhdGguZXhpc3RzKG1hbmlmZXN0ICsgIi5wb3N0cm0iKToKICAgICAgICBpbXBvcnQg
c3VicHJvY2VzcwogICAgICAgIG9zLmNobW9kKHBvc3RybSwgMG83NTUpCiAgICAgICAgc3VicHJv
Y2Vzcy5jaGVja19jYWxsKHBvc3RybSwgc2hlbGw9VHJ1ZSkKICAgICAgICBvZS5wYXRoLnJlbW92
ZShwb3N0cm0pCgogICAgb2UucGF0aC5yZW1vdmUobWFuaWZlc3QpCgpkZWYgc2V0c2NlbmVfZGVw
dmFsaWQodGFzaywgdGFza2RlcGVuZGVlcywgbm90bmVlZGVkLCBkLCBsb2c9Tm9uZSk6CiAgICAj
IHRhc2tkZXBlbmRlZXMgaXMgYSBkaWN0IG9mIHRhc2tzIHdoaWNoIGRlcGVuZCBvbiB0YXNrLCBl
YWNoIGJlaW5nIGEgMyBpdGVtIGxpc3Qgb2YgW1BOLCBUQVNLTkFNRSwgRklMRU5BTUVdCiAgICAj
IHRhc2sgaXMgaW5jbHVkZWQgaW4gdGFza2RlcGVuZGVlcyB0b28KICAgICMgUmV0dXJuIC0gRmFs
c2UgLSBXZSBuZWVkIHRoaXMgZGVwZW5kZW5jeQogICAgIyAgICAgICAgLSBUcnVlIC0gV2UgY2Fu
IHNraXAgdGhpcyBkZXBlbmRlbmN5CiAgICBpbXBvcnQgcmUKCiAgICBkZWYgbG9naXQobXNnLCBs
b2cpOgogICAgICAgIGlmIGxvZyBpcyBub3QgTm9uZToKICAgICAgICAgICAgbG9nLmFwcGVuZCht
c2cpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgYmIuZGVidWcoMiwgbXNnKQoKICAgIGxvZ2l0
KCJDb25zaWRlcmluZyBzZXRzY2VuZSB0YXNrOiAlcyIgJSAoc3RyKHRhc2tkZXBlbmRlZXNbdGFz
a10pKSwgbG9nKQoKICAgIGRlZiBpc05hdGl2ZUNyb3NzKHgpOgogICAgICAgIHJldHVybiB4LmVu
ZHN3aXRoKCItbmF0aXZlIikgb3IgIi1jcm9zcy0iIGluIHggb3IgIi1jcm9zc3NkayIgaW4geCBv
ciB4LmVuZHN3aXRoKCItY3Jvc3MiKQoKICAgICMgV2Ugb25seSBuZWVkIHRvIHRyaWdnZXIgcG9w
dWxhdGVfbGljIHRocm91Z2ggZGlyZWN0IGRlcGVuZGVuY2llcwogICAgaWYgdGFza2RlcGVuZGVl
c1t0YXNrXVsxXSA9PSAiZG9fcG9wdWxhdGVfbGljIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAg
ICMgc3Rhc2hfbG9jYWxlIGFuZCBnY2Nfc3Rhc2hfYnVpbGRkaXIgYXJlIG5ldmVyIG5lZWRlZCBh
cyBhIGRlcGVuZGVuY3kgZm9yIGJ1aWx0IG9iamVjdHMKICAgIGlmIHRhc2tkZXBlbmRlZXNbdGFz
a11bMV0gPT0gImRvX3N0YXNoX2xvY2FsZSIgb3IgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAi
ZG9fZ2NjX3N0YXNoX2J1aWxkZGlyIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAgICMgV2Ugb25s
eSBuZWVkIHRvIHRyaWdnZXIgcGFja2FnZWRhdGEgdGhyb3VnaCBkaXJlY3QgZGVwZW5kZW5jaWVz
CiAgICAjIGJ1dCBuZWVkIHRvIHByZXNlcnZlIHBhY2thZ2VkYXRhIG9uIHBhY2thZ2VkYXRhIGxp
bmtzCiAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICJkb19wYWNrYWdlZGF0YSI6CiAg
ICAgICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgogICAgICAgICAgICBpZiB0YXNrZGVwZW5k
ZWVzW2RlcF1bMV0gPT0gImRvX3BhY2thZ2VkYXRhIjoKICAgICAgICAgICAgICAgIHJldHVybiBG
YWxzZQogICAgICAgIHJldHVybiBUcnVlCgogICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgog
ICAgICAgIGxvZ2l0KCIgIGNvbnNpZGVyaW5nIGRlcGVuZGVuY3k6ICVzIiAlIChzdHIodGFza2Rl
cGVuZGVlc1tkZXBdKSksIGxvZykKICAgICAgICBpZiB0YXNrID09IGRlcDoKICAgICAgICAgICAg
Y29udGludWUKICAgICAgICBpZiBkZXAgaW4gbm90bmVlZGVkOgogICAgICAgICAgICBjb250aW51
ZQogICAgICAgICMgZG9fcGFja2FnZV93cml0ZV8qIGFuZCBkb19wYWNrYWdlIGRvZXNuJ3QgbmVl
ZCBkb19wYWNrYWdlCiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcGFj
a2FnZSIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBbJ2RvX3BhY2thZ2UnLCAnZG9fcGFj
a2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0
ZV9ycG0nLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAgICAgICBj
b250aW51ZQogICAgICAgICMgZG9fcGFja2FnZV93cml0ZV8qIG5lZWQgZG9fcG9wdWxhdGVfc3lz
cm9vdCBhcyB0aGV5J3JlIG1haW5seSBwb3N0aW5zdGFsbCBkZXBlbmRlbmNpZXMKICAgICAgICBp
ZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICJkb19wb3B1bGF0ZV9zeXNyb290IiBhbmQgdGFz
a2RlcGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2Fn
ZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0nXToKICAgICAgICAgICAgcmV0dXJu
IEZhbHNlCiAgICAgICAgIyBkb19wYWNrYWdlL3BhY2thZ2VkYXRhL3BhY2thZ2VfcWEgZG9uJ3Qg
bmVlZCBkb19wb3B1bGF0ZV9zeXNyb290CiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsx
XSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBb
J2RvX3BhY2thZ2UnLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAg
ICAgICBjb250aW51ZQogICAgICAgICMgTmF0aXZlL0Nyb3NzIHBhY2thZ2VzIGRvbid0IGV4aXN0
IGFuZCBhcmUgbm9leGVjIGFueXdheQogICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVu
ZGVlc1tkZXBdWzBdKSBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93
cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0n
LCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZScsICdkb19wYWNrYWdlX3FhJ106CiAgICAg
ICAgICAgIGNvbnRpbnVlCgogICAgICAgICMgVGhpcyBpcyBkdWUgdG8gdGhlIFtkZXBlbmRzXSBp
biB1c2VyYWRkLmJiY2xhc3MgY29tcGxpY2F0aW5nIG1hdHRlcnMKICAgICAgICAjIFRoZSBsb2dp
YyAqaXMqIHJldmVyc2VkIGhlcmUgZHVlIHRvIHRoZSB3YXkgaGFyZCBzZXRzY2VuZSBkZXBlbmRl
bmNpZXMgYXJlIGluamVjdGVkCiAgICAgICAgaWYgKHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0g
J2RvX3BhY2thZ2UnIG9yIHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5
c3Jvb3QnKSBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzBdLmVuZHN3aXRoKCgnc2hhZG93LW5hdGl2
ZScsICdzaGFkb3ctc3lzcm9vdCcsICdiYXNlLXBhc3N3ZCcsICdwc2V1ZG8tbmF0aXZlJykpIGFu
ZCB0YXNrZGVwZW5kZWVzW2RlcF1bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5c3Jvb3QnOgogICAgICAg
ICAgICBjb250aW51ZQoKICAgICAgICAjIENvbnNpZGVyIHN5c3Jvb3QgZGVwZW5kaW5nIG9uIHN5
c3Jvb3QgdGFza3MKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19wb3B1
bGF0ZV9zeXNyb290JyBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdID09ICdkb19wb3B1bGF0ZV9z
eXNyb290JzoKICAgICAgICAgICAgIyBBbGxvdyBleGNsdWRpbmcgY2VydGFpbiByZWN1cnNpdmUg
ZGVwZW5kZW5jaWVzLiBJZiBhIHJlY2lwZSBuZWVkcyBpdCBzaG91bGQgYWRkIGEKICAgICAgICAg
ICAgIyBzcGVjaWZpYyBkZXBlbmRlbmN5IGl0c2VsZiwgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBv
bmUgb2YgaXRzIGRlcGVuZGVlcyB0byBwdWxsCiAgICAgICAgICAgICMgdGhlbSBpbi4KICAgICAg
ICAgICAgIyBTZWUgYWxzbyBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwv
b3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1KYW51YXJ5LzE0NjMyNC5odG1sCiAgICAgICAgICAgIG5v
dF9uZWVkZWQgPSBGYWxzZQogICAgICAgICAgICBleGNsdWRlZGVwcyA9IGQuZ2V0VmFyKCdfU1NU
QVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKQogICAgICAgICAgICBpZiBleGNsdWRlZGVwcyBpcyBO
b25lOgogICAgICAgICAgICAgICAgIyBDYWNoZSB0aGUgcmVndWxhciBleHByZXNzaW9ucyBmb3Ig
c3BlZWQKICAgICAgICAgICAgICAgIGV4Y2x1ZGVkZXBzID0gW10KICAgICAgICAgICAgICAgIGZv
ciBleGNsIGluIChkLmdldFZhcignU1NUQVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKSBvciAiIiku
c3BsaXQoKToKICAgICAgICAgICAgICAgICAgICBleGNsdWRlZGVwcy5hcHBlbmQoKHJlLmNvbXBp
bGUoZXhjbC5zcGxpdCgnLT4nLCAxKVswXSksIHJlLmNvbXBpbGUoZXhjbC5zcGxpdCgnLT4nLCAx
KVsxXSkpKQogICAgICAgICAgICAgICAgZC5zZXRWYXIoJ19TU1RBVEVfRVhDTFVERURFUFNfU1lT
Uk9PVCcsIGV4Y2x1ZGVkZXBzKQogICAgICAgICAgICBmb3IgZXhjbCBpbiBleGNsdWRlZGVwczoK
ICAgICAgICAgICAgICAgIGlmIGV4Y2xbMF0ubWF0Y2godGFza2RlcGVuZGVlc1tkZXBdWzBdKToK
ICAgICAgICAgICAgICAgICAgICBpZiBleGNsWzFdLm1hdGNoKHRhc2tkZXBlbmRlZXNbdGFza11b
MF0pOgogICAgICAgICAgICAgICAgICAgICAgICBub3RfbmVlZGVkID0gVHJ1ZQogICAgICAgICAg
ICAgICAgICAgICAgICBicmVhawogICAgICAgICAgICBpZiBub3RfbmVlZGVkOgogICAgICAgICAg
ICAgICAgY29udGludWUKICAgICAgICAgICAgIyBGb3IgbWV0YS1leHRzZGstdG9vbGNoYWluIHdl
IHdhbnQgYWxsIHN5c3Jvb3QgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIGlmIHRhc2tkZXBlbmRl
ZXNbZGVwXVswXSA9PSAnbWV0YS1leHRzZGstdG9vbGNoYWluJzoKICAgICAgICAgICAgICAgIHJl
dHVybiBGYWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9Dcm9zcyBwb3B1bGF0ZV9zeXNyb290IG5l
ZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2Rl
cGVuZGVlc1t0YXNrXVswXSkgYW5kIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBd
KToKICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1
bGF0ZV9zeXNyb290IGRlcGVuZGVkIG9uIGJ5IGNyb3NzIHRvb2xzIG5lZWQgdG8gYmUgaW5zdGFs
bGVkCiAgICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKToK
ICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9jcm9zcyB0
b29scyBkZXBlbmRlZCB1cG9uIGJ5IHRhcmdldCBzeXNyb290IGFyZSBub3QgbmVlZGVkCiAgICAg
ICAgICAgICMgQWRkIGFuIGV4Y2VwdGlvbiBmb3Igc2hhZG93LW5hdGl2ZSBhcyByZXF1aXJlZCBi
eSB1c2VyYWRkLmJiY2xhc3MKICAgICAgICAgICAgaWYgaXNOYXRpdmVDcm9zcyh0YXNrZGVwZW5k
ZWVzW3Rhc2tdWzBdKSBhbmQgdGFza2RlcGVuZGVlc1t0YXNrXVswXSAhPSAnc2hhZG93LW5hdGl2
ZSc6CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1bGF0
ZV9zeXNyb290IG5lZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIHJldHVybiBGYWxz
ZQoKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19zaGFyZWRfd29ya2Rp
cic6CiAgICAgICAgICAgIGNvbnRpbnVlCgogICAgICAgIGlmIHRhc2tkZXBlbmRlZXNbZGVwXVsx
XSA9PSAiZG9fcG9wdWxhdGVfbGljIjoKICAgICAgICAgICAgY29udGludWUKCgogICAgICAgICMg
U2FmZSBmYWxsdGhyb3VnaCBkZWZhdWx0CiAgICAgICAgbG9naXQoIiBEZWZhdWx0IHNldHNjZW5l
IGRlcGVuZGVuY3kgZmFsbCB0aHJvdWdoIGR1ZSB0byBkZXBlbmRlbmN5OiAlcyIgJSAoc3RyKHRh
c2tkZXBlbmRlZXNbZGVwXSkpLCBsb2cpCiAgICAgICAgcmV0dXJuIEZhbHNlCiAgICByZXR1cm4g
VHJ1ZQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.extend_recipe_sysroot.14518"
Content-Disposition: attachment; filename="run.extend_recipe_sysroot.14518"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3bd42>
X-Attachment-Id: f_jz9oy3bd42

ZGVmIGV4dGVuZF9yZWNpcGVfc3lzcm9vdChkKToKICAgIGltcG9ydCBjb3B5CiAgICBpbXBvcnQg
c3VicHJvY2VzcwogICAgaW1wb3J0IGVycm5vCiAgICBpbXBvcnQgY29sbGVjdGlvbnMKICAgIGlt
cG9ydCBnbG9iCgogICAgdGFza2RlcGRhdGEgPSBkLmdldFZhcigiQkJfVEFTS0RFUERBVEEiLCBG
YWxzZSkKICAgIG15dGFza25hbWUgPSBkLmdldFZhcigiQkJfUlVOVEFTSyIpCiAgICBpZiBteXRh
c2tuYW1lLmVuZHN3aXRoKCJfc2V0c2NlbmUiKToKICAgICAgICBteXRhc2tuYW1lID0gbXl0YXNr
bmFtZS5yZXBsYWNlKCJfc2V0c2NlbmUiLCAiIikKICAgIHdvcmtkaXIgPSBkLmdldFZhcigiV09S
S0RJUiIpCiAgICAjYmIud2FybihzdHIodGFza2RlcGRhdGEpKQogICAgcG4gPSBkLmdldFZhcigi
UE4iKQogICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFyKCJTVEFHSU5HX0RJUiIpCiAgICBzaGFyZWRt
YW5pZmVzdHMgPSBkLmdldFZhcigiQ09NUE9ORU5UU19ESVIiKSArICIvbWFuaWZlc3RzIgogICAg
cmVjaXBlc3lzcm9vdCA9IGQuZ2V0VmFyKCJSRUNJUEVfU1lTUk9PVCIpCiAgICByZWNpcGVzeXNy
b290bmF0aXZlID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UX05BVElWRSIpCgogICAgIyBEZXRl
Y3QgYml0YmFrZSAtYiB1c2FnZQogICAgbm9kZXBzID0gZC5nZXRWYXIoIkJCX0xJTUlURURERVBT
Iikgb3IgRmFsc2UKICAgIGlmIG5vZGVwczoKICAgICAgICBsb2NrID0gYmIudXRpbHMubG9ja2Zp
bGUocmVjaXBlc3lzcm9vdCArICIvc3lzcm9vdC5sb2NrIikKICAgICAgICBzdGFnaW5nX3BvcHVs
YXRlX3N5c3Jvb3RfZGlyKHJlY2lwZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUsIFRydWUs
IGQpCiAgICAgICAgc3RhZ2luZ19wb3B1bGF0ZV9zeXNyb290X2RpcihyZWNpcGVzeXNyb290LCBy
ZWNpcGVzeXNyb290bmF0aXZlLCBGYWxzZSwgZCkKICAgICAgICBiYi51dGlscy51bmxvY2tmaWxl
KGxvY2spCiAgICAgICAgcmV0dXJuCgogICAgc3RhcnQgPSBOb25lCiAgICBjb25maWd1cmVkZXBz
ID0gW10KICAgIGZvciBkZXAgaW4gdGFza2RlcGRhdGE6CiAgICAgICAgZGF0YSA9IHRhc2tkZXBk
YXRhW2RlcF0KICAgICAgICBpZiBkYXRhWzFdID09IG15dGFza25hbWUgYW5kIGRhdGFbMF0gPT0g
cG46CiAgICAgICAgICAgIHN0YXJ0ID0gZGVwCiAgICAgICAgICAgIGJyZWFrCiAgICBpZiBzdGFy
dCBpcyBOb25lOgogICAgICAgIGJiLmZhdGFsKCJDb3VsZG4ndCBmaW5kIG91cnNlbGYgaW4gQkJf
VEFTS0RFUERBVEE/IikKCiAgICAjIFdlIG5lZWQgdG8gZmlndXJlIG91dCB3aGljaCBzeXNyb290
IGZpbGVzIHdlIG5lZWQgdG8gZXhwb3NlIHRvIHRoaXMgdGFzay4KICAgICMgVGhpcyBuZWVkcyB0
byBtYXRjaCB3aGF0IHdvdWxkIGdldCByZXN0b3JlZCBmcm9tIHNzdGF0ZSwgd2hpY2ggaXMgY29u
dHJvbGxlZAogICAgIyB1bHRpbWF0ZWx5IGJ5IGNhbGxzIGZyb20gYml0YmFrZSB0byBzZXRzY2Vu
ZV9kZXB2YWxpZCgpLgogICAgIyBUaGF0IGZ1bmN0aW9uIGV4cGVjdHMgYSBzZXRzY2VuZSBkZXBl
bmRlbmN5IHRyZWUuIFdlIGJ1aWxkIGEgZGVwZW5kZW5jeSB0cmVlCiAgICAjIGNvbmRlbnNlZCB0
byBpbnRlci1zc3RhdGUgdGFzayBkZXBlbmRlbmNpZXMsIHNpbWlsYXIgdG8gdGhhdCB1c2VkIGJ5
IHNldHNjZW5lCiAgICAjIHRhc2tzLiBXZSBjYW4gdGhlbiBjYWxsIGludG8gc2V0c2NlbmVfZGVw
dmFsaWQoKSBhbmQgZGVjaWRlCiAgICAjIHdoaWNoIGRlcGVuZGVuY2llcyB3ZSBjYW4gInNlZSIg
YW5kIHNob3VsZCBleHBvc2UgaW4gdGhlIHJlY2lwZSBzcGVjaWZpYyBzeXNyb290LgogICAgc2V0
c2NlbmVkZXBzID0gY29weS5kZWVwY29weSh0YXNrZGVwZGF0YSkKCiAgICBzdGFydCA9IHNldChb
c3RhcnRdKQoKICAgIHNzdGF0ZXRhc2tzID0gZC5nZXRWYXIoIlNTVEFURVRBU0tTIikuc3BsaXQo
KQogICAgIyBBZGQgcmVjaXBlIHNwZWNpZmljIHRhc2tzIHJlZmVyZW5jZWQgYnkgc2V0c2NlbmVf
ZGVwdmFsaWQoKQogICAgc3N0YXRldGFza3MuYXBwZW5kKCJkb19zdGFzaF9sb2NhbGUiKQoKICAg
IGRlZiBwcmludF9kZXBfdHJlZShkZXB0cmVlKToKICAgICAgICBkYXRhID0gIiIKICAgICAgICBm
b3IgZGVwIGluIGRlcHRyZWU6CiAgICAgICAgICAgIGRlcHMgPSAiICAgICIgKyAiXG4gICAgIi5q
b2luKGRlcHRyZWVbZGVwXVszXSkgKyAiXG4iCiAgICAgICAgICAgIGRhdGEgPSBkYXRhICsgIiVz
OlxuICAlc1xuICAlc1xuJXMgICVzXG4gICVzXG4iICUgKGRlcHRyZWVbZGVwXVswXSwgZGVwdHJl
ZVtkZXBdWzFdLCBkZXB0cmVlW2RlcF1bMl0sIGRlcHMsIGRlcHRyZWVbZGVwXVs0XSwgZGVwdHJl
ZVtkZXBdWzVdKQogICAgICAgIHJldHVybiBkYXRhCgogICAgI2JiLm5vdGUoIkZ1bGwgZGVwIHRy
ZWUgaXM6XG4lcyIgJSBwcmludF9kZXBfdHJlZSh0YXNrZGVwZGF0YSkpCgogICAgI2JiLm5vdGUo
IiBzdGFydDIgaXMgJXMiICUgc3RyKHN0YXJ0KSkKCiAgICAjIElmIHN0YXJ0IGlzIGFuIHNzdGF0
ZSB0YXNrIChsaWtlIGRvX3BhY2thZ2UpIHdlIG5lZWQgdG8gYWRkIGluIGl0cyBkaXJlY3QgZGVw
ZW5kZW5jaWVzCiAgICAjIGVsc2UgdGhlIGNvZGUgYmVsb3cgd29uJ3QgcmVjdXJzZSBpbnRvIHRo
ZW0uCiAgICBmb3IgZGVwIGluIHNldChzdGFydCk6CiAgICAgICAgZm9yIGRlcDIgaW4gc2V0c2Nl
bmVkZXBzW2RlcF1bM106CiAgICAgICAgICAgIHN0YXJ0LmFkZChkZXAyKQogICAgICAgIHN0YXJ0
LnJlbW92ZShkZXApCgogICAgI2JiLm5vdGUoIiBzdGFydDMgaXMgJXMiICUgc3RyKHN0YXJ0KSkK
CiAgICAjIENyZWF0ZSBjb2xsYXBzZWQgZG9fcG9wdWxhdGVfc3lzcm9vdCAtPiBkb19wb3B1bGF0
ZV9zeXNyb290IHRyZWUKICAgIGZvciBkZXAgaW4gdGFza2RlcGRhdGE6CiAgICAgICAgZGF0YSA9
IHNldHNjZW5lZGVwc1tkZXBdCiAgICAgICAgaWYgZGF0YVsxXSBub3QgaW4gc3N0YXRldGFza3M6
CiAgICAgICAgICAgIGZvciBkZXAyIGluIHNldHNjZW5lZGVwczoKICAgICAgICAgICAgICAgIGRh
dGEyID0gc2V0c2NlbmVkZXBzW2RlcDJdCiAgICAgICAgICAgICAgICBpZiBkZXAgaW4gZGF0YTJb
M106CiAgICAgICAgICAgICAgICAgICAgZGF0YTJbM10udXBkYXRlKHNldHNjZW5lZGVwc1tkZXBd
WzNdKQogICAgICAgICAgICAgICAgICAgIGRhdGEyWzNdLnJlbW92ZShkZXApCiAgICAgICAgICAg
IGlmIGRlcCBpbiBzdGFydDoKICAgICAgICAgICAgICAgIHN0YXJ0LnVwZGF0ZShzZXRzY2VuZWRl
cHNbZGVwXVszXSkKICAgICAgICAgICAgICAgIHN0YXJ0LnJlbW92ZShkZXApCiAgICAgICAgICAg
IGRlbCBzZXRzY2VuZWRlcHNbZGVwXQoKICAgICMgUmVtb3ZlIGNpcmN1bGFyIHJlZmVyZW5jZXMK
ICAgIGZvciBkZXAgaW4gc2V0c2NlbmVkZXBzOgogICAgICAgIGlmIGRlcCBpbiBzZXRzY2VuZWRl
cHNbZGVwXVszXToKICAgICAgICAgICAgc2V0c2NlbmVkZXBzW2RlcF1bM10ucmVtb3ZlKGRlcCkK
CiAgICAjYmIubm90ZSgiQ29tcHV0ZWQgZGVwIHRyZWUgaXM6XG4lcyIgJSBwcmludF9kZXBfdHJl
ZShzZXRzY2VuZWRlcHMpKQogICAgI2JiLm5vdGUoIiBzdGFydCBpcyAlcyIgJSBzdHIoc3RhcnQp
KQoKICAgICMgRGlyZWN0IGRlcGVuZGVuY2llcyBzaG91bGQgYmUgcHJlc2VudCBhbmQgY2FuIGJl
IGRlcGVuZGVkIHVwb24KICAgIGZvciBkZXAgaW4gc2V0KHN0YXJ0KToKICAgICAgICBpZiBzZXRz
Y2VuZWRlcHNbZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCI6CiAgICAgICAgICAgIGlm
IGRlcCBub3QgaW4gY29uZmlndXJlZGVwczoKICAgICAgICAgICAgICAgIGNvbmZpZ3VyZWRlcHMu
YXBwZW5kKGRlcCkKICAgIGJiLm5vdGUoIkRpcmVjdCBkZXBlbmRlbmNpZXMgYXJlICVzIiAlIHN0
cihjb25maWd1cmVkZXBzKSkKICAgICNiYi5ub3RlKCIgb3IgJXMiICUgc3RyKHN0YXJ0KSkKCiAg
ICBtc2didWYgPSBbXQogICAgIyBDYWxsIGludG8gc2V0c2NlbmVfZGVwdmFsaWQgZm9yIGVhY2gg
c3ViLWRlcGVuZGVuY3kgYW5kIG9ubHkgY29weSBzeXNyb290IGZpbGVzCiAgICAjIGZvciBvbmVz
IHRoYXQgd291bGQgYmUgcmVzdG9yZWQgZnJvbSBzc3RhdGUuCiAgICBkb25lID0gbGlzdChzdGFy
dCkKICAgIG5leHQgPSBsaXN0KHN0YXJ0KQogICAgd2hpbGUgbmV4dDoKICAgICAgICBuZXcgPSBb
XQogICAgICAgIGZvciBkZXAgaW4gbmV4dDoKICAgICAgICAgICAgZGF0YSA9IHNldHNjZW5lZGVw
c1tkZXBdCiAgICAgICAgICAgIGZvciBkYXRhZGVwIGluIGRhdGFbM106CiAgICAgICAgICAgICAg
ICBpZiBkYXRhZGVwIGluIGRvbmU6CiAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAg
ICAgICAgICAgIHRhc2tkZXBzID0ge30KICAgICAgICAgICAgICAgIHRhc2tkZXBzW2RlcF0gPSBz
ZXRzY2VuZWRlcHNbZGVwXVs6Ml0KICAgICAgICAgICAgICAgIHRhc2tkZXBzW2RhdGFkZXBdID0g
c2V0c2NlbmVkZXBzW2RhdGFkZXBdWzoyXQogICAgICAgICAgICAgICAgcmV0dmFsID0gc2V0c2Nl
bmVfZGVwdmFsaWQoZGF0YWRlcCwgdGFza2RlcHMsIFtdLCBkLCBtc2didWYpCiAgICAgICAgICAg
ICAgICBpZiByZXR2YWw6CiAgICAgICAgICAgICAgICAgICAgbXNnYnVmLmFwcGVuZCgiU2tpcHBp
bmcgc2V0c2NlbmUgZGVwZW5kZW5jeSAlcyBmb3IgaW5zdGFsbGF0aW9uIGludG8gdGhlIHN5c3Jv
b3QiICUgZGF0YWRlcCkKICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAg
ICAgZG9uZS5hcHBlbmQoZGF0YWRlcCkKICAgICAgICAgICAgICAgIG5ldy5hcHBlbmQoZGF0YWRl
cCkKICAgICAgICAgICAgICAgIGlmIGRhdGFkZXAgbm90IGluIGNvbmZpZ3VyZWRlcHMgYW5kIHNl
dHNjZW5lZGVwc1tkYXRhZGVwXVsxXSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCI6CiAgICAgICAg
ICAgICAgICAgICAgY29uZmlndXJlZGVwcy5hcHBlbmQoZGF0YWRlcCkKICAgICAgICAgICAgICAg
ICAgICBtc2didWYuYXBwZW5kKCJBZGRpbmcgZGVwZW5kZW5jeSBvbiAlcyIgJSBzZXRzY2VuZWRl
cHNbZGF0YWRlcF1bMF0pCiAgICAgICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgICAg
IG1zZ2J1Zi5hcHBlbmQoIkZvbGxvd2luZyBkZXBlbmRlbmN5IG9uICVzIiAlIHNldHNjZW5lZGVw
c1tkYXRhZGVwXVswXSkKICAgICAgICBuZXh0ID0gbmV3CgogICAgIyBUaGlzIGxvZ2dpbmcgaXMg
dG9vIHZlcmJvc2UgZm9yIGRheSB0byBkYXkgdXNlIHNhZGx5CiAgICAjYmIuZGVidWcoMiwgIlxu
Ii5qb2luKG1zZ2J1ZikpCgogICAgZGVwZGlyID0gcmVjaXBlc3lzcm9vdG5hdGl2ZSArICIvaW5z
dGFsbGVkZGVwcyIKICAgIGJiLnV0aWxzLm1rZGlyaGllcihkZXBkaXIpCiAgICBiYi51dGlscy5t
a2RpcmhpZXIoc2hhcmVkbWFuaWZlc3RzKQoKICAgIGxvY2sgPSBiYi51dGlscy5sb2NrZmlsZShy
ZWNpcGVzeXNyb290ICsgIi9zeXNyb290LmxvY2siKQoKICAgIGZpeG1lID0ge30KICAgIHNlZW5k
aXJzID0gc2V0KCkKICAgIHBvc3RpbnN0cyA9IFtdCiAgICBtdWx0aWxpYnMgPSB7fQogICAgbWFu
aWZlc3RzID0ge30KICAgICMgQWxsIGZpbGVzIHRoYXQgd2UncmUgZ29pbmcgdG8gYmUgaW5zdGFs
bGluZywgdG8gZmluZCBjb25mbGljdHMuCiAgICBmaWxlc2V0ID0ge30KCiAgICBmb3IgZiBpbiBv
cy5saXN0ZGlyKGRlcGRpcik6CiAgICAgICAgaWYgbm90IGYuZW5kc3dpdGgoIi5jb21wbGV0ZSIp
OgogICAgICAgICAgICBjb250aW51ZQogICAgICAgIGYgPSBkZXBkaXIgKyAiLyIgKyBmCiAgICAg
ICAgaWYgb3MucGF0aC5pc2xpbmsoZikgYW5kIG5vdCBvcy5wYXRoLmV4aXN0cyhmKToKICAgICAg
ICAgICAgYmIubm90ZSgiJXMgbm8gbG9uZ2VyIGV4aXN0cywgcmVtb3ZpbmcgZnJvbSBzeXNyb290
IiAlIGYpCiAgICAgICAgICAgIGxuayA9IG9zLnJlYWRsaW5rKGYucmVwbGFjZSgiLmNvbXBsZXRl
IiwgIiIpKQogICAgICAgICAgICBzc3RhdGVfY2xlYW5fbWFuaWZlc3QoZGVwZGlyICsgIi8iICsg
bG5rLCBkLCB3b3JrZGlyKQogICAgICAgICAgICBvcy51bmxpbmsoZikKICAgICAgICAgICAgb3Mu
dW5saW5rKGYucmVwbGFjZSgiLmNvbXBsZXRlIiwgIiIpKQoKICAgIGluc3RhbGxlZCA9IFtdCiAg
ICBmb3IgZGVwIGluIGNvbmZpZ3VyZWRlcHM6CiAgICAgICAgYyA9IHNldHNjZW5lZGVwc1tkZXBd
WzBdCiAgICAgICAgaWYgbXl0YXNrbmFtZSBpbiBbImRvX3Nka19kZXBlbmRzIiwgImRvX3BvcHVs
YXRlX3Nka19leHQiXSBhbmQgYy5lbmRzd2l0aCgiLWluaXRpYWwiKToKICAgICAgICAgICAgYmIu
bm90ZSgiU2tpcHBpbmcgaW5pdGlhbCBzZXRzY2VuZSBkZXBlbmRlbmN5ICVzIGZvciBpbnN0YWxs
YXRpb24gaW50byB0aGUgc3lzcm9vdCIgJSBjKQogICAgICAgICAgICBjb250aW51ZQogICAgICAg
IGluc3RhbGxlZC5hcHBlbmQoYykKCiAgICAjIFdlIHdhbnQgdG8gcmVtb3ZlIGFueXRoaW5nIHdo
aWNoIHRoaXMgdGFzayBwcmV2aW91c2x5IGluc3RhbGxlZCBidXQgaXMgbm8gbG9uZ2VyIGEgZGVw
ZW5kZW5jeQogICAgdGFza2luZGV4ID0gZGVwZGlyICsgIi8iICsgImluZGV4LiIgKyBteXRhc2tu
YW1lCiAgICBpZiBvcy5wYXRoLmV4aXN0cyh0YXNraW5kZXgpOgogICAgICAgIHBvdGVudGlhbCA9
IFtdCiAgICAgICAgd2l0aCBvcGVuKHRhc2tpbmRleCwgInIiKSBhcyBmOgogICAgICAgICAgICBm
b3IgbCBpbiBmOgogICAgICAgICAgICAgICAgbCA9IGwuc3RyaXAoKQogICAgICAgICAgICAgICAg
aWYgbCBub3QgaW4gaW5zdGFsbGVkOgogICAgICAgICAgICAgICAgICAgIGZsID0gZGVwZGlyICsg
Ii8iICsgbAogICAgICAgICAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhmbCk6CiAg
ICAgICAgICAgICAgICAgICAgICAgICMgV2FzIGxpa2VseSBhbHJlYWR5IHVuaW5zdGFsbGVkCiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAgICAgcG90ZW50
aWFsLmFwcGVuZChsKQogICAgICAgICMgV2UgbmVlZCB0byBlbnN1cmUgbm90IG90aGVyIHRhc2sg
bmVlZHMgdGhpcyBkZXBlbmRlbmN5LiBXZSBob2xkIHRoZSBzeXNyb290CiAgICAgICAgIyBsb2Nr
IHNvIHdlIGNhIHNlYXJjaCB0aGUgaW5kZXhlcyB0byBjaGVjawogICAgICAgIGlmIHBvdGVudGlh
bDoKICAgICAgICAgICAgZm9yIGkgaW4gZ2xvYi5nbG9iKGRlcGRpciArICIvaW5kZXguKiIpOgog
ICAgICAgICAgICAgICAgaWYgaS5lbmRzd2l0aCgiLiIgKyBteXRhc2tuYW1lKToKICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgd2l0aCBvcGVuKGksICJyIikgYXMg
ZjoKICAgICAgICAgICAgICAgICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgICAg
ICBsID0gbC5zdHJpcCgpCiAgICAgICAgICAgICAgICAgICAgICAgIGlmIGwgaW4gcG90ZW50aWFs
OgogICAgICAgICAgICAgICAgICAgICAgICAgICAgcG90ZW50aWFsLnJlbW92ZShsKQogICAgICAg
IGZvciBsIGluIHBvdGVudGlhbDoKICAgICAgICAgICAgZmwgPSBkZXBkaXIgKyAiLyIgKyBsCiAg
ICAgICAgICAgIGJiLm5vdGUoIlRhc2sgJXMgbm8gbG9uZ2VyIGRlcGVuZHMgb24gJXMsIHJlbW92
aW5nIGZyb20gc3lzcm9vdCIgJSAobXl0YXNrbmFtZSwgbCkpCiAgICAgICAgICAgIGxuayA9IG9z
LnJlYWRsaW5rKGZsKQogICAgICAgICAgICBzc3RhdGVfY2xlYW5fbWFuaWZlc3QoZGVwZGlyICsg
Ii8iICsgbG5rLCBkLCB3b3JrZGlyKQogICAgICAgICAgICBvcy51bmxpbmsoZmwpCiAgICAgICAg
ICAgIG9zLnVubGluayhmbCArICIuY29tcGxldGUiKQoKICAgIG1zZ19leGlzdHMgPSBbXQogICAg
bXNnX2FkZGluZyA9IFtdCgogICAgZm9yIGRlcCBpbiBjb25maWd1cmVkZXBzOgogICAgICAgIGMg
PSBzZXRzY2VuZWRlcHNbZGVwXVswXQogICAgICAgIGlmIGMgbm90IGluIGluc3RhbGxlZDoKICAg
ICAgICAgICAgY29udGludWUKICAgICAgICB0YXNraGFzaCA9IHNldHNjZW5lZGVwc1tkZXBdWzVd
CiAgICAgICAgdGFza21hbmlmZXN0ID0gZGVwZGlyICsgIi8iICsgYyArICIuIiArIHRhc2toYXNo
CgogICAgICAgIGlmIG9zLnBhdGguZXhpc3RzKGRlcGRpciArICIvIiArIGMpOgogICAgICAgICAg
ICBsbmsgPSBvcy5yZWFkbGluayhkZXBkaXIgKyAiLyIgKyBjKQogICAgICAgICAgICBpZiBsbmsg
PT0gYyArICIuIiArIHRhc2toYXNoIGFuZCBvcy5wYXRoLmV4aXN0cyhkZXBkaXIgKyAiLyIgKyBj
ICsgIi5jb21wbGV0ZSIpOgogICAgICAgICAgICAgICAgbXNnX2V4aXN0cy5hcHBlbmQoYykKICAg
ICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICBi
Yi5ub3RlKCIlcyBleGlzdHMgaW4gc3lzcm9vdCwgYnV0IGlzIHN0YWxlICglcyB2cy4gJXMpLCBy
ZW1vdmluZy4iICUgKGMsIGxuaywgYyArICIuIiArIHRhc2toYXNoKSkKICAgICAgICAgICAgICAg
IHNzdGF0ZV9jbGVhbl9tYW5pZmVzdChkZXBkaXIgKyAiLyIgKyBsbmssIGQsIHdvcmtkaXIpCiAg
ICAgICAgICAgICAgICBvcy51bmxpbmsoZGVwZGlyICsgIi8iICsgYykKICAgICAgICAgICAgICAg
IGlmIG9zLnBhdGgubGV4aXN0cyhkZXBkaXIgKyAiLyIgKyBjICsgIi5jb21wbGV0ZSIpOgogICAg
ICAgICAgICAgICAgICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjICsgIi5jb21wbGV0ZSIp
CiAgICAgICAgZWxpZiBvcy5wYXRoLmxleGlzdHMoZGVwZGlyICsgIi8iICsgYyk6CiAgICAgICAg
ICAgIG9zLnVubGluayhkZXBkaXIgKyAiLyIgKyBjKQoKICAgICAgICBtc2dfYWRkaW5nLmFwcGVu
ZChjKQoKICAgICAgICBvcy5zeW1saW5rKGMgKyAiLiIgKyB0YXNraGFzaCwgZGVwZGlyICsgIi8i
ICsgYykKCiAgICAgICAgbWFuaWZlc3QsIGQyID0gb2Uuc3N0YXRlc2lnLmZpbmRfc3N0YXRlX21h
bmlmZXN0KGMsIHNldHNjZW5lZGVwc1tkZXBdWzJdLCAicG9wdWxhdGVfc3lzcm9vdCIsIGQsIG11
bHRpbGlicykKICAgICAgICBpZiBkMiBpcyBub3QgZDoKICAgICAgICAgICAgIyBJZiB3ZSBkb24n
dCBkbyB0aGlzLCB0aGUgcmVjaXBlIHN5c3Jvb3Qgd2lsbCBiZSBwbGFjZWQgaW4gdGhlIHdyb25n
IFdPUktESVIgZm9yIG11bHRpbGlicwogICAgICAgICAgICAjIFdlIG5lZWQgYSBjb25zaXN0ZW50
IFdPUktESVIgZm9yIHRoZSBpbWFnZQogICAgICAgICAgICBkMi5zZXRWYXIoIldPUktESVIiLCBk
LmdldFZhcigiV09SS0RJUiIpKQogICAgICAgIGRlc3RzeXNyb290ID0gZDIuZ2V0VmFyKCJSRUNJ
UEVfU1lTUk9PVCIpCiAgICAgICAgIyBXZSBwdXQgYWxsYXJjaCByZWNpcGVzIGludG8gdGhlIGRl
ZmF1bHQgc3lzcm9vdAogICAgICAgIGlmIG1hbmlmZXN0IGFuZCAiYWxsYXJjaCIgaW4gbWFuaWZl
c3Q6CiAgICAgICAgICAgIGRlc3RzeXNyb290ID0gZC5nZXRWYXIoIlJFQ0lQRV9TWVNST09UIikK
CiAgICAgICAgbmF0aXZlID0gRmFsc2UKICAgICAgICBpZiBjLmVuZHN3aXRoKCItbmF0aXZlIikg
b3IgIi1jcm9zcy0iIGluIGMgb3IgIi1jcm9zc3NkayIgaW4gYzoKICAgICAgICAgICAgbmF0aXZl
ID0gVHJ1ZQoKICAgICAgICBpZiBtYW5pZmVzdDoKICAgICAgICAgICAgbmV3bWFuaWZlc3QgPSBj
b2xsZWN0aW9ucy5PcmRlcmVkRGljdCgpCiAgICAgICAgICAgIHRhcmdldGRpciA9IGRlc3RzeXNy
b290CiAgICAgICAgICAgIGlmIG5hdGl2ZToKICAgICAgICAgICAgICAgIHRhcmdldGRpciA9IHJl
Y2lwZXN5c3Jvb3RuYXRpdmUKICAgICAgICAgICAgaWYgdGFyZ2V0ZGlyIG5vdCBpbiBmaXhtZToK
ICAgICAgICAgICAgICAgIGZpeG1lW3RhcmdldGRpcl0gPSBbXQogICAgICAgICAgICBmbSA9IGZp
eG1lW3RhcmdldGRpcl0KCiAgICAgICAgICAgIHdpdGggb3BlbihtYW5pZmVzdCwgInIiKSBhcyBm
OgogICAgICAgICAgICAgICAgbWFuaWZlc3RzW2RlcF0gPSBtYW5pZmVzdAogICAgICAgICAgICAg
ICAgZm9yIGwgaW4gZjoKICAgICAgICAgICAgICAgICAgICBsID0gbC5zdHJpcCgpCiAgICAgICAg
ICAgICAgICAgICAgaWYgbC5lbmRzd2l0aCgiL2ZpeG1lcGF0aCIpOgogICAgICAgICAgICAgICAg
ICAgICAgICBmbS5hcHBlbmQobCkKICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAg
ICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoLmNtZCIpOgogICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIGRlc3QgPSBsLnJl
cGxhY2Uoc3RhZ2luZ2RpciwgIiIpCiAgICAgICAgICAgICAgICAgICAgZGVzdCA9ICIvIiArICIv
Ii5qb2luKGRlc3Quc3BsaXQoIi8iKVszOl0pCiAgICAgICAgICAgICAgICAgICAgbmV3bWFuaWZl
c3RbbF0gPSB0YXJnZXRkaXIgKyBkZXN0CgogICAgICAgICAgICAgICAgICAgICMgQ2hlY2sgaWYg
ZmlsZXMgaGF2ZSBhbHJlYWR5IGJlZW4gaW5zdGFsbGVkIGJ5IGFub3RoZXIKICAgICAgICAgICAg
ICAgICAgICAjIHJlY2lwZSBhbmQgYWJvcnQgaWYgdGhleSBoYXZlLCBleHBsYWluaW5nIHdoYXQg
cmVjaXBlcyBhcmUKICAgICAgICAgICAgICAgICAgICAjIGNvbmZsaWN0aW5nLgogICAgICAgICAg
ICAgICAgICAgIGhhc2huYW1lID0gdGFyZ2V0ZGlyICsgZGVzdAogICAgICAgICAgICAgICAgICAg
IGlmIG5vdCBoYXNobmFtZS5lbmRzd2l0aCgiLyIpOgogICAgICAgICAgICAgICAgICAgICAgICBp
ZiBoYXNobmFtZSBpbiBmaWxlc2V0OgogICAgICAgICAgICAgICAgICAgICAgICAgICAgYmIuZmF0
YWwoIlRoZSBmaWxlICVzIGlzIGluc3RhbGxlZCBieSBib3RoICVzIGFuZCAlcywgYWJvcnRpbmci
ICUgKGRlc3QsIGMsIGZpbGVzZXRbaGFzaG5hbWVdKSkKICAgICAgICAgICAgICAgICAgICAgICAg
ZWxzZToKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGVzZXRbaGFzaG5hbWVdID0gYwoK
ICAgICAgICAgICAgIyBIYXZpbmcgbXVsdGlwbGUgaWRlbnRpY2FsIG1hbmlmZXN0cyBpbiBlYWNo
IHN5c3Jvb3QgZWF0cyBkaXNrc3BhY2Ugc28KICAgICAgICAgICAgIyBjcmVhdGUgYSBzaGFyZWQg
cG9vbCBvZiB0aGVtIGFuZCBoYXJkbGluayBpZiB3ZSBjYW4uCiAgICAgICAgICAgICMgV2UgY3Jl
YXRlIHRoZSBtYW5pZmVzdCBpbiBhZHZhbmNlIHNvIHRoYXQgaWYgc29tZXRoaW5nIGZhaWxzIGR1
cmluZyBpbnN0YWxsYXRpb24sCiAgICAgICAgICAgICMgb3IgdGhlIGJ1aWxkIGlzIGludGVycnVw
dGVkLCBzdWJzZXF1ZW50IGV4ZXVjdGlvbiBjYW4gY2xlYW51cC4KICAgICAgICAgICAgc2hhcmVk
bSA9IHNoYXJlZG1hbmlmZXN0cyArICIvIiArIG9zLnBhdGguYmFzZW5hbWUodGFza21hbmlmZXN0
KQogICAgICAgICAgICBpZiBub3Qgb3MucGF0aC5leGlzdHMoc2hhcmVkbSk6CiAgICAgICAgICAg
ICAgICBzbWxvY2sgPSBiYi51dGlscy5sb2NrZmlsZShzaGFyZWRtICsgIi5sb2NrIikKICAgICAg
ICAgICAgICAgICMgQ2FuIHJhY2UgaGVyZS4gWW91J2QgdGhpbmsgaXQganVzdCBtZWFucyB3ZSBt
YXkgbm90IGVuZCB1cCB3aXRoIGFsbCBjb3BpZXMgaGFyZGxpbmtlZCB0byBlYWNoIG90aGVyCiAg
ICAgICAgICAgICAgICAjIGJ1dCBweXRob24gY2FuIGxvc2UgZmlsZSBoYW5kbGVzIHNvIHdlIG5l
ZWQgdG8gZG8gdGhpcyB1bmRlciBhIGxvY2suCiAgICAgICAgICAgICAgICBpZiBub3Qgb3MucGF0
aC5leGlzdHMoc2hhcmVkbSk6CiAgICAgICAgICAgICAgICAgICAgd2l0aCBvcGVuKHNoYXJlZG0s
ICd3JykgYXMgbToKICAgICAgICAgICAgICAgICAgICAgICBmb3IgbCBpbiBuZXdtYW5pZmVzdDoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVzdCA9IG5ld21hbmlmZXN0W2xdCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG0ud3JpdGUoZGVzdC5yZXBsYWNlKHdvcmtkaXIgKyAiLyIsICIi
KSArICJcbiIpCiAgICAgICAgICAgICAgICBiYi51dGlscy51bmxvY2tmaWxlKHNtbG9jaykKICAg
ICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgb3MubGluayhzaGFyZWRtLCB0YXNrbWFuaWZl
c3QpCiAgICAgICAgICAgIGV4Y2VwdCBPU0Vycm9yIGFzIGVycjoKICAgICAgICAgICAgICAgIGlm
IGVyci5lcnJubyA9PSBlcnJuby5FWERFVjoKICAgICAgICAgICAgICAgICAgICBiYi51dGlscy5j
b3B5ZmlsZShzaGFyZWRtLCB0YXNrbWFuaWZlc3QpCiAgICAgICAgICAgICAgICBlbHNlOgogICAg
ICAgICAgICAgICAgICAgIHJhaXNlCiAgICAgICAgICAgICMgRmluYWxseSBhY3R1YWxseSBpbnN0
YWxsIHRoZSBmaWxlcwogICAgICAgICAgICBmb3IgbCBpbiBuZXdtYW5pZmVzdDoKICAgICAgICAg
ICAgICAgICAgICBkZXN0ID0gbmV3bWFuaWZlc3RbbF0KICAgICAgICAgICAgICAgICAgICBpZiBs
LmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWRpcihs
LCB0YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZQogICAgICAgICAgICAgICAgICAgIHN0YWdpbmdfY29weWZpbGUobCwgdGFyZ2V0ZGlyLCBk
ZXN0LCBwb3N0aW5zdHMsIHNlZW5kaXJzKQoKICAgIGJiLm5vdGUoIkluc3RhbGxlZCBpbnRvIHN5
c3Jvb3Q6ICVzIiAlIHN0cihtc2dfYWRkaW5nKSkKICAgIGJiLm5vdGUoIlNraXBwaW5nIGFzIGFs
cmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6ICVzIiAlIHN0cihtc2dfZXhpc3RzKSkKCiAgICBmb3Ig
ZiBpbiBmaXhtZToKICAgICAgICBzdGFnaW5nX3Byb2Nlc3NmaXhtZShmaXhtZVtmXSwgZiwgcmVj
aXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgZCkKCiAgICBmb3IgcCBpbiBwb3N0aW5z
dHM6CiAgICAgICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQocCwgc2hlbGw9VHJ1ZSwgc3RkZXJy
PXN1YnByb2Nlc3MuU1RET1VUKQoKICAgIGZvciBkZXAgaW4gbWFuaWZlc3RzOgogICAgICAgIGMg
PSBzZXRzY2VuZWRlcHNbZGVwXVswXQogICAgICAgIG9zLnN5bWxpbmsobWFuaWZlc3RzW2RlcF0s
IGRlcGRpciArICIvIiArIGMgKyAiLmNvbXBsZXRlIikKCiAgICB3aXRoIG9wZW4odGFza2luZGV4
LCAidyIpIGFzIGY6CiAgICAgICAgZm9yIGwgaW4gc29ydGVkKGluc3RhbGxlZCk6CiAgICAgICAg
ICAgIGYud3JpdGUobCArICJcbiIpCgogICAgYmIudXRpbHMudW5sb2NrZmlsZShsb2NrKQoKZXh0
ZW5kX3JlY2lwZV9zeXNyb290KGQpCgpkZWYgc3RhZ2luZ19wcm9jZXNzZml4bWUoZml4bWUsIHRh
cmdldCwgcmVjaXBlc3lzcm9vdCwgcmVjaXBlc3lzcm9vdG5hdGl2ZSwgZCk6CiAgICBpbXBvcnQg
c3VicHJvY2VzcwoKICAgIGlmIG5vdCBmaXhtZToKICAgICAgICByZXR1cm4KICAgIGNtZCA9ICJz
ZWQgLWUgJ3M6XlteL10qLzolcy86ZycgJXMgfCB4YXJncyBzZWQgLWkgLWUgJ3M6RklYTUVTVEFH
SU5HRElSVEFSR0VUOiVzOmc7IHM6RklYTUVTVEFHSU5HRElSSE9TVDolczpnJyIgJSAodGFyZ2V0
LCAiICIuam9pbihmaXhtZSksIHJlY2lwZXN5c3Jvb3QsIHJlY2lwZXN5c3Jvb3RuYXRpdmUpCiAg
ICBmb3IgZml4bWV2YXIgaW4gWydQU0VVRE9fU1lTUk9PVCcsICdIT1NUVE9PTFNfRElSJywgJ1BL
R0RBVEFfRElSJywgJ1BTRVVET19MT0NBTFNUQVRFRElSJywgJ0xPR0ZJRk8nXToKICAgICAgICBm
aXhtZV9wYXRoID0gZC5nZXRWYXIoZml4bWV2YXIpCiAgICAgICAgY21kICs9ICIgLWUgJ3M6RklY
TUVfJXM6JXM6ZyciICUgKGZpeG1ldmFyLCBmaXhtZV9wYXRoKQogICAgYmIuZGVidWcoMiwgY21k
KQogICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoY21kLCBzaGVsbD1UcnVlLCBzdGRlcnI9c3Vi
cHJvY2Vzcy5TVERPVVQpCgpkZWYgc3RhZ2luZ19jb3B5ZGlyKGMsIHRhcmdldCwgZGVzdCwgc2Vl
bmRpcnMpOgogICAgaWYgZGVzdCBub3QgaW4gc2VlbmRpcnM6CiAgICAgICAgYmIudXRpbHMubWtk
aXJoaWVyKGRlc3QpCiAgICAgICAgc2VlbmRpcnMuYWRkKGRlc3QpCgpkZWYgc3RhZ2luZ19wb3B1
bGF0ZV9zeXNyb290X2Rpcih0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBuYXRpdmUsIGQp
OgogICAgaW1wb3J0IGdsb2IKICAgIGltcG9ydCBzdWJwcm9jZXNzCiAgICBpbXBvcnQgZXJybm8K
CiAgICBmaXhtZSA9IFtdCiAgICBwb3N0aW5zdHMgPSBbXQogICAgc2VlbmRpcnMgPSBzZXQoKQog
ICAgc3RhZ2luZ2RpciA9IGQuZ2V0VmFyKCJTVEFHSU5HX0RJUiIpCiAgICBpZiBuYXRpdmU6CiAg
ICAgICAgcGtnYXJjaHMgPSBbJyR7QlVJTERfQVJDSH0nLCAnJHtCVUlMRF9BUkNIfV8qJ10KICAg
ICAgICB0YXJnZXRkaXIgPSBuYXRpdmVzeXNyb290CiAgICBlbHNlOgogICAgICAgIHBrZ2FyY2hz
ID0gWycke01BQ0hJTkVfQVJDSH0nXQogICAgICAgIHBrZ2FyY2hzID0gcGtnYXJjaHMgKyBsaXN0
KHJldmVyc2VkKGQuZ2V0VmFyKCJQQUNLQUdFX0VYVFJBX0FSQ0hTIikuc3BsaXQoKSkpCiAgICAg
ICAgcGtnYXJjaHMuYXBwZW5kKCdhbGxhcmNoJykKICAgICAgICB0YXJnZXRkaXIgPSB0YXJnZXRz
eXNyb290CgogICAgYmIudXRpbHMubWtkaXJoaWVyKHRhcmdldGRpcikKICAgIGZvciBwa2dhcmNo
IGluIHBrZ2FyY2hzOgogICAgICAgIGZvciBtYW5pZmVzdCBpbiBnbG9iLmdsb2IoZC5leHBhbmQo
IiR7U1NUQVRFX01BTklGRVNUU30vbWFuaWZlc3QtJXMtKi5wb3B1bGF0ZV9zeXNyb290IiAlIHBr
Z2FyY2gpKToKICAgICAgICAgICAgaWYgbWFuaWZlc3QuZW5kc3dpdGgoIi1pbml0aWFsLnBvcHVs
YXRlX3N5c3Jvb3QiKToKICAgICAgICAgICAgICAgICMgc2tpcCBnbGliYy1pbml0aWFsIGFuZCBs
aWJnY2MtaW5pdGlhbCBkdWUgdG8gZmlsZSBvdmVybGFwCiAgICAgICAgICAgICAgICBjb250aW51
ZQogICAgICAgICAgICBpZiBub3QgbmF0aXZlIGFuZCAobWFuaWZlc3QuZW5kc3dpdGgoIi1uYXRp
dmUucG9wdWxhdGVfc3lzcm9vdCIpIG9yICJuYXRpdmVzZGstIiBpbiBtYW5pZmVzdCk6CiAgICAg
ICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICBpZiBuYXRpdmUgYW5kIG5vdCAobWFuaWZl
c3QuZW5kc3dpdGgoIi1uYXRpdmUucG9wdWxhdGVfc3lzcm9vdCIpIG9yIG1hbmlmZXN0LmVuZHN3
aXRoKCItY3Jvc3MucG9wdWxhdGVfc3lzcm9vdCIpIG9yICItY3Jvc3MtIiBpbiBtYW5pZmVzdCk6
CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICB0bWFuaWZlc3QgPSB0YXJnZXRk
aXIgKyAiLyIgKyBvcy5wYXRoLmJhc2VuYW1lKG1hbmlmZXN0KQogICAgICAgICAgICBpZiBvcy5w
YXRoLmV4aXN0cyh0bWFuaWZlc3QpOgogICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAg
ICAgdHJ5OgogICAgICAgICAgICAgICAgb3MubGluayhtYW5pZmVzdCwgdG1hbmlmZXN0KQogICAg
ICAgICAgICBleGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgICAgICBpZiBlcnIuZXJy
bm8gPT0gZXJybm8uRVhERVY6CiAgICAgICAgICAgICAgICAgICAgYmIudXRpbHMuY29weWZpbGUo
bWFuaWZlc3QsIHRtYW5pZmVzdCkKICAgICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAg
ICAgICAgcmFpc2UKICAgICAgICAgICAgd2l0aCBvcGVuKG1hbmlmZXN0LCAiciIpIGFzIGY6CiAg
ICAgICAgICAgICAgICBmb3IgbCBpbiBmOgogICAgICAgICAgICAgICAgICAgIGwgPSBsLnN0cmlw
KCkKICAgICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvZml4bWVwYXRoIik6CiAgICAg
ICAgICAgICAgICAgICAgICAgIGZpeG1lLmFwcGVuZChsKQogICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIGlmIGwuZW5kc3dpdGgoIi9maXhtZXBhdGgu
Y21kIik6CiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICAg
ICAgZGVzdCA9IGwucmVwbGFjZShzdGFnaW5nZGlyLCAiIikKICAgICAgICAgICAgICAgICAgICBk
ZXN0ID0gdGFyZ2V0ZGlyICsgIi8iICsgIi8iLmpvaW4oZGVzdC5zcGxpdCgiLyIpWzM6XSkKICAg
ICAgICAgICAgICAgICAgICBpZiBsLmVuZHN3aXRoKCIvIik6CiAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YWdpbmdfY29weWRpcihsLCB0YXJnZXRkaXIsIGRlc3QsIHNlZW5kaXJzKQogICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgICAgICAgIHRyeToKICAgICAg
ICAgICAgICAgICAgICAgICAgc3RhZ2luZ19jb3B5ZmlsZShsLCB0YXJnZXRkaXIsIGRlc3QsIHBv
c3RpbnN0cywgc2VlbmRpcnMpCiAgICAgICAgICAgICAgICAgICAgZXhjZXB0IEZpbGVFeGlzdHNF
cnJvcjoKICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUKCiAgICBzdGFnaW5nX3Byb2Nl
c3NmaXhtZShmaXhtZSwgdGFyZ2V0ZGlyLCB0YXJnZXRzeXNyb290LCBuYXRpdmVzeXNyb290LCBk
KQogICAgZm9yIHAgaW4gcG9zdGluc3RzOgogICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0
KHAsIHNoZWxsPVRydWUsIHN0ZGVycj1zdWJwcm9jZXNzLlNURE9VVCkKCiMKIyBNYW5pZmVzdHMg
aGVyZSBhcmUgY29tcGxpY2F0ZWQuIFRoZSBtYWluIHN5c3Jvb3QgYXJlYSBoYXMgdGhlIHVucGFj
a2VkIHNzdGF0ZQojIHdoaWNoIHVzIHVucmVsb2NhdGVkIGFuZCB0cmFja2VkIGJ5IHRoZSBtYWlu
IHNzdGF0ZSBtYW5pZmVzdHMuIEVhY2ggcmVjaXBlCiMgc3BlY2lmaWMgc3lzcm9vdCBoYXMgbWFu
aWZlc3RzIGZvciBlYWNoIGRlcGVuZGVuY3kgdGhhdCBpcyBpbnN0YWxsZWQgdGhlcmUuCiMgVGhl
IHRhc2sgaGFzaCBpcyB1c2VkIHRvIHRlbGwgd2hldGhlciB0aGUgZGF0YSBuZWVkcyB0byBiZSBy
ZWluc3RhbGxlZC4gV2UKIyB1c2UgYSBzeW1saW5rIHRvIHBvaW50IHRvIHRoZSBjdXJyZW50bHkg
aW5zdGFsbGVkIGhhc2guIFRoZXJlIGlzIGFsc28gYQojICJjb21wbGV0ZSIgc3RhbXAgZmlsZSB3
aGljaCBpcyB1c2VkIHRvIG1hcmsgaWYgaW5zdGFsbGF0aW9uIGNvbXBsZXRlZC4gSWYKIyBzb21l
dGhpbmcgZmFpbHMgKGUuZy4gYSBwb3N0aW5zdCksIHRoaXMgd29uJ3QgZ2V0IHdyaXR0ZW4gYW5k
IHdlIHdvdWxkCiMgcmVtb3ZlIGFuZCByZWluc3RhbGwgdGhlIGRlcGVuZGVuY3kuIFRoaXMgYWxz
byBtZWFucyBwYXJ0aWFsbHkgaW5zdGFsbGVkCiMgZGVwZW5kZW5jaWVzIHNob3VsZCBnZXQgY2xl
YW5lZCB1cCBjb3JyZWN0bHkuCiMKCmRlZiBzdGFnaW5nX2NvcHlmaWxlKGMsIHRhcmdldCwgZGVz
dCwgcG9zdGluc3RzLCBzZWVuZGlycyk6CiAgICBpbXBvcnQgZXJybm8KCiAgICBkZXN0ZGlyID0g
b3MucGF0aC5kaXJuYW1lKGRlc3QpCiAgICBpZiBkZXN0ZGlyIG5vdCBpbiBzZWVuZGlyczoKICAg
ICAgICBiYi51dGlscy5ta2RpcmhpZXIoZGVzdGRpcikKICAgICAgICBzZWVuZGlycy5hZGQoZGVz
dGRpcikKICAgIGlmICIvdXNyL2Jpbi9wb3N0aW5zdC0iIGluIGM6CiAgICAgICAgcG9zdGluc3Rz
LmFwcGVuZChkZXN0KQogICAgaWYgb3MucGF0aC5pc2xpbmsoYyk6CiAgICAgICAgbGlua3RvID0g
b3MucmVhZGxpbmsoYykKICAgICAgICBpZiBvcy5wYXRoLmxleGlzdHMoZGVzdCk6CiAgICAgICAg
ICAgIGlmIG5vdCBvcy5wYXRoLmlzbGluayhkZXN0KToKICAgICAgICAgICAgICAgIHJhaXNlIE9T
RXJyb3IoZXJybm8uRUVYSVNULCAiTGluayAlcyBhbHJlYWR5IGV4aXN0cyBhcyBhIGZpbGUiICUg
ZGVzdCwgZGVzdCkKICAgICAgICAgICAgaWYgb3MucmVhZGxpbmsoZGVzdCkgPT0gbGlua3RvOgog
ICAgICAgICAgICAgICAgcmV0dXJuIGRlc3QKICAgICAgICAgICAgcmFpc2UgT1NFcnJvcihlcnJu
by5FRVhJU1QsICJMaW5rICVzIGFscmVhZHkgZXhpc3RzIHRvIGEgZGlmZmVyZW50IGxvY2F0aW9u
PyAoJXMgdnMgJXMpIiAlIChkZXN0LCBvcy5yZWFkbGluayhkZXN0KSwgbGlua3RvKSwgZGVzdCkK
ICAgICAgICBvcy5zeW1saW5rKGxpbmt0bywgZGVzdCkKICAgICAgICAjYmIud2FybihjKQogICAg
ZWxzZToKICAgICAgICB0cnk6CiAgICAgICAgICAgIG9zLmxpbmsoYywgZGVzdCkKICAgICAgICBl
eGNlcHQgT1NFcnJvciBhcyBlcnI6CiAgICAgICAgICAgIGlmIGVyci5lcnJubyA9PSBlcnJuby5F
WERFVjoKICAgICAgICAgICAgICAgIGJiLnV0aWxzLmNvcHlmaWxlKGMsIGRlc3QpCiAgICAgICAg
ICAgIGVsc2U6CiAgICAgICAgICAgICAgICByYWlzZQogICAgcmV0dXJuIGRlc3QKCmRlZiBzc3Rh
dGVfY2xlYW5fbWFuaWZlc3QobWFuaWZlc3QsIGQsIHByZWZpeD1Ob25lKToKICAgIGltcG9ydCBv
ZS5wYXRoCgogICAgbWZpbGUgPSBvcGVuKG1hbmlmZXN0KQogICAgZW50cmllcyA9IG1maWxlLnJl
YWRsaW5lcygpCiAgICBtZmlsZS5jbG9zZSgpCgogICAgZm9yIGVudHJ5IGluIGVudHJpZXM6CiAg
ICAgICAgZW50cnkgPSBlbnRyeS5zdHJpcCgpCiAgICAgICAgaWYgcHJlZml4IGFuZCBub3QgZW50
cnkuc3RhcnRzd2l0aCgiLyIpOgogICAgICAgICAgICBlbnRyeSA9IHByZWZpeCArICIvIiArIGVu
dHJ5CiAgICAgICAgYmIuZGVidWcoMiwgIlJlbW92aW5nIG1hbmlmZXN0OiAlcyIgJSBlbnRyeSkK
ICAgICAgICAjIFdlIGNhbiByYWNlIGFnYWluc3QgYW5vdGhlciBwYWNrYWdlIHBvcHVsYXRpbmcg
ZGlyZWN0b3JpZXMgYXMgd2UncmUgcmVtb3ZpbmcgdGhlbQogICAgICAgICMgc28gd2UgaWdub3Jl
IGVycm9ycyBoZXJlLgogICAgICAgIHRyeToKICAgICAgICAgICAgaWYgZW50cnkuZW5kc3dpdGgo
Ii8iKToKICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguaXNsaW5rKGVudHJ5WzotMV0pOgogICAg
ICAgICAgICAgICAgICAgIG9zLnJlbW92ZShlbnRyeVs6LTFdKQogICAgICAgICAgICAgICAgZWxp
ZiBvcy5wYXRoLmV4aXN0cyhlbnRyeSkgYW5kIGxlbihvcy5saXN0ZGlyKGVudHJ5KSkgPT0gMDoK
ICAgICAgICAgICAgICAgICAgICBvcy5ybWRpcihlbnRyeVs6LTFdKQogICAgICAgICAgICBlbHNl
OgogICAgICAgICAgICAgICAgb3MucmVtb3ZlKGVudHJ5KQogICAgICAgIGV4Y2VwdCBPU0Vycm9y
OgogICAgICAgICAgICBwYXNzCgogICAgcG9zdHJtID0gbWFuaWZlc3QgKyAiLnBvc3RybSIKICAg
IGlmIG9zLnBhdGguZXhpc3RzKG1hbmlmZXN0ICsgIi5wb3N0cm0iKToKICAgICAgICBpbXBvcnQg
c3VicHJvY2VzcwogICAgICAgIG9zLmNobW9kKHBvc3RybSwgMG83NTUpCiAgICAgICAgc3VicHJv
Y2Vzcy5jaGVja19jYWxsKHBvc3RybSwgc2hlbGw9VHJ1ZSkKICAgICAgICBvZS5wYXRoLnJlbW92
ZShwb3N0cm0pCgogICAgb2UucGF0aC5yZW1vdmUobWFuaWZlc3QpCgpkZWYgc2V0c2NlbmVfZGVw
dmFsaWQodGFzaywgdGFza2RlcGVuZGVlcywgbm90bmVlZGVkLCBkLCBsb2c9Tm9uZSk6CiAgICAj
IHRhc2tkZXBlbmRlZXMgaXMgYSBkaWN0IG9mIHRhc2tzIHdoaWNoIGRlcGVuZCBvbiB0YXNrLCBl
YWNoIGJlaW5nIGEgMyBpdGVtIGxpc3Qgb2YgW1BOLCBUQVNLTkFNRSwgRklMRU5BTUVdCiAgICAj
IHRhc2sgaXMgaW5jbHVkZWQgaW4gdGFza2RlcGVuZGVlcyB0b28KICAgICMgUmV0dXJuIC0gRmFs
c2UgLSBXZSBuZWVkIHRoaXMgZGVwZW5kZW5jeQogICAgIyAgICAgICAgLSBUcnVlIC0gV2UgY2Fu
IHNraXAgdGhpcyBkZXBlbmRlbmN5CiAgICBpbXBvcnQgcmUKCiAgICBkZWYgbG9naXQobXNnLCBs
b2cpOgogICAgICAgIGlmIGxvZyBpcyBub3QgTm9uZToKICAgICAgICAgICAgbG9nLmFwcGVuZCht
c2cpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgYmIuZGVidWcoMiwgbXNnKQoKICAgIGxvZ2l0
KCJDb25zaWRlcmluZyBzZXRzY2VuZSB0YXNrOiAlcyIgJSAoc3RyKHRhc2tkZXBlbmRlZXNbdGFz
a10pKSwgbG9nKQoKICAgIGRlZiBpc05hdGl2ZUNyb3NzKHgpOgogICAgICAgIHJldHVybiB4LmVu
ZHN3aXRoKCItbmF0aXZlIikgb3IgIi1jcm9zcy0iIGluIHggb3IgIi1jcm9zc3NkayIgaW4geCBv
ciB4LmVuZHN3aXRoKCItY3Jvc3MiKQoKICAgICMgV2Ugb25seSBuZWVkIHRvIHRyaWdnZXIgcG9w
dWxhdGVfbGljIHRocm91Z2ggZGlyZWN0IGRlcGVuZGVuY2llcwogICAgaWYgdGFza2RlcGVuZGVl
c1t0YXNrXVsxXSA9PSAiZG9fcG9wdWxhdGVfbGljIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAg
ICMgc3Rhc2hfbG9jYWxlIGFuZCBnY2Nfc3Rhc2hfYnVpbGRkaXIgYXJlIG5ldmVyIG5lZWRlZCBh
cyBhIGRlcGVuZGVuY3kgZm9yIGJ1aWx0IG9iamVjdHMKICAgIGlmIHRhc2tkZXBlbmRlZXNbdGFz
a11bMV0gPT0gImRvX3N0YXNoX2xvY2FsZSIgb3IgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAi
ZG9fZ2NjX3N0YXNoX2J1aWxkZGlyIjoKICAgICAgICByZXR1cm4gVHJ1ZQoKICAgICMgV2Ugb25s
eSBuZWVkIHRvIHRyaWdnZXIgcGFja2FnZWRhdGEgdGhyb3VnaCBkaXJlY3QgZGVwZW5kZW5jaWVz
CiAgICAjIGJ1dCBuZWVkIHRvIHByZXNlcnZlIHBhY2thZ2VkYXRhIG9uIHBhY2thZ2VkYXRhIGxp
bmtzCiAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICJkb19wYWNrYWdlZGF0YSI6CiAg
ICAgICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgogICAgICAgICAgICBpZiB0YXNrZGVwZW5k
ZWVzW2RlcF1bMV0gPT0gImRvX3BhY2thZ2VkYXRhIjoKICAgICAgICAgICAgICAgIHJldHVybiBG
YWxzZQogICAgICAgIHJldHVybiBUcnVlCgogICAgZm9yIGRlcCBpbiB0YXNrZGVwZW5kZWVzOgog
ICAgICAgIGxvZ2l0KCIgIGNvbnNpZGVyaW5nIGRlcGVuZGVuY3k6ICVzIiAlIChzdHIodGFza2Rl
cGVuZGVlc1tkZXBdKSksIGxvZykKICAgICAgICBpZiB0YXNrID09IGRlcDoKICAgICAgICAgICAg
Y29udGludWUKICAgICAgICBpZiBkZXAgaW4gbm90bmVlZGVkOgogICAgICAgICAgICBjb250aW51
ZQogICAgICAgICMgZG9fcGFja2FnZV93cml0ZV8qIGFuZCBkb19wYWNrYWdlIGRvZXNuJ3QgbmVl
ZCBkb19wYWNrYWdlCiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsxXSA9PSAiZG9fcGFj
a2FnZSIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBbJ2RvX3BhY2thZ2UnLCAnZG9fcGFj
a2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0
ZV9ycG0nLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAgICAgICBj
b250aW51ZQogICAgICAgICMgZG9fcGFja2FnZV93cml0ZV8qIG5lZWQgZG9fcG9wdWxhdGVfc3lz
cm9vdCBhcyB0aGV5J3JlIG1haW5seSBwb3N0aW5zdGFsbCBkZXBlbmRlbmNpZXMKICAgICAgICBp
ZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICJkb19wb3B1bGF0ZV9zeXNyb290IiBhbmQgdGFz
a2RlcGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93cml0ZV9kZWInLCAnZG9fcGFja2Fn
ZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0nXToKICAgICAgICAgICAgcmV0dXJu
IEZhbHNlCiAgICAgICAgIyBkb19wYWNrYWdlL3BhY2thZ2VkYXRhL3BhY2thZ2VfcWEgZG9uJ3Qg
bmVlZCBkb19wb3B1bGF0ZV9zeXNyb290CiAgICAgICAgaWYgdGFza2RlcGVuZGVlc1t0YXNrXVsx
XSA9PSAiZG9fcG9wdWxhdGVfc3lzcm9vdCIgYW5kIHRhc2tkZXBlbmRlZXNbZGVwXVsxXSBpbiBb
J2RvX3BhY2thZ2UnLCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZV9xYSddOgogICAgICAg
ICAgICBjb250aW51ZQogICAgICAgICMgTmF0aXZlL0Nyb3NzIHBhY2thZ2VzIGRvbid0IGV4aXN0
IGFuZCBhcmUgbm9leGVjIGFueXdheQogICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVu
ZGVlc1tkZXBdWzBdKSBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdIGluIFsnZG9fcGFja2FnZV93
cml0ZV9kZWInLCAnZG9fcGFja2FnZV93cml0ZV9pcGsnLCAnZG9fcGFja2FnZV93cml0ZV9ycG0n
LCAnZG9fcGFja2FnZWRhdGEnLCAnZG9fcGFja2FnZScsICdkb19wYWNrYWdlX3FhJ106CiAgICAg
ICAgICAgIGNvbnRpbnVlCgogICAgICAgICMgVGhpcyBpcyBkdWUgdG8gdGhlIFtkZXBlbmRzXSBp
biB1c2VyYWRkLmJiY2xhc3MgY29tcGxpY2F0aW5nIG1hdHRlcnMKICAgICAgICAjIFRoZSBsb2dp
YyAqaXMqIHJldmVyc2VkIGhlcmUgZHVlIHRvIHRoZSB3YXkgaGFyZCBzZXRzY2VuZSBkZXBlbmRl
bmNpZXMgYXJlIGluamVjdGVkCiAgICAgICAgaWYgKHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0g
J2RvX3BhY2thZ2UnIG9yIHRhc2tkZXBlbmRlZXNbdGFza11bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5
c3Jvb3QnKSBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzBdLmVuZHN3aXRoKCgnc2hhZG93LW5hdGl2
ZScsICdzaGFkb3ctc3lzcm9vdCcsICdiYXNlLXBhc3N3ZCcsICdwc2V1ZG8tbmF0aXZlJykpIGFu
ZCB0YXNrZGVwZW5kZWVzW2RlcF1bMV0gPT0gJ2RvX3BvcHVsYXRlX3N5c3Jvb3QnOgogICAgICAg
ICAgICBjb250aW51ZQoKICAgICAgICAjIENvbnNpZGVyIHN5c3Jvb3QgZGVwZW5kaW5nIG9uIHN5
c3Jvb3QgdGFza3MKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19wb3B1
bGF0ZV9zeXNyb290JyBhbmQgdGFza2RlcGVuZGVlc1tkZXBdWzFdID09ICdkb19wb3B1bGF0ZV9z
eXNyb290JzoKICAgICAgICAgICAgIyBBbGxvdyBleGNsdWRpbmcgY2VydGFpbiByZWN1cnNpdmUg
ZGVwZW5kZW5jaWVzLiBJZiBhIHJlY2lwZSBuZWVkcyBpdCBzaG91bGQgYWRkIGEKICAgICAgICAg
ICAgIyBzcGVjaWZpYyBkZXBlbmRlbmN5IGl0c2VsZiwgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBv
bmUgb2YgaXRzIGRlcGVuZGVlcyB0byBwdWxsCiAgICAgICAgICAgICMgdGhlbSBpbi4KICAgICAg
ICAgICAgIyBTZWUgYWxzbyBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwv
b3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1KYW51YXJ5LzE0NjMyNC5odG1sCiAgICAgICAgICAgIG5v
dF9uZWVkZWQgPSBGYWxzZQogICAgICAgICAgICBleGNsdWRlZGVwcyA9IGQuZ2V0VmFyKCdfU1NU
QVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKQogICAgICAgICAgICBpZiBleGNsdWRlZGVwcyBpcyBO
b25lOgogICAgICAgICAgICAgICAgIyBDYWNoZSB0aGUgcmVndWxhciBleHByZXNzaW9ucyBmb3Ig
c3BlZWQKICAgICAgICAgICAgICAgIGV4Y2x1ZGVkZXBzID0gW10KICAgICAgICAgICAgICAgIGZv
ciBleGNsIGluIChkLmdldFZhcignU1NUQVRFX0VYQ0xVREVERVBTX1NZU1JPT1QnKSBvciAiIiku
c3BsaXQoKToKICAgICAgICAgICAgICAgICAgICBleGNsdWRlZGVwcy5hcHBlbmQoKHJlLmNvbXBp
bGUoZXhjbC5zcGxpdCgnLT4nLCAxKVswXSksIHJlLmNvbXBpbGUoZXhjbC5zcGxpdCgnLT4nLCAx
KVsxXSkpKQogICAgICAgICAgICAgICAgZC5zZXRWYXIoJ19TU1RBVEVfRVhDTFVERURFUFNfU1lT
Uk9PVCcsIGV4Y2x1ZGVkZXBzKQogICAgICAgICAgICBmb3IgZXhjbCBpbiBleGNsdWRlZGVwczoK
ICAgICAgICAgICAgICAgIGlmIGV4Y2xbMF0ubWF0Y2godGFza2RlcGVuZGVlc1tkZXBdWzBdKToK
ICAgICAgICAgICAgICAgICAgICBpZiBleGNsWzFdLm1hdGNoKHRhc2tkZXBlbmRlZXNbdGFza11b
MF0pOgogICAgICAgICAgICAgICAgICAgICAgICBub3RfbmVlZGVkID0gVHJ1ZQogICAgICAgICAg
ICAgICAgICAgICAgICBicmVhawogICAgICAgICAgICBpZiBub3RfbmVlZGVkOgogICAgICAgICAg
ICAgICAgY29udGludWUKICAgICAgICAgICAgIyBGb3IgbWV0YS1leHRzZGstdG9vbGNoYWluIHdl
IHdhbnQgYWxsIHN5c3Jvb3QgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIGlmIHRhc2tkZXBlbmRl
ZXNbZGVwXVswXSA9PSAnbWV0YS1leHRzZGstdG9vbGNoYWluJzoKICAgICAgICAgICAgICAgIHJl
dHVybiBGYWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9Dcm9zcyBwb3B1bGF0ZV9zeXNyb290IG5l
ZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2Rl
cGVuZGVlc1t0YXNrXVswXSkgYW5kIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBd
KToKICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1
bGF0ZV9zeXNyb290IGRlcGVuZGVkIG9uIGJ5IGNyb3NzIHRvb2xzIG5lZWQgdG8gYmUgaW5zdGFs
bGVkCiAgICAgICAgICAgIGlmIGlzTmF0aXZlQ3Jvc3ModGFza2RlcGVuZGVlc1tkZXBdWzBdKToK
ICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQogICAgICAgICAgICAjIE5hdGl2ZS9jcm9zcyB0
b29scyBkZXBlbmRlZCB1cG9uIGJ5IHRhcmdldCBzeXNyb290IGFyZSBub3QgbmVlZGVkCiAgICAg
ICAgICAgICMgQWRkIGFuIGV4Y2VwdGlvbiBmb3Igc2hhZG93LW5hdGl2ZSBhcyByZXF1aXJlZCBi
eSB1c2VyYWRkLmJiY2xhc3MKICAgICAgICAgICAgaWYgaXNOYXRpdmVDcm9zcyh0YXNrZGVwZW5k
ZWVzW3Rhc2tdWzBdKSBhbmQgdGFza2RlcGVuZGVlc1t0YXNrXVswXSAhPSAnc2hhZG93LW5hdGl2
ZSc6CiAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAjIFRhcmdldCBwb3B1bGF0
ZV9zeXNyb290IG5lZWQgdGhlaXIgZGVwZW5kZW5jaWVzCiAgICAgICAgICAgIHJldHVybiBGYWxz
ZQoKICAgICAgICBpZiB0YXNrZGVwZW5kZWVzW3Rhc2tdWzFdID09ICdkb19zaGFyZWRfd29ya2Rp
cic6CiAgICAgICAgICAgIGNvbnRpbnVlCgogICAgICAgIGlmIHRhc2tkZXBlbmRlZXNbZGVwXVsx
XSA9PSAiZG9fcG9wdWxhdGVfbGljIjoKICAgICAgICAgICAgY29udGludWUKCgogICAgICAgICMg
U2FmZSBmYWxsdGhyb3VnaCBkZWZhdWx0CiAgICAgICAgbG9naXQoIiBEZWZhdWx0IHNldHNjZW5l
IGRlcGVuZGVuY3kgZmFsbCB0aHJvdWdoIGR1ZSB0byBkZXBlbmRlbmN5OiAlcyIgJSAoc3RyKHRh
c2tkZXBlbmRlZXNbZGVwXSkpLCBsb2cpCiAgICAgICAgcmV0dXJuIEZhbHNlCiAgICByZXR1cm4g
VHJ1ZQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.populate_lic_qa_checksum.14593"
Content-Disposition: attachment; 
	filename="run.populate_lic_qa_checksum.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3bk44>
X-Attachment-Id: f_jz9oy3bk44

ZGVmIHBvcHVsYXRlX2xpY19xYV9jaGVja3N1bShkKToKICAgICIiIgogICAgQ2hlY2sgZm9yIGNo
YW5nZXMgaW4gdGhlIGxpY2Vuc2UgZmlsZXMuCiAgICAiIiIKICAgIHNhbmUgPSBUcnVlCgogICAg
bGljX2ZpbGVzID0gZC5nZXRWYXIoJ0xJQ19GSUxFU19DSEtTVU0nKSBvciAnJwogICAgbGljID0g
ZC5nZXRWYXIoJ0xJQ0VOU0UnKQogICAgcG4gPSBkLmdldFZhcignUE4nKQoKICAgIGlmIGxpYyA9
PSAiQ0xPU0VEIjoKICAgICAgICByZXR1cm4KCiAgICBpZiBub3QgbGljX2ZpbGVzIGFuZCBkLmdl
dFZhcignU1JDX1VSSScpOgogICAgICAgIHNhbmUgJj0gcGFja2FnZV9xYV9oYW5kbGVfZXJyb3Io
ImxpY2Vuc2UtY2hlY2tzdW0iLCBwbiArICI6IFJlY2lwZSBmaWxlIGZldGNoZXMgZmlsZXMgYW5k
IGRvZXMgbm90IGhhdmUgbGljZW5zZSBmaWxlIGluZm9ybWF0aW9uIChMSUNfRklMRVNfQ0hLU1VN
KSIsIGQpCgogICAgc3JjZGlyID0gZC5nZXRWYXIoJ1MnKQogICAgY29yZWJhc2VfbGljZW5zZWZp
bGUgPSBkLmdldFZhcignQ09SRUJBU0UnKSArICIvTElDRU5TRSIKICAgIGZvciB1cmwgaW4gbGlj
X2ZpbGVzLnNwbGl0KCk6CiAgICAgICAgdHJ5OgogICAgICAgICAgICAodHlwZSwgaG9zdCwgcGF0
aCwgdXNlciwgcHN3ZCwgcGFybSkgPSBiYi5mZXRjaC5kZWNvZGV1cmwodXJsKQogICAgICAgIGV4
Y2VwdCBiYi5mZXRjaC5NYWxmb3JtZWRVcmw6CiAgICAgICAgICAgIHNhbmUgJj0gcGFja2FnZV9x
YV9oYW5kbGVfZXJyb3IoImxpY2Vuc2UtY2hlY2tzdW0iLCBwbiArICI6IExJQ19GSUxFU19DSEtT
VU0gY29udGFpbnMgYW4gaW52YWxpZCBVUkw6ICIgKyB1cmwsIGQpCiAgICAgICAgICAgIGNvbnRp
bnVlCiAgICAgICAgc3JjbGljZmlsZSA9IG9zLnBhdGguam9pbihzcmNkaXIsIHBhdGgpCiAgICAg
ICAgaWYgbm90IG9zLnBhdGguaXNmaWxlKHNyY2xpY2ZpbGUpOgogICAgICAgICAgICBzYW5lICY9
IHBhY2thZ2VfcWFfaGFuZGxlX2Vycm9yKCJsaWNlbnNlLWNoZWNrc3VtIiwgcG4gKyAiOiBMSUNf
RklMRVNfQ0hLU1VNIHBvaW50cyB0byBhbiBpbnZhbGlkIGZpbGU6ICIgKyBzcmNsaWNmaWxlLCBk
KQogICAgICAgICAgICBjb250aW51ZQoKICAgICAgICBpZiAoc3JjbGljZmlsZSA9PSBjb3JlYmFz
ZV9saWNlbnNlZmlsZSk6CiAgICAgICAgICAgIGJiLndhcm4oIiR7Q09SRUJBU0V9L0xJQ0VOU0Ug
aXMgbm90IGEgdmFsaWQgbGljZW5zZSBmaWxlLCBwbGVhc2UgdXNlICcke0NPTU1PTl9MSUNFTlNF
X0RJUn0vTUlUJyBmb3IgYSBNSVQgTGljZW5zZSBmaWxlIGluIExJQ19GSUxFU19DSEtTVU0uIFRo
aXMgd2lsbCBiZWNvbWUgYW4gZXJyb3IgaW4gdGhlIGZ1dHVyZSIpCgogICAgICAgIHJlY2lwZW1k
NSA9IHBhcm0uZ2V0KCdtZDUnLCAnJykKICAgICAgICBiZWdpbmxpbmUsIGVuZGxpbmUgPSAwLCAw
CiAgICAgICAgaWYgJ2JlZ2lubGluZScgaW4gcGFybToKICAgICAgICAgICAgYmVnaW5saW5lID0g
aW50KHBhcm1bJ2JlZ2lubGluZSddKQogICAgICAgIGlmICdlbmRsaW5lJyBpbiBwYXJtOgogICAg
ICAgICAgICBlbmRsaW5lID0gaW50KHBhcm1bJ2VuZGxpbmUnXSkKCiAgICAgICAgaWYgKG5vdCBi
ZWdpbmxpbmUpIGFuZCAobm90IGVuZGxpbmUpOgogICAgICAgICAgICBtZDVjaGtzdW0gPSBiYi51
dGlscy5tZDVfZmlsZShzcmNsaWNmaWxlKQogICAgICAgICAgICB3aXRoIG9wZW4oc3JjbGljZmls
ZSwgJ3InLCBlcnJvcnM9J3JlcGxhY2UnKSBhcyBmOgogICAgICAgICAgICAgICAgbGljZW5zZSA9
IGYucmVhZCgpLnNwbGl0bGluZXMoKQogICAgICAgIGVsc2U6CiAgICAgICAgICAgIHdpdGggb3Bl
bihzcmNsaWNmaWxlLCAncmInKSBhcyBmOgogICAgICAgICAgICAgICAgaW1wb3J0IGhhc2hsaWIK
ICAgICAgICAgICAgICAgIGxpbmVubyA9IDAKICAgICAgICAgICAgICAgIGxpY2Vuc2UgPSBbXQog
ICAgICAgICAgICAgICAgbSA9IGhhc2hsaWIubWQ1KCkKICAgICAgICAgICAgICAgIGZvciBsaW5l
IGluIGY6CiAgICAgICAgICAgICAgICAgICAgbGluZW5vICs9IDEKICAgICAgICAgICAgICAgICAg
ICBpZiAobGluZW5vID49IGJlZ2lubGluZSk6CiAgICAgICAgICAgICAgICAgICAgICAgIGlmICgo
bGluZW5vIDw9IGVuZGxpbmUpIG9yIG5vdCBlbmRsaW5lKToKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG0udXBkYXRlKGxpbmUpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWNlbnNl
LmFwcGVuZChsaW5lLmRlY29kZSgndXRmLTgnLCBlcnJvcnM9J3JlcGxhY2UnKS5yc3RyaXAoKSkK
ICAgICAgICAgICAgICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrCiAgICAgICAgICAgICAgICBtZDVjaGtzdW0gPSBtLmhleGRpZ2VzdCgpCiAgICAgICAg
aWYgcmVjaXBlbWQ1ID09IG1kNWNoa3N1bToKICAgICAgICAgICAgYmIubm90ZSAocG4gKyAiOiBt
ZDUgY2hlY2tzdW0gbWF0Y2hlZCBmb3IgIiwgdXJsKQogICAgICAgIGVsc2U6CiAgICAgICAgICAg
IGlmIHJlY2lwZW1kNToKICAgICAgICAgICAgICAgIG1zZyA9IHBuICsgIjogVGhlIExJQ19GSUxF
U19DSEtTVU0gZG9lcyBub3QgbWF0Y2ggZm9yICIgKyB1cmwKICAgICAgICAgICAgICAgIG1zZyA9
IG1zZyArICJcbiIgKyBwbiArICI6IFRoZSBuZXcgbWQ1IGNoZWNrc3VtIGlzICIgKyBtZDVjaGtz
dW0KICAgICAgICAgICAgICAgIG1heF9saW5lcyA9IGludChkLmdldFZhcignUUFfTUFYX0xJQ0VO
U0VfTElORVMnKSBvciAyMCkKICAgICAgICAgICAgICAgIGlmIG5vdCBsaWNlbnNlIG9yIGxpY2Vu
c2VbLTFdICE9ICcnOgogICAgICAgICAgICAgICAgICAgICMgRW5zdXJlIHRoYXQgb3VyIGxpY2Vu
c2UgdGV4dCBlbmRzIHdpdGggYSBsaW5lIGJyZWFrCiAgICAgICAgICAgICAgICAgICAgIyAod2ls
bCBiZSBhZGRlZCB3aXRoIGpvaW4oKSBiZWxvdykuCiAgICAgICAgICAgICAgICAgICAgbGljZW5z
ZS5hcHBlbmQoJycpCiAgICAgICAgICAgICAgICByZW1vdmUgPSBsZW4obGljZW5zZSkgLSBtYXhf
bGluZXMKICAgICAgICAgICAgICAgIGlmIHJlbW92ZSA+IDA6CiAgICAgICAgICAgICAgICAgICAg
c3RhcnQgPSBtYXhfbGluZXMgLy8gMgogICAgICAgICAgICAgICAgICAgIGVuZCA9IHN0YXJ0ICsg
cmVtb3ZlIC0gMQogICAgICAgICAgICAgICAgICAgIGRlbCBsaWNlbnNlW3N0YXJ0OmVuZF0KICAg
ICAgICAgICAgICAgICAgICBsaWNlbnNlLmluc2VydChzdGFydCwgJy4uLicpCiAgICAgICAgICAg
ICAgICBtc2cgPSBtc2cgKyAiXG4iICsgcG4gKyAiOiBIZXJlIGlzIHRoZSBzZWxlY3RlZCBsaWNl
bnNlIHRleHQ6IiArIFwKICAgICAgICAgICAgICAgICAgICAgICAgIlxuIiArIFwKICAgICAgICAg
ICAgICAgICAgICAgICAgIns6dl43MH0iLmZvcm1hdCgiIGJlZ2lubGluZT0lZCAiICUgYmVnaW5s
aW5lIGlmIGJlZ2lubGluZSBlbHNlICIiKSArIFwKICAgICAgICAgICAgICAgICAgICAgICAgIlxu
IiArICJcbiIuam9pbihsaWNlbnNlKSArIFwKICAgICAgICAgICAgICAgICAgICAgICAgIns6Xl43
MH0iLmZvcm1hdCgiIGVuZGxpbmU9JWQgIiAlIGVuZGxpbmUgaWYgZW5kbGluZSBlbHNlICIiKQog
ICAgICAgICAgICAgICAgaWYgYmVnaW5saW5lOgogICAgICAgICAgICAgICAgICAgIGlmIGVuZGxp
bmU6CiAgICAgICAgICAgICAgICAgICAgICAgIHNyY2ZpbGVkZXNjID0gIiVzIChsaW5lcyAlZCB0
aHJvdWdoIHRvICVkKSIgJSAoc3JjbGljZmlsZSwgYmVnaW5saW5lLCBlbmRsaW5lKQogICAgICAg
ICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAgICAgICAgIHNyY2ZpbGVkZXNjID0g
IiVzIChiZWdpbm5pbmcgb24gbGluZSAlZCkiICUgKHNyY2xpY2ZpbGUsIGJlZ2lubGluZSkKICAg
ICAgICAgICAgICAgIGVsaWYgZW5kbGluZToKICAgICAgICAgICAgICAgICAgICBzcmNmaWxlZGVz
YyA9ICIlcyAoZW5kaW5nIG9uIGxpbmUgJWQpIiAlIChzcmNsaWNmaWxlLCBlbmRsaW5lKQogICAg
ICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAgICAgICBzcmNmaWxlZGVzYyA9IHNyY2xp
Y2ZpbGUKICAgICAgICAgICAgICAgIG1zZyA9IG1zZyArICJcbiIgKyBwbiArICI6IENoZWNrIGlm
IHRoZSBsaWNlbnNlIGluZm9ybWF0aW9uIGhhcyBjaGFuZ2VkIGluICVzIHRvIHZlcmlmeSB0aGF0
IHRoZSBMSUNFTlNFIHZhbHVlIFwiJXNcIiByZW1haW5zIHZhbGlkIiAlIChzcmNmaWxlZGVzYywg
bGljKQoKICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAgIG1zZyA9IHBuICsgIjogTElD
X0ZJTEVTX0NIS1NVTSBpcyBub3Qgc3BlY2lmaWVkIGZvciAiICsgIHVybAogICAgICAgICAgICAg
ICAgbXNnID0gbXNnICsgIlxuIiArIHBuICsgIjogVGhlIG1kNSBjaGVja3N1bSBpcyAiICsgbWQ1
Y2hrc3VtCiAgICAgICAgICAgIHNhbmUgJj0gcGFja2FnZV9xYV9oYW5kbGVfZXJyb3IoImxpY2Vu
c2UtY2hlY2tzdW0iLCBtc2csIGQpCgogICAgaWYgbm90IHNhbmU6CiAgICAgICAgYmIuZmF0YWwo
IkZhdGFsIFFBIGVycm9ycyBmb3VuZCwgZmFpbGluZyB0YXNrLiIpCgpwb3B1bGF0ZV9saWNfcWFf
Y2hlY2tzdW0oZCkKCmRlZiBwYWNrYWdlX3FhX2hhbmRsZV9lcnJvcihlcnJvcl9jbGFzcywgZXJy
b3JfbXNnLCBkKToKICAgIGlmIGVycm9yX2NsYXNzIGluIChkLmdldFZhcigiRVJST1JfUUEiKSBv
ciAiIikuc3BsaXQoKToKICAgICAgICBwYWNrYWdlX3FhX3dyaXRlX2Vycm9yKGVycm9yX2NsYXNz
LCBlcnJvcl9tc2csIGQpCiAgICAgICAgYmIuZXJyb3IoIlFBIElzc3VlOiAlcyBbJXNdIiAlIChl
cnJvcl9tc2csIGVycm9yX2NsYXNzKSkKICAgICAgICBkLnNldFZhcigiUUFfU0FORSIsIEZhbHNl
KQogICAgICAgIHJldHVybiBGYWxzZQogICAgZWxpZiBlcnJvcl9jbGFzcyBpbiAoZC5nZXRWYXIo
IldBUk5fUUEiKSBvciAiIikuc3BsaXQoKToKICAgICAgICBwYWNrYWdlX3FhX3dyaXRlX2Vycm9y
KGVycm9yX2NsYXNzLCBlcnJvcl9tc2csIGQpCiAgICAgICAgYmIud2FybigiUUEgSXNzdWU6ICVz
IFslc10iICUgKGVycm9yX21zZywgZXJyb3JfY2xhc3MpKQogICAgZWxzZToKICAgICAgICBiYi5u
b3RlKCJRQSBJc3N1ZTogJXMgWyVzXSIgJSAoZXJyb3JfbXNnLCBlcnJvcl9jbGFzcykpCiAgICBy
ZXR1cm4gVHJ1ZQoKZGVmIHBhY2thZ2VfcWFfd3JpdGVfZXJyb3IodHlwZSwgZXJyb3IsIGQpOgog
ICAgbG9nZmlsZSA9IGQuZ2V0VmFyKCdRQV9MT0dGSUxFJykKICAgIGlmIGxvZ2ZpbGU6CiAgICAg
ICAgcCA9IGQuZ2V0VmFyKCdQJykKICAgICAgICB3aXRoIG9wZW4obG9nZmlsZSwgImErIikgYXMg
ZjoKICAgICAgICAgICAgZi53cml0ZSgiJXM6ICVzIFslc11cbiIgJSAocCwgZXJyb3IsIHR5cGUp
KQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.patch_do_patch.14518"
Content-Disposition: attachment; filename="run.patch_do_patch.14518"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3bh43>
X-Attachment-Id: f_jz9oy3bh43

ZGVmIHBhdGNoX2RvX3BhdGNoKGQpOgogICAgaW1wb3J0IG9lLnBhdGNoCgogICAgcGF0Y2hzZXRt
YXAgPSB7CiAgICAgICAgInBhdGNoIjogb2UucGF0Y2guUGF0Y2hUcmVlLAogICAgICAgICJxdWls
dCI6IG9lLnBhdGNoLlF1aWx0VHJlZSwKICAgICAgICAiZ2l0Ijogb2UucGF0Y2guR2l0QXBwbHlU
cmVlLAogICAgfQoKICAgIGNscyA9IHBhdGNoc2V0bWFwW2QuZ2V0VmFyKCdQQVRDSFRPT0wnKSBv
ciAncXVpbHQnXQoKICAgIHJlc29sdmVybWFwID0gewogICAgICAgICJub29wIjogb2UucGF0Y2gu
Tk9PUFJlc29sdmVyLAogICAgICAgICJ1c2VyIjogb2UucGF0Y2guVXNlclJlc29sdmVyLAogICAg
fQoKICAgIHJjbHMgPSByZXNvbHZlcm1hcFtkLmdldFZhcignUEFUQ0hSRVNPTFZFJykgb3IgJ3Vz
ZXInXQoKICAgIGNsYXNzZXMgPSB7fQoKICAgIHMgPSBkLmdldFZhcignUycpCgogICAgb3MucHV0
ZW52KCdQQVRIJywgZC5nZXRWYXIoJ1BBVEgnKSkKCiAgICAjIFdlIG11c3QgdXNlIG9uZSBUTVBE
SVIgcGVyIHByb2Nlc3Mgc28gdGhhdCB0aGUgInBhdGNoIiBwcm9jZXNzZXMKICAgICMgZG9uJ3Qg
Z2VuZXJhdGUgdGhlIHNhbWUgdGVtcCBmaWxlIG5hbWUuCgogICAgaW1wb3J0IHRlbXBmaWxlCiAg
ICBwcm9jZXNzX3RtcGRpciA9IHRlbXBmaWxlLm1rZHRlbXAoKQogICAgb3MuZW52aXJvblsnVE1Q
RElSJ10gPSBwcm9jZXNzX3RtcGRpcgoKICAgIGZvciBwYXRjaCBpbiBzcmNfcGF0Y2hlcyhkKToK
ICAgICAgICBfLCBfLCBsb2NhbCwgXywgXywgcGFybSA9IGJiLmZldGNoLmRlY29kZXVybChwYXRj
aCkKCiAgICAgICAgaWYgInBhdGNoZGlyIiBpbiBwYXJtOgogICAgICAgICAgICBwYXRjaGRpciA9
IHBhcm1bInBhdGNoZGlyIl0KICAgICAgICAgICAgaWYgbm90IG9zLnBhdGguaXNhYnMocGF0Y2hk
aXIpOgogICAgICAgICAgICAgICAgcGF0Y2hkaXIgPSBvcy5wYXRoLmpvaW4ocywgcGF0Y2hkaXIp
CiAgICAgICAgZWxzZToKICAgICAgICAgICAgcGF0Y2hkaXIgPSBzCgogICAgICAgIGlmIG5vdCBw
YXRjaGRpciBpbiBjbGFzc2VzOgogICAgICAgICAgICBwYXRjaHNldCA9IGNscyhwYXRjaGRpciwg
ZCkKICAgICAgICAgICAgcmVzb2x2ZXIgPSByY2xzKHBhdGNoc2V0LCBvZV90ZXJtaW5hbCkKICAg
ICAgICAgICAgY2xhc3Nlc1twYXRjaGRpcl0gPSAocGF0Y2hzZXQsIHJlc29sdmVyKQogICAgICAg
ICAgICBwYXRjaHNldC5DbGVhbigpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgcGF0Y2hzZXQs
IHJlc29sdmVyID0gY2xhc3Nlc1twYXRjaGRpcl0KCiAgICAgICAgYmIubm90ZSgiQXBwbHlpbmcg
cGF0Y2ggJyVzJyAoJXMpIiAlIChwYXJtWydwYXRjaG5hbWUnXSwgb2UucGF0aC5mb3JtYXRfZGlz
cGxheShsb2NhbCwgZCkpKQogICAgICAgIHRyeToKICAgICAgICAgICAgcGF0Y2hzZXQuSW1wb3J0
KHsiZmlsZSI6bG9jYWwsICJzdHJpcHBhdGgiOiBwYXJtWydzdHJpcGxldmVsJ119LCBUcnVlKQog
ICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZXhjOgogICAgICAgICAgICBiYi51dGlscy5yZW1v
dmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAgICAgICAgICAgIGJiLmZhdGFsKHN0cihleGMpKQog
ICAgICAgIHRyeToKICAgICAgICAgICAgcmVzb2x2ZXIuUmVzb2x2ZSgpCiAgICAgICAgZXhjZXB0
IGJiLkJCSGFuZGxlZEV4Y2VwdGlvbiBhcyBlOgogICAgICAgICAgICBiYi51dGlscy5yZW1vdmUo
cHJvY2Vzc190bXBkaXIsIFRydWUpCiAgICAgICAgICAgIGJiLmZhdGFsKHN0cihlKSkKCiAgICBi
Yi51dGlscy5yZW1vdmUocHJvY2Vzc190bXBkaXIsIFRydWUpCiAgICBkZWwgb3MuZW52aXJvblsn
VE1QRElSJ10KCnBhdGNoX2RvX3BhdGNoKGQpCgpkZWYgc3JjX3BhdGNoZXMoZCwgYWxsPUZhbHNl
LCBleHBhbmQ9VHJ1ZSk6CiAgICBpbXBvcnQgb2UucGF0Y2gKICAgIHJldHVybiBvZS5wYXRjaC5z
cmNfcGF0Y2hlcyhkLCBhbGwsIGV4cGFuZCkKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.sstate_hardcode_path.14593"
Content-Disposition: attachment; filename="run.sstate_hardcode_path.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3bs46>
X-Attachment-Id: f_jz9oy3bs46

ZGVmIHNzdGF0ZV9oYXJkY29kZV9wYXRoKGQpOgogICAgaW1wb3J0IHN1YnByb2Nlc3MsIHBsYXRm
b3JtCgogICAgIyBOZWVkIHRvIHJlbW92ZSBoYXJkY29kZWQgcGF0aHMgYW5kIGZpeCB0aGVzZSB3
aGVuIHdlIGluc3RhbGwgdGhlCiAgICAjIHN0YWdpbmcgcGFja2FnZXMuCiAgICAjCiAgICAjIE5v
dGU6IHRoZSBsb2dpYyBpbiB0aGlzIGZ1bmN0aW9uIG5lZWRzIHRvIG1hdGNoIHRoZSByZXZlcnNl
IGxvZ2ljCiAgICAjIGluIHNzdGF0ZV9pbnN0YWxscGtnKHNzLCBkKQoKICAgIHN0YWdpbmdfdGFy
Z2V0ID0gZC5nZXRWYXIoJ1JFQ0lQRV9TWVNST09UJykKICAgIHN0YWdpbmdfaG9zdCA9IGQuZ2V0
VmFyKCdSRUNJUEVfU1lTUk9PVF9OQVRJVkUnKQogICAgc3N0YXRlX2J1aWxkZGlyID0gZC5nZXRW
YXIoJ1NTVEFURV9CVUlMRERJUicpCgogICAgc3N0YXRlX3NlZF9jbWQgPSAic2VkIC1pIC1lICdz
OiVzOkZJWE1FU1RBR0lOR0RJUkhPU1Q6ZyciICUgc3RhZ2luZ19ob3N0CiAgICBpZiBiYi5kYXRh
LmluaGVyaXRzX2NsYXNzKCduYXRpdmUnLCBkKSBvciBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCdj
cm9zcy1jYW5hZGlhbicsIGQpOgogICAgICAgIHNzdGF0ZV9ncmVwX2NtZCA9ICJncmVwIC1sIC1l
ICclcyciICUgKHN0YWdpbmdfaG9zdCkKICAgIGVsaWYgYmIuZGF0YS5pbmhlcml0c19jbGFzcygn
Y3Jvc3MnLCBkKSBvciBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCdjcm9zc3NkaycsIGQpOgogICAg
ICAgIHNzdGF0ZV9ncmVwX2NtZCA9ICJncmVwIC1sIC1lICclcycgLWUgJyVzJyIgJSAoc3RhZ2lu
Z190YXJnZXQsIHN0YWdpbmdfaG9zdCkKICAgICAgICBzc3RhdGVfc2VkX2NtZCArPSAiIC1lICdz
OiVzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDpnJyIgJSBzdGFnaW5nX3RhcmdldAogICAgZWxzZToK
ICAgICAgICBzc3RhdGVfZ3JlcF9jbWQgPSAiZ3JlcCAtbCAtZSAnJXMnIC1lICclcyciICUgKHN0
YWdpbmdfdGFyZ2V0LCBzdGFnaW5nX2hvc3QpCiAgICAgICAgc3N0YXRlX3NlZF9jbWQgKz0gIiAt
ZSAnczolczpGSVhNRVNUQUdJTkdESVJUQVJHRVQ6ZyciICUgc3RhZ2luZ190YXJnZXQKCiAgICBl
eHRyYV9zdGFnaW5nX2ZpeG1lcyA9IGQuZ2V0VmFyKCdFWFRSQV9TVEFHSU5HX0ZJWE1FUycpIG9y
ICcnCiAgICBmb3IgZml4bWV2YXIgaW4gZXh0cmFfc3RhZ2luZ19maXhtZXMuc3BsaXQoKToKICAg
ICAgICBmaXhtZV9wYXRoID0gZC5nZXRWYXIoZml4bWV2YXIpCiAgICAgICAgc3N0YXRlX3NlZF9j
bWQgKz0gIiAtZSAnczolczpGSVhNRV8lczpnJyIgJSAoZml4bWVfcGF0aCwgZml4bWV2YXIpCiAg
ICAgICAgc3N0YXRlX2dyZXBfY21kICs9ICIgLWUgJyVzJyIgJSAoZml4bWVfcGF0aCkKCiAgICBm
aXhtZWZuID0gIHNzdGF0ZV9idWlsZGRpciArICJmaXhtZXBhdGgiCgogICAgc3N0YXRlX3NjYW5f
Y21kID0gZC5nZXRWYXIoJ1NTVEFURV9TQ0FOX0NNRCcpCiAgICBzc3RhdGVfZmlsZWxpc3RfY21k
ID0gInRlZSAlcyIgJSAoZml4bWVmbikKCiAgICAjIGZpeG1lcGF0aCBmaWxlIG5lZWRzIHJlbGF0
aXZlIHBhdGhzLCBkcm9wIHNzdGF0ZV9idWlsZGRpciBwcmVmaXgKICAgIHNzdGF0ZV9maWxlbGlz
dF9yZWxhdGl2ZV9jbWQgPSAic2VkIC1pIC1lICdzOl4lczo6ZycgJXMiICUgKHNzdGF0ZV9idWls
ZGRpciwgZml4bWVmbikKCiAgICB4YXJnc19ub19lbXB0eV9ydW5fY21kID0gJy0tbm8tcnVuLWlm
LWVtcHR5JwogICAgaWYgcGxhdGZvcm0uc3lzdGVtKCkgPT0gJ0Rhcndpbic6CiAgICAgICAgeGFy
Z3Nfbm9fZW1wdHlfcnVuX2NtZCA9ICcnCgogICAgIyBMaW1pdCB0aGUgZml4cGF0aHMgYW5kIHNl
ZCBvcGVyYXRpb25zIGJhc2VkIG9uIHRoZSBpbml0aWFsIGdyZXAgc2VhcmNoCiAgICAjIFRoaXMg
aGFzIHRoZSBzaWRlIGVmZmVjdCBvZiBtYWtpbmcgc3VyZSB0aGUgdmZzIGNhY2hlIGlzIGhvdAog
ICAgc3N0YXRlX2hhcmRjb2RlX2NtZCA9ICIlcyB8IHhhcmdzICVzIHwgJXMgfCB4YXJncyAlcyAl
cyIgJSAoc3N0YXRlX3NjYW5fY21kLCBzc3RhdGVfZ3JlcF9jbWQsIHNzdGF0ZV9maWxlbGlzdF9j
bWQsIHhhcmdzX25vX2VtcHR5X3J1bl9jbWQsIHNzdGF0ZV9zZWRfY21kKQoKICAgIGJiLm5vdGUo
IlJlbW92aW5nIGhhcmRjb2RlZCBwYXRocyBmcm9tIHNzdGF0ZSBwYWNrYWdlOiAnJXMnIiAlIChz
c3RhdGVfaGFyZGNvZGVfY21kKSkKICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KHNzdGF0ZV9o
YXJkY29kZV9jbWQsIHNoZWxsPVRydWUsIGN3ZD1zc3RhdGVfYnVpbGRkaXIpCgogICAgICAgICMg
SWYgdGhlIGZpeG1lZm4gaXMgZW1wdHksIHJlbW92ZSBpdC4uCiAgICBpZiBvcy5zdGF0KGZpeG1l
Zm4pLnN0X3NpemUgPT0gMDoKICAgICAgICBvcy5yZW1vdmUoZml4bWVmbikKICAgIGVsc2U6CiAg
ICAgICAgYmIubm90ZSgiUmVwbGFjaW5nIGFic29sdXRlIHBhdGhzIGluIGZpeG1lcGF0aCBmaWxl
OiAnJXMnIiAlIChzc3RhdGVfZmlsZWxpc3RfcmVsYXRpdmVfY21kKSkKICAgICAgICBzdWJwcm9j
ZXNzLmNoZWNrX291dHB1dChzc3RhdGVfZmlsZWxpc3RfcmVsYXRpdmVfY21kLCBzaGVsbD1UcnVl
KQoKc3N0YXRlX2hhcmRjb2RlX3BhdGgoZCkKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.sstate_create_package.14593"
Content-Disposition: attachment; filename="run.sstate_create_package.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3bo45>
X-Attachment-Id: f_jz9oy3bo45

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCnNzdGF0ZV9jcmVhdGVfcGFja2Fn
ZSgpIHsKCVRGSUxFPWBta3RlbXAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS9zc3RhdGUtY2FjaGUvZGQvc3N0YXRlOmphaWxob3VzZTo6MC4xMTpyMDo6
MzpkZDIzZDkzNzI4NDk5ODFmNmRkNTZmNDk2ZmU2ZTE2ZGM0MDRkYjlmYzUxNjU1MmQxMTBmZTFi
NmM2ZDIzMmU4X3BvcHVsYXRlX2xpYy50Z3ouWFhYWFhYWFhgCgoJIyBFeGl0IGVhcmx1IGlmIGl0
IGFscmVhZHkgZXhpc3RzCglpZiBbIC1lIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vc3N0YXRlLWNhY2hlL2RkL3NzdGF0ZTpqYWlsaG91c2U6OjAuMTE6
cjA6OjM6ZGQyM2Q5MzcyODQ5OTgxZjZkZDU2ZjQ5NmZlNmUxNmRjNDA0ZGI5ZmM1MTY1NTJkMTEw
ZmUxYjZjNmQyMzJlOF9wb3B1bGF0ZV9saWMudGd6IF07IHRoZW4KCQlyZXR1cm4KCWZpCgogICAg
ICAgICMgVXNlIHBpZ3ogaWYgYXZhaWxhYmxlCiAgICAgICAgT1BUPSItY3pTIgogICAgICAgIGlm
IFsgLXggIiQoY29tbWFuZCAtdiBwaWd6KSIgXTsgdGhlbgogICAgICAgICAgICBPUFQ9Ii1JIHBp
Z3ogLWNTIgogICAgICAgIGZpCgoJIyBOZWVkIHRvIGhhbmRsZSBlbXB0eSBkaXJlY3RvcmllcwoJ
aWYgWyAiJChscyAtQSkiIF07IHRoZW4KCQlzZXQgK2UKCQl0YXIgJE9QVCAtZiAkVEZJTEUgKgoJ
CXJldD0kPwoJCWlmIFsgJHJldCAtbmUgMCBdICYmIFsgJHJldCAtbmUgMSBdOyB0aGVuCgkJCWV4
aXQgMQoJCWZpCgkJc2V0IC1lCgllbHNlCgkJdGFyICRPUFQgLS1maWxlPSRURklMRSAtLWZpbGVz
LWZyb209L2Rldi9udWxsCglmaQoJY2htb2QgMDY2NCAkVEZJTEUKCSMgU2tpcCBpZiBpdCB3YXMg
YWxyZWFkeSBjcmVhdGVkIGJ5IHNvbWUgb3RoZXIgcHJvY2VzcwoJaWYgWyAhIC1lIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vc3N0YXRlLWNhY2hlL2Rk
L3NzdGF0ZTpqYWlsaG91c2U6OjAuMTE6cjA6OjM6ZGQyM2Q5MzcyODQ5OTgxZjZkZDU2ZjQ5NmZl
NmUxNmRjNDA0ZGI5ZmM1MTY1NTJkMTEwZmUxYjZjNmQyMzJlOF9wb3B1bGF0ZV9saWMudGd6IF07
IHRoZW4KCQltdiAtZiAkVEZJTEUgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS9zc3RhdGUtY2FjaGUvZGQvc3N0YXRlOmphaWxob3VzZTo6MC4xMTpyMDo6
MzpkZDIzZDkzNzI4NDk5ODFmNmRkNTZmNDk2ZmU2ZTE2ZGM0MDRkYjlmYzUxNjU1MmQxMTBmZTFi
NmM2ZDIzMmU4X3BvcHVsYXRlX2xpYy50Z3oKCWVsc2UKCQlybSAkVEZJTEUKCWZpCn0KCmNkICcv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
c3N0YXRlLWJ1aWxkLXBvcHVsYXRlX2xpYy8nCnNzdGF0ZV9jcmVhdGVfcGFja2FnZQoKIyBjbGVh
bnVwCnJldD0kPwp0cmFwICcnIDAKZXhpdCAkcmV0Cg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.sstate_hardcode_path_unpack.14593"
Content-Disposition: attachment; 
	filename="run.sstate_hardcode_path_unpack.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3bw47>
X-Attachment-Id: f_jz9oy3bw47

ZGVmIHNzdGF0ZV9oYXJkY29kZV9wYXRoX3VucGFjayhkKToKICAgICMgRml4dXAgaGFyZGNvZGVk
IHBhdGhzCiAgICAjCiAgICAjIE5vdGU6IFRoZSBsb2dpYyBiZWxvdyBtdXN0IG1hdGNoIHRoZSBy
ZXZlcnNlIGxvZ2ljIGluCiAgICAjIHNzdGF0ZV9oYXJkY29kZV9wYXRoKGQpCiAgICBpbXBvcnQg
c3VicHJvY2VzcwoKICAgIHNzdGF0ZWluc3QgPSBkLmdldFZhcignU1NUQVRFX0lOU1RESVInKQog
ICAgc3N0YXRlZml4bWVkaXIgPSBkLmdldFZhcignU1NUQVRFX0ZJWE1FRElSJykKICAgIGZpeG1l
Zm4gPSBzc3RhdGVpbnN0ICsgImZpeG1lcGF0aCIKICAgIGlmIG9zLnBhdGguaXNmaWxlKGZpeG1l
Zm4pOgogICAgICAgIHN0YWdpbmdfdGFyZ2V0ID0gZC5nZXRWYXIoJ1JFQ0lQRV9TWVNST09UJykK
ICAgICAgICBzdGFnaW5nX2hvc3QgPSBkLmdldFZhcignUkVDSVBFX1NZU1JPT1RfTkFUSVZFJykK
CiAgICAgICAgaWYgYmIuZGF0YS5pbmhlcml0c19jbGFzcygnbmF0aXZlJywgZCkgb3IgYmIuZGF0
YS5pbmhlcml0c19jbGFzcygnY3Jvc3MtY2FuYWRpYW4nLCBkKToKICAgICAgICAgICAgc3N0YXRl
X3NlZF9jbWQgPSAic2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUkhPU1Q6JXM6ZyciICUgKHN0
YWdpbmdfaG9zdCkKICAgICAgICBlbGlmIGJiLmRhdGEuaW5oZXJpdHNfY2xhc3MoJ2Nyb3NzJywg
ZCkgb3IgYmIuZGF0YS5pbmhlcml0c19jbGFzcygnY3Jvc3NzZGsnLCBkKToKICAgICAgICAgICAg
c3N0YXRlX3NlZF9jbWQgPSAic2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDolczpn
OyBzOkZJWE1FU1RBR0lOR0RJUkhPU1Q6JXM6ZyciICUgKHN0YWdpbmdfdGFyZ2V0LCBzdGFnaW5n
X2hvc3QpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgc3N0YXRlX3NlZF9jbWQgPSAic2VkIC1p
IC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDolczpnJyIgJSAoc3RhZ2luZ190YXJnZXQpCgog
ICAgICAgIGV4dHJhX3N0YWdpbmdfZml4bWVzID0gZC5nZXRWYXIoJ0VYVFJBX1NUQUdJTkdfRklY
TUVTJykgb3IgJycKICAgICAgICBmb3IgZml4bWV2YXIgaW4gZXh0cmFfc3RhZ2luZ19maXhtZXMu
c3BsaXQoKToKICAgICAgICAgICAgZml4bWVfcGF0aCA9IGQuZ2V0VmFyKGZpeG1ldmFyKQogICAg
ICAgICAgICBzc3RhdGVfc2VkX2NtZCArPSAiIC1lICdzOkZJWE1FXyVzOiVzOmcnIiAlIChmaXht
ZXZhciwgZml4bWVfcGF0aCkKCiAgICAgICAgIyBBZGQgc3N0YXRlaW5zdCB0byBlYWNoIGZpbGVu
YW1lIGluIGZpeG1lcGF0aCwgdXNlIHhhcmdzIHRvIGVmZmljaWVudGx5IGNhbGwgc2VkCiAgICAg
ICAgc3N0YXRlX2hhcmRjb2RlX2NtZCA9ICJzZWQgLWUgJ3M6XjolczpnJyAlcyB8IHhhcmdzICVz
IiAlIChzc3RhdGVpbnN0LCBmaXhtZWZuLCBzc3RhdGVfc2VkX2NtZCkKCiAgICAgICAgIyBEZWZl
ciBkb19wb3B1bGF0ZV9zeXNyb290IHJlbG9jYXRpb24gY29tbWFuZAogICAgICAgIGlmIHNzdGF0
ZWZpeG1lZGlyOgogICAgICAgICAgICBiYi51dGlscy5ta2RpcmhpZXIoc3N0YXRlZml4bWVkaXIp
CiAgICAgICAgICAgIHdpdGggb3Blbihzc3RhdGVmaXhtZWRpciArICIvZml4bWVwYXRoLmNtZCIs
ICJ3IikgYXMgZjoKICAgICAgICAgICAgICAgIHNzdGF0ZV9oYXJkY29kZV9jbWQgPSBzc3RhdGVf
aGFyZGNvZGVfY21kLnJlcGxhY2UoZml4bWVmbiwgc3N0YXRlZml4bWVkaXIgKyAiL2ZpeG1lcGF0
aCIpCiAgICAgICAgICAgICAgICBzc3RhdGVfaGFyZGNvZGVfY21kID0gc3N0YXRlX2hhcmRjb2Rl
X2NtZC5yZXBsYWNlKHNzdGF0ZWluc3QsICJGSVhNRUZJTkFMU1NUQVRFSU5TVCIpCiAgICAgICAg
ICAgICAgICBzc3RhdGVfaGFyZGNvZGVfY21kID0gc3N0YXRlX2hhcmRjb2RlX2NtZC5yZXBsYWNl
KHN0YWdpbmdfaG9zdCwgIkZJWE1FRklOQUxTU1RBVEVIT1NUIikKICAgICAgICAgICAgICAgIHNz
dGF0ZV9oYXJkY29kZV9jbWQgPSBzc3RhdGVfaGFyZGNvZGVfY21kLnJlcGxhY2Uoc3RhZ2luZ190
YXJnZXQsICJGSVhNRUZJTkFMU1NUQVRFVEFSR0VUIikKICAgICAgICAgICAgICAgIGYud3JpdGUo
c3N0YXRlX2hhcmRjb2RlX2NtZCkKICAgICAgICAgICAgYmIudXRpbHMuY29weWZpbGUoZml4bWVm
biwgc3N0YXRlZml4bWVkaXIgKyAiL2ZpeG1lcGF0aCIpCiAgICAgICAgICAgIHJldHVybgoKICAg
ICAgICBiYi5ub3RlKCJSZXBsYWNpbmcgZml4bWUgcGF0aHMgaW4gc3N0YXRlIHBhY2thZ2U6ICVz
IiAlIChzc3RhdGVfaGFyZGNvZGVfY21kKSkKICAgICAgICBzdWJwcm9jZXNzLmNoZWNrX2NhbGwo
c3N0YXRlX2hhcmRjb2RlX2NtZCwgc2hlbGw9VHJ1ZSkKCiAgICAgICAgIyBOZWVkIHRvIHJlbW92
ZSB0aGlzIG9yIHdlJ2QgY29weSBpdCBpbnRvIHRoZSB0YXJnZXQgZGlyZWN0b3J5IGFuZCBtYXkK
ICAgICAgICAjIGNvbmZsaWN0IHdpdGggYW5vdGhlciB3cml0ZXIKICAgICAgICBvcy5yZW1vdmUo
Zml4bWVmbikKCnNzdGF0ZV9oYXJkY29kZV9wYXRoX3VucGFjayhkKQoK
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.sstate_report_unihash.14593"
Content-Disposition: attachment; filename="run.sstate_report_unihash.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3c048>
X-Attachment-Id: f_jz9oy3c048

ZGVmIHNzdGF0ZV9yZXBvcnRfdW5paGFzaChkKToKICAgIHJlcG9ydF91bmloYXNoID0gZ2V0YXR0
cihiYi5wYXJzZS5zaWdnZW4sICdyZXBvcnRfdW5paGFzaCcsIE5vbmUpCgogICAgaWYgcmVwb3J0
X3VuaWhhc2g6CiAgICAgICAgc3MgPSBzc3RhdGVfc3RhdGVfZnJvbXZhcnMoZCkKICAgICAgICBy
ZXBvcnRfdW5paGFzaChvcy5nZXRjd2QoKSwgc3NbJ3Rhc2snXSwgZCkKCnNzdGF0ZV9yZXBvcnRf
dW5paGFzaChkKQoKZGVmIHNzdGF0ZV9zdGF0ZV9mcm9tdmFycyhkLCB0YXNrID0gTm9uZSk6CiAg
ICBpZiB0YXNrIGlzIE5vbmU6CiAgICAgICAgdGFzayA9IGQuZ2V0VmFyKCdCQl9DVVJSRU5UVEFT
SycpCiAgICAgICAgaWYgbm90IHRhc2s6CiAgICAgICAgICAgIGJiLmZhdGFsKCJzc3RhdGUgY29k
ZSBydW5uaW5nIHdpdGhvdXQgdGFzayBjb250ZXh0PyEiKQogICAgICAgIHRhc2sgPSB0YXNrLnJl
cGxhY2UoIl9zZXRzY2VuZSIsICIiKQoKICAgIGlmIHRhc2suc3RhcnRzd2l0aCgiZG9fIik6CiAg
ICAgICAgdGFzayA9IHRhc2tbMzpdCiAgICBpbnB1dHMgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsg
dGFzaywgJ3NzdGF0ZS1pbnB1dGRpcnMnKSBvciAiIikuc3BsaXQoKQogICAgb3V0cHV0cyA9IChk
LmdldFZhckZsYWcoImRvXyIgKyB0YXNrLCAnc3N0YXRlLW91dHB1dGRpcnMnKSBvciAiIikuc3Bs
aXQoKQogICAgcGxhaW5kaXJzID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUt
cGxhaW5kaXJzJykgb3IgIiIpLnNwbGl0KCkKICAgIGxvY2tmaWxlcyA9IChkLmdldFZhckZsYWco
ImRvXyIgKyB0YXNrLCAnc3N0YXRlLWxvY2tmaWxlJykgb3IgIiIpLnNwbGl0KCkKICAgIGxvY2tm
aWxlc3NoYXJlZCA9IChkLmdldFZhckZsYWcoImRvXyIgKyB0YXNrLCAnc3N0YXRlLWxvY2tmaWxl
LXNoYXJlZCcpIG9yICIiKS5zcGxpdCgpCiAgICBpbnRlcmNlcHRmdW5jcyA9IChkLmdldFZhckZs
YWcoImRvXyIgKyB0YXNrLCAnc3N0YXRlLWludGVyY2VwdGZ1bmNzJykgb3IgIiIpLnNwbGl0KCkK
ICAgIGZpeG1lZGlyID0gZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0ZS1maXhtZWRp
cicpIG9yICIiCiAgICBpZiBub3QgdGFzayBvciBsZW4oaW5wdXRzKSAhPSBsZW4ob3V0cHV0cyk6
CiAgICAgICAgYmIuZmF0YWwoInNzdGF0ZSB2YXJpYWJsZXMgbm90IHNldHVwIGNvcnJlY3RseT8h
IikKCiAgICBpZiB0YXNrID09ICJwb3B1bGF0ZV9saWMiOgogICAgICAgIGQuc2V0VmFyKCJTU1RB
VEVfUEtHU1BFQyIsICIke1NTVEFURV9TV1NQRUN9IikKICAgICAgICBkLnNldFZhcigiU1NUQVRF
X0VYVFJBUEFUSCIsICIiKQogICAgICAgIGQuc2V0VmFyKCdTU1RBVEVfRVhUUkFQQVRIV0lMRENB
UkQnLCAiIikKCiAgICBzcyA9IHNzdGF0ZV9pbml0KHRhc2ssIGQpCiAgICBmb3IgaSBpbiByYW5n
ZShsZW4oaW5wdXRzKSk6CiAgICAgICAgc3N0YXRlX2FkZChzcywgaW5wdXRzW2ldLCBvdXRwdXRz
W2ldLCBkKQogICAgc3NbJ2xvY2tmaWxlcyddID0gbG9ja2ZpbGVzCiAgICBzc1snbG9ja2ZpbGVz
LXNoYXJlZCddID0gbG9ja2ZpbGVzc2hhcmVkCiAgICBzc1sncGxhaW5kaXJzJ10gPSBwbGFpbmRp
cnMKICAgIHNzWydpbnRlcmNlcHRmdW5jcyddID0gaW50ZXJjZXB0ZnVuY3MKICAgIHNzWydmaXht
ZWRpciddID0gZml4bWVkaXIKICAgIHJldHVybiBzcwoKZGVmIHNzdGF0ZV9pbml0KHRhc2ssIGQp
OgogICAgc3MgPSB7fQogICAgc3NbJ3Rhc2snXSA9IHRhc2sKICAgIHNzWydkaXJzJ10gPSBbXQog
ICAgc3NbJ3BsYWluZGlycyddID0gW10KICAgIHNzWydsb2NrZmlsZXMnXSA9IFtdCiAgICBzc1sn
bG9ja2ZpbGVzLXNoYXJlZCddID0gW10KICAgIHJldHVybiBzcwoKZGVmIHNzdGF0ZV9hZGQoc3Ms
IHNvdXJjZSwgZGVzdCwgZCk6CiAgICBpZiBub3Qgc291cmNlLmVuZHN3aXRoKCIvIik6CiAgICAg
ICAgIHNvdXJjZSA9IHNvdXJjZSArICIvIgogICAgaWYgbm90IGRlc3QuZW5kc3dpdGgoIi8iKToK
ICAgICAgICAgZGVzdCA9IGRlc3QgKyAiLyIKICAgIHNvdXJjZSA9IG9zLnBhdGgubm9ybXBhdGgo
c291cmNlKQogICAgZGVzdCA9IG9zLnBhdGgubm9ybXBhdGgoZGVzdCkKICAgIHNyY2Jhc2UgPSBv
cy5wYXRoLmJhc2VuYW1lKHNvdXJjZSkKICAgIHNzWydkaXJzJ10uYXBwZW5kKFtzcmNiYXNlLCBz
b3VyY2UsIGRlc3RdKQogICAgcmV0dXJuIHNzCgo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; 
	name="run.sstate_task_postfunc.14593"
Content-Disposition: attachment; filename="run.sstate_task_postfunc.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3c349>
X-Attachment-Id: f_jz9oy3c349

ZGVmIHNzdGF0ZV90YXNrX3Bvc3RmdW5jKGQpOgogICAgc2hhcmVkX3N0YXRlID0gc3N0YXRlX3N0
YXRlX2Zyb212YXJzKGQpCgogICAgZm9yIGludGVyY2VwdCBpbiBzaGFyZWRfc3RhdGVbJ2ludGVy
Y2VwdGZ1bmNzJ106CiAgICAgICAgYmIuYnVpbGQuZXhlY19mdW5jKGludGVyY2VwdCwgZCwgKGQu
Z2V0VmFyKCJXT1JLRElSIiksKSkKCiAgICBvbWFzayA9IG9zLnVtYXNrKDBvMDAyKQogICAgaWYg
b21hc2sgIT0gMG8wMDI6CiAgICAgICBiYi5ub3RlKCJVc2luZyB1bWFzayAwbzAwMiAobm90ICUw
bykgZm9yIHNzdGF0ZSBwYWNrYWdpbmciICUgb21hc2spCiAgICBzc3RhdGVfcGFja2FnZShzaGFy
ZWRfc3RhdGUsIGQpCiAgICBvcy51bWFzayhvbWFzaykKCiAgICBzc3RhdGVpbnN0ID0gZC5nZXRW
YXIoIlNTVEFURV9JTlNURElSIikKICAgIGQuc2V0VmFyKCdTU1RBVEVfRklYTUVESVInLCBzaGFy
ZWRfc3RhdGVbJ2ZpeG1lZGlyJ10pCgogICAgc3N0YXRlX2luc3RhbGxwa2dkaXIoc2hhcmVkX3N0
YXRlLCBkKQoKICAgIGJiLnV0aWxzLnJlbW92ZShkLmdldFZhcigiU1NUQVRFX0JVSUxERElSIiks
IHJlY3Vyc2U9VHJ1ZSkKCnNzdGF0ZV90YXNrX3Bvc3RmdW5jKGQpCgpkZWYgc3N0YXRlX3N0YXRl
X2Zyb212YXJzKGQsIHRhc2sgPSBOb25lKToKICAgIGlmIHRhc2sgaXMgTm9uZToKICAgICAgICB0
YXNrID0gZC5nZXRWYXIoJ0JCX0NVUlJFTlRUQVNLJykKICAgICAgICBpZiBub3QgdGFzazoKICAg
ICAgICAgICAgYmIuZmF0YWwoInNzdGF0ZSBjb2RlIHJ1bm5pbmcgd2l0aG91dCB0YXNrIGNvbnRl
eHQ/ISIpCiAgICAgICAgdGFzayA9IHRhc2sucmVwbGFjZSgiX3NldHNjZW5lIiwgIiIpCgogICAg
aWYgdGFzay5zdGFydHN3aXRoKCJkb18iKToKICAgICAgICB0YXNrID0gdGFza1szOl0KICAgIGlu
cHV0cyA9IChkLmdldFZhckZsYWcoImRvXyIgKyB0YXNrLCAnc3N0YXRlLWlucHV0ZGlycycpIG9y
ICIiKS5zcGxpdCgpCiAgICBvdXRwdXRzID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdz
c3RhdGUtb3V0cHV0ZGlycycpIG9yICIiKS5zcGxpdCgpCiAgICBwbGFpbmRpcnMgPSAoZC5nZXRW
YXJGbGFnKCJkb18iICsgdGFzaywgJ3NzdGF0ZS1wbGFpbmRpcnMnKSBvciAiIikuc3BsaXQoKQog
ICAgbG9ja2ZpbGVzID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtbG9ja2Zp
bGUnKSBvciAiIikuc3BsaXQoKQogICAgbG9ja2ZpbGVzc2hhcmVkID0gKGQuZ2V0VmFyRmxhZygi
ZG9fIiArIHRhc2ssICdzc3RhdGUtbG9ja2ZpbGUtc2hhcmVkJykgb3IgIiIpLnNwbGl0KCkKICAg
IGludGVyY2VwdGZ1bmNzID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtaW50
ZXJjZXB0ZnVuY3MnKSBvciAiIikuc3BsaXQoKQogICAgZml4bWVkaXIgPSBkLmdldFZhckZsYWco
ImRvXyIgKyB0YXNrLCAnc3N0YXRlLWZpeG1lZGlyJykgb3IgIiIKICAgIGlmIG5vdCB0YXNrIG9y
IGxlbihpbnB1dHMpICE9IGxlbihvdXRwdXRzKToKICAgICAgICBiYi5mYXRhbCgic3N0YXRlIHZh
cmlhYmxlcyBub3Qgc2V0dXAgY29ycmVjdGx5PyEiKQoKICAgIGlmIHRhc2sgPT0gInBvcHVsYXRl
X2xpYyI6CiAgICAgICAgZC5zZXRWYXIoIlNTVEFURV9QS0dTUEVDIiwgIiR7U1NUQVRFX1NXU1BF
Q30iKQogICAgICAgIGQuc2V0VmFyKCJTU1RBVEVfRVhUUkFQQVRIIiwgIiIpCiAgICAgICAgZC5z
ZXRWYXIoJ1NTVEFURV9FWFRSQVBBVEhXSUxEQ0FSRCcsICIiKQoKICAgIHNzID0gc3N0YXRlX2lu
aXQodGFzaywgZCkKICAgIGZvciBpIGluIHJhbmdlKGxlbihpbnB1dHMpKToKICAgICAgICBzc3Rh
dGVfYWRkKHNzLCBpbnB1dHNbaV0sIG91dHB1dHNbaV0sIGQpCiAgICBzc1snbG9ja2ZpbGVzJ10g
PSBsb2NrZmlsZXMKICAgIHNzWydsb2NrZmlsZXMtc2hhcmVkJ10gPSBsb2NrZmlsZXNzaGFyZWQK
ICAgIHNzWydwbGFpbmRpcnMnXSA9IHBsYWluZGlycwogICAgc3NbJ2ludGVyY2VwdGZ1bmNzJ10g
PSBpbnRlcmNlcHRmdW5jcwogICAgc3NbJ2ZpeG1lZGlyJ10gPSBmaXhtZWRpcgogICAgcmV0dXJu
IHNzCgpkZWYgc3N0YXRlX2luc3RhbGxwa2dkaXIoc3MsIGQpOgogICAgaW1wb3J0IG9lLnBhdGgK
ICAgIGltcG9ydCBzdWJwcm9jZXNzCgogICAgc3N0YXRlaW5zdCA9IGQuZ2V0VmFyKCJTU1RBVEVf
SU5TVERJUiIpCiAgICBkLnNldFZhcignU1NUQVRFX0ZJWE1FRElSJywgc3NbJ2ZpeG1lZGlyJ10p
CgogICAgZm9yIGYgaW4gKGQuZ2V0VmFyKCdTU1RBVEVQT1NUVU5QQUNLRlVOQ1MnKSBvciAnJyku
c3BsaXQoKToKICAgICAgICAjIEFsbCBob29rcyBzaG91bGQgcnVuIGluIHRoZSBTU1RBVEVfSU5T
VERJUgogICAgICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYyhmLCBkLCAoc3N0YXRlaW5zdCwpKQoKICAg
IGRlZiBwcmVwZGlyKGRpcik6CiAgICAgICAgIyByZW1vdmUgZGlyIGlmIGl0IGV4aXN0cywgZW5z
dXJlIGFueSBwYXJlbnQgZGlyZWN0b3JpZXMgZG8gZXhpc3QKICAgICAgICBpZiBvcy5wYXRoLmV4
aXN0cyhkaXIpOgogICAgICAgICAgICBvZS5wYXRoLnJlbW92ZShkaXIpCiAgICAgICAgYmIudXRp
bHMubWtkaXJoaWVyKGRpcikKICAgICAgICBvZS5wYXRoLnJlbW92ZShkaXIpCgogICAgZm9yIHN0
YXRlIGluIHNzWydkaXJzJ106CiAgICAgICAgcHJlcGRpcihzdGF0ZVsxXSkKICAgICAgICBvcy5y
ZW5hbWUoc3N0YXRlaW5zdCArIHN0YXRlWzBdLCBzdGF0ZVsxXSkKICAgIHNzdGF0ZV9pbnN0YWxs
KHNzLCBkKQoKICAgIGZvciBwbGFpbiBpbiBzc1sncGxhaW5kaXJzJ106CiAgICAgICAgd29ya2Rp
ciA9IGQuZ2V0VmFyKCdXT1JLRElSJykKICAgICAgICBzaGFyZWR3b3JrZGlyID0gb3MucGF0aC5q
b2luKGQuZ2V0VmFyKCdUTVBESVInKSwgIndvcmstc2hhcmVkIikKICAgICAgICBzcmMgPSBzc3Rh
dGVpbnN0ICsgIi8iICsgcGxhaW4ucmVwbGFjZSh3b3JrZGlyLCAnJykKICAgICAgICBpZiBzaGFy
ZWR3b3JrZGlyIGluIHBsYWluOgogICAgICAgICAgICBzcmMgPSBzc3RhdGVpbnN0ICsgIi8iICsg
cGxhaW4ucmVwbGFjZShzaGFyZWR3b3JrZGlyLCAnJykKICAgICAgICBkZXN0ID0gcGxhaW4KICAg
ICAgICBiYi51dGlscy5ta2RpcmhpZXIoc3JjKQogICAgICAgIHByZXBkaXIoZGVzdCkKICAgICAg
ICBvcy5yZW5hbWUoc3JjLCBkZXN0KQoKICAgIHJldHVybiBUcnVlCgpkZWYgc3N0YXRlX3BhY2th
Z2Uoc3MsIGQpOgogICAgaW1wb3J0IG9lLnBhdGgKCiAgICB0bXBkaXIgPSBkLmdldFZhcignVE1Q
RElSJykKCiAgICBzc3RhdGVidWlsZCA9IGQuZXhwYW5kKCIke1dPUktESVJ9L3NzdGF0ZS1idWls
ZC0lcy8iICUgc3NbJ3Rhc2snXSkKICAgIHNzdGF0ZXBrZyA9IGQuZ2V0VmFyKCdTU1RBVEVfUEtH
JykgKyAnXycrIHNzWyd0YXNrJ10gKyAiLnRneiIKICAgIGJiLnV0aWxzLnJlbW92ZShzc3RhdGVi
dWlsZCwgcmVjdXJzZT1UcnVlKQogICAgYmIudXRpbHMubWtkaXJoaWVyKHNzdGF0ZWJ1aWxkKQog
ICAgYmIudXRpbHMubWtkaXJoaWVyKG9zLnBhdGguZGlybmFtZShzc3RhdGVwa2cpKQogICAgZm9y
IHN0YXRlIGluIHNzWydkaXJzJ106CiAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKHN0YXRl
WzFdKToKICAgICAgICAgICAgY29udGludWUKICAgICAgICBzcmNiYXNlID0gc3RhdGVbMF0ucnN0
cmlwKCIvIikucnNwbGl0KCcvJywgMSlbMF0KICAgICAgICAjIEZpbmQgYW5kIGVycm9yIGZvciBh
YnNvbHV0ZSBzeW1saW5rcy4gV2UgY291bGQgYXR0ZW1wdCB0byByZWxvY2F0ZSBidXQgaXRzIG5v
dAogICAgICAgICMgY2xlYXIgd2hlcmUgdGhlIHN5bWxpbmsgaXMgcmVsYXRpdmUgdG8gaW4gdGhp
cyBjb250ZXh0LiBXZSBjb3VsZCBhZGQgdGhhdCBtYXJrdXAKICAgICAgICAjIHRvIHNzdGF0ZSB0
YXNrcyBidXQgdGhlcmUgYXJlbid0IG1hbnkgb2YgdGhlc2Ugc28gYmV0dGVyIGp1c3QgYXZvaWQg
dGhlbSBlbnRpcmVseS4KICAgICAgICBmb3Igd2Fsa3Jvb3QsIGRpcnMsIGZpbGVzIGluIG9zLndh
bGsoc3RhdGVbMV0pOgogICAgICAgICAgICBmb3IgZmlsZSBpbiBmaWxlcyArIGRpcnM6CiAgICAg
ICAgICAgICAgICBzcmNwYXRoID0gb3MucGF0aC5qb2luKHdhbGtyb290LCBmaWxlKQogICAgICAg
ICAgICAgICAgaWYgbm90IG9zLnBhdGguaXNsaW5rKHNyY3BhdGgpOgogICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICBsaW5rID0gb3MucmVhZGxpbmsoc3JjcGF0aCkK
ICAgICAgICAgICAgICAgIGlmIG5vdCBvcy5wYXRoLmlzYWJzKGxpbmspOgogICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICBpZiBub3QgbGluay5zdGFydHN3aXRoKHRt
cGRpcik6CiAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgICAgIGJiLmVy
cm9yKCJzc3RhdGUgZm91bmQgYW4gYWJzb2x1dGUgcGF0aCBzeW1saW5rICVzIHBvaW50aW5nIGF0
ICVzLiBQbGVhc2UgcmVwbGFjZSB0aGlzIHdpdGggYSByZWxhdGl2ZSBsaW5rLiIgJSAoc3JjcGF0
aCwgbGluaykpCiAgICAgICAgYmIuZGVidWcoMiwgIlByZXBhcmluZyB0cmVlICVzIGZvciBwYWNr
YWdpbmcgYXQgJXMiICUgKHN0YXRlWzFdLCBzc3RhdGVidWlsZCArIHN0YXRlWzBdKSkKICAgICAg
ICBvcy5yZW5hbWUoc3RhdGVbMV0sIHNzdGF0ZWJ1aWxkICsgc3RhdGVbMF0pCgogICAgd29ya2Rp
ciA9IGQuZ2V0VmFyKCdXT1JLRElSJykKICAgIHNoYXJlZHdvcmtkaXIgPSBvcy5wYXRoLmpvaW4o
ZC5nZXRWYXIoJ1RNUERJUicpLCAid29yay1zaGFyZWQiKQogICAgZm9yIHBsYWluIGluIHNzWydw
bGFpbmRpcnMnXToKICAgICAgICBwZGlyID0gcGxhaW4ucmVwbGFjZSh3b3JrZGlyLCBzc3RhdGVi
dWlsZCkKICAgICAgICBpZiBzaGFyZWR3b3JrZGlyIGluIHBsYWluOgogICAgICAgICAgICBwZGly
ID0gcGxhaW4ucmVwbGFjZShzaGFyZWR3b3JrZGlyLCBzc3RhdGVidWlsZCkKICAgICAgICBiYi51
dGlscy5ta2RpcmhpZXIocGxhaW4pCiAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKHBkaXIpCiAg
ICAgICAgb3MucmVuYW1lKHBsYWluLCBwZGlyKQoKICAgIGQuc2V0VmFyKCdTU1RBVEVfQlVJTERE
SVInLCBzc3RhdGVidWlsZCkKICAgIGQuc2V0VmFyKCdTU1RBVEVfUEtHJywgc3N0YXRlcGtnKQog
ICAgZC5zZXRWYXIoJ1NTVEFURV9JTlNURElSJywgc3N0YXRlYnVpbGQpCgogICAgaWYgZC5nZXRW
YXIoJ1NTVEFURV9TS0lQX0NSRUFUSU9OJykgPT0gJzEnOgogICAgICAgIHJldHVybgoKICAgIHNz
dGF0ZV9jcmVhdGVfcGFja2FnZSA9IFsnc3N0YXRlX3JlcG9ydF91bmloYXNoJywgJ3NzdGF0ZV9j
cmVhdGVfcGFja2FnZSddCiAgICBpZiBkLmdldFZhcignU1NUQVRFX1NJR19LRVknKToKICAgICAg
ICBzc3RhdGVfY3JlYXRlX3BhY2thZ2UuYXBwZW5kKCdzc3RhdGVfc2lnbl9wYWNrYWdlJykKCiAg
ICBmb3IgZiBpbiAoZC5nZXRWYXIoJ1NTVEFURUNSRUFURUZVTkNTJykgb3IgJycpLnNwbGl0KCkg
KyBcCiAgICAgICAgICAgICBzc3RhdGVfY3JlYXRlX3BhY2thZ2UgKyBcCiAgICAgICAgICAgICAo
ZC5nZXRWYXIoJ1NTVEFURVBPU1RDUkVBVEVGVU5DUycpIG9yICcnKS5zcGxpdCgpOgogICAgICAg
ICMgQWxsIGhvb2tzIHNob3VsZCBydW4gaW4gU1NUQVRFX0JVSUxERElSLgogICAgICAgIGJiLmJ1
aWxkLmV4ZWNfZnVuYyhmLCBkLCAoc3N0YXRlYnVpbGQsKSkKCiAgICBiYi5zaWdnZW4uZHVtcF90
aGlzX3Rhc2soc3N0YXRlcGtnICsgIi5zaWdpbmZvIiwgZCkKCiAgICByZXR1cm4KCmRlZiBzc3Rh
dGVfaW5pdCh0YXNrLCBkKToKICAgIHNzID0ge30KICAgIHNzWyd0YXNrJ10gPSB0YXNrCiAgICBz
c1snZGlycyddID0gW10KICAgIHNzWydwbGFpbmRpcnMnXSA9IFtdCiAgICBzc1snbG9ja2ZpbGVz
J10gPSBbXQogICAgc3NbJ2xvY2tmaWxlcy1zaGFyZWQnXSA9IFtdCiAgICByZXR1cm4gc3MKCmRl
ZiBzc3RhdGVfaW5zdGFsbChzcywgZCk6CiAgICBpbXBvcnQgb2UucGF0aAogICAgaW1wb3J0IG9l
LnNzdGF0ZXNpZwogICAgaW1wb3J0IHN1YnByb2Nlc3MKCiAgICBzaGFyZWRmaWxlcyA9IFtdCiAg
ICBzaGFyZWRkaXJzID0gW10KICAgIGJiLnV0aWxzLm1rZGlyaGllcihkLmV4cGFuZCgiJHtTU1RB
VEVfTUFOSUZFU1RTfSIpKQoKICAgIHNzdGF0ZWluc3QgPSBkLmV4cGFuZCgiJHtXT1JLRElSfS9z
c3RhdGUtaW5zdGFsbC0lcy8iICUgc3NbJ3Rhc2snXSkKCiAgICBtYW5pZmVzdCwgZDIgPSBvZS5z
c3RhdGVzaWcuc3N0YXRlX2dldF9tYW5pZmVzdF9maWxlbmFtZShzc1sndGFzayddLCBkKQoKICAg
IGlmIG9zLmFjY2VzcyhtYW5pZmVzdCwgb3MuUl9PSyk6CiAgICAgICAgYmIuZmF0YWwoIlBhY2th
Z2UgYWxyZWFkeSBzdGFnZWQgKCVzKT8hIiAlIG1hbmlmZXN0KQoKICAgIGQuc2V0VmFyKCJTU1RB
VEVfSU5TVF9QT1NUUk0iLCBtYW5pZmVzdCArICIucG9zdHJtIikKCiAgICBsb2NrcyA9IFtdCiAg
ICBmb3IgbG9jayBpbiBzc1snbG9ja2ZpbGVzLXNoYXJlZCddOgogICAgICAgIGxvY2tzLmFwcGVu
ZChiYi51dGlscy5sb2NrZmlsZShsb2NrLCBUcnVlKSkKICAgIGZvciBsb2NrIGluIHNzWydsb2Nr
ZmlsZXMnXToKICAgICAgICBsb2Nrcy5hcHBlbmQoYmIudXRpbHMubG9ja2ZpbGUobG9jaykpCgog
ICAgZm9yIHN0YXRlIGluIHNzWydkaXJzJ106CiAgICAgICAgYmIuZGVidWcoMiwgIlN0YWdpbmcg
ZmlsZXMgZnJvbSAlcyB0byAlcyIgJSAoc3RhdGVbMV0sIHN0YXRlWzJdKSkKICAgICAgICBmb3Ig
d2Fsa3Jvb3QsIGRpcnMsIGZpbGVzIGluIG9zLndhbGsoc3RhdGVbMV0pOgogICAgICAgICAgICBm
b3IgZmlsZSBpbiBmaWxlczoKICAgICAgICAgICAgICAgIHNyY3BhdGggPSBvcy5wYXRoLmpvaW4o
d2Fsa3Jvb3QsIGZpbGUpCiAgICAgICAgICAgICAgICBkc3RwYXRoID0gc3JjcGF0aC5yZXBsYWNl
KHN0YXRlWzFdLCBzdGF0ZVsyXSkKICAgICAgICAgICAgICAgICNiYi5kZWJ1ZygyLCAiU3RhZ2lu
ZyAlcyB0byAlcyIgJSAoc3JjcGF0aCwgZHN0cGF0aCkpCiAgICAgICAgICAgICAgICBzaGFyZWRm
aWxlcy5hcHBlbmQoZHN0cGF0aCkKICAgICAgICAgICAgZm9yIGRpciBpbiBkaXJzOgogICAgICAg
ICAgICAgICAgc3JjZGlyID0gb3MucGF0aC5qb2luKHdhbGtyb290LCBkaXIpCiAgICAgICAgICAg
ICAgICBkc3RkaXIgPSBzcmNkaXIucmVwbGFjZShzdGF0ZVsxXSwgc3RhdGVbMl0pCiAgICAgICAg
ICAgICAgICAjYmIuZGVidWcoMiwgIlN0YWdpbmcgJXMgdG8gJXMiICUgKHNyY2RpciwgZHN0ZGly
KSkKICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguaXNsaW5rKHNyY2Rpcik6CiAgICAgICAgICAg
ICAgICAgICAgc2hhcmVkZmlsZXMuYXBwZW5kKGRzdGRpcikKICAgICAgICAgICAgICAgICAgICBj
b250aW51ZQogICAgICAgICAgICAgICAgaWYgbm90IGRzdGRpci5lbmRzd2l0aCgiLyIpOgogICAg
ICAgICAgICAgICAgICAgIGRzdGRpciA9IGRzdGRpciArICIvIgogICAgICAgICAgICAgICAgc2hh
cmVkZGlycy5hcHBlbmQoZHN0ZGlyKQoKICAgICMgQ2hlY2sgdGhlIGZpbGUgbGlzdCBmb3IgY29u
ZmxpY3RzIGFnYWluc3QgZmlsZXMgd2hpY2ggYWxyZWFkeSBleGlzdAogICAgd2hpdGVsaXN0ID0g
KGQuZ2V0VmFyKCJTU1RBVEVfRFVQV0hJVEVMSVNUIikgb3IgIiIpLnNwbGl0KCkKICAgIG1hdGNo
ID0gW10KICAgIGZvciBmIGluIHNoYXJlZGZpbGVzOgogICAgICAgIGlmIG9zLnBhdGguZXhpc3Rz
KGYpIGFuZCBub3Qgb3MucGF0aC5pc2xpbmsoZik6CiAgICAgICAgICAgIGYgPSBvcy5wYXRoLm5v
cm1wYXRoKGYpCiAgICAgICAgICAgIHJlYWxtYXRjaCA9IFRydWUKICAgICAgICAgICAgZm9yIHcg
aW4gd2hpdGVsaXN0OgogICAgICAgICAgICAgICAgdyA9IG9zLnBhdGgubm9ybXBhdGgodykKICAg
ICAgICAgICAgICAgIGlmIGYuc3RhcnRzd2l0aCh3KToKICAgICAgICAgICAgICAgICAgICByZWFs
bWF0Y2ggPSBGYWxzZQogICAgICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgIGlmIHJl
YWxtYXRjaDoKICAgICAgICAgICAgICAgIG1hdGNoLmFwcGVuZChmKQogICAgICAgICAgICAgICAg
c3N0YXRlX3NlYXJjaF9jbWQgPSAiZ3JlcCAtcmxGICclcycgJXMgLS1leGNsdWRlPW1hc3Rlci5s
aXN0IHwgc2VkIC1lICdzOl4uKi86OiciICUgKGYsIGQuZXhwYW5kKCIke1NTVEFURV9NQU5JRkVT
VFN9IikpCiAgICAgICAgICAgICAgICBzZWFyY2hfb3V0cHV0ID0gc3VicHJvY2Vzcy5Qb3Blbihz
c3RhdGVfc2VhcmNoX2NtZCwgc2hlbGw9VHJ1ZSwgc3Rkb3V0PXN1YnByb2Nlc3MuUElQRSkuY29t
bXVuaWNhdGUoKVswXQogICAgICAgICAgICAgICAgaWYgc2VhcmNoX291dHB1dDoKICAgICAgICAg
ICAgICAgICAgICBtYXRjaC5hcHBlbmQoIiAgKG1hdGNoZWQgaW4gJXMpIiAlIHNlYXJjaF9vdXRw
dXQuZGVjb2RlKCd1dGYtOCcpLnJzdHJpcCgpKQogICAgICAgICAgICAgICAgZWxzZToKICAgICAg
ICAgICAgICAgICAgICBtYXRjaC5hcHBlbmQoIiAgKG5vdCBtYXRjaGVkIHRvIGFueSB0YXNrKSIp
CiAgICBpZiBtYXRjaDoKICAgICAgICBiYi5lcnJvcigiVGhlIHJlY2lwZSAlcyBpcyB0cnlpbmcg
dG8gaW5zdGFsbCBmaWxlcyBpbnRvIGEgc2hhcmVkICIgXAogICAgICAgICAgImFyZWEgd2hlbiB0
aG9zZSBmaWxlcyBhbHJlYWR5IGV4aXN0LiBUaG9zZSBmaWxlcyBhbmQgdGhlaXIgbWFuaWZlc3Qg
IiBcCiAgICAgICAgICAibG9jYXRpb24gYXJlOlxuICAlc1xuUGxlYXNlIHZlcmlmeSB3aGljaCBy
ZWNpcGUgc2hvdWxkIHByb3ZpZGUgdGhlICIgXAogICAgICAgICAgImFib3ZlIGZpbGVzLlxuXG5U
aGUgYnVpbGQgaGFzIHN0b3BwZWQsIGFzIGNvbnRpbnVpbmcgaW4gdGhpcyBzY2VuYXJpbyBXSUxM
ICIgXAogICAgICAgICAgImJyZWFrIHRoaW5ncyAtIGlmIG5vdCBub3csIHBvc3NpYmx5IGluIHRo
ZSBmdXR1cmUgKHdlJ3ZlIHNlZW4gYnVpbGRzIGZhaWwgIiBcCiAgICAgICAgICAic2V2ZXJhbCBt
b250aHMgbGF0ZXIpLiBJZiB0aGUgc3lzdGVtIGtuZXcgaG93IHRvIHJlY292ZXIgZnJvbSB0aGlz
ICIgXAogICAgICAgICAgImF1dG9tYXRpY2FsbHkgaXQgd291bGQsIGhvd2V2ZXIgdGhlcmUgYXJl
IHNldmVyYWwgZGlmZmVyZW50IHNjZW5hcmlvcyAiIFwKICAgICAgICAgICJ3aGljaCBjYW4gcmVz
dWx0IGluIHRoaXMgYW5kIHdlIGRvbid0IGtub3cgd2hpY2ggb25lIHRoaXMgaXMuIEl0IG1heSBi
ZSAiIFwKICAgICAgICAgICJ5b3UgaGF2ZSBzd2l0Y2hlZCBwcm92aWRlcnMgb2Ygc29tZXRoaW5n
IGxpa2UgdmlydHVhbC9rZXJuZWwgKGUuZy4gZnJvbSAiIFwKICAgICAgICAgICJsaW51eC15b2N0
byB0byBsaW51eC15b2N0by1kZXYpLCBpbiB0aGF0IGNhc2UgeW91IG5lZWQgdG8gZXhlY3V0ZSB0
aGUgIiBcCiAgICAgICAgICAiY2xlYW4gdGFzayBmb3IgYm90aCByZWNpcGVzIGFuZCBpdCB3aWxs
IHJlc29sdmUgdGhpcyBlcnJvci4gSXQgbWF5IGJlICIgXAogICAgICAgICAgInlvdSBjaGFuZ2Vk
IERJU1RST19GRUFUVVJFUyBmcm9tIHN5c3RlbWQgdG8gdWRldiBvciB2aWNlIHZlcnNhLiBDbGVh
bmluZyAiIFwKICAgICAgICAgICJ0aG9zZSByZWNpcGVzIHNob3VsZCBhZ2FpbiByZXNvbHZlIHRo
aXMgZXJyb3IsIGhvd2V2ZXIgc3dpdGNoaW5nICIgXAogICAgICAgICAgIkRJU1RST19GRUFUVVJF
UyBvbiBhbiBleGlzdGluZyBidWlsZCBkaXJlY3RvcnkgaXMgbm90IHN1cHBvcnRlZCAtIHlvdSAi
IFwKICAgICAgICAgICJzaG91bGQgcmVhbGx5IGNsZWFuIG91dCB0bXAgYW5kIHJlYnVpbGQgKHJl
dXNpbmcgc3N0YXRlIHNob3VsZCBiZSBzYWZlKS4gIiBcCiAgICAgICAgICAiSXQgY291bGQgYmUg
dGhlIG92ZXJsYXBwaW5nIGZpbGVzIGRldGVjdGVkIGFyZSBoYXJtbGVzcyBpbiB3aGljaCBjYXNl
ICIgXAogICAgICAgICAgImFkZGluZyB0aGVtIHRvIFNTVEFURV9EVVBXSElURUxJU1QgbWF5IGJl
IHRoZSBjb3JyZWN0IHNvbHV0aW9uLiBJdCBjb3VsZCAiIFwKICAgICAgICAgICJhbHNvIGJlIHlv
dXIgYnVpbGQgaXMgaW5jbHVkaW5nIHR3byBkaWZmZXJlbnQgY29uZmxpY3RpbmcgdmVyc2lvbnMg
b2YgIiBcCiAgICAgICAgICAidGhpbmdzIChlLmcuIGJsdWV6IDQgYW5kIGJsdWV6IDUgYW5kIHRo
ZSBjb3JyZWN0IHNvbHV0aW9uIGZvciB0aGF0IHdvdWxkICIgXAogICAgICAgICAgImJlIHRvIHJl
c29sdmUgdGhlIGNvbmZsaWN0LiBJZiBpbiBkb3VidCwgcGxlYXNlIGFzayBvbiB0aGUgbWFpbGlu
ZyBsaXN0LCAiIFwKICAgICAgICAgICJzaGFyaW5nIHRoZSBlcnJvciBhbmQgZmlsZWxpc3QgYWJv
dmUuIiAlIFwKICAgICAgICAgIChkLmdldFZhcignUE4nKSwgIlxuICAiLmpvaW4obWF0Y2gpKSkK
ICAgICAgICBiYi5mYXRhbCgiSWYgdGhlIGFib3ZlIG1lc3NhZ2UgaXMgdG9vIG11Y2gsIHRoZSBz
aW1wbGVyIHZlcnNpb24gaXMgeW91J3JlIGFkdmlzZWQgdG8gd2lwZSBvdXQgdG1wIGFuZCByZWJ1
aWxkIChyZXVzaW5nIHNzdGF0ZSBpcyBmaW5lKS4gVGhhdCB3aWxsIGxpa2VseSBmaXggdGhpbmdz
IGluIG1vc3QgKGJ1dCBub3QgYWxsKSBjYXNlcy4iKQoKICAgIGlmIHNzWydmaXhtZWRpciddIGFu
ZCBvcy5wYXRoLmV4aXN0cyhzc1snZml4bWVkaXInXSArICIvZml4bWVwYXRoLmNtZCIpOgogICAg
ICAgIHNoYXJlZGZpbGVzLmFwcGVuZChzc1snZml4bWVkaXInXSArICIvZml4bWVwYXRoLmNtZCIp
CiAgICAgICAgc2hhcmVkZmlsZXMuYXBwZW5kKHNzWydmaXhtZWRpciddICsgIi9maXhtZXBhdGgi
KQoKICAgICMgV3JpdGUgb3V0IHRoZSBtYW5pZmVzdAogICAgZiA9IG9wZW4obWFuaWZlc3QsICJ3
IikKICAgIGZvciBmaWxlIGluIHNoYXJlZGZpbGVzOgogICAgICAgIGYud3JpdGUoZmlsZSArICJc
biIpCgogICAgIyBXZSB3YW50IHRvIGVuc3VyZSB0aGF0IGRpcmVjdG9yaWVzIGFwcGVhciBhdCB0
aGUgZW5kIG9mIHRoZSBtYW5pZmVzdAogICAgIyBzbyB0aGF0IHdoZW4gd2UgdGVzdCB0byBzZWUg
aWYgdGhleSBzaG91bGQgYmUgZGVsZXRlZCBhbnkgY29udGVudHMKICAgICMgYWRkZWQgYnkgdGhl
IHRhc2sgd2lsbCBoYXZlIGJlZW4gcmVtb3ZlZCBmaXJzdC4KICAgIGRpcnMgPSBzb3J0ZWQoc2hh
cmVkZGlycywga2V5PWxlbikKICAgICMgTXVzdCByZW1vdmUgY2hpbGRyZW4gZmlyc3QsIHdoaWNo
IHdpbGwgaGF2ZSBhIGxvbmdlciBwYXRoIHRoYW4gdGhlIHBhcmVudAogICAgZm9yIGRpIGluIHJl
dmVyc2VkKGRpcnMpOgogICAgICAgIGYud3JpdGUoZGkgKyAiXG4iKQogICAgZi5jbG9zZSgpCgog
ICAgIyBBcHBlbmQgdG8gdGhlIGxpc3Qgb2YgbWFuaWZlc3RzIGZvciB0aGlzIFBBQ0tBR0VfQVJD
SAoKICAgIGkgPSBkMi5leHBhbmQoIiR7U1NUQVRFX01BTklGRVNUU30vaW5kZXgtJHtTU1RBVEVf
TUFOTUFDSH0iKQogICAgbCA9IGJiLnV0aWxzLmxvY2tmaWxlKGkgKyAiLmxvY2siKQogICAgZmls
ZWRhdGEgPSBkLmdldFZhcigiU1RBTVAiKSArICIgIiArIGQyLmdldFZhcigiU1NUQVRFX01BTkZJ
TEVQUkVGSVgiKSArICIgIiArIGQuZ2V0VmFyKCJXT1JLRElSIikgKyAiXG4iCiAgICBtYW5pZmVz
dHMgPSBbXQogICAgaWYgb3MucGF0aC5leGlzdHMoaSk6CiAgICAgICAgd2l0aCBvcGVuKGksICJy
IikgYXMgZjoKICAgICAgICAgICAgbWFuaWZlc3RzID0gZi5yZWFkbGluZXMoKQogICAgaWYgZmls
ZWRhdGEgbm90IGluIG1hbmlmZXN0czoKICAgICAgICB3aXRoIG9wZW4oaSwgImErIikgYXMgZjoK
ICAgICAgICAgICAgZi53cml0ZShmaWxlZGF0YSkKICAgIGJiLnV0aWxzLnVubG9ja2ZpbGUobCkK
CiAgICAjIFJ1biB0aGUgYWN0dWFsIGZpbGUgaW5zdGFsbAogICAgZm9yIHN0YXRlIGluIHNzWydk
aXJzJ106CiAgICAgICAgaWYgb3MucGF0aC5leGlzdHMoc3RhdGVbMV0pOgogICAgICAgICAgICBv
ZS5wYXRoLmNvcHloYXJkbGlua3RyZWUoc3RhdGVbMV0sIHN0YXRlWzJdKQoKICAgIGZvciBwb3N0
aW5zdCBpbiAoZC5nZXRWYXIoJ1NTVEFURVBPU1RJTlNURlVOQ1MnKSBvciAnJykuc3BsaXQoKToK
ICAgICAgICAjIEFsbCBob29rcyBzaG91bGQgcnVuIGluIHRoZSBTU1RBVEVfSU5TVERJUgogICAg
ICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYyhwb3N0aW5zdCwgZCwgKHNzdGF0ZWluc3QsKSkKCiAgICBm
b3IgbG9jayBpbiBsb2NrczoKICAgICAgICBiYi51dGlscy51bmxvY2tmaWxlKGxvY2spCgpkZWYg
c3N0YXRlX2FkZChzcywgc291cmNlLCBkZXN0LCBkKToKICAgIGlmIG5vdCBzb3VyY2UuZW5kc3dp
dGgoIi8iKToKICAgICAgICAgc291cmNlID0gc291cmNlICsgIi8iCiAgICBpZiBub3QgZGVzdC5l
bmRzd2l0aCgiLyIpOgogICAgICAgICBkZXN0ID0gZGVzdCArICIvIgogICAgc291cmNlID0gb3Mu
cGF0aC5ub3JtcGF0aChzb3VyY2UpCiAgICBkZXN0ID0gb3MucGF0aC5ub3JtcGF0aChkZXN0KQog
ICAgc3JjYmFzZSA9IG9zLnBhdGguYmFzZW5hbWUoc291cmNlKQogICAgc3NbJ2RpcnMnXS5hcHBl
bmQoW3NyY2Jhc2UsIHNvdXJjZSwgZGVzdF0pCiAgICByZXR1cm4gc3MKCmRlZiBidWlsZGhpc3Rv
cnlfZW1pdF9wa2doaXN0b3J5KGQpOgogICAgaWYgZC5nZXRWYXIoJ0JCX0NVUlJFTlRUQVNLJykg
aW4gWydwb3B1bGF0ZV9zeXNyb290JywgJ3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUnXToKICAg
ICAgICBiYi5idWlsZC5leGVjX2Z1bmMoImJ1aWxkaGlzdG9yeV9lbWl0X3N5c3Jvb3QiLCBkKQoK
ICAgIGlmIG5vdCBkLmdldFZhcignQkJfQ1VSUkVOVFRBU0snKSBpbiBbJ3BhY2thZ2VkYXRhJywg
J3BhY2thZ2VkYXRhX3NldHNjZW5lJ106CiAgICAgICAgcmV0dXJuIDAKCiAgICBpZiBub3QgInBh
Y2thZ2UiIGluIChkLmdldFZhcignQlVJTERISVNUT1JZX0ZFQVRVUkVTJykgb3IgIiIpLnNwbGl0
KCk6CiAgICAgICAgcmV0dXJuIDAKCiAgICBpbXBvcnQgcmUKICAgIGltcG9ydCBqc29uCiAgICBp
bXBvcnQgc2hsZXgKICAgIGltcG9ydCBlcnJubwoKICAgIHBrZ2hpc3RkaXIgPSBkLmdldFZhcign
QlVJTERISVNUT1JZX0RJUl9QQUNLQUdFJykKICAgIG9sZHBrZ2hpc3RkaXIgPSBkLmdldFZhcign
QlVJTERISVNUT1JZX09MRF9ESVJfUEFDS0FHRScpCgogICAgY2xhc3MgUmVjaXBlSW5mbzoKICAg
ICAgICBkZWYgX19pbml0X18oc2VsZiwgbmFtZSk6CiAgICAgICAgICAgIHNlbGYubmFtZSA9IG5h
bWUKICAgICAgICAgICAgc2VsZi5wZSA9ICIwIgogICAgICAgICAgICBzZWxmLnB2ID0gIjAiCiAg
ICAgICAgICAgIHNlbGYucHIgPSAicjAiCiAgICAgICAgICAgIHNlbGYuZGVwZW5kcyA9ICIiCiAg
ICAgICAgICAgIHNlbGYucGFja2FnZXMgPSAiIgogICAgICAgICAgICBzZWxmLnNyY3JldiA9ICIi
CiAgICAgICAgICAgIHNlbGYubGF5ZXIgPSAiIgoKCiAgICBjbGFzcyBQYWNrYWdlSW5mbzoKICAg
ICAgICBkZWYgX19pbml0X18oc2VsZiwgbmFtZSk6CiAgICAgICAgICAgIHNlbGYubmFtZSA9IG5h
bWUKICAgICAgICAgICAgc2VsZi5wZSA9ICIwIgogICAgICAgICAgICBzZWxmLnB2ID0gIjAiCiAg
ICAgICAgICAgIHNlbGYucHIgPSAicjAiCiAgICAgICAgICAgICMgcGtnL3BrZ2UvcGtndi9wa2dy
IHNob3VsZCBiZSBlbXB0eSBiZWNhdXNlIHdlIHdhbnQgdG8gYmUgYWJsZSB0byBkZWZhdWx0IHRo
ZW0KICAgICAgICAgICAgc2VsZi5wa2cgPSAiIgogICAgICAgICAgICBzZWxmLnBrZ2UgPSAiIgog
ICAgICAgICAgICBzZWxmLnBrZ3YgPSAiIgogICAgICAgICAgICBzZWxmLnBrZ3IgPSAiIgogICAg
ICAgICAgICBzZWxmLnNpemUgPSAwCiAgICAgICAgICAgIHNlbGYuZGVwZW5kcyA9ICIiCiAgICAg
ICAgICAgIHNlbGYucnByb3ZpZGVzID0gIiIKICAgICAgICAgICAgc2VsZi5yZGVwZW5kcyA9ICIi
CiAgICAgICAgICAgIHNlbGYucnJlY29tbWVuZHMgPSAiIgogICAgICAgICAgICBzZWxmLnJzdWdn
ZXN0cyA9ICIiCiAgICAgICAgICAgIHNlbGYucnJlcGxhY2VzID0gIiIKICAgICAgICAgICAgc2Vs
Zi5yY29uZmxpY3RzID0gIiIKICAgICAgICAgICAgc2VsZi5maWxlcyA9ICIiCiAgICAgICAgICAg
IHNlbGYuZmlsZWxpc3QgPSAiIgogICAgICAgICAgICAjIFZhcmlhYmxlcyB0aGF0IG5lZWQgdG8g
YmUgd3JpdHRlbiB0byB0aGVpciBvd24gc2VwYXJhdGUgZmlsZQogICAgICAgICAgICBzZWxmLmZp
bGV2YXJzID0gZGljdC5mcm9ta2V5cyhbJ3BrZ19wcmVpbnN0JywgJ3BrZ19wb3N0aW5zdCcsICdw
a2dfcHJlcm0nLCAncGtnX3Bvc3RybSddKQoKICAgICMgU2hvdWxkIGNoZWNrIFBBQ0tBR0VTIGhl
cmUgdG8gc2VlIGlmIGFueXRoaW5nIHJlbW92ZWQKCiAgICBkZWYgcmVhZFBhY2thZ2VJbmZvKHBr
ZywgaGlzdGZpbGUpOgogICAgICAgIHBrZ2luZm8gPSBQYWNrYWdlSW5mbyhwa2cpCiAgICAgICAg
d2l0aCBvcGVuKGhpc3RmaWxlLCAiciIpIGFzIGY6CiAgICAgICAgICAgIGZvciBsaW5lIGluIGY6
CiAgICAgICAgICAgICAgICBsbnMgPSBsaW5lLnNwbGl0KCc9JywgMSkKICAgICAgICAgICAgICAg
IG5hbWUgPSBsbnNbMF0uc3RyaXAoKQogICAgICAgICAgICAgICAgdmFsdWUgPSBsbnNbMV0uc3Ry
aXAoIiBcdFxyXG4iKS5zdHJpcCgnIicpCiAgICAgICAgICAgICAgICBpZiBuYW1lID09ICJQRSI6
CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5wZSA9IHZhbHVlCiAgICAgICAgICAgICAgICBl
bGlmIG5hbWUgPT0gIlBWIjoKICAgICAgICAgICAgICAgICAgICBwa2dpbmZvLnB2ID0gdmFsdWUK
ICAgICAgICAgICAgICAgIGVsaWYgbmFtZSA9PSAiUFIiOgogICAgICAgICAgICAgICAgICAgIHBr
Z2luZm8ucHIgPSB2YWx1ZQogICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJQS0ciOgogICAg
ICAgICAgICAgICAgICAgIHBrZ2luZm8ucGtnID0gdmFsdWUKICAgICAgICAgICAgICAgIGVsaWYg
bmFtZSA9PSAiUEtHRSI6CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5wa2dlID0gdmFsdWUK
ICAgICAgICAgICAgICAgIGVsaWYgbmFtZSA9PSAiUEtHViI6CiAgICAgICAgICAgICAgICAgICAg
cGtnaW5mby5wa2d2ID0gdmFsdWUKICAgICAgICAgICAgICAgIGVsaWYgbmFtZSA9PSAiUEtHUiI6
CiAgICAgICAgICAgICAgICAgICAgcGtnaW5mby5wa2dyID0gdmFsdWUKICAgICAgICAgICAgICAg
IGVsaWYgbmFtZSA9PSAiUlBST1ZJREVTIjoKICAgICAgICAgICAgICAgICAgICBwa2dpbmZvLnJw
cm92aWRlcyA9IHZhbHVlCiAgICAgICAgICAgICAgICBlbGlmIG5hbWUgPT0gIlJERVBFTkRTIjoK
ICAgICAgICAgICAgICAgICAgICBwa2dpbmZvLnJkZXBlbmRzID0gdmFsdWUKICAgICAgICAgICAg
ICAgIGVsaWYgbmFtZSA9PSAiUlJFQ09NTUVORFMiOgogICAgICAgICAgICAgICAgICAgIHBrZ2lu
Zm8ucnJlY29tbWVuZHMgPSB2YWx1ZQogICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJSU1VH
R0VTVFMiOgogICAgICAgICAgICAgICAgICAgIHBrZ2luZm8ucnN1Z2dlc3RzID0gdmFsdWUKICAg
ICAgICAgICAgICAgIGVsaWYgbmFtZSA9PSAiUlJFUExBQ0VTIjoKICAgICAgICAgICAgICAgICAg
ICBwa2dpbmZvLnJyZXBsYWNlcyA9IHZhbHVlCiAgICAgICAgICAgICAgICBlbGlmIG5hbWUgPT0g
IlJDT05GTElDVFMiOgogICAgICAgICAgICAgICAgICAgIHBrZ2luZm8ucmNvbmZsaWN0cyA9IHZh
bHVlCiAgICAgICAgICAgICAgICBlbGlmIG5hbWUgPT0gIlBLR1NJWkUiOgogICAgICAgICAgICAg
ICAgICAgIHBrZ2luZm8uc2l6ZSA9IGludCh2YWx1ZSkKICAgICAgICAgICAgICAgIGVsaWYgbmFt
ZSA9PSAiRklMRVMiOgogICAgICAgICAgICAgICAgICAgIHBrZ2luZm8uZmlsZXMgPSB2YWx1ZQog
ICAgICAgICAgICAgICAgZWxpZiBuYW1lID09ICJGSUxFTElTVCI6CiAgICAgICAgICAgICAgICAg
ICAgcGtnaW5mby5maWxlbGlzdCA9IHZhbHVlCiAgICAgICAgIyBBcHBseSBkZWZhdWx0cwogICAg
ICAgIGlmIG5vdCBwa2dpbmZvLnBrZzoKICAgICAgICAgICAgcGtnaW5mby5wa2cgPSBwa2dpbmZv
Lm5hbWUKICAgICAgICBpZiBub3QgcGtnaW5mby5wa2dlOgogICAgICAgICAgICBwa2dpbmZvLnBr
Z2UgPSBwa2dpbmZvLnBlCiAgICAgICAgaWYgbm90IHBrZ2luZm8ucGtndjoKICAgICAgICAgICAg
cGtnaW5mby5wa2d2ID0gcGtnaW5mby5wdgogICAgICAgIGlmIG5vdCBwa2dpbmZvLnBrZ3I6CiAg
ICAgICAgICAgIHBrZ2luZm8ucGtnciA9IHBrZ2luZm8ucHIKICAgICAgICByZXR1cm4gcGtnaW5m
bwoKICAgIGRlZiBnZXRsYXN0cGtndmVyc2lvbihwa2cpOgogICAgICAgIHRyeToKICAgICAgICAg
ICAgaGlzdGZpbGUgPSBvcy5wYXRoLmpvaW4ob2xkcGtnaGlzdGRpciwgcGtnLCAibGF0ZXN0IikK
ICAgICAgICAgICAgcmV0dXJuIHJlYWRQYWNrYWdlSW5mbyhwa2csIGhpc3RmaWxlKQogICAgICAg
IGV4Y2VwdCBFbnZpcm9ubWVudEVycm9yOgogICAgICAgICAgICByZXR1cm4gTm9uZQoKICAgIGRl
ZiBzb3J0cGtnbGlzdChzdHJpbmcpOgogICAgICAgIHBrZ2l0ZXIgPSByZS5maW5kaXRlcihyJ1th
LXpBLVowLTkuKy1dKyggXChbPjw9XStbXildK1wpKT8nLCBzdHJpbmcsIDApCiAgICAgICAgcGtn
bGlzdCA9IFtwLmdyb3VwKDApIGZvciBwIGluIHBrZ2l0ZXJdCiAgICAgICAgcGtnbGlzdC5zb3J0
KCkKICAgICAgICByZXR1cm4gJyAnLmpvaW4ocGtnbGlzdCkKCiAgICBkZWYgc29ydGxpc3Qoc3Ry
aW5nKToKICAgICAgICBpdGVtcyA9IHN0cmluZy5zcGxpdCgnICcpCiAgICAgICAgaXRlbXMuc29y
dCgpCiAgICAgICAgcmV0dXJuICcgJy5qb2luKGl0ZW1zKQoKICAgIHBuID0gZC5nZXRWYXIoJ1BO
JykKICAgIHBlID0gZC5nZXRWYXIoJ1BFJykgb3IgIjAiCiAgICBwdiA9IGQuZ2V0VmFyKCdQVicp
CiAgICBwciA9IGQuZ2V0VmFyKCdQUicpCiAgICBsYXllciA9IGJiLnV0aWxzLmdldF9maWxlX2xh
eWVyKGQuZ2V0VmFyKCdGSUxFJyksIGQpCgogICAgcGtnZGF0YV9kaXIgPSBkLmdldFZhcignUEtH
REFUQV9ESVInKQogICAgcGFja2FnZXMgPSAiIgogICAgdHJ5OgogICAgICAgIHdpdGggb3Blbihv
cy5wYXRoLmpvaW4ocGtnZGF0YV9kaXIsIHBuKSkgYXMgZjoKICAgICAgICAgICAgZm9yIGxpbmUg
aW4gZi5yZWFkbGluZXMoKToKICAgICAgICAgICAgICAgIGlmIGxpbmUuc3RhcnRzd2l0aCgnUEFD
S0FHRVM6ICcpOgogICAgICAgICAgICAgICAgICAgIHBhY2thZ2VzID0gb2UudXRpbHMuc3F1YXNo
c3BhY2VzKGxpbmUuc3BsaXQoJzogJywgMSlbMV0pCiAgICAgICAgICAgICAgICAgICAgYnJlYWsK
ICAgIGV4Y2VwdCBJT0Vycm9yIGFzIGU6CiAgICAgICAgaWYgZS5lcnJubyA9PSBlcnJuby5FTk9F
TlQ6CiAgICAgICAgICAgICMgUHJvYmFibHkgYSAtY3Jvc3MgcmVjaXBlLCBqdXN0IGlnbm9yZQog
ICAgICAgICAgICByZXR1cm4gMAogICAgICAgIGVsc2U6CiAgICAgICAgICAgIHJhaXNlCgogICAg
cGFja2FnZWxpc3QgPSBwYWNrYWdlcy5zcGxpdCgpCiAgICBwcmVzZXJ2ZSA9IGQuZ2V0VmFyKCdC
VUlMREhJU1RPUllfUFJFU0VSVkUnKS5zcGxpdCgpCiAgICBpZiBub3Qgb3MucGF0aC5leGlzdHMo
cGtnaGlzdGRpcik6CiAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKHBrZ2hpc3RkaXIpCiAgICBl
bHNlOgogICAgICAgICMgUmVtb3ZlIGZpbGVzIGZvciBwYWNrYWdlcyB0aGF0IG5vIGxvbmdlciBl
eGlzdAogICAgICAgIGZvciBpdGVtIGluIG9zLmxpc3RkaXIocGtnaGlzdGRpcik6CiAgICAgICAg
ICAgIGlmIGl0ZW0gbm90IGluIHByZXNlcnZlOgogICAgICAgICAgICAgICAgaWYgaXRlbSBub3Qg
aW4gcGFja2FnZWxpc3Q6CiAgICAgICAgICAgICAgICAgICAgaXRlbXBhdGggPSBvcy5wYXRoLmpv
aW4ocGtnaGlzdGRpciwgaXRlbSkKICAgICAgICAgICAgICAgICAgICBpZiBvcy5wYXRoLmlzZGly
KGl0ZW1wYXRoKToKICAgICAgICAgICAgICAgICAgICAgICAgZm9yIHN1YmZpbGUgaW4gb3MubGlz
dGRpcihpdGVtcGF0aCk6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcy51bmxpbmsob3Mu
cGF0aC5qb2luKGl0ZW1wYXRoLCBzdWJmaWxlKSkKICAgICAgICAgICAgICAgICAgICAgICAgb3Mu
cm1kaXIoaXRlbXBhdGgpCiAgICAgICAgICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAg
ICAgICAgICAgb3MudW5saW5rKGl0ZW1wYXRoKQoKICAgIHJjcGluZm8gPSBSZWNpcGVJbmZvKHBu
KQogICAgcmNwaW5mby5wZSA9IHBlCiAgICByY3BpbmZvLnB2ID0gcHYKICAgIHJjcGluZm8ucHIg
PSBwcgogICAgcmNwaW5mby5kZXBlbmRzID0gc29ydGxpc3Qob2UudXRpbHMuc3F1YXNoc3BhY2Vz
KGQuZ2V0VmFyKCdERVBFTkRTJykgb3IgIiIpKQogICAgcmNwaW5mby5wYWNrYWdlcyA9IHBhY2th
Z2VzCiAgICByY3BpbmZvLmxheWVyID0gbGF5ZXIKICAgIHdyaXRlX3JlY2lwZWhpc3RvcnkocmNw
aW5mbywgZCkKCiAgICBwa2dkZXN0ID0gZC5nZXRWYXIoJ1BLR0RFU1QnKQogICAgZm9yIHBrZyBp
biBwYWNrYWdlbGlzdDoKICAgICAgICBwa2dkYXRhID0ge30KICAgICAgICB3aXRoIG9wZW4ob3Mu
cGF0aC5qb2luKHBrZ2RhdGFfZGlyLCAncnVudGltZScsIHBrZykpIGFzIGY6CiAgICAgICAgICAg
IGZvciBsaW5lIGluIGYucmVhZGxpbmVzKCk6CiAgICAgICAgICAgICAgICBpdGVtID0gbGluZS5y
c3RyaXAoJ1xuJykuc3BsaXQoJzogJywgMSkKICAgICAgICAgICAgICAgIGtleSA9IGl0ZW1bMF0K
ICAgICAgICAgICAgICAgIGlmIGtleS5lbmRzd2l0aCgnXycgKyBwa2cpOgogICAgICAgICAgICAg
ICAgICAgIGtleSA9IGtleVs6LWxlbihwa2cpLTFdCiAgICAgICAgICAgICAgICBwa2dkYXRhW2tl
eV0gPSBpdGVtWzFdLmVuY29kZSgnbGF0aW4tMScpLmRlY29kZSgndW5pY29kZV9lc2NhcGUnKQoK
ICAgICAgICBwa2dlID0gcGtnZGF0YS5nZXQoJ1BLR0UnLCAnMCcpCiAgICAgICAgcGtndiA9IHBr
Z2RhdGFbJ1BLR1YnXQogICAgICAgIHBrZ3IgPSBwa2dkYXRhWydQS0dSJ10KICAgICAgICAjCiAg
ICAgICAgIyBGaW5kIG91dCB3aGF0IHRoZSBsYXN0IHZlcnNpb24gd2FzCiAgICAgICAgIyBNYWtl
IHN1cmUgdGhlIHZlcnNpb24gZGlkIG5vdCBkZWNyZWFzZQogICAgICAgICMKICAgICAgICBsYXN0
dmVyc2lvbiA9IGdldGxhc3Rwa2d2ZXJzaW9uKHBrZykKICAgICAgICBpZiBsYXN0dmVyc2lvbjoK
ICAgICAgICAgICAgbGFzdF9wa2dlID0gbGFzdHZlcnNpb24ucGtnZQogICAgICAgICAgICBsYXN0
X3BrZ3YgPSBsYXN0dmVyc2lvbi5wa2d2CiAgICAgICAgICAgIGxhc3RfcGtnciA9IGxhc3R2ZXJz
aW9uLnBrZ3IKICAgICAgICAgICAgciA9IGJiLnV0aWxzLnZlcmNtcCgocGtnZSwgcGtndiwgcGtn
ciksIChsYXN0X3BrZ2UsIGxhc3RfcGtndiwgbGFzdF9wa2dyKSkKICAgICAgICAgICAgaWYgciA8
IDA6CiAgICAgICAgICAgICAgICBtc2cgPSAiUGFja2FnZSB2ZXJzaW9uIGZvciBwYWNrYWdlICVz
IHdlbnQgYmFja3dhcmRzIHdoaWNoIHdvdWxkIGJyZWFrIHBhY2thZ2UgZmVlZHMgZnJvbSAoJXM6
JXMtJXMgdG8gJXM6JXMtJXMpIiAlIChwa2csIGxhc3RfcGtnZSwgbGFzdF9wa2d2LCBsYXN0X3Br
Z3IsIHBrZ2UsIHBrZ3YsIHBrZ3IpCiAgICAgICAgICAgICAgICBwYWNrYWdlX3FhX2hhbmRsZV9l
cnJvcigidmVyc2lvbi1nb2luZy1iYWNrd2FyZHMiLCBtc2csIGQpCgogICAgICAgIHBrZ2luZm8g
PSBQYWNrYWdlSW5mbyhwa2cpCiAgICAgICAgIyBBcHBhcmVudGx5IHRoZSB2ZXJzaW9uIGNhbiBi
ZSBkaWZmZXJlbnQgb24gYSBwZXItcGFja2FnZSBiYXNpcyAoc2VlIFB5dGhvbikKICAgICAgICBw
a2dpbmZvLnBlID0gcGtnZGF0YS5nZXQoJ1BFJywgJzAnKQogICAgICAgIHBrZ2luZm8ucHYgPSBw
a2dkYXRhWydQViddCiAgICAgICAgcGtnaW5mby5wciA9IHBrZ2RhdGFbJ1BSJ10KICAgICAgICBw
a2dpbmZvLnBrZyA9IHBrZ2RhdGFbJ1BLRyddCiAgICAgICAgcGtnaW5mby5wa2dlID0gcGtnZQog
ICAgICAgIHBrZ2luZm8ucGtndiA9IHBrZ3YKICAgICAgICBwa2dpbmZvLnBrZ3IgPSBwa2dyCiAg
ICAgICAgcGtnaW5mby5ycHJvdmlkZXMgPSBzb3J0cGtnbGlzdChvZS51dGlscy5zcXVhc2hzcGFj
ZXMocGtnZGF0YS5nZXQoJ1JQUk9WSURFUycsICIiKSkpCiAgICAgICAgcGtnaW5mby5yZGVwZW5k
cyA9IHNvcnRwa2dsaXN0KG9lLnV0aWxzLnNxdWFzaHNwYWNlcyhwa2dkYXRhLmdldCgnUkRFUEVO
RFMnLCAiIikpKQogICAgICAgIHBrZ2luZm8ucnJlY29tbWVuZHMgPSBzb3J0cGtnbGlzdChvZS51
dGlscy5zcXVhc2hzcGFjZXMocGtnZGF0YS5nZXQoJ1JSRUNPTU1FTkRTJywgIiIpKSkKICAgICAg
ICBwa2dpbmZvLnJzdWdnZXN0cyA9IHNvcnRwa2dsaXN0KG9lLnV0aWxzLnNxdWFzaHNwYWNlcyhw
a2dkYXRhLmdldCgnUlNVR0dFU1RTJywgIiIpKSkKICAgICAgICBwa2dpbmZvLnJyZXBsYWNlcyA9
IHNvcnRwa2dsaXN0KG9lLnV0aWxzLnNxdWFzaHNwYWNlcyhwa2dkYXRhLmdldCgnUlJFUExBQ0VT
JywgIiIpKSkKICAgICAgICBwa2dpbmZvLnJjb25mbGljdHMgPSBzb3J0cGtnbGlzdChvZS51dGls
cy5zcXVhc2hzcGFjZXMocGtnZGF0YS5nZXQoJ1JDT05GTElDVFMnLCAiIikpKQogICAgICAgIHBr
Z2luZm8uZmlsZXMgPSBvZS51dGlscy5zcXVhc2hzcGFjZXMocGtnZGF0YS5nZXQoJ0ZJTEVTJywg
IiIpKQogICAgICAgIGZvciBmaWxldmFyIGluIHBrZ2luZm8uZmlsZXZhcnM6CiAgICAgICAgICAg
IHBrZ2luZm8uZmlsZXZhcnNbZmlsZXZhcl0gPSBwa2dkYXRhLmdldChmaWxldmFyLCAiIikKCiAg
ICAgICAgIyBHYXRoZXIgaW5mb3JtYXRpb24gYWJvdXQgcGFja2FnZWQgZmlsZXMKICAgICAgICB2
YWwgPSBwa2dkYXRhLmdldCgnRklMRVNfSU5GTycsICcnKQogICAgICAgIGRpY3R2YWwgPSBqc29u
LmxvYWRzKHZhbCkKICAgICAgICBmaWxlbGlzdCA9IGxpc3QoZGljdHZhbC5rZXlzKCkpCiAgICAg
ICAgZmlsZWxpc3Quc29ydCgpCiAgICAgICAgcGtnaW5mby5maWxlbGlzdCA9ICIgIi5qb2luKFtz
aGxleC5xdW90ZSh4KSBmb3IgeCBpbiBmaWxlbGlzdF0pCgogICAgICAgIHBrZ2luZm8uc2l6ZSA9
IGludChwa2dkYXRhWydQS0dTSVpFJ10pCgogICAgICAgIHdyaXRlX3BrZ2hpc3RvcnkocGtnaW5m
bywgZCkKCiAgICAjIENyZWF0ZSBmaWxlcy1pbi08cGFja2FnZS1uYW1lPi50eHQgZmlsZXMgY29u
dGFpbmluZyBhIGxpc3Qgb2YgZmlsZXMgb2YgZWFjaCByZWNpcGUncyBwYWNrYWdlCiAgICBiYi5i
dWlsZC5leGVjX2Z1bmMoImJ1aWxkaGlzdG9yeV9saXN0X3BrZ19maWxlcyIsIGQpCgpkZWYgcGFj
a2FnZV9xYV9oYW5kbGVfZXJyb3IoZXJyb3JfY2xhc3MsIGVycm9yX21zZywgZCk6CiAgICBpZiBl
cnJvcl9jbGFzcyBpbiAoZC5nZXRWYXIoIkVSUk9SX1FBIikgb3IgIiIpLnNwbGl0KCk6CiAgICAg
ICAgcGFja2FnZV9xYV93cml0ZV9lcnJvcihlcnJvcl9jbGFzcywgZXJyb3JfbXNnLCBkKQogICAg
ICAgIGJiLmVycm9yKCJRQSBJc3N1ZTogJXMgWyVzXSIgJSAoZXJyb3JfbXNnLCBlcnJvcl9jbGFz
cykpCiAgICAgICAgZC5zZXRWYXIoIlFBX1NBTkUiLCBGYWxzZSkKICAgICAgICByZXR1cm4gRmFs
c2UKICAgIGVsaWYgZXJyb3JfY2xhc3MgaW4gKGQuZ2V0VmFyKCJXQVJOX1FBIikgb3IgIiIpLnNw
bGl0KCk6CiAgICAgICAgcGFja2FnZV9xYV93cml0ZV9lcnJvcihlcnJvcl9jbGFzcywgZXJyb3Jf
bXNnLCBkKQogICAgICAgIGJiLndhcm4oIlFBIElzc3VlOiAlcyBbJXNdIiAlIChlcnJvcl9tc2cs
IGVycm9yX2NsYXNzKSkKICAgIGVsc2U6CiAgICAgICAgYmIubm90ZSgiUUEgSXNzdWU6ICVzIFsl
c10iICUgKGVycm9yX21zZywgZXJyb3JfY2xhc3MpKQogICAgcmV0dXJuIFRydWUKCmRlZiB3cml0
ZV9wa2doaXN0b3J5KHBrZ2luZm8sIGQpOgogICAgYmIuZGVidWcoMiwgIldyaXRpbmcgcGFja2Fn
ZSBoaXN0b3J5IGZvciBwYWNrYWdlICVzIiAlIHBrZ2luZm8ubmFtZSkKCiAgICBwa2doaXN0ZGly
ID0gZC5nZXRWYXIoJ0JVSUxESElTVE9SWV9ESVJfUEFDS0FHRScpCgogICAgcGtncGF0aCA9IG9z
LnBhdGguam9pbihwa2doaXN0ZGlyLCBwa2dpbmZvLm5hbWUpCiAgICBpZiBub3Qgb3MucGF0aC5l
eGlzdHMocGtncGF0aCk6CiAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKHBrZ3BhdGgpCgogICAg
aW5mb2ZpbGUgPSBvcy5wYXRoLmpvaW4ocGtncGF0aCwgImxhdGVzdCIpCiAgICB3aXRoIG9wZW4o
aW5mb2ZpbGUsICJ3IikgYXMgZjoKICAgICAgICBpZiBwa2dpbmZvLnBlICE9ICIwIjoKICAgICAg
ICAgICAgZi53cml0ZSh1IlBFID0gJXNcbiIgJSAgcGtnaW5mby5wZSkKICAgICAgICBmLndyaXRl
KHUiUFYgPSAlc1xuIiAlICBwa2dpbmZvLnB2KQogICAgICAgIGYud3JpdGUodSJQUiA9ICVzXG4i
ICUgIHBrZ2luZm8ucHIpCgogICAgICAgIGlmIHBrZ2luZm8ucGtnICE9IHBrZ2luZm8ubmFtZToK
ICAgICAgICAgICAgZi53cml0ZSh1IlBLRyA9ICVzXG4iICUgcGtnaW5mby5wa2cpCiAgICAgICAg
aWYgcGtnaW5mby5wa2dlICE9IHBrZ2luZm8ucGU6CiAgICAgICAgICAgIGYud3JpdGUodSJQS0dF
ID0gJXNcbiIgJSBwa2dpbmZvLnBrZ2UpCiAgICAgICAgaWYgcGtnaW5mby5wa2d2ICE9IHBrZ2lu
Zm8ucHY6CiAgICAgICAgICAgIGYud3JpdGUodSJQS0dWID0gJXNcbiIgJSBwa2dpbmZvLnBrZ3Yp
CiAgICAgICAgaWYgcGtnaW5mby5wa2dyICE9IHBrZ2luZm8ucHI6CiAgICAgICAgICAgIGYud3Jp
dGUodSJQS0dSID0gJXNcbiIgJSBwa2dpbmZvLnBrZ3IpCiAgICAgICAgZi53cml0ZSh1IlJQUk9W
SURFUyA9ICVzXG4iICUgIHBrZ2luZm8ucnByb3ZpZGVzKQogICAgICAgIGYud3JpdGUodSJSREVQ
RU5EUyA9ICVzXG4iICUgIHBrZ2luZm8ucmRlcGVuZHMpCiAgICAgICAgZi53cml0ZSh1IlJSRUNP
TU1FTkRTID0gJXNcbiIgJSAgcGtnaW5mby5ycmVjb21tZW5kcykKICAgICAgICBpZiBwa2dpbmZv
LnJzdWdnZXN0czoKICAgICAgICAgICAgZi53cml0ZSh1IlJTVUdHRVNUUyA9ICVzXG4iICUgIHBr
Z2luZm8ucnN1Z2dlc3RzKQogICAgICAgIGlmIHBrZ2luZm8ucnJlcGxhY2VzOgogICAgICAgICAg
ICBmLndyaXRlKHUiUlJFUExBQ0VTID0gJXNcbiIgJSAgcGtnaW5mby5ycmVwbGFjZXMpCiAgICAg
ICAgaWYgcGtnaW5mby5yY29uZmxpY3RzOgogICAgICAgICAgICBmLndyaXRlKHUiUkNPTkZMSUNU
UyA9ICVzXG4iICUgIHBrZ2luZm8ucmNvbmZsaWN0cykKICAgICAgICBmLndyaXRlKHUiUEtHU0la
RSA9ICVkXG4iICUgIHBrZ2luZm8uc2l6ZSkKICAgICAgICBmLndyaXRlKHUiRklMRVMgPSAlc1xu
IiAlICBwa2dpbmZvLmZpbGVzKQogICAgICAgIGYud3JpdGUodSJGSUxFTElTVCA9ICVzXG4iICUg
IHBrZ2luZm8uZmlsZWxpc3QpCgogICAgZm9yIGZpbGV2YXIgaW4gcGtnaW5mby5maWxldmFyczoK
ICAgICAgICBmaWxldmFycGF0aCA9IG9zLnBhdGguam9pbihwa2dwYXRoLCAibGF0ZXN0LiVzIiAl
IGZpbGV2YXIpCiAgICAgICAgdmFsID0gcGtnaW5mby5maWxldmFyc1tmaWxldmFyXQogICAgICAg
IGlmIHZhbDoKICAgICAgICAgICAgd2l0aCBvcGVuKGZpbGV2YXJwYXRoLCAidyIpIGFzIGY6CiAg
ICAgICAgICAgICAgICBmLndyaXRlKHZhbCkKICAgICAgICBlbHNlOgogICAgICAgICAgICBpZiBv
cy5wYXRoLmV4aXN0cyhmaWxldmFycGF0aCk6CiAgICAgICAgICAgICAgICBvcy51bmxpbmsoZmls
ZXZhcnBhdGgpCgojCiMgcm9vdGZzX3R5cGUgY2FuIGJlOiBpbWFnZSwgc2RrX3RhcmdldCwgc2Rr
X2hvc3QKIwoKZGVmIHdyaXRlX3JlY2lwZWhpc3RvcnkocmNwaW5mbywgZCk6CiAgICBiYi5kZWJ1
ZygyLCAiV3JpdGluZyByZWNpcGUgaGlzdG9yeSIpCgogICAgcGtnaGlzdGRpciA9IGQuZ2V0VmFy
KCdCVUlMREhJU1RPUllfRElSX1BBQ0tBR0UnKQoKICAgIGluZm9maWxlID0gb3MucGF0aC5qb2lu
KHBrZ2hpc3RkaXIsICJsYXRlc3QiKQogICAgd2l0aCBvcGVuKGluZm9maWxlLCAidyIpIGFzIGY6
CiAgICAgICAgaWYgcmNwaW5mby5wZSAhPSAiMCI6CiAgICAgICAgICAgIGYud3JpdGUodSJQRSA9
ICVzXG4iICUgIHJjcGluZm8ucGUpCiAgICAgICAgZi53cml0ZSh1IlBWID0gJXNcbiIgJSAgcmNw
aW5mby5wdikKICAgICAgICBmLndyaXRlKHUiUFIgPSAlc1xuIiAlICByY3BpbmZvLnByKQogICAg
ICAgIGYud3JpdGUodSJERVBFTkRTID0gJXNcbiIgJSAgcmNwaW5mby5kZXBlbmRzKQogICAgICAg
IGYud3JpdGUodSJQQUNLQUdFUyA9ICVzXG4iICUgIHJjcGluZm8ucGFja2FnZXMpCiAgICAgICAg
Zi53cml0ZSh1IkxBWUVSID0gJXNcbiIgJSAgcmNwaW5mby5sYXllcikKCiAgICB3cml0ZV9sYXRl
c3Rfc3JjcmV2KGQsIHBrZ2hpc3RkaXIpCgpkZWYgd3JpdGVfbGF0ZXN0X3NyY3JldihkLCBwa2do
aXN0ZGlyKToKICAgIHNyY3JldmZpbGUgPSBvcy5wYXRoLmpvaW4ocGtnaGlzdGRpciwgJ2xhdGVz
dF9zcmNyZXYnKQoKICAgIHNyY3JldnMsIHRhZ19zcmNyZXZzID0gX2dldF9zcmNyZXZfdmFsdWVz
KGQpCiAgICBpZiBzcmNyZXZzOgogICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhwa2doaXN0
ZGlyKToKICAgICAgICAgICAgYmIudXRpbHMubWtkaXJoaWVyKHBrZ2hpc3RkaXIpCiAgICAgICAg
b2xkX3RhZ19zcmNyZXZzID0ge30KICAgICAgICBpZiBvcy5wYXRoLmV4aXN0cyhzcmNyZXZmaWxl
KToKICAgICAgICAgICAgd2l0aCBvcGVuKHNyY3JldmZpbGUpIGFzIGY6CiAgICAgICAgICAgICAg
ICBmb3IgbGluZSBpbiBmOgogICAgICAgICAgICAgICAgICAgIGlmIGxpbmUuc3RhcnRzd2l0aCgn
IyB0YWdfJyk6CiAgICAgICAgICAgICAgICAgICAgICAgIGtleSwgdmFsdWUgPSBsaW5lLnNwbGl0
KCI9IiwgMSkKICAgICAgICAgICAgICAgICAgICAgICAga2V5ID0ga2V5LnJlcGxhY2UoJyMgdGFn
XycsICcnKS5zdHJpcCgpCiAgICAgICAgICAgICAgICAgICAgICAgIHZhbHVlID0gdmFsdWUucmVw
bGFjZSgnIicsICcnKS5zdHJpcCgpCiAgICAgICAgICAgICAgICAgICAgICAgIG9sZF90YWdfc3Jj
cmV2c1trZXldID0gdmFsdWUKICAgICAgICB3aXRoIG9wZW4oc3JjcmV2ZmlsZSwgJ3cnKSBhcyBm
OgogICAgICAgICAgICBvcmlnX3NyY3JldiA9IGQuZ2V0VmFyKCdTUkNSRVYnLCBGYWxzZSkgb3Ig
J0lOVkFMSUQnCiAgICAgICAgICAgIGlmIG9yaWdfc3JjcmV2ICE9ICdJTlZBTElEJzoKICAgICAg
ICAgICAgICAgIGYud3JpdGUoJyMgU1JDUkVWID0gIiVzIlxuJyAlIG9yaWdfc3JjcmV2KQogICAg
ICAgICAgICBpZiBsZW4oc3JjcmV2cykgPiAxOgogICAgICAgICAgICAgICAgZm9yIG5hbWUsIHNy
Y3JldiBpbiBzb3J0ZWQoc3JjcmV2cy5pdGVtcygpKToKICAgICAgICAgICAgICAgICAgICBvcmln
X3NyY3JldiA9IGQuZ2V0VmFyKCdTUkNSRVZfJXMnICUgbmFtZSwgRmFsc2UpCiAgICAgICAgICAg
ICAgICAgICAgaWYgb3JpZ19zcmNyZXY6CiAgICAgICAgICAgICAgICAgICAgICAgIGYud3JpdGUo
JyMgU1JDUkVWXyVzID0gIiVzIlxuJyAlIChuYW1lLCBvcmlnX3NyY3JldikpCiAgICAgICAgICAg
ICAgICAgICAgZi53cml0ZSgnU1JDUkVWXyVzID0gIiVzIlxuJyAlIChuYW1lLCBzcmNyZXYpKQog
ICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgZi53cml0ZSgnU1JDUkVWID0gIiVzIlxu
JyAlIG5leHQoaXRlcihzcmNyZXZzLnZhbHVlcygpKSkpCiAgICAgICAgICAgIGlmIGxlbih0YWdf
c3JjcmV2cykgPiAwOgogICAgICAgICAgICAgICAgZm9yIG5hbWUsIHNyY3JldiBpbiBzb3J0ZWQo
dGFnX3NyY3JldnMuaXRlbXMoKSk6CiAgICAgICAgICAgICAgICAgICAgZi53cml0ZSgnIyB0YWdf
JXMgPSAiJXMiXG4nICUgKG5hbWUsIHNyY3JldikpCiAgICAgICAgICAgICAgICAgICAgaWYgbmFt
ZSBpbiBvbGRfdGFnX3NyY3JldnMgYW5kIG9sZF90YWdfc3JjcmV2c1tuYW1lXSAhPSBzcmNyZXY6
CiAgICAgICAgICAgICAgICAgICAgICAgIHBrZyA9IGQuZ2V0VmFyKCdQTicpCiAgICAgICAgICAg
ICAgICAgICAgICAgIGJiLndhcm4oIlJldmlzaW9uIGZvciB0YWcgJXMgaW4gcGFja2FnZSAlcyB3
YXMgY2hhbmdlZCBzaW5jZSBsYXN0IGJ1aWxkIChmcm9tICVzIHRvICVzKSIgJSAobmFtZSwgcGtn
LCBvbGRfdGFnX3NyY3JldnNbbmFtZV0sIHNyY3JldikpCgogICAgZWxzZToKICAgICAgICBpZiBv
cy5wYXRoLmV4aXN0cyhzcmNyZXZmaWxlKToKICAgICAgICAgICAgb3MucmVtb3ZlKHNyY3JldmZp
bGUpCgpkZWYgcGFja2FnZV9xYV93cml0ZV9lcnJvcih0eXBlLCBlcnJvciwgZCk6CiAgICBsb2dm
aWxlID0gZC5nZXRWYXIoJ1FBX0xPR0ZJTEUnKQogICAgaWYgbG9nZmlsZToKICAgICAgICBwID0g
ZC5nZXRWYXIoJ1AnKQogICAgICAgIHdpdGggb3Blbihsb2dmaWxlLCAiYSsiKSBhcyBmOgogICAg
ICAgICAgICBmLndyaXRlKCIlczogJXMgWyVzXVxuIiAlIChwLCBlcnJvciwgdHlwZSkpCgpkZWYg
X2dldF9zcmNyZXZfdmFsdWVzKGQpOgogICAgIiIiCiAgICBSZXR1cm4gdGhlIHZlcnNpb24gc3Ry
aW5ncyBmb3IgdGhlIGN1cnJlbnQgcmVjaXBlCiAgICAiIiIKCiAgICBzY21zID0gW10KICAgIGZl
dGNoZXIgPSBiYi5mZXRjaC5GZXRjaChkLmdldFZhcignU1JDX1VSSScpLnNwbGl0KCksIGQpCiAg
ICB1cmxkYXRhID0gZmV0Y2hlci51ZAogICAgZm9yIHUgaW4gdXJsZGF0YToKICAgICAgICBpZiB1
cmxkYXRhW3VdLm1ldGhvZC5zdXBwb3J0c19zcmNyZXYoKToKICAgICAgICAgICAgc2Ntcy5hcHBl
bmQodSkKCiAgICBhdXRvaW5jX3RlbXBsID0gJ0FVVE9JTkMrJwogICAgZGljdF9zcmNyZXZzID0g
e30KICAgIGRpY3RfdGFnX3NyY3JldnMgPSB7fQogICAgZm9yIHNjbSBpbiBzY21zOgogICAgICAg
IHVkID0gdXJsZGF0YVtzY21dCiAgICAgICAgZm9yIG5hbWUgaW4gdWQubmFtZXM6CiAgICAgICAg
ICAgIHRyeToKICAgICAgICAgICAgICAgIHJldiA9IHVkLm1ldGhvZC5zb3J0YWJsZV9yZXZpc2lv
bih1ZCwgZCwgbmFtZSkKICAgICAgICAgICAgZXhjZXB0IFR5cGVFcnJvcjoKICAgICAgICAgICAg
ICAgICMgc3VwcG9ydCBvbGQgYml0YmFrZSB2ZXJzaW9ucwogICAgICAgICAgICAgICAgcmV2ID0g
dWQubWV0aG9kLnNvcnRhYmxlX3JldmlzaW9uKHNjbSwgdWQsIGQsIG5hbWUpCiAgICAgICAgICAg
ICMgQ2xlYW4gdGhpcyB1cCB3aGVuIHdlIG5leHQgYnVtcCBiaXRiYWtlIHZlcnNpb24KICAgICAg
ICAgICAgaWYgdHlwZShyZXYpICE9IHN0cjoKICAgICAgICAgICAgICAgIGF1dG9pbmMsIHJldiA9
IHJldgogICAgICAgICAgICBlbGlmIHJldi5zdGFydHN3aXRoKGF1dG9pbmNfdGVtcGwpOgogICAg
ICAgICAgICAgICAgcmV2ID0gcmV2W2xlbihhdXRvaW5jX3RlbXBsKTpdCiAgICAgICAgICAgIGRp
Y3Rfc3JjcmV2c1tuYW1lXSA9IHJldgogICAgICAgICAgICBpZiAndGFnJyBpbiB1ZC5wYXJtOgog
ICAgICAgICAgICAgICAgdGFnID0gdWQucGFybVsndGFnJ107CiAgICAgICAgICAgICAgICBrZXkg
PSBuYW1lKydfJyt0YWcKICAgICAgICAgICAgICAgIGRpY3RfdGFnX3NyY3JldnNba2V5XSA9IHJl
dgogICAgcmV0dXJuIChkaWN0X3NyY3JldnMsIGRpY3RfdGFnX3NyY3JldnMpCgo=
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.sstate_task_prefunc.14593"
Content-Disposition: attachment; filename="run.sstate_task_prefunc.14593"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3c750>
X-Attachment-Id: f_jz9oy3c750

ZGVmIHNzdGF0ZV90YXNrX3ByZWZ1bmMoZCk6CiAgICBzaGFyZWRfc3RhdGUgPSBzc3RhdGVfc3Rh
dGVfZnJvbXZhcnMoZCkKICAgIHNzdGF0ZV9jbGVhbihzaGFyZWRfc3RhdGUsIGQpCgpzc3RhdGVf
dGFza19wcmVmdW5jKGQpCgpkZWYgc3N0YXRlX3N0YXRlX2Zyb212YXJzKGQsIHRhc2sgPSBOb25l
KToKICAgIGlmIHRhc2sgaXMgTm9uZToKICAgICAgICB0YXNrID0gZC5nZXRWYXIoJ0JCX0NVUlJF
TlRUQVNLJykKICAgICAgICBpZiBub3QgdGFzazoKICAgICAgICAgICAgYmIuZmF0YWwoInNzdGF0
ZSBjb2RlIHJ1bm5pbmcgd2l0aG91dCB0YXNrIGNvbnRleHQ/ISIpCiAgICAgICAgdGFzayA9IHRh
c2sucmVwbGFjZSgiX3NldHNjZW5lIiwgIiIpCgogICAgaWYgdGFzay5zdGFydHN3aXRoKCJkb18i
KToKICAgICAgICB0YXNrID0gdGFza1szOl0KICAgIGlucHV0cyA9IChkLmdldFZhckZsYWcoImRv
XyIgKyB0YXNrLCAnc3N0YXRlLWlucHV0ZGlycycpIG9yICIiKS5zcGxpdCgpCiAgICBvdXRwdXRz
ID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtb3V0cHV0ZGlycycpIG9yICIi
KS5zcGxpdCgpCiAgICBwbGFpbmRpcnMgPSAoZC5nZXRWYXJGbGFnKCJkb18iICsgdGFzaywgJ3Nz
dGF0ZS1wbGFpbmRpcnMnKSBvciAiIikuc3BsaXQoKQogICAgbG9ja2ZpbGVzID0gKGQuZ2V0VmFy
RmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtbG9ja2ZpbGUnKSBvciAiIikuc3BsaXQoKQogICAg
bG9ja2ZpbGVzc2hhcmVkID0gKGQuZ2V0VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtbG9j
a2ZpbGUtc2hhcmVkJykgb3IgIiIpLnNwbGl0KCkKICAgIGludGVyY2VwdGZ1bmNzID0gKGQuZ2V0
VmFyRmxhZygiZG9fIiArIHRhc2ssICdzc3RhdGUtaW50ZXJjZXB0ZnVuY3MnKSBvciAiIikuc3Bs
aXQoKQogICAgZml4bWVkaXIgPSBkLmdldFZhckZsYWcoImRvXyIgKyB0YXNrLCAnc3N0YXRlLWZp
eG1lZGlyJykgb3IgIiIKICAgIGlmIG5vdCB0YXNrIG9yIGxlbihpbnB1dHMpICE9IGxlbihvdXRw
dXRzKToKICAgICAgICBiYi5mYXRhbCgic3N0YXRlIHZhcmlhYmxlcyBub3Qgc2V0dXAgY29ycmVj
dGx5PyEiKQoKICAgIGlmIHRhc2sgPT0gInBvcHVsYXRlX2xpYyI6CiAgICAgICAgZC5zZXRWYXIo
IlNTVEFURV9QS0dTUEVDIiwgIiR7U1NUQVRFX1NXU1BFQ30iKQogICAgICAgIGQuc2V0VmFyKCJT
U1RBVEVfRVhUUkFQQVRIIiwgIiIpCiAgICAgICAgZC5zZXRWYXIoJ1NTVEFURV9FWFRSQVBBVEhX
SUxEQ0FSRCcsICIiKQoKICAgIHNzID0gc3N0YXRlX2luaXQodGFzaywgZCkKICAgIGZvciBpIGlu
IHJhbmdlKGxlbihpbnB1dHMpKToKICAgICAgICBzc3RhdGVfYWRkKHNzLCBpbnB1dHNbaV0sIG91
dHB1dHNbaV0sIGQpCiAgICBzc1snbG9ja2ZpbGVzJ10gPSBsb2NrZmlsZXMKICAgIHNzWydsb2Nr
ZmlsZXMtc2hhcmVkJ10gPSBsb2NrZmlsZXNzaGFyZWQKICAgIHNzWydwbGFpbmRpcnMnXSA9IHBs
YWluZGlycwogICAgc3NbJ2ludGVyY2VwdGZ1bmNzJ10gPSBpbnRlcmNlcHRmdW5jcwogICAgc3Nb
J2ZpeG1lZGlyJ10gPSBmaXhtZWRpcgogICAgcmV0dXJuIHNzCgpkZWYgc3N0YXRlX2NsZWFuKHNz
LCBkKToKICAgIGltcG9ydCBvZS5wYXRoCiAgICBpbXBvcnQgZ2xvYgoKICAgIGQyID0gZC5jcmVh
dGVDb3B5KCkKICAgIHN0YW1wX2NsZWFuID0gZC5nZXRWYXIoIlNUQU1QQ0xFQU4iKQogICAgZXh0
cmFpbmYgPSBkLmdldFZhckZsYWcoImRvXyIgKyBzc1sndGFzayddLCAnc3RhbXAtZXh0cmEtaW5m
bycpCiAgICBpZiBleHRyYWluZjoKICAgICAgICBkMi5zZXRWYXIoIlNTVEFURV9NQU5NQUNIIiwg
ZXh0cmFpbmYpCiAgICAgICAgd2lsZGNhcmRfc3RmaWxlID0gIiVzLmRvXyVzKi4lcyIgJSAoc3Rh
bXBfY2xlYW4sIHNzWyd0YXNrJ10sIGV4dHJhaW5mKQogICAgZWxzZToKICAgICAgICB3aWxkY2Fy
ZF9zdGZpbGUgPSAiJXMuZG9fJXMqIiAlIChzdGFtcF9jbGVhbiwgc3NbJ3Rhc2snXSkKCiAgICBt
YW5pZmVzdCA9IGQyLmV4cGFuZCgiJHtTU1RBVEVfTUFORklMRVBSRUZJWH0uJXMiICUgc3NbJ3Rh
c2snXSkKCiAgICBpZiBvcy5wYXRoLmV4aXN0cyhtYW5pZmVzdCk6CiAgICAgICAgbG9ja3MgPSBb
XQogICAgICAgIGZvciBsb2NrIGluIHNzWydsb2NrZmlsZXMtc2hhcmVkJ106CiAgICAgICAgICAg
IGxvY2tzLmFwcGVuZChiYi51dGlscy5sb2NrZmlsZShsb2NrKSkKICAgICAgICBmb3IgbG9jayBp
biBzc1snbG9ja2ZpbGVzJ106CiAgICAgICAgICAgIGxvY2tzLmFwcGVuZChiYi51dGlscy5sb2Nr
ZmlsZShsb2NrKSkKCiAgICAgICAgc3N0YXRlX2NsZWFuX21hbmlmZXN0KG1hbmlmZXN0LCBkKQoK
ICAgICAgICBmb3IgbG9jayBpbiBsb2NrczoKICAgICAgICAgICAgYmIudXRpbHMudW5sb2NrZmls
ZShsb2NrKQoKICAgICMgUmVtb3ZlIHRoZSBjdXJyZW50IGFuZCBwcmV2aW91cyBzdGFtcHMsIGJ1
dCBrZWVwIHRoZSBzaWdkYXRhLgogICAgIwogICAgIyBUaGUgZ2xvYigpIG1hdGNoZXMgZG9fdGFz
ayogd2hpY2ggbWF5IG1hdGNoIG11bHRpcGxlIHRhc2tzLCBmb3IKICAgICMgZXhhbXBsZTogZG9f
cGFja2FnZSBhbmQgZG9fcGFja2FnZV93cml0ZV9pcGssIHNvIHdlIG5lZWQgdG8KICAgICMgZXhh
Y3RseSBtYXRjaCAqLmRvX3Rhc2suKiBhbmQgKi5kb190YXNrX3NldHNjZW5lLioKICAgIHJtX3N0
YW1wID0gJy5kb18lcy4nICUgc3NbJ3Rhc2snXQogICAgcm1fc2V0c2NlbmUgPSAnLmRvXyVzX3Nl
dHNjZW5lLicgJSBzc1sndGFzayddCiAgICAjIEZvciBCQl9TSUdOQVRVUkVfSEFORExFUiA9ICJu
b29wIgogICAgcm1fbm9oYXNoID0gIi5kb18lcyIgJSBzc1sndGFzayddCiAgICBmb3Igc3RmaWxl
IGluIGdsb2IuZ2xvYih3aWxkY2FyZF9zdGZpbGUpOgogICAgICAgICMgS2VlcCB0aGUgc2lnZGF0
YQogICAgICAgIGlmICIuc2lnZGF0YS4iIGluIHN0ZmlsZSBvciAiLnNpZ2Jhc2VkYXRhLiIgaW4g
c3RmaWxlOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgICMgUHJlc2VydmUgdGFpbnQgZmls
ZXMgaW4gdGhlIHN0YW1wcyBkaXJlY3RvcnkKICAgICAgICBpZiBzdGZpbGUuZW5kc3dpdGgoJy50
YWludCcpOgogICAgICAgICAgICBjb250aW51ZQogICAgICAgIGlmIHJtX3N0YW1wIGluIHN0Zmls
ZSBvciBybV9zZXRzY2VuZSBpbiBzdGZpbGUgb3IgXAogICAgICAgICAgICAgICAgc3RmaWxlLmVu
ZHN3aXRoKHJtX25vaGFzaCk6CiAgICAgICAgICAgIG9lLnBhdGgucmVtb3ZlKHN0ZmlsZSkKCmRl
ZiBzc3RhdGVfaW5pdCh0YXNrLCBkKToKICAgIHNzID0ge30KICAgIHNzWyd0YXNrJ10gPSB0YXNr
CiAgICBzc1snZGlycyddID0gW10KICAgIHNzWydwbGFpbmRpcnMnXSA9IFtdCiAgICBzc1snbG9j
a2ZpbGVzJ10gPSBbXQogICAgc3NbJ2xvY2tmaWxlcy1zaGFyZWQnXSA9IFtdCiAgICByZXR1cm4g
c3MKCmRlZiBzc3RhdGVfYWRkKHNzLCBzb3VyY2UsIGRlc3QsIGQpOgogICAgaWYgbm90IHNvdXJj
ZS5lbmRzd2l0aCgiLyIpOgogICAgICAgICBzb3VyY2UgPSBzb3VyY2UgKyAiLyIKICAgIGlmIG5v
dCBkZXN0LmVuZHN3aXRoKCIvIik6CiAgICAgICAgIGRlc3QgPSBkZXN0ICsgIi8iCiAgICBzb3Vy
Y2UgPSBvcy5wYXRoLm5vcm1wYXRoKHNvdXJjZSkKICAgIGRlc3QgPSBvcy5wYXRoLm5vcm1wYXRo
KGRlc3QpCiAgICBzcmNiYXNlID0gb3MucGF0aC5iYXNlbmFtZShzb3VyY2UpCiAgICBzc1snZGly
cyddLmFwcGVuZChbc3JjYmFzZSwgc291cmNlLCBkZXN0XSkKICAgIHJldHVybiBzcwoKZGVmIHNz
dGF0ZV9jbGVhbl9tYW5pZmVzdChtYW5pZmVzdCwgZCwgcHJlZml4PU5vbmUpOgogICAgaW1wb3J0
IG9lLnBhdGgKCiAgICBtZmlsZSA9IG9wZW4obWFuaWZlc3QpCiAgICBlbnRyaWVzID0gbWZpbGUu
cmVhZGxpbmVzKCkKICAgIG1maWxlLmNsb3NlKCkKCiAgICBmb3IgZW50cnkgaW4gZW50cmllczoK
ICAgICAgICBlbnRyeSA9IGVudHJ5LnN0cmlwKCkKICAgICAgICBpZiBwcmVmaXggYW5kIG5vdCBl
bnRyeS5zdGFydHN3aXRoKCIvIik6CiAgICAgICAgICAgIGVudHJ5ID0gcHJlZml4ICsgIi8iICsg
ZW50cnkKICAgICAgICBiYi5kZWJ1ZygyLCAiUmVtb3ZpbmcgbWFuaWZlc3Q6ICVzIiAlIGVudHJ5
KQogICAgICAgICMgV2UgY2FuIHJhY2UgYWdhaW5zdCBhbm90aGVyIHBhY2thZ2UgcG9wdWxhdGlu
ZyBkaXJlY3RvcmllcyBhcyB3ZSdyZSByZW1vdmluZyB0aGVtCiAgICAgICAgIyBzbyB3ZSBpZ25v
cmUgZXJyb3JzIGhlcmUuCiAgICAgICAgdHJ5OgogICAgICAgICAgICBpZiBlbnRyeS5lbmRzd2l0
aCgiLyIpOgogICAgICAgICAgICAgICAgaWYgb3MucGF0aC5pc2xpbmsoZW50cnlbOi0xXSk6CiAg
ICAgICAgICAgICAgICAgICAgb3MucmVtb3ZlKGVudHJ5WzotMV0pCiAgICAgICAgICAgICAgICBl
bGlmIG9zLnBhdGguZXhpc3RzKGVudHJ5KSBhbmQgbGVuKG9zLmxpc3RkaXIoZW50cnkpKSA9PSAw
OgogICAgICAgICAgICAgICAgICAgIG9zLnJtZGlyKGVudHJ5WzotMV0pCiAgICAgICAgICAgIGVs
c2U6CiAgICAgICAgICAgICAgICBvcy5yZW1vdmUoZW50cnkpCiAgICAgICAgZXhjZXB0IE9TRXJy
b3I6CiAgICAgICAgICAgIHBhc3MKCiAgICBwb3N0cm0gPSBtYW5pZmVzdCArICIucG9zdHJtIgog
ICAgaWYgb3MucGF0aC5leGlzdHMobWFuaWZlc3QgKyAiLnBvc3RybSIpOgogICAgICAgIGltcG9y
dCBzdWJwcm9jZXNzCiAgICAgICAgb3MuY2htb2QocG9zdHJtLCAwbzc1NSkKICAgICAgICBzdWJw
cm9jZXNzLmNoZWNrX2NhbGwocG9zdHJtLCBzaGVsbD1UcnVlKQogICAgICAgIG9lLnBhdGgucmVt
b3ZlKHBvc3RybSkKCiAgICBvZS5wYXRoLnJlbW92ZShtYW5pZmVzdCkKCg==
--0000000000001277a5058ffd4170
Content-Type: application/octet-stream; name="run.write_srcrev.14470"
Content-Disposition: attachment; filename="run.write_srcrev.14470"
Content-Transfer-Encoding: base64
Content-ID: <f_jz9oy3cb51>
X-Attachment-Id: f_jz9oy3cb51

ZGVmIHdyaXRlX3NyY3JldihkKToKICAgIHdyaXRlX2xhdGVzdF9zcmNyZXYoZCwgZC5nZXRWYXIo
J0JVSUxESElTVE9SWV9ESVJfUEFDS0FHRScpKQoKd3JpdGVfc3JjcmV2KGQpCgpkZWYgd3JpdGVf
bGF0ZXN0X3NyY3JldihkLCBwa2doaXN0ZGlyKToKICAgIHNyY3JldmZpbGUgPSBvcy5wYXRoLmpv
aW4ocGtnaGlzdGRpciwgJ2xhdGVzdF9zcmNyZXYnKQoKICAgIHNyY3JldnMsIHRhZ19zcmNyZXZz
ID0gX2dldF9zcmNyZXZfdmFsdWVzKGQpCiAgICBpZiBzcmNyZXZzOgogICAgICAgIGlmIG5vdCBv
cy5wYXRoLmV4aXN0cyhwa2doaXN0ZGlyKToKICAgICAgICAgICAgYmIudXRpbHMubWtkaXJoaWVy
KHBrZ2hpc3RkaXIpCiAgICAgICAgb2xkX3RhZ19zcmNyZXZzID0ge30KICAgICAgICBpZiBvcy5w
YXRoLmV4aXN0cyhzcmNyZXZmaWxlKToKICAgICAgICAgICAgd2l0aCBvcGVuKHNyY3JldmZpbGUp
IGFzIGY6CiAgICAgICAgICAgICAgICBmb3IgbGluZSBpbiBmOgogICAgICAgICAgICAgICAgICAg
IGlmIGxpbmUuc3RhcnRzd2l0aCgnIyB0YWdfJyk6CiAgICAgICAgICAgICAgICAgICAgICAgIGtl
eSwgdmFsdWUgPSBsaW5lLnNwbGl0KCI9IiwgMSkKICAgICAgICAgICAgICAgICAgICAgICAga2V5
ID0ga2V5LnJlcGxhY2UoJyMgdGFnXycsICcnKS5zdHJpcCgpCiAgICAgICAgICAgICAgICAgICAg
ICAgIHZhbHVlID0gdmFsdWUucmVwbGFjZSgnIicsICcnKS5zdHJpcCgpCiAgICAgICAgICAgICAg
ICAgICAgICAgIG9sZF90YWdfc3JjcmV2c1trZXldID0gdmFsdWUKICAgICAgICB3aXRoIG9wZW4o
c3JjcmV2ZmlsZSwgJ3cnKSBhcyBmOgogICAgICAgICAgICBvcmlnX3NyY3JldiA9IGQuZ2V0VmFy
KCdTUkNSRVYnLCBGYWxzZSkgb3IgJ0lOVkFMSUQnCiAgICAgICAgICAgIGlmIG9yaWdfc3JjcmV2
ICE9ICdJTlZBTElEJzoKICAgICAgICAgICAgICAgIGYud3JpdGUoJyMgU1JDUkVWID0gIiVzIlxu
JyAlIG9yaWdfc3JjcmV2KQogICAgICAgICAgICBpZiBsZW4oc3JjcmV2cykgPiAxOgogICAgICAg
ICAgICAgICAgZm9yIG5hbWUsIHNyY3JldiBpbiBzb3J0ZWQoc3JjcmV2cy5pdGVtcygpKToKICAg
ICAgICAgICAgICAgICAgICBvcmlnX3NyY3JldiA9IGQuZ2V0VmFyKCdTUkNSRVZfJXMnICUgbmFt
ZSwgRmFsc2UpCiAgICAgICAgICAgICAgICAgICAgaWYgb3JpZ19zcmNyZXY6CiAgICAgICAgICAg
ICAgICAgICAgICAgIGYud3JpdGUoJyMgU1JDUkVWXyVzID0gIiVzIlxuJyAlIChuYW1lLCBvcmln
X3NyY3JldikpCiAgICAgICAgICAgICAgICAgICAgZi53cml0ZSgnU1JDUkVWXyVzID0gIiVzIlxu
JyAlIChuYW1lLCBzcmNyZXYpKQogICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgZi53
cml0ZSgnU1JDUkVWID0gIiVzIlxuJyAlIG5leHQoaXRlcihzcmNyZXZzLnZhbHVlcygpKSkpCiAg
ICAgICAgICAgIGlmIGxlbih0YWdfc3JjcmV2cykgPiAwOgogICAgICAgICAgICAgICAgZm9yIG5h
bWUsIHNyY3JldiBpbiBzb3J0ZWQodGFnX3NyY3JldnMuaXRlbXMoKSk6CiAgICAgICAgICAgICAg
ICAgICAgZi53cml0ZSgnIyB0YWdfJXMgPSAiJXMiXG4nICUgKG5hbWUsIHNyY3JldikpCiAgICAg
ICAgICAgICAgICAgICAgaWYgbmFtZSBpbiBvbGRfdGFnX3NyY3JldnMgYW5kIG9sZF90YWdfc3Jj
cmV2c1tuYW1lXSAhPSBzcmNyZXY6CiAgICAgICAgICAgICAgICAgICAgICAgIHBrZyA9IGQuZ2V0
VmFyKCdQTicpCiAgICAgICAgICAgICAgICAgICAgICAgIGJiLndhcm4oIlJldmlzaW9uIGZvciB0
YWcgJXMgaW4gcGFja2FnZSAlcyB3YXMgY2hhbmdlZCBzaW5jZSBsYXN0IGJ1aWxkIChmcm9tICVz
IHRvICVzKSIgJSAobmFtZSwgcGtnLCBvbGRfdGFnX3NyY3JldnNbbmFtZV0sIHNyY3JldikpCgog
ICAgZWxzZToKICAgICAgICBpZiBvcy5wYXRoLmV4aXN0cyhzcmNyZXZmaWxlKToKICAgICAgICAg
ICAgb3MucmVtb3ZlKHNyY3JldmZpbGUpCgpkZWYgX2dldF9zcmNyZXZfdmFsdWVzKGQpOgogICAg
IiIiCiAgICBSZXR1cm4gdGhlIHZlcnNpb24gc3RyaW5ncyBmb3IgdGhlIGN1cnJlbnQgcmVjaXBl
CiAgICAiIiIKCiAgICBzY21zID0gW10KICAgIGZldGNoZXIgPSBiYi5mZXRjaC5GZXRjaChkLmdl
dFZhcignU1JDX1VSSScpLnNwbGl0KCksIGQpCiAgICB1cmxkYXRhID0gZmV0Y2hlci51ZAogICAg
Zm9yIHUgaW4gdXJsZGF0YToKICAgICAgICBpZiB1cmxkYXRhW3VdLm1ldGhvZC5zdXBwb3J0c19z
cmNyZXYoKToKICAgICAgICAgICAgc2Ntcy5hcHBlbmQodSkKCiAgICBhdXRvaW5jX3RlbXBsID0g
J0FVVE9JTkMrJwogICAgZGljdF9zcmNyZXZzID0ge30KICAgIGRpY3RfdGFnX3NyY3JldnMgPSB7
fQogICAgZm9yIHNjbSBpbiBzY21zOgogICAgICAgIHVkID0gdXJsZGF0YVtzY21dCiAgICAgICAg
Zm9yIG5hbWUgaW4gdWQubmFtZXM6CiAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAgIHJl
diA9IHVkLm1ldGhvZC5zb3J0YWJsZV9yZXZpc2lvbih1ZCwgZCwgbmFtZSkKICAgICAgICAgICAg
ZXhjZXB0IFR5cGVFcnJvcjoKICAgICAgICAgICAgICAgICMgc3VwcG9ydCBvbGQgYml0YmFrZSB2
ZXJzaW9ucwogICAgICAgICAgICAgICAgcmV2ID0gdWQubWV0aG9kLnNvcnRhYmxlX3JldmlzaW9u
KHNjbSwgdWQsIGQsIG5hbWUpCiAgICAgICAgICAgICMgQ2xlYW4gdGhpcyB1cCB3aGVuIHdlIG5l
eHQgYnVtcCBiaXRiYWtlIHZlcnNpb24KICAgICAgICAgICAgaWYgdHlwZShyZXYpICE9IHN0cjoK
ICAgICAgICAgICAgICAgIGF1dG9pbmMsIHJldiA9IHJldgogICAgICAgICAgICBlbGlmIHJldi5z
dGFydHN3aXRoKGF1dG9pbmNfdGVtcGwpOgogICAgICAgICAgICAgICAgcmV2ID0gcmV2W2xlbihh
dXRvaW5jX3RlbXBsKTpdCiAgICAgICAgICAgIGRpY3Rfc3JjcmV2c1tuYW1lXSA9IHJldgogICAg
ICAgICAgICBpZiAndGFnJyBpbiB1ZC5wYXJtOgogICAgICAgICAgICAgICAgdGFnID0gdWQucGFy
bVsndGFnJ107CiAgICAgICAgICAgICAgICBrZXkgPSBuYW1lKydfJyt0YWcKICAgICAgICAgICAg
ICAgIGRpY3RfdGFnX3NyY3JldnNba2V5XSA9IHJldgogICAgcmV0dXJuIChkaWN0X3NyY3JldnMs
IGRpY3RfdGFnX3NyY3JldnMpCgo=
--0000000000001277a5058ffd4170--
