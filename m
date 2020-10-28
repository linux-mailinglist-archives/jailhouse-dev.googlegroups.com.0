Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJ54476AKGQE42LVW4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB229D247
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:00 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id s12sf291840wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919400; cv=pass;
        d=google.com; s=arc-20160816;
        b=NTymRVO6R6Sr5bBGn5RjD/MWE8kUmts3UNEyTYo8Va7Nk2fOlv/uS/Ue3cGykQRPty
         9XqC5XRroMqGM19Yn5nTer3Yy+uhUaskMvbSmxd6sAJ1ktM8LEY1FrexiFnzf7ydPY0l
         3wtnGFdCW4moqRW0UCFrpDEWtdsUw1vcneZousa72/W3sSEGrQmB33TqQb10ZSaN0N/7
         LIlLSibp/nH4zuGSfo22V5t3jewyIjMoU5nf6tiiwlh+EecjqYMxO8q9KbM26J9e8n06
         1QZFdX9J+/LDl64e0Wunht3ilfEyTZzYltZih5E+EDRDGkYPYGG+Tt1cMom2+VJCdiYk
         7Qmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4kqCpYN/zxWrHIn6ZWmkaLs2URDUchtPjUEZVnQS41Q=;
        b=R35SrprGuTWL+2mC7P6fkbY6Jnu9itWprp/NBt5Co2FX9hdV00dQqr904hKp9HhfsE
         +2rVch3lATMhyJoF5Q6Ssl8KDMcvfPU/cz2Ka7YOkUeAIPgvUxLyIMqYPEn1d7jSAmGc
         /sx/jBweaG69+3mNdLSuvLq1kPeMxHDoztZXQSfyiwJd8726R+bFH/rry7/HmbDOS28w
         FwxFyA7I4Z54cH0eZpFyf5NlR3JwRFwlukp4wrpyEnj4Mgb792OkKR0W2B/EbSue9E93
         ZNP612PD4BvBsSKokIF2uul4zdUzku+jpgrvQUSCKll7hK/Y44w7suHJhvVxdmIctG0o
         cWIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="w/qNz+Hv";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4kqCpYN/zxWrHIn6ZWmkaLs2URDUchtPjUEZVnQS41Q=;
        b=CWoTvfgg921vJJuy/iEXrLqVtwTh74MGZMuHlivMnVTGcsCJPtCC2YFru2HsoFHTkr
         Q/neskSGPuJni2l9/OkF3sj5VqKD/YuPuS37B7QraVuPzdeF9GeYm6XRcjrhaezmvhm6
         KGohHt2E/xO8+nwYe7cE528PVp0ACwyqFuOjNf19Sds3nG5Z1KAu6jiBfnRTFUwAxVvN
         3SLnNzgv2bXCLhCHw6FwRSq9rEm45fXxZynwKB539Vmtg04UokGTAnAR3FL9BssjnjxZ
         9goIIdZipt4mErFUjbk0ZYgtzwPUdWraLqaM9Zh/FMbAgJSuPO17HoGpo10BVD1HqdTv
         8hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4kqCpYN/zxWrHIn6ZWmkaLs2URDUchtPjUEZVnQS41Q=;
        b=t3qRJf0HhUP2IxMg2p5skLpP+i/AyL07nJ2RfYtxLFQcqKkvWACDJQMaH1674+Bnkl
         9V5eLneE/qk60yO7vVgE6PYdw9Xn+b6Ka4sKZjdqJw//6VT0vDztBqG7HhjZC65khQlQ
         Xu4GTPmuMZyIGpkG+dEx77IiUCDlA20pmyj1NSFHuuRZe49FqUlCEAviPRnFV3aJWBIu
         CWILlfiCDl+WvYIcpvmu9uF4YYVpmKji8L0ahYD5CIYW90CoDwAIeIId/0m8ghbDx9pw
         EZKjzf/Vhrcq6QH67bEE+HXtBANUBBIukYmeEZOYvvF8fxIsEBieH1tpU/aW0Fh2kTOv
         Ht8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530sg7U8hB6OliedyM8A9v/qny3YZ7iDqSxgbAX7Tp+mPKcUW4Ng
	ucRT/jJBFjeYkVjdreSs+I8=
X-Google-Smtp-Source: ABdhPJzu5vOoCbsx+ZebH5Cr8HU40varVMHShA4ye3adLpx/N4xNcKDa0umVwbleU55hc4fbQPyiyQ==
X-Received: by 2002:a1c:20d0:: with SMTP id g199mr840485wmg.38.1603919400122;
        Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2c84:: with SMTP id s126ls211478wms.1.canary-gmail; Wed,
 28 Oct 2020 14:09:59 -0700 (PDT)
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr763942wms.77.1603919399207;
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919399; cv=none;
        d=google.com; s=arc-20160816;
        b=aiE7CiozpI0zMoT2JPxIeEVUlN7eX/TsSnSZFzcFFSfJ2aKJem/ShNL2j5FYZDI2qA
         yHtcbUCsNMwLAIr06SG6Y1ZLCN5Af7yD/VfflzDSWBLDMyTBojtoq3krFhimrfRZoqu0
         A6neOYnJSQCV1i2fhvk1eg6MPjA7jBwVSG/AcVmvAuEfafwmIcdi8/v07J6NFP5bI4iT
         RqebekUIo4VxO+2m4mlA0RRkj7bQHoqaf9ZNmIrZqjUiBsdTb/QR2lPBVu2DT0CDnKrL
         WNsArAIfTx42lPZmZrSEYzJbgElw8xsUYxMhlLdCamIhyXUYKZY8HFm9i0kJa+NxKhWn
         JoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=hCjGy51FKTLX8zJZekyB9McVszk10EWd9jpptNeijBs=;
        b=xFNfW6OThetVq6fNtXN2Kskfrz4rmvXTG0gq3udCe4Ilfu2867odeU9+dAWMbqCv30
         fb+Iez+4BXa9pgH54MVN0h5UQNZUs1Mg7PWevx2LLDGqjxPmP6XGOPIqNVme1dIq5B9Y
         pHDg8Kh70z2uJT5V14NN1RfzyArs336aFTBvWmtI612d8iQmW752xZbfty2F1zAUJn0P
         7UP8NuRW9KF2hbE+padFYJ6LAzJrCfjCXXGf55ku43EfRjM345fbvAG42ymfF9TJSxmT
         KP2qa8i3iZQhjix0XTYmpxJemOQWP58cq8eB5g7B4BJP21wEfLJjgoClcHEElOWcYhSu
         g0nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="w/qNz+Hv";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id e5si22078wrj.3.2020.10.28.14.09.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rq0H5hzyTC
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:59 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id TkV0ah6jbRo6 for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:58 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rp4gylzyT0
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 17/22] x86: apic: Wsign-compare change to uint and update comparison check accordingly
Date: Wed, 28 Oct 2020 22:09:28 +0100
Message-Id: <20201028210933.138379-18-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="w/qNz+Hv";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index d36c2033..b49a6745 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -315,7 +315,7 @@ void apic_clear(void)
 {
 	unsigned int maxlvt = (apic_ops.read(APIC_REG_LVR) >> 16) & 0xff;
 	unsigned int xlc = (apic_ext_features() >> 16) & 0xff;
-	int n;
+	unsigned int n;
 
 	/* Enable the APIC - the cell may have turned it off */
 	apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
@@ -336,7 +336,7 @@ void apic_clear(void)
 
 	/* Clear ISR. This is done in reverse direction as EOI
 	 * clears highest-priority interrupt ISR bit. */
-	for (n = APIC_NUM_INT_REGS-1; n >= 0; n--)
+	for (n = APIC_NUM_INT_REGS-1; n != 0; n--)
 		while (apic_ops.read(APIC_REG_ISR0 + n) != 0)
 			apic_ops.write(APIC_REG_EOI, APIC_EOI_ACK);
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-18-andrea.bastoni%40tum.de.
