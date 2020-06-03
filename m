Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBRXH333AKGQE7DS5IXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa39.google.com (mail-vk1-xa39.google.com [IPv6:2607:f8b0:4864:20::a39])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4C1ED212
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 16:29:27 +0200 (CEST)
Received: by mail-vk1-xa39.google.com with SMTP id y68sf600295vkd.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 07:29:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591194566; cv=pass;
        d=google.com; s=arc-20160816;
        b=fd97hb47UJbGxg1AmUG5YC6z76pilCVzF/n5mnJf3dky5PpLuSVKvUoKEKUqD90goL
         C1fgfYJHTE5MswVws/J5CvFgsr86WUUaTDeWSwznmj3jfePmDSO0NuIMkdVhOMw4ZllV
         3Rd3rPDtx9Cq0FVn9bv+ol9XDYPiHXeX4iY7CKyZXO2pv2sQ7TIiqMt1sPtjD50H4GNA
         X+iUGtLZcPVVBIYIgQT8880Pz7g68gU4mTgeMOvgKk/spjAb94oaNBbl6oPYP40tJ5LC
         XEl7eqLqDX9G5zYGR+lDnoASM8xam1o/AePZUxW/RPlUj0y3joukh5AbDt1BDkpJVbwQ
         90LQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=6R615++vcCX7WGmIgEVEFXfKYYBmbMDMHnc9NEuFwkk=;
        b=SQdcXi63hWL+RkADHCsfdHAVBh4aAGhq5oPC8Ekry+B8evituH+Ka786z5tMy+QmcN
         kQwxHc2DwWgpaNTNrrYfmeQewR/L/dT2PQLQnpflznYOqrWCYzrgqQnKp+W3aeajayVs
         FG4NVmJX3csH9rUMwIHAzJ7mUBbzwHeMyy1DXJpcgvNC5G0Cxx8m9gvjcXr97rS734J5
         AhHUwVDV/wysOLpIqrlA3tew/77W0pyxo3P53QIkThODUI8fELaeQ7NtYBb7KbMwlX14
         pzLnUAhMS3r5vS3/VD7pFCJKy25JKd7WAmjr3ncDXLAfTfYRX3GdxIGoCU9gwFlUD2GA
         PVAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="A/N5OtXe";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6R615++vcCX7WGmIgEVEFXfKYYBmbMDMHnc9NEuFwkk=;
        b=Q3ezgf7agtbXEKQcpOHRzvPTPW2mb7S2H+tjLLVTIvHGj5PK0vAGqWzKzVvIIgnt1D
         V1GWztlfyXFErBkJnTC3TKshnfx7EDNdOeBmKD5M9GpbEkl8AbeOo/S1g392BrTHvsY1
         NCz4PLmHX+7juK4iB5kUfBc3e6boEssDA5hZUzo7oO/lf04FZLi5l0dVJTjAIlhyT6YA
         fRO9rV5hQ5micD1t7o+QX1EwVVyPSdSznakTb8ezbHM/ZR7mJNnAZLsTrQemVsmtuDgn
         zT6/Aq8k55uUeKBCQ4h8wHXZgjflWdaLe9yZINhCqFJm1NGTrlFRsMKa8bptkK9/2G3e
         isPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6R615++vcCX7WGmIgEVEFXfKYYBmbMDMHnc9NEuFwkk=;
        b=hmFwFAvyPaQohx8FpxFJTx0ehocBc9JNB88OoYhvMBHD0X47ZaInX8ojshpqW8EVu4
         bmtPgIX8qiyXmO6gCwyFvtg5V7P+pVb4d5kqwbaNzpC+aRmEZ8o7ASW4OdksbNFhDdFv
         pC8zYjHPWepYP64kJ9S0m3F4m2UdZgrdBW/6RB2hjcMvHkDWINcqREIwLrGSeMIW6vJc
         an1og6rUgpI0ywDSzsI+WjpNUOI+X5P+ET8twndkqip7T5aFQw57L1A1O+bSpCjCUDdM
         PmEA+/FSRzvMLSmwDEyhGmVTLKm2QkroVj752KBYx8LVqDsAZDjkE7rkEAxQ+3jf9fMt
         OKBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533jQOmCsiwB3mlozfPTAn8ak9MhXffhnwpj1sJe2HPx0lq7jLqc
	PWcWUUYEpr6rNVQL3b2Im1g=
X-Google-Smtp-Source: ABdhPJz2X9lPWwi7E5Q3hpK9szeOpxOIuOrZGJq2rElduz+f13D5bBQabo7NdqT59sSRiv+5CA8Osg==
X-Received: by 2002:a67:df82:: with SMTP id x2mr20921476vsk.87.1591194566632;
        Wed, 03 Jun 2020 07:29:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:5bc6:: with SMTP id z6ls181273uae.10.gmail; Wed, 03 Jun
 2020 07:29:26 -0700 (PDT)
X-Received: by 2002:ab0:22c4:: with SMTP id z4mr162576uam.56.1591194566077;
        Wed, 03 Jun 2020 07:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591194566; cv=none;
        d=google.com; s=arc-20160816;
        b=Nt4knVONfK3w6CIIDEqmu+3R/FrKzkdY/O/tB61Ke/EF/QbJi3Us605bLApHPs/ldu
         Guq56VlgvWUiy+YCCk7CrNeLOMiIwYe3OYADkeJrp5E22OwpR4zLz4ruvszaxgG0UYtk
         V3BWUiPqlOsL7PPHx7mTMG9oRQuDJGrCbZwrlg1RXadjJrSza1/gJUOx+c4Zjk2MMkhs
         1NNGmMnPH9GpeRwWbVpQW2/e8+EPmzycms25jxQGHOxGfoo6mUcR99yItPskJBh0v/iz
         tZYgjsMI2/NqSBlagRbmpAxgrar2SjBZupaVptcntbHH1/TK4esbzNvMPh4c+Pk/VnRD
         1pIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=nKP/tPMmXkTxZ67FXyXnshFzkxuzv3T6+G+edz7DLwU=;
        b=Q8LDF/G0GmNVqmOzZORvKI33fb9HUXcCt+Cypshi65AZq6pvzOe0jqfJYZLyIYpAcW
         esWSYpdC8/gXiMQOnCnPOf8mrWu4kpVfPdY8sfpWqQbk46YBpnwUy4MV/VCf4geEi/5t
         EAEZ+v8ZprKrYEsFYsw8SuzloIMb+pv2p7VNDl64uSXmF6oJWo4zrjQILrWBO7Gj3tJw
         RU6jj/dF/4H398eDz1i/md4pHdMC756X0HLGG0ReHjIPLeBLLzHfNGXbi0za9A/pUncK
         3y/xYML/SzoU6dD7inVDq06YNEQG26ev5uPlfEqi6l4Du0xJwDBiHpyQaMFepyfF4slL
         zK1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="A/N5OtXe";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id t139si14772vkd.3.2020.06.03.07.29.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 07:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-b2150d3.ash1-iad.github.net (github-lowworker-b2150d3.ash1-iad.github.net [10.56.113.12])
	by smtp.github.com (Postfix) with ESMTP id C52C2521EAC
	for <jailhouse-dev@googlegroups.com>; Wed,  3 Jun 2020 07:29:25 -0700 (PDT)
Date: Wed, 03 Jun 2020 07:29:25 -0700
From: Peng Fan <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/015623-4ce765@github.com>
Subject: [siemens/jailhouse] 4ce765: arm: irqchip: fix irq_bitmap setting
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="A/N5OtXe";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 4ce7658dddfd5a1682a379d5ac46657e93fe1ff0
      https://github.com/siemens/jailhouse/commit/4ce7658dddfd5a1682a379d5ac46657e93fe1ff0
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-06-03 (Wed, 03 Jun 2020)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm: irqchip: fix irq_bitmap setting

There is a implication that the pin_base in the cell file
should be "32 + 128 * i" with "i >= 0". However there is no checking
for that. Pepole might choose other pin_base, such as 160, 224 and etc.

Saying the 1st irqchip pin_base is 224, the 2nd irqchip pin_base is
160. When irqchip_cell_init loop into the 2nd irqchip, it will override
the settings of the 1st irqchip, because "224 - 160" is less that
"sizeof(__u32 pin_bitmap[4])", so to make things simple, we not enforce
the pin_base must be "32 + 128 * i", and make the upper example could
work is to check whether pin_bitmap has a non-zero value.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
[Jan: removed unneeded test]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/015623-4ce765%40github.com.
