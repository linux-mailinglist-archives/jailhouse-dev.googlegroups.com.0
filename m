Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOMPQTYAKGQER3JEZPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 875451299E8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:30:18 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id v10sf2815523lfa.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:30:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125818; cv=pass;
        d=google.com; s=arc-20160816;
        b=pk9Er406dr6kI13NQKvfChtcCqeSM+PT7loxaiB7Q6U1Orgiyg+sok0df+FIMU7tk1
         LKSQu77xq60ZwxZSarTwEW4xKWUBCqX40E3mnMTkAFHt5aTyS5/qaw9AUzaZrId62edq
         lvDTEPRM60XxrgYy2xsUl1/OUUhqenL7UOqddiOx82DatT6GKD6Sjy4iXxb6WQXz+oxv
         DSvRipSnOuc1ezuDJfT5859nUqF3hDWcqU4TYNw5Q+gnenEAKFDgFwVOHXFHuWL0OHGr
         /uH1GjaR3f26T0sZ7GyzHfNYp9p+VibATprBmuhPnRj1JSMJD3cESQtZkMZfuQbFP+mF
         w4+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=FG8z8j4REHq0ZPBfZw0KcFTBobuhrI6uSlfLbTfsEdw=;
        b=HfifekpdHmtPtMVF/xoXDIOhEQZbyaTMLE9z3kUqH5WVegaMtZYiQ9xIDYMuGe7gTC
         m4Ve3KWwEoIVen2DP3fiK+we73YTEFWlS5U6pe7c3YXJ2QFeLDFs74QWpY5X8Ecx9a6r
         CRTt+bw1iGq5RuKWSBFE2FdCWR/A7Njj6jHnztLBk/lxehNgo25Q7B3RB/Eb2es3TeXx
         I4tI32xcY5MJSyyjWkv4bYCDcCeAQ1Nd+07V5NpWqydFG5wDh0u1a/Ydk5s4fo9mXrBK
         4vof2/+d/c0R3nvLcfe51whPU49yIFsmolmHSK9+3caiRW0KzYdh6Tn+Sz8SQuh8UTVH
         LmPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pAcllLwh;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FG8z8j4REHq0ZPBfZw0KcFTBobuhrI6uSlfLbTfsEdw=;
        b=Mozv5A14zXWtDRuIE2vdtMYxFGlwAsrI2HrogYVMi+8d1sag4cayrTiRG58OJnUGsu
         eYTAaoZjyHKuvJP6nHA+If4sQ+j/O2Wr4uD0iN4P/tIRDE+ht8jTsDuRN0H40mGrbSaX
         iQH9YB9+c1UxEgV9nwc8RaPqHXPkvjlQp4ohuN40gDREnvXlScFRt3VInJBcZlMcGXAj
         L21eh0LC4pO+hI6kzJ6WNBT2pZhCLAV4Nam7c75WgTIqykaKuSt5UKbU5bH4k8jONXcH
         ZtUq3UIcSXlGlPS/iVaBzjmDAcgIu4OBZGmso5nPkgXiwYOIIOfF8tB9hFavwLyEDtJI
         wbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FG8z8j4REHq0ZPBfZw0KcFTBobuhrI6uSlfLbTfsEdw=;
        b=Y7CB7Rreuq7d3fBLAIW+nY82SiClq6/ZZLj2YSImCsuaCGPvTucPPrKqiHHi6tyO//
         b7xuTM1hocxqRNG0TGj9yL4z6S2+FrhLV6VQyulmCN1zMdNuwWeakbhshkrS1cMYkLhu
         muW+mkur6eTc6TKlxvKhT9ytVhN1z2yUoohyP6C4XUZNoLr3A7iv4IPhNBUEYT2eKxor
         GbasCv8FWjg1yVCjK4sGzXwurRelDORHeuloNuudqp2pcc/lkgTpOA65Ap6gQWCELvUx
         6gKzKRlL+ZWm4FV5tLm0zvFg9Dk+0F9Vj+c3S1MfPfh6BC3uFxART+9vAgJ6YShUn2Tw
         E6CA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW3g6VqBqIiLR0Hz4pfbmUYfP45tBiZsN9NLI0w0ThNM/x740Ay
	+U293xHRyC+nI2X2nZkEFT0=
X-Google-Smtp-Source: APXvYqzeQ4M29jhYb9bpNjFD1cO3hx4bYIuFTWrsNs8jZshSdIx1crdn+WErqmgLxs8wqL2higkbXg==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr17579598lfi.170.1577125817918;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1051:: with SMTP id x17ls2240094ljm.8.gmail; Mon,
 23 Dec 2019 10:30:17 -0800 (PST)
X-Received: by 2002:a2e:83d5:: with SMTP id s21mr14095789ljh.95.1577125817331;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125817; cv=none;
        d=google.com; s=arc-20160816;
        b=VQUbDf9LWmsdcUq0yzxImB/Qlwdljata/HEAnWtIxuCfhN2V55ttMPRlJy5F2onDVJ
         vFl9PiKlbJstpLn+A5ItlQvhnnkzrm1M3GEAOFG7kRQDFRyfXkByc8CW2mptmxaZ+/Nt
         r4E6xj8gIMbRFzfKS07YU+ZCkE7A8UXu0IN1ztN34IsZ7YKDaKvEBlCk2yp9CaNBqNUR
         WWk5JffJnd4tQXCcDduS5H8Dyz+y9Q7Gz/PF1773yDupcwPGXsQ6KRWQIGbFGa1CXQ6M
         qtaWno5K4D4/xJY01BRMEJXMhxTIuXzqp0fe6392LVHm9gd8ulnA4MpwKumIBHuM4Z/V
         rcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=vto39TDHD3M52RYjKcgGOozUi1SQZhIWJrs3J4+w6rc=;
        b=ITZnsxK4ammMdaID+hBLEw0OKnOUeijKTTVDVuWtXyd+PTjj0vZZ1ff1D7jv2AtTUD
         tT8fnYfe1x6tMPQSjrt9Tk+t9Gu8828alCG40yPCvcHgruRsCAjrmmLT5bbkZYXFjmu7
         m0ZZfewwsovrYiICtWQLdkeQU5oW2CAmEpHzOFhmtvYVhGEqyEkDkorvhx8alyprbR/x
         G/nPgWIgbpHdHdBBXWVtLvc0srsy2GM+Ll13nQfypwdw2JrbZ3I5o+kTv+NfD0hUQ8tu
         WCB+xfQ6Z7S3t5uhsxVLCtxE/XrAhTWsyCbn+zC6UU199fj+1lehLYZQk9/OqfQHguC+
         9g9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pAcllLwh;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id h8si689348ljj.3.2019.12.23.10.30.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.mchp.siemens.de ([84.61.93.39]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MWS3S-1jH8IU1rmE-00Xaek for <jailhouse-dev@googlegroups.com>; Mon, 23 Dec
 2019 19:30:16 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/6] arm/arm64: Refactor traps.h inclusion
Date: Mon, 23 Dec 2019 19:29:47 +0100
Message-Id: <f07ebffc91fdc37ba7760eac353338c759f563e4.1577125789.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:qyzh7chUtqYTB1KGCmRMQJSTxGIjZZyC8lHBnORfoLCMr9Se/YN
 zesRa/1d9Fk7uANijatOKd4xUIO6p5Ze4b7Cql8kxjjjmQqzEr6EJkxoXAk2l6J+uxoRkaN
 DiJvbTIF4vya6QD57Af5Fx+i07AYyh5eqMWhoxJSvNHjZ+uj5V1IbOmSRePSNrEfCLFevh6
 vsJBbJbe2HNjtrtk/jXEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:v8SmyKCDTZg=:SjdabhJuyJaonBvZP47iOT
 OwwRmBiOaz/l81zNCqtvucE0kBDBh+qJIjtdbXK0xf2dkQXIFtfEjBa9oQtNvrELQ1B/SgcOk
 /Ntiq5dsFiPUIvRSwEBpa68tSJZ1VaGXx9jGnDHsofLB5RONbGVfqBLv2SSea8yiEBdHkgrYB
 NvqV8AT/4UrphC2Pu9hIFDtDVVYFq4kqDAHDHg7+Q2mBQPzZ4sIfhX8PtW41no7r36b84rMsV
 VwIkRaqd/syTAM7GAM8L0fz7JxZCo0rTKQ1L+qfEazSSX9rSvBBQ6MaVfcCgdXucl6UbK8t60
 akj5C37pz2+gfFhmqRKK4lWCw7zIMlBAXW8TSdIgJNZyV9t3X/tuPxzJ+KY42WyTPGv9u40IZ
 xnzO+NjjkRitS6Y/A/dhQHd2bRX25GJVpRfrv93Kue9wxn2cZvd+Lu11oFW8XpLxYwyCf8GPx
 cFYo1cdPNg1aKGJddUCekuxxkKlhihQOfrhpwAc6uESe8CWxGS07h0QAmcGMfXtB7rFi5z8VN
 nbMpuk6KJr/bwbQpD/DrbRwXD8L+iA6coPRrJCOv+2lAI9VntAn/9VuEEtV5238RERUhCStFt
 RrJAyA3SuUDoaSz81CKdkmkedt/z1QH/9qoaK70pzXj6tKbgb8bP07gJPGo/LHZJLB/SflUN9
 9NaWvbKrP+q4kDtuvRVjmoAGouWaKKi5duBnQOkkVaIMVBVhRmAhsgdylh9faC5gSgDIfTqME
 ZCrLGNBY63fbnjbJoa/dUKcYYfgYqWsMsPCPXWZAMk5mIaytAfDPLWk+vARKoyceosmO2/2B7
 /LttxTbN1A6dpNHz1/q5TgCaPKSPFn9M7+TFoxGSyNQRpE9w13m91UIwF6AbTVZfF4fYoB9Ig
 Uj4bfDw/EEK5rn/6Jy/NFZe5yZj42q/1eBdO62TprTpYHLLUtMXDOyq2QXSFRRU7/Fx0IlQcs
 3anQpxyi3GVzmwqLMVMtTCrsRXxSkbk0oFB/Ao/OuHjzK/JhMxro6WX4Edh1k8bnaQHPmvaSH
 Hwu5gB+s+udxDr/FqV75lFtajGd4FvjQ/Gk6HJnq9sChkoGZEvlKL7QEWhlwPuX8wGhptNn36
 jh/RqCG8f3YSzikfdOyPLLQgj0XD2GoeCKPvala6JF0VMBqnbNf1lPD+c5+70hpK0h/8TYexS
 SwDsGdgYNN/f1HWfn+UrV1KrcfpKZi6mx4bzWJIee0RbPn8OgjckerhfU5puOkbZHA07srFZg
 fIUajnNuC6AHX+qwaxZixPslC06cyFh9Xoa7StA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=pAcllLwh;       spf=pass
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Rather than placing the arch-specific traps.h under at unusual place,
make use of includ_next to pull the common header from the prioritized
arch-specific one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/traps.h       |  8 --------
 hypervisor/arch/arm/include/{arch => }/asm/traps.h   | 10 ++++++++++
 hypervisor/arch/arm64/include/{arch => }/asm/traps.h | 10 ++++++++++
 3 files changed, 20 insertions(+), 8 deletions(-)
 rename hypervisor/arch/arm/include/{arch => }/asm/traps.h (69%)
 rename hypervisor/arch/arm64/include/{arch => }/asm/traps.h (69%)

diff --git a/hypervisor/arch/arm-common/include/asm/traps.h b/hypervisor/arch/arm-common/include/asm/traps.h
index ce3907d0..65d4cbd2 100644
--- a/hypervisor/arch/arm-common/include/asm/traps.h
+++ b/hypervisor/arch/arm-common/include/asm/traps.h
@@ -10,12 +10,6 @@
  * the COPYING file in the top-level directory.
  */

-#ifndef _JAILHOUSE_ASM_TRAPS_H
-#define _JAILHOUSE_ASM_TRAPS_H
-
-#include <jailhouse/types.h>
-#include <arch/asm/traps.h>
-
 enum trap_return {
 	TRAP_HANDLED		= 1,
 	TRAP_UNHANDLED		= 0,
@@ -27,5 +21,3 @@ typedef enum trap_return (*trap_handler)(struct trap_context *ctx);
 void arch_skip_instruction(struct trap_context *ctx);

 enum trap_return arch_handle_dabt(struct trap_context *ctx);
-
-#endif /* !_JAILHOUSE_ASM_TRAPS_H */
diff --git a/hypervisor/arch/arm/include/arch/asm/traps.h b/hypervisor/arch/arm/include/asm/traps.h
similarity index 69%
rename from hypervisor/arch/arm/include/arch/asm/traps.h
rename to hypervisor/arch/arm/include/asm/traps.h
index 3e02b828..99cb3ada 100644
--- a/hypervisor/arch/arm/include/arch/asm/traps.h
+++ b/hypervisor/arch/arm/include/asm/traps.h
@@ -10,6 +10,11 @@
  * the COPYING file in the top-level directory.
  */

+#ifndef _JAILHOUSE_ASM_TRAPS_H
+#define _JAILHOUSE_ASM_TRAPS_H
+
+#include <jailhouse/types.h>
+
 struct trap_context {
 	unsigned long *regs;
 	u32 hsr;
@@ -17,3 +22,8 @@ struct trap_context {

 void access_cell_reg(struct trap_context *ctx, u8 reg, unsigned long *val,
 		     bool is_read);
+
+/* now include from arm-common */
+#include_next <asm/traps.h>
+
+#endif /* !_JAILHOUSE_ASM_TRAPS_H */
diff --git a/hypervisor/arch/arm64/include/arch/asm/traps.h b/hypervisor/arch/arm64/include/asm/traps.h
similarity index 69%
rename from hypervisor/arch/arm64/include/arch/asm/traps.h
rename to hypervisor/arch/arm64/include/asm/traps.h
index e2164ad9..59cb137c 100644
--- a/hypervisor/arch/arm64/include/arch/asm/traps.h
+++ b/hypervisor/arch/arm64/include/asm/traps.h
@@ -10,6 +10,11 @@
  * the COPYING file in the top-level directory.
  */

+#ifndef _JAILHOUSE_ASM_TRAPS_H
+#define _JAILHOUSE_ASM_TRAPS_H
+
+#include <jailhouse/processor.h>
+
 struct trap_context {
 	unsigned long *regs;
 	u64 esr;
@@ -19,3 +24,8 @@ struct trap_context {

 void arch_handle_trap(union registers *guest_regs);
 void arch_el2_abt(union registers *regs);
+
+/* now include from arm-common */
+#include_next <asm/traps.h>
+
+#endif /* !_JAILHOUSE_ASM_TRAPS_H */
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f07ebffc91fdc37ba7760eac353338c759f563e4.1577125789.git.jan.kiszka%40web.de.
