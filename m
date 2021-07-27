Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBJOX76DQMGQE2V4WRAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D03D742B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 13:19:02 +0200 (CEST)
Received: by mail-oo1-xc3b.google.com with SMTP id u5-20020a4a97050000b029026a71f65966sf8211569ooi.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 04:19:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627384741; cv=pass;
        d=google.com; s=arc-20160816;
        b=Eshd7nj0dR0MAMN5dEP3Y8R6Gr4E5U7wkhz9bxiWPiyaPYUBC4Z+p7/R3+cfzMYC2U
         kcIICMPEGfPlt2IAEvflWeNe/0RagaF+sTfX6JbN0aGoxW2j4/QOGJS5hmLYxTEGWuTO
         KDemQgMZMXh4pkRn7PYfUoEYe7dLPjXqA8IH8EJQjo0wXXeyZopFcBi29aiMNFCSqsl0
         y0yRXO0OMj9gSfHi8d+a5FdeYoYJ+ZvCdF62Sviidg6UzWJXM1B/xGzDnIZDlnI8iT4f
         lmxT7MtxaZPvKH8CIMG6wglcm2vDzeCO87jcMXjv5GTeitgkogil/zkPbcq1NdTZIRox
         R9lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=t8lEKRf4gHl1E98hk6zF0115baCHheGciM35n7jSgpY=;
        b=debAKuH/vlbWFm/q17fwZoAvuYvqo9Wx/436bWy1ka2x+kq5roVCsELrEsBmRinMCF
         YygKzhKCMQDJVJrHipoBfqz1/NzKcbO5POZcTDqIauYCe1lwTO/Ccsvps1WhodFpAmTE
         Yja4nCSSnoOxWThAMQNuSITyVhS6GZ8AepKfKBmdoX1whX45WzgFj7OOtbaCRaler3sL
         h61/mLpf531pG2R434jHX+x/hL6A3+RragWRHFsJWMOm1DurThnaAddDCNrYhii+mCAF
         6wATTdVBYy+5Wi4LrDdlg7AouZ5zJfWjvieaF8goyJqpTv7G9m2vAJxPeqsWkn1/Dcel
         gL3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J0BCAJOq;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t8lEKRf4gHl1E98hk6zF0115baCHheGciM35n7jSgpY=;
        b=OSWQrL/1bqBLFZ1cFuQjAs76THUQEsIxawBY57E0NrK6SjmXmLl/t5yQGU+hsizifm
         sa9vz6QMDhMENhIlHFSudbbQMYmOsHvxmkVY+SLRXDtcWvhbDzLFHjyKbxe/9suNwWYn
         sFI/dokAT+SUalZPbI8Zo/PiRgJxL4ax0gnRCrYwa1fXbC2OKWuNfKyi8tk7w3cBAJdB
         HICqnHAIx4HRFumzDBoH0l0d2bkMlBG6T2Fn6b7ryCg6AXGbHWiSS2I03qgA0lwuEoR5
         3y40dPIu6asuMXncKFyeiPTlAmVt0t2hoqxwEVH6O07V469AaJQN7KGjfr4FJyRJGVD6
         rQcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t8lEKRf4gHl1E98hk6zF0115baCHheGciM35n7jSgpY=;
        b=kaSa2x5ZHAoMxzJDmaBOpIx3SwYkmoog+1x0X9h1jRYp+VmK5CgUg7/WS9rNYfDjGx
         GezgjoonYbNNTyuREylCXX1jtAxjKiIQFO8TMUtysxUXC8jUwrJGL1je0ZSlI5jQySzx
         aEA6l/TyIz8/cEILWVRMuY2LOpRP32PTofIOJvRKrQ5PYBBMJ0rOo/HM14AkPrNiqF/b
         ijJpN/T3ywN+KIef7P9lhkP1PIaWBQb2FjF4LsFeYrBP8XH8sF3tIIkdRIC6RKjVAjcC
         hdfZZ2pieEk3AXKcv135r4zOKnLzi+T27KIKEXe+rMrPhfdXNP6KjqY4oc4mUGEWV5q0
         aAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t8lEKRf4gHl1E98hk6zF0115baCHheGciM35n7jSgpY=;
        b=rb00mRao6enhjp/a2MnJDKLP77SgJ1riVIjQ5p2nuEApIKHoVA6jNd0S1CtlNQybfY
         XO7v85ogf/y1R+rK7fG/ySpOLKu1W/yPbLbZlPXgUOUUhN5ElWB19x6QQxuRkqxxPeec
         y9cEd93JMn22dHfJyCgcUqUDJHVLMI6spo16kJFHrjUQ2XqmbJkW7yF2jYyIpz7sTQLm
         bcDofLa5N4nYqpj13x8HC4gSQFDBqLegSTi2g0GR8Diu5pZa+ZwuoO+P8JFnrGVol+7M
         Mug2D4T797s5WeLGodWfoH/iX54pa0xPR8WkfI6jlU1tzx9WX5TSAOziSazNrcU31ShV
         aaCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5323AHA80RDJ0Jf/Gj4mF2atv4PTIZeywD2/WzLInXVeWRSzfIAs
	4vuzJlAhHUU6qX96pjk3T50=
X-Google-Smtp-Source: ABdhPJyMyM79B5dcm9hXmApniWr5gpt/cEDKwQCN+NICJCMdrZZfCn2G29C5Hlv08IIv9evGAij3hA==
X-Received: by 2002:a05:6808:140e:: with SMTP id w14mr14156406oiv.32.1627384741630;
        Tue, 27 Jul 2021 04:19:01 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:b84:: with SMTP id a4ls6657458otv.9.gmail; Tue, 27
 Jul 2021 04:19:01 -0700 (PDT)
X-Received: by 2002:a9d:6948:: with SMTP id p8mr14520584oto.7.1627384741168;
        Tue, 27 Jul 2021 04:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627384741; cv=none;
        d=google.com; s=arc-20160816;
        b=HDGA5t3Lk1MT1omfmcBccczySLSfRA7dxW6OMr7ki8YHBGypLogkYsBgh0LfetxOBB
         H0PgIqfpK+9JLfHUM5gbE5/4ekjXIB50d/5PC7/A1BU9145FevUFEuEcDuNJzq9kmM3l
         tfWy7ET5F/dlxG/kbOF118dJdAA5+qaaDLEAJLkt+Op0xCaiIVPTgKDLnJucAgAOLR7B
         s4oOK86dR03642RYA62ZJFs0/Q2TzgmXlry0UfKj/XPnAlW4FThVmXNUew5Mh1AL+5sU
         eAh75uT6eDL63++9GrJ1egJh40hGHKqRp/N/PFlBpbzsf9oPOZTJ2UQ7Tr0TTWlt6d3f
         ATHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from:dkim-signature;
        bh=VdlhPC59Dt2h7YwalxQS0qlk0NLdX0uvopb/1IH/Pu8=;
        b=qmjFCKhzm6bfN2hvUYiqUFYw/eE+/JdV5xqervT4JdXO22xh75akPU0g9V/j+QUbWg
         5tD4sTBx26kMnc+iBiHdaZ2sQ3EwaKLSVNAIkCsuko9Q0ZheOxc/jyvReOKI2C16Nd7Q
         y5D6B7IqQHLSofmXbRhPXMS7luRSml91cZraOLVzxEtrlKjOhJYvpCo2CKtu0/Ycz3Cb
         +iM82P+aVJtpov4Nw+FdnYv3i463wAQa5ktNX6vGytATz5QlrEMmQThgZ/pkk1nxS3+J
         042hQzi9/66QFuf6Xeyxo5gprNBbhRORKaZQpyZXo/DRZWVJGUVLCTvlimE20AQ9A+WT
         CybQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J0BCAJOq;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com. [2607:f8b0:4864:20::1042])
        by gmr-mx.google.com with ESMTPS id o10si294079oic.3.2021.07.27.04.19.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 04:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) client-ip=2607:f8b0:4864:20::1042;
Received: by mail-pj1-x1042.google.com with SMTP id l19so17320950pjz.0
        for <jailhouse-dev@googlegroups.com>; Tue, 27 Jul 2021 04:19:01 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b029:12b:32c8:c097 with SMTP id m15-20020a170902db0fb029012b32c8c097mr18374102plx.25.1627384740353;
        Tue, 27 Jul 2021 04:19:00 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id n15sm2102272pff.149.2021.07.27.04.18.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 04:19:00 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2] ARM64: Set the right set TCR.(I)PS value
Date: Tue, 27 Jul 2021 11:18:57 +0000
Message-Id: <20210727111857.16710-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=J0BCAJOq;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

According to spec, the {I}PS should be never larger
than the CPU hardware implemented physical address
size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
may lead to some unexpected issues.

we can refer to DDI0487G_a_armv8_arm's description below:
If {I}PS is programmed to a value larger than the
implemented PA size, then the PE behaves as if programmed
with the implemented PA size, but software must not rely
on this behavior. That is, the output address size is never
largerthan the implemented PA size.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
DDI0487G_a_armv8_arm: Physical address size implementation options
ID_AA64MMFR0_EL1.PARange Total  PA size PA address size
        0000                     4GB    32 bits, PA[31:0]
        0001                     64GB   36 bits, PA[35:0]
        0010                     1TB    40 bits, PA[39:0]
        0011                     4TB    42 bits, PA[41:0]
        0100                     16TB   44 bits, PA[43:0]
        0101                     256TB  48 bits, PA[47:0]
        0110                     4PB    52 bits, PA[51:0]
---
 hypervisor/arch/arm64/entry.S              | 10 +++++++++-
 hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index 3f4ee871..3183088a 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -460,8 +460,16 @@ enable_mmu_el2:
 	ldr	x1, =(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)	\
 			       | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)	\
 			       | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)	\
-			       | (PARANGE_48B << TCR_PS_SHIFT)		\
 			       | TCR_EL2_RES1)
+
+	/*
+	 * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange value
+	 */
+	mrs     x9, id_aa64mmfr0_el1
+	// Narrow PARange to fit the PS field in TCR_ELx
+	ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
+	bfi     x1, x9, #TCR_PS_SHIFT, #3
+
 	msr	tcr_el2, x1
 
 	msr	ttbr0_el2, x0
diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index 932dbb50..1b588aad 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -144,6 +144,11 @@
 				| S1_PTE_FLAG_NORMAL | PTE_INNER_SHAREABLE\
 				| S1_PTE_ACCESS_EL0)
 
+/**
+ * Memory Model Feature Register 0
+ */
+#define ID_AA64MMFR0_PARANGE_SHIFT	0
+
 /* Macros used by the core, only for the EL2 stage-1 mappings */
 #define PAGE_FLAG_FRAMEBUFFER	S1_PTE_FLAG_DEVICE
 #define PAGE_FLAG_DEVICE	S1_PTE_FLAG_DEVICE
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210727111857.16710-1-gengdongjiu1%40gmail.com.
