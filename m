Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBYOC7PUQKGQE4CAJBQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 5895678B4B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 14:06:58 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id o11sf46264328qtq.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 05:06:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564402017; cv=pass;
        d=google.com; s=arc-20160816;
        b=djKZGqxrXMyMfHs2FXqiLuOImQRZOuCrEL6NtcdJmahyAsnnhvcpcSavLGqImWB245
         2T0fDeSclYMyL6i3os1DxylPrWpnmPjDdbiJCYzqAVsGl9T5nJmCBMNq5r0NsTRuIn5C
         lbE1mFXa9M0fEF+JY4rcsl1cID6Tic9/pHbfXAyfvTn/+TNQ09yAwrB4Tqclh6e/MifN
         k6ooyiMyuxIhBGFh/6QF2IsMUakU8UGaa1Zn86co7Rz10CeKPW2IqHlHoi2iSmrCeDLH
         xE7D7/eGnuCqSNx90mfNu3bUh1NFyXg0EQkKm9QsCd3p621fZKKBni8dUSakDKRxaUPB
         SyVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=IdL8IidxQMJMJGwskXGPE5vemO0IJGO/vcZYz8aSIlY=;
        b=OozXEK4URBx/FcLxkfRZTO5TzbDGdFtLMpIonOuz87mXM0txtDe2rHCz+z3ZFv8qDG
         1VPjt3cWEfo+HRlog8K1wklrQWgnowEMs67tkkIBXyHHJ1tytwufEEVERfwoBYUNCyBV
         ENMNwB9/K+xK3Wf581JA3QWrxhkv2aBLSi0cA7HM1anchsZHZUlgX6JjskOL5k35imNK
         /aVPctCZ9VcYneAryTieKjgtXunxzW/vwiPovvPpXRwck0Eucr8W2PYSztWI02L7Ygop
         PkjJM6NghcUZvWufA+YeJP74TTZ+cR1boTAkxTbFRzpIdRJ/exrnf9CK0+l7PiuMA7Nw
         HRjQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=S62rrDOP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IdL8IidxQMJMJGwskXGPE5vemO0IJGO/vcZYz8aSIlY=;
        b=oGRQUU/MT/8wnKEiF7lx0iqw7AiwuLQsatB0QJ7835GZgN/iudASW8SuCaUhd/GcL2
         cpu1BqVHAHlHrHnS01gYlfxgFMpCr0kR9PE1w8zGy3Q/Mm6twQl2rLGaA1bL+tH0enBu
         f95cIHcm0sYerHAKqM08UNTSSUxqIsjtUIeTHQhR8255JhMI5zgVNHD0jTA/sNDzJGLS
         EjulWQbJYEgkibTKCBNeeTeik6UY9DQTvG0GdPRFPWs95CkXURBZJN89qTRtyyTwfp35
         R27PIM5cNmPajQ52dAYiNfH+1PWm53Tq8d0Na9ksxoBUXy1Hh21OOzWeoBfQQ6U/vwiR
         jUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IdL8IidxQMJMJGwskXGPE5vemO0IJGO/vcZYz8aSIlY=;
        b=c0G2smiytsk9UTXIV6npYbs/RhkZm7hlPgjU0xqw0ATJkSY19C5eRut3wl6cg8rEL6
         Rx+Mwb607nYRPzKrZnRe//dWN8BkzSIQWnXVs5CQR0Rw2eo0D8EAVHLbFZk5oGrTfzPb
         ZYSKkc3qqo4KuTm1EO6AYmV+XbXzIMrg8I8RegW5GX5/xmJwTkc7IAy7rU2GRg1q+zkU
         ucJInCjoRMan0CfJSYhAlxD5w+x4ZoEzQ8X2MbNtk+au2SJRyJ8w2NHYJWoT6Ahustmt
         w96beddVfTFAghYT4ru0Q6i+Kda3YIZ9juOoFV3SZrAYsghfiWXDiBPKEfYt7Tae50f4
         Krow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXBBlSayKy0GJ3O5SmEN1BeZzzM1YlJEs0YQYZX8SuaIvxXjWJX
	O/Z77AJgMvMW23HQyVN7u3k=
X-Google-Smtp-Source: APXvYqxsi3urNdax9bmVrs6PHqvFoulU8AE+S/nn7ZJmcCVO0gqNsvO+B58FlkOSDuJroxZv8cvDkQ==
X-Received: by 2002:a0c:8a76:: with SMTP id 51mr79862331qvu.210.1564402017286;
        Mon, 29 Jul 2019 05:06:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:91ab:: with SMTP id n40ls9929427qvn.4.gmail; Mon, 29 Jul
 2019 05:06:56 -0700 (PDT)
X-Received: by 2002:a0c:f193:: with SMTP id m19mr79974077qvl.20.1564402016840;
        Mon, 29 Jul 2019 05:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564402016; cv=none;
        d=google.com; s=arc-20160816;
        b=GEGN/YrcA0zCsWwRk2/RaAd6Bcy6bsgweIW8k7IihvG0lXjavh2YWlEnKczxTvOcfw
         DRA8V0sYnYbDPvUsHf9pDyEd9QPk2WGbQ9xVJcxrFQw4Yt2V9IL2blvxEMY66HygPyxR
         N8suBk9YFutihP/CofDH7Jl4hn5c5LVufDcHwNUbPoFbwpXWMc7gWTdrBFA47slqv7HO
         DfhY1a6gBHAMPiduVodTL52SLQ5tChkGC/IFsGQx+sYrwK34liwWl8Pe2S9dWu9zcrUk
         rc7ecg41/ZQyGLU+/U/BUO/dEp7cetlvm2G0U+7Jio8NO8VmYXeSikns9tOulMOdC5qU
         AFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=SuW0nolDPiwxkWI+N1CSw7tpAIuAVtM732tC5OXTycI=;
        b=m1CLLnbSPUQAY80VqpGQAY8/b5CRy+EEkbqWtBJ6eSHKTFmT8G3AZMLvDbHIAGcVbI
         m4mZAcVk+GmKR3KRN9UBeQ9z9L15joZBVLdso81FVwU1WQHavd0Rp4yZA6flK7vM/29h
         6sDkFqBgpySREaTQsRfEPrgG05GgZ+5ELvtWXDMk05gGDQ+iJPNvSNvUEWQ173HmScRF
         S4iucPIYGTWrxSLS0rXZFTVU3GJST7M5BmSJA/d7DGYNrtH9jxyKph0qAmWVu+Y6zubj
         vqsCSKuKbLGaukHWtS5dhURBtOP6jIqrQC1LPLeI2Po4Gzg7lxD2bbW/Af48JWRturuw
         lYXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=S62rrDOP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id o6si3074105qtj.3.2019.07.29.05.06.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 05:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Date: Mon, 29 Jul 2019 05:06:56 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/f6fef9-ce661a@github.com>
Subject: [siemens/jailhouse] ce87a6: core: bitops: fix type of clear_bit
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=S62rrDOP;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/master

  Home:   https://github.com/siemens/jailhouse

  Commit: ce87a6afc1de4ffdd10fba9c92ff1c89ec7d34e4

      https://github.com/siemens/jailhouse/commit/ce87a6afc1de4ffdd10fba9c9=
2ff1c89ec7d34e4

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/arm/include/asm/bitops.h

    M hypervisor/arch/arm64/include/asm/bitops.h

    M hypervisor/arch/x86/include/asm/bitops.h



  Log Message:

  -----------

  core: bitops: fix type of clear_bit



I don't see a reason why nr should be unsigned for set_bit, but signed for

clear_bit. This probably got copy&pasted across architectures.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 92c1d1d9948fd0c50d6c5bf4259e1dc9ba0b3d4e

      https://github.com/siemens/jailhouse/commit/92c1d1d9948fd0c50d6c5bf42=
59e1dc9ba0b3d4e

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: use definitions instead of constants



Those definitions are used during allocating, so let's use them during

deallocation as well.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 90f392def0720107d0f0cb17f4d026cfd1c101b2

      https://github.com/siemens/jailhouse/commit/90f392def0720107d0f0cb17f=
4d026cfd1c101b2

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/cell.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: use the variable io_bitmap for both



Semantically, SVM and VMX don't differ that much in those regards. Let's us=
e

the same variable for both.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 53a55842ef7e9f3695649272b37eed8cec89c271

      https://github.com/siemens/jailhouse/commit/53a55842ef7e9f3695649272b=
37eed8cec89c271

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/vcpu.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: consolidate io_bitmap allocation



It's pretty much the same, besides the number of pages that have to be

allocated.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c416ff7427f11d51a818bdf8683a75f200f8573d

      https://github.com/siemens/jailhouse/commit/c416ff7427f11d51a818bdf86=
83a75f200f8573d

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: consolidate deallocation of IO bitmaps



Same as before - we can now do this in vcpu.c.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 9ad5ca85ea350eb10dd56a1994183039f5ac13f7

      https://github.com/siemens/jailhouse/commit/9ad5ca85ea350eb10dd56a199=
4183039f5ac13f7

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/vcpu.c



  Log Message:

  -----------

  x86: remove superfluous statement



pio_bitmap already is set to the cell's pio bitmap. No need to repeat the

assignment.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e4cfe90d48731cf30159d9fb8f9e7283756095f1

      https://github.com/siemens/jailhouse/commit/e4cfe90d48731cf30159d9fb8=
f9e7283756095f1

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/i8042.c

    M hypervisor/arch/x86/include/asm/cell.h

    M hypervisor/arch/x86/vcpu.c



  Log Message:

  -----------

  x86: simplify check if i8042 needs moderation



By adding pio_i8042_allowed boolean flag to arch cell fields.



With this, we don't need to directly access the pio_bitmap in i8042.c. This

does not only simplify (and speed up) the decision, it will also be helpful=
 in

future patches.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e7674ea7425fc3f968c6d50a2bffb9afae861f9f

      https://github.com/siemens/jailhouse/commit/e7674ea7425fc3f968c6d50a2=
bffb9afae861f9f

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M driver/main.c



  Log Message:

  -----------

  driver: Account for renaming of lapic_timer_frequency in 5.3



"lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=A4nde=
rt sich

nix."



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 4f27c75d40daa00e7bb10e2c7b8160c6da8d9732

      https://github.com/siemens/jailhouse/commit/4f27c75d40daa00e7bb10e2c7=
b8160c6da8d9732

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M Kbuild



  Log Message:

  -----------

  kbuild: Correctly step into driver directory



Descending into subdirectories with modules via subdir-y worked up to

5.3-rc1 but was never designed to do so, see

https://patchwork.kernel.org/patch/11059033. We are supposed to use

obj-m here as well.



Don't migrate the other subdirs because that causes warnings such as



cat: /data/jailhouse/hypervisor/modules.order: No such file or directory



due to missing module targets there.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 91d4db70c6f9443e27475d76d965ee5e487a61e2

      https://github.com/siemens/jailhouse/commit/91d4db70c6f9443e27475d76d=
965ee5e487a61e2

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M configs/arm64/amd-seattle-gic-demo.c

    M configs/arm64/amd-seattle-uart-demo.c

    M configs/arm64/espressobin-gic-demo.c

    M configs/arm64/foundation-v8-gic-demo.c

    M configs/arm64/foundation-v8-linux-demo.c

    M configs/arm64/foundation-v8-uart-demo.c

    M configs/arm64/hikey-gic-demo.c

    M configs/arm64/imx8mq-gic-demo.c

    M configs/arm64/k3-am654-gic-demo.c

    M configs/arm64/k3-am654-uart-demo.c

    M configs/arm64/macchiatobin-gic-demo.c

    M configs/arm64/miriac-sbc-ls1046a-gic-demo.c

    M configs/arm64/qemu-arm64-gic-demo.c

    M configs/arm64/ultra96-gic-demo.c

    M configs/arm64/zynqmp-zcu102-gic-demo.c



  Log Message:

  -----------

  configs: arm64: don't set .pio_bitmap_size



Needles to set them to zero:

  a) The compiler will do it for us

  b) ARM64 won't use it



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: a8f1af81a9e2858c9cdc62dcd47471dc5a6e70fa

      https://github.com/siemens/jailhouse/commit/a8f1af81a9e2858c9cdc62dcd=
47471dc5a6e70fa

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/vcpu.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: drop vcpu_vendor_get_cell_io_bitmap and struct vcpu_io_bitmap



Intel and AMD are now basically the same. No more need for those level

of indirection. Consolidate it and save a lot of lines of code.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: cb4dee3cfb262cb2a184e7c62a56f1cb812e55c4

      https://github.com/siemens/jailhouse/commit/cb4dee3cfb262cb2a184e7c62=
a56f1cb812e55c4

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M include/jailhouse/cell-config.h



  Log Message:

  -----------

  cell-config: introduce pio_whitelist structure and helpers



Introduce struct jailhouse_pio_whitelist, and a macro PIO_RANGE that helps =
to

fill lists in config files.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 654594bc0be786ae1e495abef7b322e9024f8daa

      https://github.com/siemens/jailhouse/commit/654594bc0be786ae1e495abef=
7b322e9024f8daa

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M configs/x86/apic-demo.c

    M configs/x86/e1000-demo.c

    M configs/x86/f2a88xm-hd3.c

    M configs/x86/imb-a180.c

    M configs/x86/ioapic-demo.c

    M configs/x86/ivshmem-demo.c

    M configs/x86/linux-x86-demo.c

    M configs/x86/pci-demo.c

    M configs/x86/qemu-x86.c

    M configs/x86/smp-demo.c

    M configs/x86/tiny-demo.c

    M hypervisor/arch/x86/vcpu.c

    M include/jailhouse/cell-config.h

    M tools/jailhouse-hardware-check



  Log Message:

  -----------

  x86: pio: use a whitelist instead of a permission bitmap



Whitelist-based permissions align better with the Jailhouse philosophy.



This patch switches the permission bitmap (which basically was (almost) a

duplicate of the final io_bitmap) to a structure that whitelists a port ran=
ge,

given a base port and a length.



As a side effect, this patch drastically reduces the size of config files:

8404  -> 224   apic-demo.cell

8488  -> 312   e1000-demo.cell

11450 -> 3290  f2a88xm-hd3.cell

11634 -> 3474  imb-a180.cell

8424  -> 252   ioapic-demo.cell

8480  -> 296   ivshmem-demo.cell

8788  -> 608   linux-x86-demo.cell

8488  -> 308   pci-demo.cell

9730  -> 1586  qemu-x86.cell

8392  -> 212   smp-demo.cell

8404  -> 224   tiny-demo.cell



If no whitelist is given, all PIO access will be denied. Additionally, incr=
ease

the config file revision header.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

[Jan: renamed for_each_pio -> for_each_pio_region]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ce661a1b2ea6bc66d972a3d7850389f87d9556ce

      https://github.com/siemens/jailhouse/commit/ce661a1b2ea6bc66d972a3d78=
50389f87d9556ce

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M tools/jailhouse-cell-linux

    M tools/root-cell-config.c.tmpl



  Log Message:

  -----------

  tools: update config generator



Obvious what happens here: Align the root cell template.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/f6fef92ffaba...ce661a=
1b2ea6

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/master/f6fef9-ce661a%40gith=
ub.com.
