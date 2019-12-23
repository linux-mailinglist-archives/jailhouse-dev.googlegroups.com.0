Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOMPQTYAKGQER3JEZPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BC41299E4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:30:17 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id u18sf8335411wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125817; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kb0Hi4Z1PeqzruIQdWnf5VMVTq+vvZEgSiSE7XiIDGgIFnWKJ+t4DDpowc4bmKAs5f
         AArCBop4Jg/JEOE7BeYc+F34RNmdEnTCEP7iyH6faG/wk8nQ1TLFozwVop7fZ76W0CxV
         D9A2yto3fVyoaPA7cj246idO48f5jb3qJiZiY+B57dWGIXT9zSWO1enjjEWU9AZRspeg
         N/Tk84twReKQcgapc+EfIXyPmxick3r/2UsoaZDmv5b+b/9FgYf8T7sTcI8tkJ2Zn6xD
         worCKTBDR/6OSXVAVCG6/ll6v2slrw9HsASZTyb00pNAyzpv5gjVHgZH4CJaAHXlsswl
         OGLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=F4i+pekDh7SNsA8WNH7C0QXsPhAhtXnVmrwYTaBp9M4=;
        b=nAI+nSTZF+BPNEoBqTJpTbE3VzvGmhjJY24oLfMnSqniTIT8n0XEHxwtn9VubCTWjR
         F38V2J9UsiAIo5wUUvKODMBlirQL7pLd1+NeREgcQF3PsH19Pz6nBCUYKKv/CbPk3mRn
         avfaq8l+I6frroeSxlDprVe/z1wpXokgpdim+H9n3Ud/Bwdxv1fs7R59XjupAFTW9EZ9
         CWHv75YORrpUTXeULvAECuNC/wibfFuPh+44nSdNKZPC1pH6nrPabLwqrUx87zF/z/bu
         nfqYR6TrU1Ho275lSYt2WclZr2X8CQ+FMnf25EpHjSgFJPkPkNt/nANyUQuZBNSr28AL
         TQ7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AFfWQZUF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F4i+pekDh7SNsA8WNH7C0QXsPhAhtXnVmrwYTaBp9M4=;
        b=iBF5923FGS99A5dK7FFjFQJRCqsBjlcDQi97aD4iqF1cVe3OFRg0C1Niu5PyAeEDM7
         wUYbX8tqoH8Vy1aVhmc8l27NEVz0no5FCRLJX6o0SW2ZqLRITOWSLn9HsHucOgovFg1T
         pNyeuw8HdoF7BPXMcw+5raxRDEWu+UWLh+gTdd2oSU3bZr8ozEownv2ZESHVhuG2ZJB3
         SdJP1qgYT4ap7ogb0CgJJ+KTUktQRB4s/qXe0Ujz1bJeTXX5ofvl2Dlh3Rh1+A9bWAAh
         W8hVWqU4bjx0D6V0lvRBbPmZcdbSINFK3QKqsJ341nrMyU+eDj2HwI4Rrm+Lspbsv4Yc
         QWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F4i+pekDh7SNsA8WNH7C0QXsPhAhtXnVmrwYTaBp9M4=;
        b=SrJHHy6Tg8vLfDZdIUVtdHUH5XaLctwFcj5F5WHK0O5Y8caPfV7fz+NoPydpdBCFis
         b5iOTV5CmoXeRZsIaU3fc347q3bt3HOXbsNNViRJxpXm+CxTaT0+Q6wQFfYrN0awJB9t
         LA2EwqAe+UmfjH4E1ygpbtSU5S//oRD4WAyUzULk2xtNpUsIt+OVZsenPwdLY2Cvy+bD
         2jDKcPrk5o2OgBw24AsgWcu5EmCUkuFTAUP63OKXvLwftp+QuxZgj/l4J5TZAZrvH2UV
         ARRtd2FHnx59ZkB6sKEJlyWSiCIkVOGP2oHfMahDHcjLfbcY44AMiF1lFp+Wu6lWoRwz
         p5Ag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU2XF1SRIXrFqoUJu9tpvEEqgB7+y7/qje7eD8mwwAPRpQLMESM
	1/YKWAzi0TrMCWj7+/prJvs=
X-Google-Smtp-Source: APXvYqxLu9rKqfn2v8RRgsQohGQLiyy3vrQt/AkqEFrCYE/cnvYfROsGdNncHp0VR7g7rc/Gxk5jFg==
X-Received: by 2002:a05:600c:30a:: with SMTP id q10mr270808wmd.84.1577125817279;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cb55:: with SMTP id v21ls71308wmj.4.canary-gmail; Mon,
 23 Dec 2019 10:30:16 -0800 (PST)
X-Received: by 2002:a1c:44d5:: with SMTP id r204mr288988wma.122.1577125816564;
        Mon, 23 Dec 2019 10:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125816; cv=none;
        d=google.com; s=arc-20160816;
        b=u+RAgC3daP7dsIxBDmuu1rZ66lF2edO+2ktUWtcjt5SHjorXoUmJVzjk3ZYi6C5Dmi
         /6Fcs8q+twr0ix85W0nFuuvIrFH5OF2P7l2nf6jAWUUelmo+W02hfIG9DYHLdcja/L2s
         WhpJx/DuGkfEaP4RQ/sBg7O5bdecoPHuBO96y2AZSub7S4VnnirZSYk2s+Ddi7iPyKVu
         lNRxEVFG9izl7qsxsQxTqcgXuo631ZjaKiWcXzNTkz0Ikk01luGrWcJqzmiaZAaDdGMt
         Felzg+yrC9sOnOss7dgxLtrtyPIM5bGzYu2wRG3j+Qhoh37RSns5ZXWJpsljbwKlqmtd
         UjUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=TRBVLNCv+0c2/45/MG4aweV8RECtIhjVcT3GlZBRqjE=;
        b=yA5wW/x88E7wPp9Pa+i71krkDUue3Htwl5g5b/+wlIvZBqNoXFXy/VTGBDmRzaoTq0
         RhgZrM24/nZkfBruaupIt/CH65db02iwVEKgR9YUpN4J8RNcUSyrXypmSBy7PDza9k2d
         uN7F++f84CnQwua0YaofdTjMi9pXHevfB6f/EDH3bS0hBFUvNo0KXPNNRN4HANS49mNG
         OEsZG1fF4pP2tf8ld0zHCLU0/ev77qkiIPanDjM1rRUcTYkCvxh91ZIkdWcj92zei1Q5
         HukvIJ8eE0nS07chNvPJe/wNvNE4Hyqx4Djarl/24zTIo8IL6KXbIiskmYG1NR/KbkL/
         DazA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AFfWQZUF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id t131si11219wmb.1.2019.12.23.10.30.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:30:16 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.mchp.siemens.de ([84.61.93.39]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0M7sw0-1jesTQ0Md6-00vKsm for <jailhouse-dev@googlegroups.com>; Mon, 23 Dec
 2019 19:30:16 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/6] arm-common: Fix barrier usage in irqchip_set_pending / irqchip_inject_pending
Date: Mon, 23 Dec 2019 19:29:45 +0100
Message-Id: <940e194f3be655cc56929c70b3f7fa61cc89abed.1577125789.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:BW/n/4s9Ve5NBk+AhAooYAbcSDPlATvZYLPh5Qn5EXrujlzj3OG
 FMIJ5WOKJV1zgu9PfEpmZQU+NmfEY3iGmCHEPQywgznKKIgXKLSxbD7CMhlm9363P3j9vIY
 FUvCXJQpN62Q4jDOkiAwa9CuTHMBOEw/WvChROxqUNQoEiFTKi4ZkPdrQoSoDi98t724F5/
 ToUsM4xEAlXz9CZmflR8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z9lKAPd0YRY=:KZbnIJ9IiPF7MS1Sk9j/6t
 qfs2hI/90eMjzyF5uODlcMlnMazwyfZWrq8OtzDobhTulRBJMGpo087gZysM3461xnOiRbL/I
 q/WjNQRI+uYA80J0D0/3hiaE0Zm5K/2IEuWe7DSltkNfxYB/ebIvmGoXQ6gJNKCB9A8F4pyli
 e7LjHdv3U9ygcpRmuOSbf/HupZepceDkHk8+EaAVDsQJ2yNsRS6b4MqW28PcuB6AlviBVk3qm
 iCt+PzrjpwetV5hl76bwcPJ/ei8AhHjocnRK/lCh2eElflbmK70Kif1W6XGNA2Xz0ps39sLM3
 Rg4lqSSi3PBp/IvPpyvFrncNcr5JuCvP71r/w7ZAUT2z38zxcuyjPGCUL0VJx8nHEaHpkj3ry
 23+4CZxFCF3raZtOF7inq6bt5HDRrNtG11PitAY/ltnIdErKxUX7NiqvHwnn425eUkfB9qEu0
 CahrR+hf0+BgH88uFqIT/Y6sk0J96iCnWU9voPseDBMckf1sM20FGRGk1euVzhOJyFDM89Pyu
 UdedhCATG081mEgr2varae+OUOiCqeLsik+M+qtoI3unm2+1xS5Yw91t/mchJRWPdL0t4EIKS
 ymo158kYdXPb1C2GoLvdIbpgzMo911f1Bt1/wx3ZJnbfNawnx0/gbuObLSiIqVXr/BEW/K4rQ
 RhKXL2UoCaJwq8Kzb6vt64YVFR9MMv8Qzfn7YLS5JX/6alK/mS08/EGWnwpXLbvIS+D5jlNkR
 BDrAUBPSrPNd7K26P15Alz3464HDz8mORvSZ5MeBzEMxp/SodEldRkcYAzkYwt/lHb7QBIWdV
 3lzwknNbFqvzjpgYz8d/UcS5rlnIh1erpEZsHvQmDjTbtRPBsNJjEvWdlMw/XHoKUUX7/C8Qh
 nvbPAwMC3FSNim6FtlfPILrS6GrNUyjrIRiwTnB2WvbDyiPbEmCYC6ZJWzyXMHvk+0lJGixyj
 eTLGF+W80KFaNMc8t6jZWbK/M8QnVZgjmdDL129yQ4r+XVLFKSVLmTpbvuX/n6umuwEEh129N
 NroKIbE/iFA0MHYGqYKfx/bQCAFNtvZ4Dg00r3qiOR6R2ghNUetYhCDE5kHlhyXwL5BLR+4ez
 BebPQTNUX7HggZyvEpbl16+OWpDqTn2Xv5Bvok/XVmvJofC2/knhvvA2OQDPy1Avx0uR7hvth
 80P9X6N4SZrSk1VtoEFeesALDSySeixCMBoNT4xXPBd5BOdSYJ81nydo/e4jTEsHRJ81cyKAg
 zdRgCKlXOAS6h4/HVa452bZm6v0bG7f47ahMIsw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=AFfWQZUF;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

We were missing memory barriers before updating the lockless ring buffer
of pending interrupts, both on producer and consumer side. At the same
time, we can remove a barrier that is already provided implicitly by
spin_unlock on ARM.

Reported-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/irqchip.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 1c881b64..d0bd50c6 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -246,14 +246,18 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	if (new_tail != pending->head) {
 		pending->irqs[pending->tail] = irq_id;
 		pending->sender[pending->tail] = sender;
-		pending->tail = new_tail;
 		/*
-		 * Make the change to pending_irqs.tail visible before the
-		 * caller sends SGI_INJECT.
+		 * Make the entry content is visible before updating the tail
+		 * index.
 		 */
 		memory_barrier();
+		pending->tail = new_tail;
 	}

+	/*
+	 * The unlock has memory barrier semantic on ARM v7 and v8. Therefore
+	 * the change to tail will be visible when sending SGI_INJECT later on.
+	 */
 	spin_unlock(&pending->lock);

 	/*
@@ -292,6 +296,11 @@ void irqchip_inject_pending(void)
 			return;
 		}

+		/*
+		 * Ensure that the entry was read before updating the head
+		 * index.
+		 */
+		memory_barrier();
 		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
 	}

@@ -389,6 +398,11 @@ void irqchip_cpu_shutdown(struct public_per_cpu *cpu_public)

 		irqchip.inject_phys_irq(irq_id);

+		/*
+		 * Ensure that the entry was read before updating the head
+		 * index.
+		 */
+		memory_barrier();
 		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
 	}
 }
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/940e194f3be655cc56929c70b3f7fa61cc89abed.1577125789.git.jan.kiszka%40web.de.
