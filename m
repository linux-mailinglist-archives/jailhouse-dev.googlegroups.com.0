Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTV5T6RQMGQEO6BQK2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F370A0BA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:47 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id 4fb4d7f45d1cf-510ddadbec6sf3612406a12.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528847; cv=pass;
        d=google.com; s=arc-20160816;
        b=fF6XCtmCrgUhygLMb29yH5672sMpESlpmY2RYqDmaZGox3vV6hqFYqO94vKYQAc0ML
         0R3NzGMRydCFEhH0tycZM++9zOihqAnSk0TYrbNQ3vQ5h1qCZj+MBR6woeU2/DrzBU9C
         mdBHira+msElRhL4RN1fQ2asd6sVjIcWaLTPrSFoLd1qY2FAzgNfT7TjpJjtpvnjX6E4
         ywf48fqas3crEqcVP6VVk86lqWdrtCJKl/HnMPLOdW8yogItKE2tg6OZZAEkJQ/IF3Eb
         XkRmO8bD74p+G4u4iaUJPcLL8yRaYwXAKoyPRT6HnYNG7yDG+9Lbl+GMaoiypJsdLYPA
         KOag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ur0qEeQOkVcuyVLE0m8IoACIbvg440Asq0AUTlTqKH8=;
        b=uEugkGaM6zbZdNxTF9gUCzH97VTMdfxsS9RRK5sUer9WB3QzqVLK9sUvxI+WPT1JTL
         LNDcw7Ix+KPpdRqT/MzrkurAky9NFK08zSg2WeJwGJVOCVs+N0vuycrWFaSQA0ivcUGu
         Ua8aFB1V4CmSQWquKtgMCxN40hmwmJtQuCXrana2Gw5diY99TmEEWQslqBlkjf3ormbF
         R+hSkIjiV3ZbQTUfBq++q860LxuJ5THirTEFEAjpYfcUIYFl2lD52vh3qqvl6g8QS1/e
         ZSWOdN+dCFWRxjUpbMCUaTrx81VzwbvFFh6TyLNsaHktrAMRwDXQvx5ZTP9yPCkF1aUU
         mfRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ur0qEeQOkVcuyVLE0m8IoACIbvg440Asq0AUTlTqKH8=;
        b=Qv3xEYVxb73hmSKaIvL+u9sqEIqlZTr61WjojEYAcTTJCoLTHDkb6fIszx/GNqOK0D
         taiSXEvwEaddBgmHoozb3ANI8GK1KHcW/Jv17WjTLmmzf96xQPJcGHYkEdpeZo5dSiKW
         ILLI2THDZTP3qTlH7sUJSuwQjiCGTQN7NM+ETy9yKDs/eHzArZuaGnDQkX0vpqiOkjXr
         OUGagtUKpGM7rmHJZiMZbuCAGhQgniPON+YqkbfDdQctxDk8yCjpkYCjrGY73+dKgfKI
         fSgaU91LsJl+1JQ7IvjerwZS0wT4ijXVGQuzw+tmmTseKiBU28RlvT69FQGVLJK/NOG6
         1gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur0qEeQOkVcuyVLE0m8IoACIbvg440Asq0AUTlTqKH8=;
        b=YI7E3kSsb+Bn4sJWhQnDff0B+SWxYNHbxeViFOIZSw3nlN/qV+9Z4qRgsizs7Qv+cM
         Ot56MzkwVmS170YAUHeEB1dJ6ychSxcxc6Wom833QgJtFZOIxAyL04FjZudewJwiXZmp
         vyIPK08zNrHe3iIEFiq8k8T1XEADjh8E5pXT0hyqvWUHHjXoAql+ND+Af29+ICBeOGrd
         nihmIdB7VTQgj8HGmoQ33gzn6F0AT9P2CDnc90kLRqKkYYnx0DLhqUvAlf4AyJhtPeur
         E3YwrKtk6SlbLXuONEnBhKNlkg5kLMM4PGIPf6sPQcwbNuX2PJjOM0/phfKHv4VrMJF2
         i8FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzBSjZU8gyi161/rpX6Lot5oMAC39Y2jPreecvARz3DogKHhcJp
	+6uK1WcXqL0liozQj36dASclnA==
X-Google-Smtp-Source: ACHHUZ5oYIaUMzMHnQYgJx/ulYgDJd+PuGddDGLkGB8LAYq4iFa/Mqz4N5pAFmTcmbY64TrzCDSRlg==
X-Received: by 2002:a50:ab50:0:b0:50c:7343:c9b1 with SMTP id t16-20020a50ab50000000b0050c7343c9b1mr1218251edc.8.1684528846750;
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1a48:b0:50b:f4e3:a863 with SMTP id
 bf8-20020a0564021a4800b0050bf4e3a863ls97834edb.1.-pod-prod-01-eu; Fri, 19 May
 2023 13:40:44 -0700 (PDT)
X-Received: by 2002:a17:906:fe41:b0:96a:138:c1a0 with SMTP id wz1-20020a170906fe4100b0096a0138c1a0mr3360796ejb.9.1684528844849;
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528844; cv=none;
        d=google.com; s=arc-20160816;
        b=NvLrtx/ee08VMUbEirYrFKurpSABUtDWquieSWhHEv50+oHs+vrmngREuCm7CJ4ZvZ
         fLdGImviscM98pmN7lSoDVwqfQRApanvKjtO46zfOFHsFwoxweI0gb3/8J2LHM+Eusqs
         8P3No7Pk+u0W1UmXhPwrcFBGqKB6icybI4AyMEhnDbnq7IzrBApXjArQBu01+d8YECIE
         Aopko78x5LAahOPs4JWYtUal6U72D8CHmlQyJffc2vCSZjsG8VKFf8kCsrhahWwMh04c
         E5zcxC6ClhyKtSs/b2+FvUccien711zKg/sZY+pgYHwMNpyBc4CGiX30QeNffO/NTbsG
         3t7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=RfZJT7PzGtNFnhXGn6VWiBnqesTmvz+zmqEqVgJPnIE=;
        b=kM7gnObSM3JrdtqdVnsptEZvhdg5pMKlJilnezr5juk2d6NPuGd8fJJ8hOqwTk7/38
         45DFKrhyJIb0+4ZZJoG1txSR3vkfoH4wgb+3rrxjtOYLTrcDWLgHjYffE/v8TpC6OZei
         Eymw7f5L4SJmvdlqXkdNVB3LyPxHWotFbglTJNgiXyj5BIDTYq2P4L5KERiIq1Xjs4sC
         3jRuv+4k8xQQrEMkTznjmvQlwKbppfCSIvD3gAElEQS/VWoocVJeiz8e5dpWGoP5CClv
         avHo43pdUXvLE9OBwVEiz7FNx1r4T5DP+xU3Jwn5cg03G/U2a+P0OlSsE1m3SlDX210M
         Fu/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id fl23-20020a1709072a9700b00965600719e4si6369ejc.1.2023.05.19.13.40.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdS2zSszxpn;
	Fri, 19 May 2023 22:40:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 09/73] core: Beautify for_each_cpu helper
Date: Fri, 19 May 2023 22:39:29 +0200
Message-Id: <20230519204033.643200-10-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Avoid -1 as impossible exception value, rather use the equally
impossible INVALID_CPU_ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/control.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index ececa026..35634e74 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -54,7 +54,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  *
  * @see for_each_cpu_except
  */
-#define for_each_cpu(cpu, set)	for_each_cpu_except(cpu, set, -1)
+#define for_each_cpu(cpu, set)	for_each_cpu_except(cpu, set, INVALID_CPU_ID)
 
 /**
  * Loop-generating macro for iterating over all CPUs in a set, except the
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-10-ralf.ramsauer%40oth-regensburg.de.
