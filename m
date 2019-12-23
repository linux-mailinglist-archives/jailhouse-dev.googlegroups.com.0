Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOMPQTYAKGQER3JEZPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC91299E3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:30:17 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id 90sf8329516wrq.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125817; cv=pass;
        d=google.com; s=arc-20160816;
        b=NIjB9/U/WjSIGfXni7F9xr2cIJyfzniItoru6JzhoONcHuiIHF8A90NtSyrIXneBkw
         qrGB9tygKqmZq2I0v1dQpEzDo0yIfbJbQPurEQlLJh5yNE0oQm7PJ1XE0xtNO4GzXq1/
         KCLnZMSOS6BerBGMLSBJLeTwaP6atx4qS3ppbNlyVGZeKRtJFZYWDtfUscu/65oUKAq+
         Sq/CZxhyUmKTEIx06evH7eEdKCyJQWJvH0xq6ygMl9qSwf5WFrdYcAf78eMjRJU3e/2P
         hYaN04u5O7J6jSi2Soa0OmTEcOTIDkQG2lnSa0i3KG189bBfyjsiE8TzR1AfcgR7zzyB
         fQuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=sZKQzZsCcfp95/BHTPUcr5ixECTrRLlF2lZWPLXKo1Y=;
        b=c2mTiX7wwBIoez9oV+U8hPapsqpXE2iZQDMkwjeRvlSxGprqpnk3wi9sDeJSjlsIdW
         a6GPfpxEDB9gT8n2VHRy6/3zitQQBkt2OfFRZnzQi3x8riVCtl2rTJ2u19cwtKLOcAJj
         QhihAd+JOenfkZD/G/3tYByzyRO5RH7X4GWgsS9coR5uziWrexYLu0OF0Vr2vQiLIHMY
         v4sDmm0LOWCQNe7UkSTGypSN62hLpP8VSEayafSeJPRSkEYOaDrji7xPwjmoXKgRmokJ
         st/NVoBpPGoQixMLAxjg4NoQ8o9lpNIIDXpb5xtnfi8mdb0lnMh3vxNqQw6eAkOYMNG1
         AeBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=m93froA6;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sZKQzZsCcfp95/BHTPUcr5ixECTrRLlF2lZWPLXKo1Y=;
        b=p/TJx5jOwdz2JY22Ad8XUJOqps1Fbc90OkQiR0+F5jc1Nz5V29EZm7LQPrNJRJBeLY
         4hMoUgCqXakMhGk8SWt+8sXvlP1+UJImcG+JJpdIh733OXvimipJ5udVjMQSkvk5DlzH
         7sgszOewSFf2i6S3xCUekgOnBHh0xfB+IqyJ1zC6Oi9CBaQfDvOUs5rS8P06j+9jOlSJ
         W7o58t/9Rbi9CEm5FhqxZbkFB2wGXHlkkPGQ1Mbbk/u85SXjQWof9dwe6G2Yp5jo3FDM
         +c2H7RMr6skgDxEY/w1Gxks0Q8CEWQFDcI1bCDWN0e6YdS5rRg2cEdKhBJp9xLmxYTVY
         IQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sZKQzZsCcfp95/BHTPUcr5ixECTrRLlF2lZWPLXKo1Y=;
        b=FV+QYqSgJcR2+C7gBFzNC/veGLdkb8TNi0bbJ9BsP4A97DqaMgVp4nc69o2e6VpPtQ
         w/pYmxIRGzgy0LuPBlq742ndocQppKNoeXWf3WC1aHewkWaWAj+v7yRnovhH8L3MBDGR
         SKQv6gchz6xevVfBdKDlufTv2wTYr1Ba9Qtry46UgMTFe+aKbcxgVSHzZPbJNjqAUbw/
         3EBv94Lpo6XjmVhifDzrK2oFaGuQiWX4DGATBEyn31xAC5F+euY5//MEqGHNx674GKqS
         Cy52HwnVXw9jcjZwhKrhjux4tLAySUJ2OrLgwUjjFEyxSi8RktbK90GQkX80ua2okm2C
         D5JQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVd4lVefPzMhHU7t/2WAHusgo6M83ZhYSCB02CpLe6Tubvmjh6C
	f8+Asf52ycOvY0lg7ol1Fow=
X-Google-Smtp-Source: APXvYqwiZlCK/zY1Dkrw/LB8pdu1ma2TJqc5gKlX1qCGsttfoZaxqtePQf5g3megTSB2JLi1tEVjKQ==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr31847481wrr.286.1577125817251;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6303:: with SMTP id i3ls4575980wru.13.gmail; Mon, 23 Dec
 2019 10:30:16 -0800 (PST)
X-Received: by 2002:adf:fd84:: with SMTP id d4mr31297981wrr.211.1577125816391;
        Mon, 23 Dec 2019 10:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125816; cv=none;
        d=google.com; s=arc-20160816;
        b=N+GyLRqA/MJ9WckFjZsAqd0kDXmQJDmKeP2OeUwhZ66jsmCWwNZeS9rBq6DbgMwDwp
         WvhhFlWThgpI3MIphI0bvAVm6heVjuRcNBUcNC9lNDhD/PMHke/VQZB+yjWXKV8nQcoV
         RqKnHlkmMX7CRgavJarV0LFiWugXETJII+IPol1vKEH5zvau9YbP/I40bn3h+BAoiEBz
         YaxA7LuG27L7A5Ew0nxWCUC8tkffJggsyyd+qIvZdq2Vau6xy687fC8LsaWLxk7Gwwhu
         7QJUi7JZhnyaFLhp2xidNaRw96r+HwdkK92mUazKXYIvch4huMr/PKQ7lYCa7LCIaFi6
         xPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=gT0XbXRA3OtaV6XErT1Q8NjTpwISLr2Neo7OeGbS9fU=;
        b=LQCodURYAeT0DZIqB1OIX4Sh4L/9g5rH3IjsiXxyB9xIE6HCXRwTlyqmElBkCUjduy
         PWHJ9xaA7o7WXWLsYcpBcmG1mUTrBqlQOrOKcE0GIjcRtI31JlT/ilHvEjv5rS7b5FKz
         dgICzDGb1IvlYCvJj+WgTsSIGPVbQKxy/rfP0avLlnzAww7T6EOuLVqaPgof4xFik5Ou
         JnPjSKKbucP2e8wDVN12c3qTv8R1dYXRSGAr8n1GApte5kIYxmoKNSAdjjcpWZpG6tBF
         +0aVOr9mRUigOfZZ1TxKvMjLAJoo7uiXBr/ZV6Aj8ZJB+hdf6WgFJby9/bf8DcaeN3Ns
         rv/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=m93froA6;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id g3si764548wrw.5.2019.12.23.10.30.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:30:16 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.mchp.siemens.de ([84.61.93.39]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MMVu6-1irj8D30DG-008KWo; Mon, 23 Dec 2019 19:30:15 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 0/6] arm/arm64 barrier fixes and some cleanups
Date: Mon, 23 Dec 2019 19:29:43 +0100
Message-Id: <cover.1577125789.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
X-Provags-ID: V03:K1:Jfg1qjm8Um+myk6KMpOjEiiNzBS+hD9Cm1f4tgIMYfHsTjTOR81
 wq4lbK/S4oWyJZjZvI9RCF8JTz2dOYIzxG8vXyLUNfoBVDVmGqAXEqYi0lySNkcMWBnslXw
 mSbmE2Ofs6kOCan3uaDSQWavIzPgaB6Gkor9YzxkXgkyB8xWaEukuTerr/rdRDn78QA3YpD
 5wj8bNW3+TbJz1G5KREVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4v6Se3kF+/U=:rQmXXa1GtcK3YDxtAlYa+i
 BT8AmIK7thTM3xQrrFfk+uu/nlyLAi2e2n6Ez7wq6SSbYC8o/t4Z5/uxL553nELuLp5F5kVvA
 5qVkVUPWhZ40zgorHNVQd8evEdL7Ixof6YwN6hk9g4bcHO1dB9Iw4ECrJxKMdPQRwBuNu2Psu
 81me3iBVDuwqI98hiSwnlSkU7Xv8aiJaPDDb5M3Halg75QwGDNXAI1jg+f2kT6QiUUaAmVvId
 9cGa1t+qxNpHLTlUmQlaFJhhjRb6CHtv0f//E2ySOs+he/WRU7HK41+lyPAD0iyWzqfuUaPYG
 0zVapXM1Gt6IZXKIwzgwPn9OU6xjNu5ropnN3UXTPIbPae0TMjykBedGueDvIwNSaxRdFdgNX
 R7IqAi3Lt1nieYhMhKXItjhoWyCpG8UTm8Z0TrB/adyY/Op60F7dR/gODj2UrARbQJL0zCNYQ
 C2myDrIY5TorwCcReC4SqDRwCinQlf9DX0c92IqsvWLhkqOBX4ZO1OuJ6YaGxdtHoAYNGaLoo
 UyKzIvc9u8gFgbPec0GtuEhWueg3CaR3omZTGM7bcERkj9yOCxvs5rLRNYQ47PihzhkO/WmKT
 xRtocm6OGf9b3nLYxe47BU5zl4xhXKp6kPgXa5O9OmF2CSKh0wfYA4I0pUMq/HoZAGLJ5/qIV
 GeZB3yaVNfC/kRKp0mXMUmV6TlpNZY7khsMVHkbhBPc4vaiZVQFdiSw3BVMinx01HXYtyBRgC
 0BQo6CfNWBCzSjILrEJiK6RICXW8YyGCyUcvel6UsmjCEcf8pE8TEP3R7cixBXlX4aQRmOKqR
 kHQ7pUdkmzAPQ3idykxOJBpdzXy/vU/QyXQi6lbjRT0FD+nsNNUcTM2YVqhtYvPQeZop8plm0
 g/lJu6JQ1GkzLjt7EMjfXwBgDubHbyTZQZLX/cpk8fCVBZx0Gd35q0JRqoCf7e3XwCDWGJ1x6
 GUURlED9VVHKT9Zh+u0cKPc7UTVUtBM1leV94l15Chooe/LxSKLyA6z7hGVfusT1Tbln2qcRO
 VmDd/d5hNWwHa9HNM5FczTaWBkhOJx8QPQIuLCEvUjzMWqg2JVAxQQoU1bz4kthTq80Eez5UR
 ViUbYFdF1SRWbmvUgMEC8YjmX9b0S1FiN65FLHkYoXEP0Tc5vOXYS8irPzNk33XhYm07/nihh
 n4QUxrj+XgcL+ZRlDfVbju4khp3XQLShJBsdLdiNVJ/mec06QHeHj553K4hg/mgyCKmN6uEmK
 lYrO6PBNmrZTMJZHarCjhb3l2vKBQqbWVlxbZSQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=m93froA6;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

Primarily contains the fixes for the barrier issues Peng first found.
While at it, I found more.

And I cleaned up some ARM headers, thought that should have no
functional impact.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Jan Kiszka (6):
  arm64: Document why spin_lock/unlock have memory barrier semantics
  arm-common: Fix barrier usage in irqchip_set_pending /
    irqchip_inject_pending
  arm/arm64: Populate memory_load_barrier
  arm/arm64: Refactor traps.h inclusion
  arm-common: Fix some stand-alone inclusion issues
  scripts: Let header_check cover arm-common includes as well

 hypervisor/arch/arm-common/include/asm/gic.h         |  2 +-
 hypervisor/arch/arm-common/include/asm/iommu.h       |  2 +-
 hypervisor/arch/arm-common/include/asm/traps.h       |  8 --------
 hypervisor/arch/arm-common/irqchip.c                 | 20 +++++++++++++++++---
 hypervisor/arch/arm/include/asm/processor.h          |  1 +
 hypervisor/arch/arm/include/{arch => }/asm/traps.h   | 10 ++++++++++
 hypervisor/arch/arm64/include/asm/processor.h        |  1 +
 hypervisor/arch/arm64/include/asm/spinlock.h         | 10 ++++++++++
 hypervisor/arch/arm64/include/{arch => }/asm/traps.h | 10 ++++++++++
 scripts/header_check                                 | 12 ++++++++++++
 10 files changed, 63 insertions(+), 13 deletions(-)
 rename hypervisor/arch/arm/include/{arch => }/asm/traps.h (69%)
 rename hypervisor/arch/arm64/include/{arch => }/asm/traps.h (69%)

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1577125789.git.jan.kiszka%40web.de.
