Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XIZT7QKGQEGSSHSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DE72E988F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:07 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id x186sf17249063lff.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774207; cv=pass;
        d=google.com; s=arc-20160816;
        b=myvDOD7jAv9CKl1Qo/TWKT8G/M+vFVNRJR8TmVTPbLZS3d/ZiLD1wqKk8EUeo4RiHy
         vf4rL0i/HPUHfbjvV9TIG8eZJH05OLsJnQFvM7CFxupHyX98lR+eJNWrPzN0GAlHUpKm
         mG/kthpBqKuSQnWR2BGR1upUcTytRbD67ggGreSRoygpYjagW1VB0ayHCTj2zJEgGOSS
         4CEXpNrK3sG1OR+FqHQmVxlqwsdz2OEG8VwE6pyDgv4zh+JaCvkXgPjbATp96HWRuiKx
         SQcnKsKqwTxUkjKg8ZJWCGU+EmKxN15jl6VZiRCxqn3qTghYhrYYPzATUUX6ETsEQyt1
         qYAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=QXCfmbIZaWylvjPW0AM+gEwNZdUhcNw3Q4K+EI6FDUI=;
        b=F4uDs70z8ZXVtST6frJUaEx8Bm9VvZa8IwHpTY6QBzHUSqJjq92EW9CGt8+4n5dRy6
         QVgEWQ+avmUFq1dxuo1rbQGKOOv7PvCI7A9KBDs/bt6U6XUhxDW8u0Tr0T9pRdRRLoFt
         KW72zTQ6C5Fcr6RBOb9UrGxviDnqnUG6VSudFHrpcvrxo9mad6LjmbvOjJxOgqAMooy5
         ha9Ahw0tqcHQEuXrIi1sNg/Clfc7uzJg5NI2gUCP0mqs6GXETJ2VVibPT/dmMbBuhugO
         MuFE4ZtsZGuJn3xAtSno8VoWX3QqYSRlBcoi8bbnFYLMW2A+SGBX0++JwJNdhSL4DTn0
         OOfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MNE2TOto;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QXCfmbIZaWylvjPW0AM+gEwNZdUhcNw3Q4K+EI6FDUI=;
        b=Q4JckQsvEwEqjZclA7GU8WmIeO8UYik+kff9qinuvnjh2FgjfdaQc8gm+fRQLhCaLb
         O37hlFcmr/fHclJQYUx4N9clby5rdhlCQJ7ErZ1+89MPEHPgOk1F0lXa8mNSehxABPHo
         WoaSByGYgsgA/M2KV4bUMZwD1oTc7TsDBeDowwfl2e8lxb8yBsVwue6O3VMNhf3DrXcu
         vHe7U8Evs133t2X1ZGbEAXtZNjxzedYYfiVDFvR5tDmXr1JFOdUtlPyzGp+x5WfcWiAk
         xn8QqOa1k/NUkKQIMi8k6nTB8IGW6SyAwPRf0pPyxTAzlBIh7Mez9cUq/cVvvKlvV3TT
         vbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QXCfmbIZaWylvjPW0AM+gEwNZdUhcNw3Q4K+EI6FDUI=;
        b=Y4eaGfhu1mf/QEXXq1f2jKA+vrJHyEDygwVi9AjQHSYVgw3K7XOXukq0H0JBguecZE
         alX88iQVpXZalXl9GwW2zqBWbmnmxoiN7YfUAywpngVDjtomCHmSjvI9a3HlR0h3+4Lo
         FjTfNQsjY0tupi+p3dZJfp6lTha7N6hulo8FDVnIMhBC1ufPA3STnk9ZNUVwLFwcLE1u
         AwnRqFyQ5MrIiMvVgO/IScPYJKn5cTJXK9TmA5H40uaRfi/SL5TXbpr3pAIgYfyQYEqS
         3DX9REoG3YuqicSUp8CgBkXt3alX+NKBaYfRUk/eKZXrlL1Hlyb8FNpIgktYtC/qK10j
         DCFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328nL8Zl8bvjQBzDPaI89cZo2uFmibfLDC84VK8KpTkRPBvYH0K
	ku0LzWZBR/rD32RG65tc1YM=
X-Google-Smtp-Source: ABdhPJyUJmRu5FijuPvBye4u5sNmLu0L9vDUIUXup4R7m7baToG+V+JQ8bLUeo8H/VGx51+kGUhK1w==
X-Received: by 2002:a2e:9ad7:: with SMTP id p23mr33985335ljj.465.1609774207243;
        Mon, 04 Jan 2021 07:30:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc2a:: with SMTP id b42ls14295523ljf.2.gmail; Mon, 04
 Jan 2021 07:30:06 -0800 (PST)
X-Received: by 2002:a2e:a36a:: with SMTP id i10mr33795818ljn.342.1609774206132;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774206; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbkYA9ZK0Q2yztFCSBP8FtqWZQ5QsvVnF9qFCAEyYsmk78IrHReuQBIcDWD8wB0Npz
         VqegItBvlSqTAu6Mdf2SMJFXvyb2nv1DTH5SbE55G53J36iK2NnXPSQrIj83eO0JW5xf
         g8PNZ2Ha0oJUetmEjp/3gJoHdDsCnzmLM076PYWD167910plLxSIYOqLNV0Xox42auuP
         Dfv7ZDlrZmSnlmC8qwmxuYGcAsNmt+t95We/TD4ycyoi/BFY5PNsndx9FrnbiECPNfKe
         fpHBnvlghzviOuFAItMJOm7d0he2DJF2ri2dlwa+hs2yc2M2JkBBZSEnGVey/EIyDnww
         aihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=sThGd5m5KNRpiLFyIBpTB7k6tfR3blk1udBCLLcBcEM=;
        b=KvA5miQmIah7RW3AghibKF7ngKbe9MnY7tafQncud/8/sokyftSVx/s8AgKSoeUqH0
         9WjjkJp/5hj9lJSEA7nCmXSdK7jiUCvNSqArt+G0bz+4zPHa429WQdHHDOQsVSmiCdEg
         EYdJ2SfZae6OIDrsH1WjhhlaYT12fxKidvpLHkxrQO51y5X1h5wjx++M2cqFV8BAGyby
         OGDLT48eGY9d36N8HEwE93m1/SqVQpFfN+hp4RmVmJFyB5m1jeLBBmdsvI0hId0ZWHz/
         lpVhxA1meqM2MWTqfGN33QsgFci1kCbStHoyjxAQhbHSTX3fT/nr0E1VjnEvRGTJlHrK
         pQRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MNE2TOto;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id z4si1431930lfr.7.2021.01.04.07.30.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1McZnj-1kQPyK1oeT-00cqsz for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:05 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 7/9] arm-common: Add handling of SMCCC_ARCH_WORKAROUND_2 requests
Date: Mon,  4 Jan 2021 16:29:57 +0100
Message-Id: <4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HNlR3gBPVjPi/UYDb45G5zllQGJwimpJJjxMkoCGOcgSYr1tRcZ
 zafVs9SJgQAee8BDgeTkOuNIPM5EIdYgq3S3w9IPA8hXrfT6ULDjolpaNdRcQp8ZXs8WzQH
 pZN7P3qd2FJGTCiDudWSisg+U+Vzk4dwI+VZn10BtzS3A1BPq8g/qOOz8ipJVPkCpQTLqGC
 aq++RyJgH2ILg4IMAkoFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kr6lzt3b+kI=:ISpY5WLTeiIk+HJowo9sUU
 LvKZvXfcbQO3VVSqXKiDkyoZAq6VrfZYB8Otob9gHtX/MxTfl/108chyzhnslNUz7yk1AjZ6k
 GcDgtA/rnAD3Qzj3JnRwBFzRDZGPMIjkKRXXFJuW3Le83UIc+CE8aPwvyZ7hmYv18+nIX8BiB
 WzfSwlinCqdD7HbeolGusDWnGxIgjoHbsQQ6GmCdGgbGAIBNE/WeuHHmOcF77hyx1F1Z6+Xyt
 NaE26MF7IYRq+KAfYlcX/h5jNhHTN3uz8U360dZvoh+9ZqIl5eD7rv9UGnPlevB0E18LVpAWT
 eeiY94lO5l0hP12JLIqsz0zQGMHqGB4ONTYL70XfByRCXrtPJTlQw1cABLRNAhQZu27Tv+tyL
 Veflu3XZUp5UI1YWqDa9CIwt/uiEw5/Su0wZRQoPbPl2IMh8WQXlEeNWAVA/0uiYhsyPXvaQ2
 4M8419fpPlhHh9XXiFeAiCHPZ/hHjk3LCng6ebg6N30BKgNNTkqAvCLPl+JgLa+ZqOHEHpj8p
 BOW4RY/I17nXnzQnJiNmHbDc71k2Z/MpqmzUlFrM+2YHHMd7dJccbZydzsKWvt70FKr9DoD1A
 QNOZrm7h1IPqKE2uW9+m9yfeIyJDXyebUw2qIvYM6rlMEtcJTyk9+qmRXS9/KE+wrJoLTNecq
 T7KEVPV34xMnKNdxhFPsmHTB90B5Ie/wG8QastUypzTHA3xj2BQm7b7vxI/LSvYNRLVoZLqQu
 9pFPiaPJvuevzhs959bpT9Qul/5ux7e1UwYdc45Z1R96+qTVTjZIlYR3ttxiG6//yxa9lYRFY
 0X1tCDLB1IL+iZ+xcNkfcogag2e4AztbkjR6dxhvaN1KbZHMVXo8e79mg2vWhh7VFNAq5VBUb
 shZIZea2rn+zOHuLf+0Q==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=MNE2TOto;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Jailhouse does not need this workaround as it isolates secrets via
CPU and, thus, cell-private mappings. However, guests may request
control over the workaround. As it is per CPU, we can grant access.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/percpu.h | 3 ++-
 hypervisor/arch/arm-common/smccc.c              | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/percpu.h b/hypervisor/arch/arm-common/include/asm/percpu.h
index 4b37e1be..a3e38fa0 100644
--- a/hypervisor/arch/arm-common/include/asm/percpu.h
+++ b/hypervisor/arch/arm-common/include/asm/percpu.h
@@ -16,7 +16,8 @@
 #define STACK_SIZE			PAGE_SIZE

 #define ARM_PERCPU_FIELDS						\
-	bool smccc_has_workaround_1;
+	bool smccc_has_workaround_1;					\
+	bool smccc_has_workaround_2;

 #define ARCH_PUBLIC_PERCPU_FIELDS					\
 	unsigned long mpidr;						\
diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index bdbb067e..363cda1a 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -44,8 +44,10 @@ void smccc_discover(void)
 		return;

 	ret = smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_1);
-
 	this_cpu_data()->smccc_has_workaround_1 = ret >= ARM_SMCCC_SUCCESS;
+
+	ret = smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_2);
+	this_cpu_data()->smccc_has_workaround_2 = ret >= ARM_SMCCC_SUCCESS;
 }

 static inline long handle_arch_features(u32 id)
@@ -77,6 +79,11 @@ static enum trap_return handle_arch(struct trap_context *ctx)
 		*ret = handle_arch_features(ctx->regs[1]);
 		break;

+	case SMCCC_ARCH_WORKAROUND_2:
+		if (!this_cpu_data()->smccc_has_workaround_2)
+			return ARM_SMCCC_NOT_SUPPORTED;
+		return smc_arg1(SMCCC_ARCH_WORKAROUND_2, ctx->regs[1]);
+
 	default:
 		panic_printk("Unhandled SMC arch trap %lx\n", *ret);
 		return TRAP_UNHANDLED;
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a.1609774199.git.jan.kiszka%40web.de.
