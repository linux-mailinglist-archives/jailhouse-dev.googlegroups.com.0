Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUV5T6RQMGQEZ5ZUFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB570A0CB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:52 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id 38308e7fff4ca-2af237b22aasf6613461fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528851; cv=pass;
        d=google.com; s=arc-20160816;
        b=iTdLg3TxSJ0iMkPFFn9wXCkH4itCHZay4gJzCeDN1bgySu7s2bw8//1s3LRC7hlW+2
         olziuq989h1i13AFz6CbgeLM+qjW27M5/L+NLxWQR/gp33Pi5EMck6597tKyZxev3hIa
         DUOK1qQ859eMcuFiYACkvZ+ywuIAwogXBpDZxp3YmeVZVA5SpTWL6JANOE5lQ97n+31b
         bvzObK3LedbTj7JWSyS4c890HweLGQhmfaSR47iTQWegQy0To5CXY8gpNMONwRlmz69U
         9FbXjPGszU2iJ1Bki3tl2Rdery2IAns0EpglXgbG4cv7OmP+uWe96keR5lIUKTRMQzou
         DbBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=6A0qZ/ES9EEM7jlFssQsjd0HSCuXjFHLmhxTw8HaQUY=;
        b=xE55OFnGg66rDAPWisC2kcvKXHdE4i5mgII42FUNdjtTLuH5Fl8v7cWH9/9NeTCm7h
         Msg2jzDEgoWkWU8+Rsav6SqXfyLXPkpLq40pyYVlYP2lZ6zDbvQPNtV6queMJKXwYFz6
         VnWYu71dsmibY9/TMLnS27E97xZ7qJNobjEj2gAeofHCecZLOMbQPc6jDn6zkvRzJU1G
         6I1fkgyRJF3ZnxpFQLYhpnlxjvv8hqNS4D36LiCQmd//Y0YZW9rpkpS5Z/hrZ+7e1COL
         Vh7BKDdO4W0rUay+IOo/yhcaMXh464vHy3U80usQMq5ib2r600oEw1iHdy1M0EoW7sus
         38NQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6A0qZ/ES9EEM7jlFssQsjd0HSCuXjFHLmhxTw8HaQUY=;
        b=sn0S10ZIZSlYqq/pCXjoKhsFh/qkvK0Hl210WwoMA/wxr1lKlD8O9bSrhl6QNGQMMr
         p9P+oezOLjGF1aJibhGWbPu0VR78foLiM6EliMTu690ZCLdVGn82WTdfhS1mR+enbhcD
         Oj3Sr8GpTVc3jhdurP4/6d543OaGP5aSXOXKu3fzH7HKtnNx71v+8eFUTAK8W2w9ZeEE
         O9D6kc4wG3EUSL1ptvGnIbVle3nffQwipF816407+6dJ3BLrkuprhmSYfRmwhbSruJF6
         64psQlJI9SE7z25pYrkHVYxGgz/jKQPmK2td84ZO1gWaKZPpi/jLzKPA2YK1zFQ8RiQA
         dJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A0qZ/ES9EEM7jlFssQsjd0HSCuXjFHLmhxTw8HaQUY=;
        b=Oe1POIXE/9M5UzdkIakKRtymga9fQdWpqvIlCx2eKwj+IEfVLE3v+aWWj8FqA6B6s+
         jgzEyJAY7XaHdJaSVPUD/AkbRT9ot8tN7/bN0Xrc9E84HlXh0q+sJywvrmareLgmawOj
         rw6erlUTD3UdfZQN2D/jab5uv+mR+3Zxu22r3WySf4aRsiU7Row6hCfdoBb8neEayR2o
         6Dkz11w4HxFik39HovTDcTrMs/eLSFKBdUqUrdTSYh9Z/dhDNfs6b/smO3HHKFpANRBg
         PJD9bFhWerBhFUhitlpWprItbda9fjAHrO17ZixbeffVpqCnvqBuXfeJIQqwI5EbjBPF
         +LKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwkTUPCKAehdM4UFKxcg6GsIqs7Qqp3ZTsdhPG+ApCOKMDhBdkV
	a5okLpdF7JaOFhNul+Rq3Uc=
X-Google-Smtp-Source: ACHHUZ4qWEUPRZRMhti8kFaqGTLRa3XvJvQwR/84lPFSapfYNJIMFwloIDNlgNmHL95QXxR3WP8cDg==
X-Received: by 2002:a2e:854f:0:b0:2ab:291f:4df7 with SMTP id u15-20020a2e854f000000b002ab291f4df7mr765968ljj.6.1684528851313;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7807:0:b0:2af:16a2:fb05 with SMTP id t7-20020a2e7807000000b002af16a2fb05ls370102ljc.1.-pod-prod-05-eu;
 Fri, 19 May 2023 13:40:49 -0700 (PDT)
X-Received: by 2002:a19:ad02:0:b0:4f1:866d:9b01 with SMTP id t2-20020a19ad02000000b004f1866d9b01mr1153863lfc.3.1684528849411;
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528849; cv=none;
        d=google.com; s=arc-20160816;
        b=s9SqFqyTsMc+/r+8E7ht03/WZf6WwH4siGNfiDkkt5qai9afQc7IkGquGL1d8xQCoN
         wf0XlqhuxlLbL8zkIuvHSGpqHNrOyJhRuLJqo+F66NGvmKv9u8DxrlSwLBuAwV4BNaK2
         Y1XfDu0lfm0QBXEMbg0gV//Vy7/8uY/Po3TPk+Y4wRmMN7OG0HWBFCCu5WsDKBT7pic9
         r6wVCV1DTKZ9ApbRC483eISMoXkUkDms88COw6PMrPwPre6hKRcCzUGb2g5xvmGq6siu
         /EQVmf/fWBRBhM1M9/pbd/s7IDyy+buW53ONJrvzXhSIpo2hWKG3LLeFPFqGytmCVNHj
         d7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/vMrdxkd/F79E1F7R7wVF6KxU6dPk0IxerEfUvDdeLk=;
        b=KgsgyeyS/4VareEaKUixJZ5INC+yIihyaCDFwo0fJT4PltpY0x7BSH0ba/qivxglB3
         E4p3egnCvx42xmWTpyk6SWR+mmQYe1j5gPr+Vf4SmqmuVtrJrlNFdSOkOtkcjW715hlh
         voMUBB8zYGmwkloGnWBqtVV+XEX8T66d+83uz5M1Mz39kqT+JH9ItpTFOVz7gNo0yXv/
         X7BRAAjp2j/OAvTgIefWPJo6ZAdUlXBKBpbJed38LLDR0jIxmVs7wk0Qw3gXjSnAEASO
         CbFwCqa0pdNp3LFsLJEJSNx/cbr6iDUWDVzTGjADJu07KY877gfTOG3G3GfT+xPwKPZW
         s34g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s10-20020a2eb62a000000b002a8b2891ba7si305520ljn.1.2023.05.19.13.40.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdX57Snzxpn;
	Fri, 19 May 2023 22:40:48 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 23/73] driver: sysfs: fix cell statistic calculation
Date: Fri, 19 May 2023 22:39:43 +0200
Message-Id: <20230519204033.643200-24-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_700_799 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Can be squashed to new-cpu-config later.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index ac0b88b4..1664b5e5 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -96,8 +96,8 @@ static ssize_t cell_stats_show(struct kobject *kobj,
 
 	for_each_cpu(cpu, &cell->cpus_assigned) {
 		jailhouse_cpu = per_cpu(jailhouse_cpu_id, cpu);
-		value = jailhouse_call_arg2(JAILHOUSE_HC_CPU_GET_INFO, cpu,
-					    code);
+		value = jailhouse_call_arg2(JAILHOUSE_HC_CPU_GET_INFO,
+					    jailhouse_cpu, code);
 		if (value > 0)
 			sum += value;
 	}
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-24-ralf.ramsauer%40oth-regensburg.de.
