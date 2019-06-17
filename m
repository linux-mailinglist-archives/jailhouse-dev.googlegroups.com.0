Return-Path: <jailhouse-dev+bncBAABBBNET3UAKGQEPWVTWCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97C4839C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 15:13:42 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id s18sf4646488wru.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 06:13:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560777222; cv=pass;
        d=google.com; s=arc-20160816;
        b=NfJG2BIA3PGL/yW2z7JsBPehMS4rbA/oEuboAbSEA22Qp9UfIudzqhg3/+Ga37EpbO
         6cumNVxSQkinuib7CQ+sktZ4L/4+dUMgNX5V32nf7sw0Stgf/lb5fCEhNZT2nQRfbA9C
         VeNtnGTW7csGBE3843Tc38xR92zXRiQkFXYslHsPf78soUVxUmIUaMHcJw6kalx7/xdS
         YLbuKR1M9LWhE0VsK5+BoZDqRGAtUqNI1Xxxzy+vymGXo9ytZ1+GX3WlHK/cuVmhCk3Z
         lHUJ1MS1q6lD1J7NeP8d+xQbWMkbdAMoyjemXcjn6qPdHI1zQloTj6EVT5clYAf7hGu2
         1fDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=/cV6MePEjhV6zNlud3HZQgG5YsZkopaAmZq75xMEkOM=;
        b=R/Fw9ebjXiFNqmFrpT1/v989F/A5NSLnJBiJSQHkCdtQayMhDycv8yUrcJI/z9N6iv
         DvnJDKF6wC4ckVjhKG/BS48TDJ9vxw4wT95uZRPdPy4ZnpWeg52GM5kXhuZjQJN49rlU
         2UrNRdwc3+9r7x+jd9Svpa7wR/PvaBO6RO/vOOWFLlO2xAvprM0vRXLYVWi8TPXU3U8I
         hQYwkVvStGy61NgBEw/vpaN11NWF7nCoBdRA6SNZ4wtMCaA/P/GfkeqanjMR23Hbz2HA
         S/dH2GAqrJCaSs0ty/CcpscgKtFLI5XfzsgNhBh/1Q2TKKPVnk8XV2pKWln/gv2MV9yD
         H1IQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/cV6MePEjhV6zNlud3HZQgG5YsZkopaAmZq75xMEkOM=;
        b=P3qdIxlrQBCCiynS9UGbknwrvH2OagjKeeHmnPt75s2nyefKV+g5Xeusy3gT7RK85n
         Y3JJ7XE5yDjsr2s2s2GjEsHQD/S1+xmHsCAbRvEgWxO18mvJmrUPXbThiWaO1J59hyRH
         r+Nav/Cn7vp1tSmF6jyYPr1aC7PsSrNCrQYBzV+/sYcI8U0a6eIbtmmu2SRpT/4wUFbX
         b+9TWKk6Q0YkVW0Wtvs1E6fI1fZRy14ejS7JBG9jk4UcqWSVEAa8aAuSfYgF+l6qvoRa
         TiBcLY4GgNRF47aVoqQ6uARl9S+tazLsyrV1ywkG6yZjsCCqXCvOdGSvV33ApNEwIjMy
         YP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/cV6MePEjhV6zNlud3HZQgG5YsZkopaAmZq75xMEkOM=;
        b=D5moGlXzL8RDd6HG2oceISsHWHienEwkeuhILUF6yH+OCRJYA2hpYBoQqcSyAhj+DV
         ukbC5MNKuwS3qWXUznvb/A+uhsiwex1nbwZk+nQ5JrVD4eioAPc6qHG62iTH4gmt8pIP
         4ATctnIC7ORvK0fLMXZRaHOK7MXFdKGU5c8kn+lyvKq7H35kEw4i7lz7P82YqDuSWWqE
         R9LTkLVnY4+3bFI6yAebNeDq6QNY+GE9LMEmFyMh5QIukvFfQkHyzrW23DYkc49z62Ak
         5Pus/1dlisowakjDptsNQ//LXaXkwizrKlMAKOENllP5uQKdK3psee5PSSimO7NTtarh
         NnQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUdyumh0eEUO0jOWb+c/hx1dtOi4vjVz8Uk3WcLiZp9bdZL7S18
	8Cp3rHsNVK51xFgp2ab7hTg=
X-Google-Smtp-Source: APXvYqystvtqFCcPI6B67u2IfFndUBnKGQ7YQCMH8qo01yNhf7uxAYf4VytKecrRYh/x2ETpaIT43A==
X-Received: by 2002:adf:f050:: with SMTP id t16mr58518094wro.99.1560777222119;
        Mon, 17 Jun 2019 06:13:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls3857161wri.14.gmail; Mon, 17 Jun
 2019 06:13:41 -0700 (PDT)
X-Received: by 2002:adf:e843:: with SMTP id d3mr32785918wrn.249.1560777221737;
        Mon, 17 Jun 2019 06:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560777221; cv=none;
        d=google.com; s=arc-20160816;
        b=fJ9fnTJvev2uBlUgqIT6+JOIL1YJ9SpK9LMcVm4fd1tBFoEGg8SpabDF6vDQRf+gqo
         KiwBieHcGjoqPhecHJmlbXjuEYOhtbFkJEAlWCZJHKkNPGLn2o7hQGBSKRQKI4H1BMue
         udUt9s7nQZvisdsgk9gwRnvBwuYQ8rngL9FA7FFHI7XwCgCff5ot+dkxXlwg9OEPuQQD
         5ytIlVYbAkPYEpQp4iEKJ9iqYzh7QQ4yNKmczUdDSIQWD1Vr6xCbNIfDN3HArW9MDHJE
         9WwMvrwqGUsmF8G98Y9HbP3J+efK0ZGO2O6R6Ib89KLZQG1ukFDjI4TOtGrWRcJQ/iql
         PUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=1tO1ZbWdyIGb69ERLPVyw4jxW/Kl0lncy8g2Vl2QWpA=;
        b=v3ZxbPwN4B0SbCDWYzOFtFGDExiWKFOqHhDRBqYnWcpBPsE+0y7UEvIcslMNzAdftp
         w+OCp9rBqVkM1q5zOBYXoh+OHG1M3tAdMrr7ssnq97fMMVSiTjkLBUYTjqHDJBnkaz+h
         4Sg2A8l5z+czns6tLPQNO8qkMbUierSDn3tUg8bxUUHdBFZnHYBFT2AAKeo5UOdxb/mS
         riHga2oHEGfC9tw/wIwqUH1DcLqfmC1MpGtEFFv/Db4dJUOyVFD4luwWigq4jcSaFSQM
         PdujhmDgOxwKRxmzkzCeYouFU7WX9bCFIcygttlAv7S4bS5vGnqrem4V+4Zt89y9Wz9l
         1/5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id 194si447486wma.1.2019.06.17.06.13.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 06:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from zion.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45SBVY1w1KzxpQ;
	Mon, 17 Jun 2019 15:13:41 +0200 (CEST)
From: Mario Mintel <mario.mintel@st.oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Mario Mintel <mario.mintel@st.oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 1/2] x86: vtd: Print BDF instead of hexadecimal device address
Date: Mon, 17 Jun 2019 15:13:20 +0200
Message-Id: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.17.130916, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.17.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1400_1499 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: mario.mintel@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of mario.mintel@st.oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
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

As it improves readability of hypervisor messages for debugging purposes.

Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
---
 hypervisor/arch/x86/vtd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 1cae0dcb..8e076b4b 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -621,8 +621,9 @@ static int vtd_reserve_int_remap_region(u16 device_id, unsigned int length)
 		if (start < 0)
 			start = n;
 		if (n + 1 == start + length) {
-			printk("Reserving %u interrupt(s) for device %04x "
-			       "at index %d\n", length, device_id, start);
+			printk("Reserving %u interrupt(s) for device "
+			       "%02x:%02x.%x at index %d\n", length,
+			       PCI_BDF_PARAMS(device_id), start);
 			for (n = start; n < start + length; n++) {
 				int_remap_table[n].field.assigned = 1;
 				int_remap_table[n].field.sid = device_id;
@@ -639,8 +640,8 @@ static void vtd_free_int_remap_region(u16 device_id, unsigned int length)
 	int pos = vtd_find_int_remap_region(device_id);
 
 	if (pos >= 0) {
-		printk("Freeing %u interrupt(s) for device %04x at index %d\n",
-		       length, device_id, pos);
+		printk("Freeing %u interrupt(s) for device %02x:%02x.%x at "
+		       "index %d\n", length, PCI_BDF_PARAMS(device_id), pos);
 		while (length-- > 0)
 			vtd_update_irte(pos++, free_irte);
 	}
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190617131321.8585-1-mario.mintel%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
