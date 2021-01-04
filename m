Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJODZP7QKGQESI25C3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 352082E92AA
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:38 +0100 (CET)
Received: by mail-ej1-x63d.google.com with SMTP id ov1sf6845217ejb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752998; cv=pass;
        d=google.com; s=arc-20160816;
        b=D/f6+++4q/soiRUz70XwOgpq91+VeYR92sFomkMiv7cQegpAXF7ngxL25Pu12iyr2+
         q7GGAqMAH3l8W7k6rSg/YLGxQcS4a2iIZYg/dc/RtpTT6ZGxk8aQXYd/Ipb/9fG2Hktq
         Q2WxGHA/r2Y94+Qe15gtA3ebPcNPBxILpoS8eDDK7UEXaK2LrJ6STM2ixlkZEyJ1CPMB
         1R+pEW7NmdjBbx1O3e/RCUOxzVGn2p4/9ALvA9rBADBNsRIegBAcn3++Z9niP+hO3dKP
         WrKbjAhbOW0CTui0TKbBXp6Rkw3YiztX1pOhkD8UKDswxlE6Q9XtJQZhqcCREX0Iv2Rt
         JlQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Aqsvu8l8QRMv/lActyp+ilPp+rlTE6sU1pbzYFtIk+8=;
        b=C0ZT8igrsb6Sj7JyBGltcjOEWrNd7HmTsu3cOVkFj0IiqaOn3yXEZbN1en2K1Mscat
         cMi/0DQJGl9vIZMnm2+RSpT+LhCZTpXMQGJtV2ZuAdzvCk5Cwo936p/gGCVNO4lRSW1L
         ylTBqqrIK+oWt7bV2Pso5u3foARgdZAIPNu26b9liFKkZIiLC0JDXOaKJ/8ikiEFnV3b
         J38RYcYGdqP/G4UlS6naqOCIgYv6YBy0Mle9mtaF95a4PTwoR/AsLnYCcxBvj4Uzyzjg
         v7kc2KYmjS/mDXEmqj/IaL37Y3/gfJ2VqBgTNtpXRrt32TxMqTyvvGNKWZdE4gaWY71v
         c4pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Yxy4vW10;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Aqsvu8l8QRMv/lActyp+ilPp+rlTE6sU1pbzYFtIk+8=;
        b=AQ4eHdmgxSCgWVfVPwLDpnpiGYqAFv0pkLgI7Gts6/oTHnI6mwcFZteGMUfcCeeEZ+
         EffzJg52nS1NcBRUipMP+Pw1Rv6HS1MpI/CAXbusFULlD2PHil4QN9+BvUuJ2UvkxyW2
         kfxjaud4yfzySqO/6vpuGyl+Z6gS/UeF4gCndkVL2DzlCHwrdcLxLAeodGguh59Lue77
         fyw7S7+UaglSppsa9f40UI030SU2qZZVDjLHxaTtajQm6kv5QyQUwO0dZBNKcMUmB8pE
         oMv0wpzy3KgT9ZC9amIC1RliewDMTKIElwsNv7HDD8Q+pgh8f2bWjWW00rb962p8B7Eb
         lblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Aqsvu8l8QRMv/lActyp+ilPp+rlTE6sU1pbzYFtIk+8=;
        b=Xp8h62//t7Jb4B+JoxIvw3GQsRBjMq+iKYPU5woKPqFkjcR7d4pLyqsTcmNZic1Oau
         rWkaTfSW2QkrMral3DaSc9jDnXHZXvHnDWgq20xR8S5rQfxGA+8x30r8XqL8jZcUoZ9C
         eQQhu9qQxla1A+Wv7RmxwHwXHHk+18RQqHNsqUJouqVQc9oG/vqNyUYDNsuostEDX2YV
         DvODxrhZ5LmdreCFOPJRQmu+rgfZ0KKHm9R8cCK8Foq14N7JdGbBkJAEMEceHbTRuMZl
         T4y0m7OgWChBCkg/V84NTy0/7PY45SoVtMk5tuKwAQNVFOeK+ordQyb+WuKHYlQEzoSX
         TB8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OAlYHZrhBAdfD6Kz9Imaw7dDFok2hckYTtFkbIivfMfSWnXGz
	bazu+wzXrHpeY8VC5GSlKnc=
X-Google-Smtp-Source: ABdhPJxm8qpz1mpuReqo59WVI8xyXtYyeEgeQLNhFGL1ZeyS3n/FGdLf3EEPqy9ffCwI5Jm+6/A0NA==
X-Received: by 2002:a17:906:1f07:: with SMTP id w7mr43551769ejj.519.1609752997953;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8a9b:: with SMTP id j27ls14475072edj.3.gmail; Mon, 04
 Jan 2021 01:36:36 -0800 (PST)
X-Received: by 2002:a50:9354:: with SMTP id n20mr71465999eda.231.1609752996853;
        Mon, 04 Jan 2021 01:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752996; cv=none;
        d=google.com; s=arc-20160816;
        b=gxZbS2rXnncc1FBWZHHKSWNSfR9VmQOmIX/DPm0jxYMiIXLubwQGqPWMgqgZmDVwvu
         jBuXc7trAPjPuiihFWBmHE9EmC+uQ0jglFTfmYwbhRRXy7uOgCSjjtkouoPcKffQ/hHL
         vz57sqj08BOZKG/k7g1OAYRCiKwaREIzinyBsNPXo+R9bUqCMxVzkNzhkxlYDvpnWeJ0
         PA5hnb5qH7Ku5yzkvYiDIydoyxnF77o2V7/yRNG62mSESxUvHF3sxTjO57xUiHug/TdF
         C3EbyzbUlq2ZJxuK7AKTA2av3zLuCudIsZN1I6+ymmoqbFVWhjCxD33ksxQlOCFIu7+k
         3onA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Uvty/I47wUcKLJzs2qYynBRYjAtZ5gxGs69MpMHNxq4=;
        b=aKZHxK4WvTqMVH1g0u8jLqGgB8zK1MHwSSv1z97EXrywz4jt3zgBnmF8IWXONlkmXq
         fCDUunw7jw1ZQtn0yoziShVBkGKcHsE90io31Q/b6dLprkpfGVjLLxkXGj/i1T4M/2c8
         XJPc2sRRi1f4/nGQ8IAYwp6Um+jo3nNJ7j7jXt+MN6T6VZr/wmuNU7x0VAOszyWmv7BL
         aS6OfHk6bV+VPtEwCeAxX2KeJXuWY5IRO/s9HF0bogW1+UwprAIT5lYYeFmP0ct6NtLl
         zUuGnJiXrwfQXsu2O7QAVnnWd8PTjfB3iWIZn7sz9xowsFScaW053sSlpVVf1pFCtOWX
         i6zQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Yxy4vW10;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id i6si1638055edk.4.2021.01.04.01.36.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MAMli-1kpBXy1GCA-00BaFf for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:36 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/8] arm: Enforce soft-float ABI
Date: Mon,  4 Jan 2021 10:36:15 +0100
Message-Id: <1b4c2b27ccf2f873bc1e66e9b0182a76f1191a3c.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jEExjoF5PssByUwnpKNjCfoNuUnhHmEQDzosebWz6rxdUJc0/HK
 K+La/e8lqoBCs4tvaQHC1GXmuNrVApmx13zamQCxLzIhhbeqJJldra0dpqBc/E6gLoiMxrF
 1z/9B0JhX+ccHIfYBClR3kuUG6vhsRlFqk8v0qI+8RRrAanyC1IjU2rjKbjHyGXBvfWdXRv
 NcAAVYqqDhQ6CpZU7U3PA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uw40XXJP5M4=:1Au3IdmzQSdWo9ruUCsukj
 DRVzCOPSb9BDTK+fDZ6cM3bFPF2aP7jZTuVB/jDuGtyBfG4o/Od/ddUZZyPwHb5zHAWDsLxmw
 UI679DcE/UKt+wTQajUGcTguMt9q59rv+iGoZf8NooB0+am6AnWJOTKhFy7tEaoP7idBS5P4N
 eahTmsCF6lMKi74c0J/ZYaKiNbbHfmDsikIuBIwxug74bKZrDjMozzf7EXJjtnhM9cNn26DFd
 lCJyPoPtDzkYFsgn0+6wvVOEAjT/2kc8Fi2mlhBh6ZRsgTp3QSGL4qJg6z6Z1bvve1bL91bN7
 8EAaYTe1P9fdPwz/YsVTbw0bcA9M+wr2Q1thsDCz8qzt0KIx9NTupCPhZmh03DifNQJRLVNyR
 n/Ke8SBNgY36vz03bbu5FbC2HodBgs/J3s3SU2Zi0FPYPCVV5tlfMsMAuFh1DG7jYSmVqtpOM
 Is4pktfC794n6SvH3wYfmjdi+UoR0sbqUYHzE6opijOTF+/sV0yUTScsY/+3uPw9v1PysupQK
 BLGOKGEA5zRIZOdI1tCmY6bzUDUKAbOb/XgwpwP+g+2irOu6IVQvvlODhkane2KyzORXMFcgj
 avXUs3yyz1rRig/WCOVaGu2GqPUV2V+VCkp/q/dCnM+0CqZPMiyyXRV7kW0IKxk/XtD0Yc1Od
 ohBXLXw3mzwB/IlseNERCSInj01/TMMo4BtvdAvQTA/uYoN7jVXf9Lvye3ZbI5ExWxLeLXEaP
 UnAiH/GJqsn+FkovLAyg9/rE7Ta63KdtUXti+WxtcTmRPOuIgq09/U8fM2+ph4Cplegawjw3A
 ZXusK8vKmqPY+Qzh3gcjVimBbBc/Q4ByqB08wkG9PcegYtobohz07oGdO36vI3F50FAk3br7R
 tOK4yJKR6/6Qrb6vTsZg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Yxy4vW10;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Required with newer gcc as we may otherwise "gain" vector instructions
that are not supported by Jailhouse. This is analogously to the kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
index ad5b2276..a54370fc 100644
--- a/hypervisor/arch/arm/Makefile
+++ b/hypervisor/arch/arm/Makefile
@@ -12,5 +12,5 @@

 LINUXINCLUDE += -I$(src)/arch/arm-common/include

-KBUILD_CFLAGS += -marm -march=armv7ve
-KBUILD_AFLAGS += -march=armv7ve
+KBUILD_CFLAGS += -marm -march=armv7ve -msoft-float
+KBUILD_AFLAGS += -march=armv7ve -msoft-float
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b4c2b27ccf2f873bc1e66e9b0182a76f1191a3c.1609752982.git.jan.kiszka%40web.de.
