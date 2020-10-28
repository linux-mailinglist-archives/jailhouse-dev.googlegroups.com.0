Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMXG436AKGQEI7VVBQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885B29D16A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 19:06:43 +0100 (CET)
Received: by mail-qk1-x73a.google.com with SMTP id d124sf208121qke.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 11:06:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603908402; cv=pass;
        d=google.com; s=arc-20160816;
        b=y8X5bPSWIHfmzYNU3TLfX7YSEqiE8J5FvzjVqW+GPCzaksLLiSdfXObHoT7i6Noexz
         Vn9FBxcJxbHMkw1nW9nSIj2uWfC9vyPSPTkQlc6kedwiUEMypWO07bRk0/fgazOW6u3V
         q4eYVtXY7kV3YJIgDuL3Jn/Mq2qKflZrKTL5asg0ylgT0XiO3r10r1czy6q8N7H0UmCC
         +4GGS7A9hoQjJ3jaRoUkRX/gCMSM1MjUQeX6LmpydXu0WeMl4QopSORYnd5hmH0pYKzh
         GcEdTdY1S0a9xE5gC0rkoBBGV01fIEKmjNVFcAwMdngcf7Cm2eNHns5d56Zd+BQbW/vs
         0b7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=vk4V6fKQYTphPLPP7dZRa88RU8+1QZ8zxBpWeZQk8HE=;
        b=I8hvBCV5kV3Y/oSwmwIlUProdLpJJHQrpmRrESFQz2LkT+8B4s3OCtiLPKZywyOv0G
         ceYv8Pzjjb80PUyqYpcS9ElDOuxuIF7HUYNuEW9DqUyTM8d/fsQRy/xkU4MWUulATEy0
         NnDqHsgbaynWN7I6yb5qh3zuk3dhxhVPesSXyXJdRxFbsJNiDyxuUe/u1cqYRo23u22t
         VnCVKuZAY+vERFsk1r5e7ACGui1kUw2s5oKIFuBaoqAjmBz5RS+RBNgLDOcN/RKKJn9F
         LHXlFYyGGmT7qkWyDbL0P2HC0Qxz96ljROZp2ZoVyMQ7H1n53IQvZbrOxEM2GOdAll3S
         0tmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Hi4nfFxp;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=vk4V6fKQYTphPLPP7dZRa88RU8+1QZ8zxBpWeZQk8HE=;
        b=AyUpWhp+Hs+ZJcMvuvPZrZqw+j7S5YVVm7QIGBioai2Hfvi1aUnQ3MTtnHAWzS2fZi
         ELBFHc7gGWzn6DinUAzp1h4qezmVMoeUMQ1twO3araWMPipkGRtL+WRc3SVnDutbsXBH
         pYVDRjB4PsHn7YUZrfADdGgPsOJII7mq3qn9gLPNb5luHlG98Yn7c8tjr26sKE0LP+gW
         M8dAb8oTyypgJq6uirflVMJzEYPPgiIdT/22ojUbkrGyERsekCZ+nGKyqa4AeAUhdex8
         bMXIzPT6hMNPM4yCX2yvuWRHMimTI1N72LH0A5t+8Wy+rB2kAlujz5m5BRaaUA5M4+4z
         KBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vk4V6fKQYTphPLPP7dZRa88RU8+1QZ8zxBpWeZQk8HE=;
        b=HcHB/YUz4AsymcEu/r8fFNTU6t86zuJQI1dYytVqQp8bCUP64nwfgexRVHN4AJqU2E
         XvRKlOW5gWqVnxWRWT//tGOAMq3pfLJa/2e1BrTZ9hs+uI8eOmPbgK4Qnc36Srp5cUYW
         IxJ5W4sKNJICzTTixQeg+Ez7ZoM847JSxzx5y4B4MPWMdyfyH0anuEXV9LLUoTiuTtiW
         +DVzdxC8bUEiFjV7j+ZRsoVwdK9oYmojyp/wtFcFwe8tzHTrj19kDgaWUDX2MvDVqBvh
         QpEK3/sVfE9YwXQNOzdUWkMf7j4R0Y9cJAQlA8mKLh3DufaAeP0zuMzL/qKObP5SjU1s
         wFgg==
X-Gm-Message-State: AOAM531gVBC6/8l5AhKdo+5aonDd4Svz/RqRlbJk1R+7ePsYjvdLkngH
	py5PH+7s5hQVKmqhxI3Gyt4=
X-Google-Smtp-Source: ABdhPJyGdgo80Qg0rYRwWIa+uT5npbzqIGXnCVEmOTW/NtYj9wKefCIjn5ewgZEOHrvMakIktIY//w==
X-Received: by 2002:a0c:ecce:: with SMTP id o14mr258117qvq.2.1603908402569;
        Wed, 28 Oct 2020 11:06:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7441:: with SMTP id h1ls160732qtr.2.gmail; Wed, 28 Oct
 2020 11:06:42 -0700 (PDT)
X-Received: by 2002:ac8:7758:: with SMTP id g24mr68570qtu.307.1603908401753;
        Wed, 28 Oct 2020 11:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603908401; cv=none;
        d=google.com; s=arc-20160816;
        b=drZQVYch23zNEDAusAft7YGL2KfeSCIyypNi2D53/NHWkdETTGwFhat4nvg7AKHijV
         PLuOdE/GScmN7X2uRfgIxnEmWx/qDEeLTCO9E11eF9q1Hguvb0ftnadl3pzQhJpdqySP
         /fkvHyPZ2npun9S1IQI3t0YzP/rgGazN/HPznq9rxqsU0+Y/XajK7bw7eGHHBSPB87QB
         zweW2Rrz7JrFd6hrrkLiqsHh0hcjBciH0QN1bL8nMq54F6DXlQTNiHwZ57PMI4Jec0jo
         ontJH1+5THHNk3Gdt1WNKpmpHIGMEzL81TrJeBPy8tGH9TTsPVE2KqX3LQbCiwo6uM4P
         2DcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=TW52v5LBIoJZ2p01k3cfOVFdR22QXx0nq5Digk0FTgM=;
        b=yX1XJIS2xhAku30x11sp8kkJMKFenjYaCPxT3CguFhiH1ZnP/gcPoGvBx5QUtbmbib
         DJuKOgs0LbEGiZH/PYIqlCiaBn14ClbT/4VyHf3/i1ZuSf/hp2qmbT4cDGWKk5wF1fJn
         UHSKhIS8dOQjwnZKAoRVESfi4RrSHO39D7xovf0R7khY+bld3h2yqt+n2vYBekAIrL99
         YDwRe6mFp8JDogn0IKhIOESGmpWvi1X0pK/CEnsLMSW4xpz8rDtOwZKBZEr0LuRgalhd
         Eiy7TaJLR9dLob8AQUyRHBCFkqlpXfO6BqR5t6OBUuUEo6ZKPqUrbU80426Gmk17Kjnz
         ziVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Hi4nfFxp;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id 70si27400qkm.2.2020.10.28.11.06.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 11:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github.com (hubbernetes-node-9f0bbdd.ash1-iad.github.net [10.56.115.58])
	by smtp.github.com (Postfix) with ESMTPA id 8AE109026FF
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 11:06:41 -0700 (PDT)
Date: Wed, 28 Oct 2020 11:06:41 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/0ba496-b95b6d@github.com>
Subject: [siemens/jailhouse] b95b6d: driver: Adjust type of __hyp_stub_vectors
 declaration
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Hi4nfFxp;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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
  Commit: b95b6df40fe8851250d8e3bad7a46a0d99a16bc8
      https://github.com/siemens/jailhouse/commit/b95b6df40fe8851250d8e3bad7a46a0d99a16bc8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-28 (Wed, 28 Oct 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Adjust type of __hyp_stub_vectors declaration

Aligns us with an internal declaration in upstream
linux/arch/arm64/kernel/hibernate.c and with an external one in the
linux-imx downstream kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/0ba496-b95b6d%40github.com.
