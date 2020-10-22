Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVMQY76AKGQEZJ57GSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 71826296448
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:46 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id h6sf962790edt.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389526; cv=pass;
        d=google.com; s=arc-20160816;
        b=0PVisigIFN7GGIBjVTMUq0QOdwjPg6Zj/npsPdFpRuTiYPIMKfgJVRFAbkLd/B4eL9
         083fjwd1hk4F47yE/gNUohNslmPIbM2SKiKrLOcrU5WW55HYWICuGZ/vZGPraVYGWnuk
         BBXQewh0bKZxKasJK8+1/b8rUvL/P1RP0zTeo7e6wFEcc1YWpa9oSjby3OJ4gxR/pzay
         o/evLwpTYzbT4DTb7ENQ32cSUUc7WtJvF1u7OqS8M+PC7gxSA1nll9sQsjFfSw9ay0BX
         WS2m1gaWD3tBLdzqWrVTeYZvL8NjkUN6izEOnqmBApHFbGm7QBM4buVXvPpiRI5fQ62v
         Tcag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=VaQny5Xh4hyoU0CyUS31fFmVPiOjFIuzT979axHLHHg=;
        b=B4yV2Xsjzztth7ykjLpaFj3yNGCHbmA1NP8g0LzF53QOBBIerRIqsiRFyyCBpRAzVL
         H9QSQGv/dhHaNQa6hTAaEdUKIIe+ecZslV6d2Q6qJa+ujC+UMTmJ8haZu7GihT2YD7W8
         COipvlpr6eI2eEXUgn+hGgUcL3l8fM/Efm3Ai68gNI8LGyd8PKN8EROHRiznGXwwntz7
         QJkGVzSdtQDFtJpQK+/rayuFqqq6Ok/7JbuKvmw0Mn1ybXvZl12FA+KPPWZlO9NMnCyx
         DiLuDNJP+/S3FRqO/9IPzVLR4hRxlbOWAYV3bcX0PxkQSRvun3MB/G32hMPGe2I+H+hA
         v21g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="0ZYQin/Z";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VaQny5Xh4hyoU0CyUS31fFmVPiOjFIuzT979axHLHHg=;
        b=UQVJcpk3YaPAZA/YcKPDu+UPfHJmQpHe15jNgnLQba3oVsF6YRsh0C6JgiKun0XiTu
         2qCAZn9jvduNS6jSqebTQOP5+upjjYMoriKB32foyXd9B7uZ4tU8RuJY69mYqAlmUpOo
         vwxdGnh0Z6BFhVhkqW0poDRDFhrMkok1jOYM4FVmulraW3ybc4cVBkfLDbpdDTXFeG7/
         /7+KXfOetxSfkAhTlwEElr8/B6/G5jawhHcGaMt2jaXw7keIyN63ySLkpLO1+qT5gh0w
         qSpqDV/T79X9G8LLQSUfzF6B4atSRtUkB9QfNMJJcow7arvQ2UyG2HkVp5eN7wE9EtKf
         66Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VaQny5Xh4hyoU0CyUS31fFmVPiOjFIuzT979axHLHHg=;
        b=RTopWGGB9/jUEhhpfXltS6Y2aoZDWL35llboyIPHP5//HvXMvnzW3vfNBTFKPQpkqd
         AobdbQrqMmCzM06/3gqzruooBxB82fmHVvPofjwYYsRtPDT4RNCNkeSWVHAE7IjA7BSg
         6grjzM5kalwBfgEpZsKLiG/BQ8R/bJ6YMDePOwwl2cAxE8iRDuqdklegdM6LWxTWpoSL
         PgvEuxooIAdl15QMWy072CIJFMW28rf/UTfPm3bjcPqI7rCnZuLTUtRs+o6+pauiqF18
         UNpWPEQBnK8bzXbRJd9LKi6k8rZIIgl/eFQeb5LDNm0gXZf/ZNDgXPY7RlhazgiSLJX6
         9kZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+SZjfNQ9vjnRBKcEow2mSi8sT+n+VhiTgpGX9lUQCxORoXLiM
	GJlRt2WQE55ik56U7JsavFI=
X-Google-Smtp-Source: ABdhPJxlanB3o1GXKEm0TYRLtS1Apq6o4iNvtOOZnjwGeC3wstV6huT8be7zs79ddq7dlNQW6iq+TQ==
X-Received: by 2002:a17:906:2895:: with SMTP id o21mr3608895ejd.332.1603389526201;
        Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls1173151edt.3.gmail; Thu, 22 Oct
 2020 10:58:45 -0700 (PDT)
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr3474610edb.197.1603389525064;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389525; cv=none;
        d=google.com; s=arc-20160816;
        b=qyMtIh3kY0LJ4ysmv4AYj3gXJJ5jWwBSzeDmkR9wSySOZC3qHZLK1etoQHZootn/qv
         5pU4sQV6Qy8wKb2f497DeDi5xg8OVOsdz4XA2qF5+u6Zr2evzd9NAkMfE+T/FMLFp/Jx
         DgkoxclGfAcRbQ8jr+B9yXz7dAWQOxB+Ms9MpAKvmdEm1mxBUbrepoefdqMAMwE/7Mam
         wvdYVrnfB44t10liRfGsznXSBn5NABdPFIElVRgtFRzh4mlvoJxDuJXBsq7tkrLK/uOr
         e9pF5BlD+uqTrLH8oGVlGlS5J7vCCIzm9pJ6Y6BwKDfTk9U2dSxPP+40VZF3EnjRawSd
         HIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=63QBtYpei1FY5kN1T6P0RRDJplT7dUIxq7kcz72Jqy4=;
        b=TtUyPHHPn3SHB/6Gegv9nM3/APx0CZgLtNxkEq9AAcS7Lm9eJtVY0ubCl+Uf5mFxer
         wzDE6oJWEgmqtTC1hCep541juPoK2wWtfGJD1CJVgq0jZuBtxHPotsV+dEIJXgladmzE
         insV8wvxhO5CDFl8RKSfclvi8RTmyqLAtkb4ytEnWtS+iwoFsiuh5QySOaSnGha00o9i
         6/ufN8Og2AP4dFStYRlzcobnga1Gt2jmoByeX9uKbV4cGoNrfOJfSPz4gRekLQ6GWQdw
         QU7JecntDwZutLx681TFuowrAjFP7BAr1nU0zkcoM/+fK/Qn9M3fJiaadTJLblCYe4vW
         E7Pw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="0ZYQin/Z";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id f15si4119edj.3.2020.10.22.10.58.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTw5r1LzyXc
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id ZNbSXjl4nqMP for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTw2dhSzyXW
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 27/33] x86: control, vcpu: force cast to prevent Wsign-compare
Date: Thu, 22 Oct 2020 19:58:19 +0200
Message-Id: <20201022175826.199614-28-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="0ZYQin/Z";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

The cast is just to prevent fallouts due to the Werror. The error and
rax are really unsigned values, but int to unsigned promotion is mixed
too many times to be easily fixed.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/control.c | 2 +-
 hypervisor/arch/x86/vcpu.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 2aea807a..98659f4a 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -238,7 +238,7 @@ x86_exception_handler(struct exception_frame *frame)
 {
 	panic_printk("FATAL: Jailhouse triggered exception #%lld\n",
 		     frame->vector);
-	if (frame->error != -1)
+	if ((int)frame->error != -1)
 		panic_printk("Error code: %llx\n", frame->error);
 	panic_printk("Physical CPU ID: %lu\n", phys_processor_id());
 	panic_printk("RIP: 0x%016llx RSP: 0x%016llx FLAGS: %llx\n", frame->rip,
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 7a6543bf..5dd23d49 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -194,7 +194,7 @@ void vcpu_handle_hypercall(void)
 
 	guest_regs->rax = hypercall(code, guest_regs->rdi & arg_mask,
 				    guest_regs->rsi & arg_mask);
-	if (guest_regs->rax == -ENOSYS)
+	if ((int)guest_regs->rax == -ENOSYS)
 		printk("CPU %d: Unknown hypercall %ld, RIP: 0x%016llx\n",
 		       cpu_id, code,
 		       vcpu_vendor_get_rip() - X86_INST_LEN_HYPERCALL);
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-28-andrea.bastoni%40tum.de.
