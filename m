Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBE5N2LTAKGQEIJWLEYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id B087B19417
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 23:07:31 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id y12sf2408355ede.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 14:07:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557436051; cv=pass;
        d=google.com; s=arc-20160816;
        b=vxxKij3gR+dMqZ4K1S/BXrEQTtdJ8zd7pvfsT6tRfXoV1a+oCULPduCAg6Gi2eNBhX
         EU1V03WJ8RROFzwNahuC/OH8uZ9ixCcBvfcA0RxX23xlysLvyWW2etq5DOP0ux7WefcJ
         xis7NtPYSXkIEJykK5FncSZBopI/Fst02bad2g9p5LHe2ls5vG/9tEgi4Naj6oIuk4YT
         skmXjNrnr8ywpI14CcDHwKty/j0MgSDUPRAAE+5D2K7oLKtYfxAK4JxUXKsRXzqMC3qa
         yLoKLjFfWhwi/sjj7NE3vhgLXqwsSSqVSobXrjndJwp8IvbYUr0RxV07nMMNlxGV1ppx
         C8FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GA7YHnOdXnSipAggMoQMHsfba7QONQTjtWjm2+cA+eg=;
        b=v+ht8aONCTuGvED/kSfvprvTIxSGx4rZfsFiXZt39TNDo9d/jDNOhdQO8Ir3B7i7z8
         OF4RiaGAuA3g/l3axk4UeACXWmHzVMOXNe8riKxiVvdvl96afo4oIM3KGPs/xr7If5k0
         zYUFx3WgGsl7PPI/9xhYI1LtiaJ6XLExIcj6zQEynPuH0a3aNSumxNo+2UxOz7I0U6ix
         kTc0w2C76JYSbhc3DF3DSWdYyhZsW5XDUlwg3imGchCovTq9mRSFA2ICLNslgC0Uvqvl
         LE6KbAzIuAq5qeJn92nfoqGK5G3dXDmeZD9yvVP89unV2k9pzIzT3Hxd34z2aKHeDGFY
         OXKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GA7YHnOdXnSipAggMoQMHsfba7QONQTjtWjm2+cA+eg=;
        b=qdMKZP1RAu08FHhdNncNZLg9pNACeedd0pH1k5ZKWKaVnLC/757/7gqlNiNnWD92PX
         g1YcDm35kGPq+m4QbUK67YTPYOi0By18RJpz1xZWCVu7YdXxP2HdTrE8Hm5ERjLc8mGY
         lyyEZ7dh8Ufx46Mw+kBh0hCwv1MPYcPg5exsx8jv7izSnWvBpbgXM5j/I88xFdc5g1K9
         ZiyzjouwGER6/pBHSHDmLdB/Ox2zUqZq+j0xdriXZuU57nWzbeyWCxzjDSxOuQ90aeq3
         DQvo70I/4VgP16sAx1j1WrPKVXdqhoX1vptVugqMsPyS+I8840m6z8xnm0pdwSEo4QuP
         hvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GA7YHnOdXnSipAggMoQMHsfba7QONQTjtWjm2+cA+eg=;
        b=oX+j59tEjKw94zLdPuok4k2WjNgmAS4OU2abYSr8RfXGHaGGLk73d92y+66sVGeLjv
         S2u+QJNPoj8g1vmbBihwBt7phTBYX0HgLsyPu5ccoaLzI87h21FDE6k3U08XWPRRLLjA
         igOrEOYh9WNXwGjrU5YGR5KQ5NqIOBwhYfsKbz9kKBLcmIs4Pmyebb9vou8G2P72RV41
         geRbHvlKRRfK+yYJWzJvLkE0wNJsOxj4T32m7J45LOrYiJrRBjotQpz4fMjAaTdbMJBe
         IzAk+Z8t+NGlmXR+LRZHl+8eVExa/gxoHq/Anhl6Kh9Gl5NOAeaRnOfk9UW6yJtjQ4HS
         40fg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWiuctCdHFijUDnvfXJ+3TbB3gvwCVUP1c0S5YJKrhJwa8Ka380
	SQm8JLlt9/8Z6iYHMMczsGA=
X-Google-Smtp-Source: APXvYqyBBb3WNLEPWL8jN1T81KL+1i//ev20kNbGINfmV7FbGYT8TTFw1+GLDrzuWePk04P/WfwxdA==
X-Received: by 2002:a50:9405:: with SMTP id p5mr6596550eda.111.1557436051505;
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:aef7:: with SMTP id f52ls1103200edd.13.gmail; Thu, 09
 May 2019 14:07:31 -0700 (PDT)
X-Received: by 2002:a50:9470:: with SMTP id q45mr6661200eda.269.1557436051036;
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557436051; cv=none;
        d=google.com; s=arc-20160816;
        b=kpclzxd8BcAtlp6p0RdrV54MOQJGHXkklv2l439AlYtI/fybLidzyAOSk7z3LxGDiW
         tkCrwq9EObBuxsEyI4xQINme9iy9fLF4GW4K/dVcUleyBeQmwqVqDhezoRXDgiw6zCJK
         M7KrK57StVs+HFeJvsyUrBLFc3IwNUhtIjzvo45ooIs4t+oet6h6ZYIdIjWElj20shCO
         JGUyG+qzaeirBhOaFiYZdD8rL7M5AesF55o5Z8WJbBfOTtKRFDtgYr2xki+Ux9ECHOBp
         nTY+mFn8Yv9YxKKqeh7FxtD4taQuSoXrZP7hGTu16C4AfGzCiEUUbat77pG+7+ViaArv
         EU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=1ehKg9jJQlAIQzsurghYVssQ461T/uxQSit7AdCF64s=;
        b=VCaaEKZcD+onjfBFNFwRvEf1dRtpW4Faf2z01YEtJsQF0A8fNtpjWP7ZnjkTd97bys
         9qG+O1Zpgte1YX4S60Kwmr96sxeYjt2W2AuQ8mSUrMuaAQDNXonfaFHrVsmnsV5kd3NR
         U/Qv0IueF+J4rKk2fpJX33DkqrqyXMoQ5+anpdUVqexcOGR6fOBMr638MVHaOaMHoY/z
         NK6O24uccyJAc04+eS6iv5dux0XzNwBTpjfwh7a++UhcXdzAm0hvMpQ4kszfCiqwPkAL
         foyywJCnlFy+hKXtVJ4DI8+6yWKFYQOnmFHTDofOLH1vWkeDjh003gzPhGM7m1Sm87DZ
         z1VQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id k38si1428690edd.2.2019.05.09.14.07.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450QsG3zCnzyBN;
	Thu,  9 May 2019 23:07:30 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC PATCH 2/4] inmates: x86: rename header.S to header-64.S
Date: Thu,  9 May 2019 23:07:24 +0200
Message-Id: <20190509210726.23168-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.210016, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

The 32-bit header is called header-32.S, so let's name the 64-bit header
header-64.S.

With this, we can also simplify and tune the Makefile a bit. This makes
life easier, if we later add further 32/64-bit specific targets.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/Makefile                  | 8 ++++----
 inmates/lib/x86/{header.S => header-64.S} | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename inmates/lib/x86/{header.S => header-64.S} (100%)

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 97a37341..e4ae6b7e 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,14 +40,14 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
+TARGETS := ioapic.o printk.o setup.o smp.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_64_ONLY := int.o mem.o pci.o timing.o
 
-lib-y := $(TARGETS) $(TARGETS_64_ONLY)
+lib-y := $(TARGETS) $(TARGETS_64_ONLY) header-64.o
 
-lib32-y := $(addprefix $(obj)/,$(TARGETS:.o=-32.o))
+lib32-y := $(addprefix $(obj)/,$(TARGETS:.o=-32.o)) $(obj)/header-32.o
 
 quiet_cmd_link_archive32 = AR      $@
 cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib32-y)
@@ -55,9 +55,9 @@ cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib32-y)
 $(obj)/lib32.a: $(lib32-y)
 	$(call if_changed,link_archive32)
 
-AFLAGS_header-32.o := -m32
 targets += header-32.o
 
+$(obj)/%-32.o: a_flags += -m32
 $(obj)/%-32.o: c_flags += -m32
 $(obj)/%-32.o: $(src)/%.c
 	$(call if_changed_rule,cc_o_c)
diff --git a/inmates/lib/x86/header.S b/inmates/lib/x86/header-64.S
similarity index 100%
rename from inmates/lib/x86/header.S
rename to inmates/lib/x86/header-64.S
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509210726.23168-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
