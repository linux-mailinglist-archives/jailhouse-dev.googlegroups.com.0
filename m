Return-Path: <jailhouse-dev+bncBAABBEFET3UAKGQELGLGQQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3304839E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 15:13:52 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id e13sf1123750lfb.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 06:13:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560777232; cv=pass;
        d=google.com; s=arc-20160816;
        b=JIhnH3v29c9lTYhhJf13X2bYEpcM5sM2RAO5z4SdEsxF+mlchvX3HJnN6euZLUZoT0
         jNTdErRzcJKmiLc07y0Kfk4fYp8Owecz5tmSE/ZfuBE8jM/xdYWBRbhj1cOj61qQsZf6
         Lh/TAKkia8AzKg9S/Nr/ln1sobQlN04fAlvYMSJn5t6MZii7u694Q7eiILmGJuXLhGwv
         zPBh/0if815nJmt8QkCCdLqpNeR7aas/K6E7sVkGfi5YgQ8HOijHbec+XP+I/n7e3UPH
         WEXm9fU8xxwkA1PkU7mGD/w7o7wcRCfNjz7FXhskQi1LqzcSyYxOy+j2q2vXKyTgbMAW
         /Nxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/9Ph3zYUbNe52MyOBT+6JdGMrlUsex+6Dx6ouWx+whc=;
        b=OU9lOGFiBGKeBe6qT/RyDN+H7hY/iuFYy9ePwxagx1EBSmT30PvqcPlnDIe6YK4fbQ
         1EsTz7WsIjqm3GkxmQLnQsDTo8bIXrXOhpaUOAYgh+fId9AUmoN75Ggcw9+i5C7zBM6T
         FGiccjgKtijgdXKfuJNiAQIB2qXHfvVCsQC953xjACzo5H1fEiXoGrcPfB7cABq4IiC1
         kVzH2vBPCpziJGZxH4DGte6n5taB2vaU9D03wdlsFW7cv4Sd1NnQkxkfznbFf0R7fFv2
         UwySf043Dp2CtP9o/sy5H/zPOxywH2n7LdX1BobCCWph2tN9vbtka+2fW1a7DLND7W8h
         jvcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/9Ph3zYUbNe52MyOBT+6JdGMrlUsex+6Dx6ouWx+whc=;
        b=OqPdmi8Uk2deKf22HHwI+IvFJeloTOe56GH/uQS0029aZ07koZURIGhOTucDnA6vlN
         dmbBpcu8Rg7fRp1PFAM1wFi0a4ivmcsw7WXIGDpXfVcADLyzJXpRm40XFM4ADKyQbT6M
         Y3Cd/aP40C5jBCspqJCAiujb5GP2t99uPnFVXPSF/ZhA09ga86YyJHpkJ1yqEMuFIQkM
         i+vWl/PUUej6vxXRd7yKLddI6Z0KlMOdwVe42Qs1WieDWk0uNDmwuOXApWG1I6YDvu3U
         Ldyzjz38PKoOwQRv92ihKSgLGbEwcasDCzLkmMg+bF7xUfe7ZUMvD18PbGjF1QEFeSAr
         HpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/9Ph3zYUbNe52MyOBT+6JdGMrlUsex+6Dx6ouWx+whc=;
        b=eM8SogGSvDgkgt6jcbyj4yig6hdV5goKemTKtFtesveZMilElAosYe41VII6+X3IXp
         Cw0KTZnAbKsVj6mmMzn2HNx9vBQp3IX3GXMZDYg5WfV0Yy7wjW5gIH9Y69H5DGThSnx4
         Tqbdz3cmDpvfQhNJXetI/csG+vbZ2hOJJ5j5iTD33P9wBreHYuLjPlVnlVlTHOdV8YTu
         ueyCuZ9tDtl2FCX9z7fZ0WiHMOzW0qiUSBnMA+IPYObYLQzhg8B1tQAnHhhTVnU7BESv
         krApkf7b4ZDWknP/7FQggbeUCRNo6NkRUX3fzhNsKt4/eUevNs9tjG+mzty5AYAoSUXu
         y6Xw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVUc+COk9wzcPR2P7niO8xcUFGfMLpydBsv8J/52l/1xGUosIoq
	Se7cqyc2NgP1UQTqspImJww=
X-Google-Smtp-Source: APXvYqx1ZIpS2tWK+8omJBVqdlFAaQz1VNEcysxWM2M6NMuZP7BE0hm4T5D+YDwKCT9smnDiF9u4sQ==
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr37095235lfp.154.1560777232124;
        Mon, 17 Jun 2019 06:13:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2b43:: with SMTP id q64ls1109875lje.10.gmail; Mon, 17
 Jun 2019 06:13:51 -0700 (PDT)
X-Received: by 2002:a2e:854d:: with SMTP id u13mr13376222ljj.236.1560777231794;
        Mon, 17 Jun 2019 06:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560777231; cv=none;
        d=google.com; s=arc-20160816;
        b=z5vnKKSFq6XeI510lUscruFHT591PnSq6Xivw6chMmMNe6WBTagKYVz1fAvVYHR7X3
         xI4nal3uaG+7CaVY+sYXT7Zcdh7KfQ4sH9I++PyHyMGGXjEs/A0bVQ5dCcHdvCFopoqg
         +wHlT6+guHpO3ijdR4UZhUeY1cdSg92Qu1PDg8nxojg+LgcQ6mestdeRdidHdS59frpR
         DqveqUvjXK49TX8cZdtKmpGxQ/KZwKntbHy79iFMhWuRx0w/MmOwkIc19PF06axcoFAf
         EyAfJ01EbpXEV1W3oko44BLyo7QYXZ2uKsfWMZSuIMYof3bxYS83/N2cqs3XLTUY0r8+
         pFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mcpk0p1R5HnBMW75nBcSuQY6fyxYyigF/ztgX5vPO/o=;
        b=0dpT7peozycXlR6qHvCLG+p2l0z2yEcFoDRkEYUPqppbnypejLErKdRjdF/y46DoF4
         SA7Ilyvc1Gmd+qLsqWinn9mw8Duz8du5NEsvnWem8waW18oNX25Obpbx8U/ZeedKxs2I
         3AhW5gbVsfKGVhOjRBsH+YcElOciGKMsYhMYMFehq6CD7wEYzy1xUIVoSccqbjZIwG51
         5Kqse49uTUMoLVCdgDVazdEbqb2+ICUl7gtJ3XBOZUGPM2aCR4PXKcjSTB8HMg4wNZ+v
         nJLSH1P4Qd7XzD6+rDbtZgQuGRtcRUX/TJYVlvcBTV4OdCbyIK34b68jiKkZu3Z0bHS2
         vecw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id l3si384779lfh.4.2019.06.17.06.13.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 06:13:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from zion.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45SBVk5BMvzxpQ;
	Mon, 17 Jun 2019 15:13:50 +0200 (CEST)
From: Mario Mintel <mario.mintel@st.oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Mario Mintel <mario.mintel@st.oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 2/2] x86: vtd: Limit index of vtd_update_irte to 16 bits
Date: Mon, 17 Jun 2019 15:13:21 +0200
Message-Id: <20190617131321.8585-2-mario.mintel@st.oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
References: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.17.130916, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.17.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_900_999 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

See Intels VT-d Architectures Specification, chapter 5.1.3:
"Maximum number of IRTEs in an Interrupt Remapping Table is 64K."

Hence the max numbers of IRTEs is 65535 so we can limit the index to 16
bits.

Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
---
 hypervisor/arch/x86/vtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 8e076b4b..d0dd4fd8 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -556,7 +556,7 @@ static void vtd_init_unit(void *reg_base, void *inv_queue)
 	vtd_update_gcmd_reg(reg_base, VTD_GCMD_IRE, 1);
 }
 
-static void vtd_update_irte(unsigned int index, union vtd_irte content)
+static void vtd_update_irte(u16 index, union vtd_irte content)
 {
 	const struct vtd_entry inv_int = {
 		.lo_word = VTD_REQ_INV_INT | VTD_INV_INT_INDEX |
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190617131321.8585-2-mario.mintel%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
