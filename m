Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJODZP7QKGQESI25C3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063B2E92A8
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:38 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id u29sf13036739wru.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752997; cv=pass;
        d=google.com; s=arc-20160816;
        b=hiIICjuxAsJH5yNew5fHzSiFUxicXFRYe7Eu7hwtZMSJ/1WMZ93AQrocMq0oouxX9D
         wdXjAJgsrftm+iUbBqEHcGLejKiO6oblJfdfGhgN7SiGs6fRC/6GgHGC/kHubPffMITS
         PNjYMZqlRXbKa4ioIxR4ucQv9JTOGgF7WGKhEy819jhKgXqtEWO5AOo1dbi8FQf/XVjU
         sj4fve6h4q+1gKK8OaPZqCEPDw9XOeMtNajpQGroNsm44dYLuv/H8E0WD1kUnebLQO2a
         t1RRXn3VysYyMCQUKmejQq/0bB3Ph/ZjLc27X//slIOGHz5c0KNEWLNldjYDAvfM2So1
         ZhVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=G/k/MhmEZ1Rn4ilT1vJ5vhY6dZHbY9nn7Ziv0ndo288=;
        b=vC6UmEWpXojkWfJXCnOwviKKrLXKIEssgnE4B1KBXyXraYI0EJkzIZld1E6mvJbXkP
         /JLtJyctTXx7nHNMWM4iQO7Q6nap7lWwPkHv0OLe03szlozkTYryd5b5fOWpR0aCwwCi
         SOgsc/iWjaSVIteSI+JcjsPuG++ulWEzrKMkaXmIkzNPg8bh6Nmkc6Tr7dEahNcNRGEn
         73kBEvM7CZPg6Efqsc1NmsubQLVAEBoXSE6Vr7CVddQY9MHEChQAGwR9TiZlZOy9hkzc
         0HHK0kmy8dZqT3G9WbKnIoPZh/ZkpguQFUJcQ77UQiTxJww4LYLqZf+UtkB0Lif4tN3B
         N0uQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lPWMV6tj;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G/k/MhmEZ1Rn4ilT1vJ5vhY6dZHbY9nn7Ziv0ndo288=;
        b=MbMo7Cbc12Pega1VmE4r8Zs2fnYTWgVc4pjZ3uWWta+aMO06XICC6OVYhrWRNjgxTO
         i3/c+9fnjEMpBfXK0sUj8iE1xePu7oVLkb6vcjc3NN1WA/HNZjre4bQPLYzlsvKJlASp
         ugvgpqO+Ui8LeSPUU2IdAfToqYftBdDlNJQKuggVLlqWtoahL5VkY8/E8h6JiDCTtERi
         F8xLGC6V+rge4a6JOXbW2j00c6e6kUydHHK077jVYTD3Uq9XA9LAx2DKjmKUhFefEo6v
         xlQ4+tq5K1kAZabNC6H0sxpBB1x+Ro5X1F6C2vJ+oTwDEfkVraRt1T0khHnvLE4p7tRa
         MlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G/k/MhmEZ1Rn4ilT1vJ5vhY6dZHbY9nn7Ziv0ndo288=;
        b=Bda/3H7DgRPNUtE3Sx708tePWslbKPTIq7eeHTk5P0hMErt4L6T6iRc90ogqfeIrXj
         aZWFJcdrTqnr/YBLKrk26+hMC99RiyhcJx2qmnVeQNOVG+rYjjP/Li7r9T0UwM8MNMdI
         f9HJoSIo6vlj6usB9fIqLwz0ZaBnHlvpFFglZjgGRdkgPYIWNxgx67x+06MCZBjsbv8g
         AFD3WF3c4LxDGpVnW2Esa4ijm4bDu9516xqL79rtW61iP2K8Wfc9UliNT8bei+KJcyMH
         IPyw/AfrmS/I7UQ6vbjhpAQy3EjUxEZhDYQNItFdC0LhaN8x4176OXILy9favwUbVt5G
         T5LQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533B0mx4lglbULk+3WrhhmnN7gZqCIIWNT8tfoebi/fPnW8YaXI4
	sceH9l6wVSmA6WDsdyMWJAk=
X-Google-Smtp-Source: ABdhPJw7Leitedvrhes5bCjlSsJppO3FZhBtK6XkHZXOr4GaWeq9HgCzwM764U7rEOBD20YXFEmKJg==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr26902183wmc.185.1609752997805;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb0e:: with SMTP id s14ls5706278wrn.2.gmail; Mon, 04 Jan
 2021 01:36:37 -0800 (PST)
X-Received: by 2002:adf:e688:: with SMTP id r8mr77977059wrm.20.1609752996937;
        Mon, 04 Jan 2021 01:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752996; cv=none;
        d=google.com; s=arc-20160816;
        b=vG/joSTB5RNbTbu+sc6qUfbEicC/RkBm+iRREmWEY6vjxwbn6jg9rWDde/8G84YeMu
         6sXZh5uhBZEYMKPoSTtD1t4get9/JoLNRD7USxrPQiSD3QV97vaU6cp6JZhZvCD40GWQ
         79kqiKLQXxb21MbrNprQPpanl3NVNZ8A+W+6+sFKy90RO9Vc1ZYmreOa8rddgg35I0eJ
         JKm8cCRRR792aDMBB3a+9EMhIWaLkOPDXFd/gqisdr6J84T364HfYPPIWfClTXOMs/qi
         /sJLwNZNi1EuriLz0PVyMM/ee1SAoIy8pne/4bVp61TyyokKhr1ysaDZiJznoeoZG8XZ
         E5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=379sOCiSyLmwhH/J2FXq40TBIvanT9XtZRbHlzTPoEQ=;
        b=mGFlSUEihNd78K1H9K2ysAjsUbMihOSyqT241DoGdpOt9TYyFUVJf+YbBGThH4h/wb
         ANlM2YPqx7YlZ5xlaR+1JKYHl+/o3xaRPrJg9UmHySNLM5+YXjHyWkRMfuRJVWqsbJyl
         OqWHT0+mlkn6S1Aw22kguJxo28ThNPCSlnb8vcx0DbMYfTfAmXr0LhlGx5sLiOMeZQr9
         4m2DsG7i60C1/tshyFbV9Z7RsI/y60v0Pawoh4HEYQ1nQHQaW3ATTX127kdrftwWjT9x
         wtyx8QHmzI+8oHVhMnnU33CeL7xBYxtfwPgPSHGcomoeHS2DJ09CXzVdeSSI6qrsoNpE
         5BLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lPWMV6tj;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id o135si678835wme.3.2021.01.04.01.36.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LlneG-1kN1TI1vyS-00ZLYn for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:36 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/8] arm: entry: Drop broken attempt to restore CPSR
Date: Mon,  4 Jan 2021 10:36:16 +0100
Message-Id: <5a9b08b44fd429feb90abcaa4fe01b1867f66225.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FkdbIv26XYn11y/bgWpaRZm51woXSZWdUR+RSp/syuX9uREjKPd
 OWKD6zne74UhG88yB7MrwtQy10jvvDL809sK/xQ6kxe9kUQKBl1/RQnnTVclQLD0XYFiFaM
 ul1vTSi/g1eq9TLopvKUrvU1lmQL5lpArTRTZyp4cmPhZls9cuoxkFMch9acqK6L/kFeIw9
 SNikBWUYF73w+zgHn3xDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Tqnqi1LMTo=:CD3ZpE/EjysOG6XKzfgO46
 TwSZOmo381L3Dq5TDU6bzaqKTR4zIvUC+8D7l0JfKP676yg8bWpWkNOt5tz6y4PGqvtUTpw57
 EQAfUrcuyRd4eKA59csnrz+96HxS2smsfqp70S14s5zi2U4DzldAuR1Hc9p1zt6PMu3B74ibh
 3+IcdSIPNI7YvnGRXjU72KloPHTgOJbRI1z2czUc8IwlXGT6yxwTK06tazf/gU6DuyBCk1o+o
 MGvMHEb6Nc370KtQy0r75jnJqwdTlzeeCFznG6xYzLEq37P3gI68bDSOcWXCIGaV295SHg0JR
 U0AH+8yo4eF1IvGfmr9I4G/hzgqSrnu6kf2/jfMuYmaftgOmCkWlq4uQ4R8u+KEMrtsJuaudJ
 mrYF4Vccwlzvbejjf8kW+WQGGGBpuu3sZfJG3eur9x2O3qMjRvcAjYTsfPdKyRC9QKHfxUahZ
 A2UaDwjruqgPI/5Ln6t9eQefyXZcKT7DUHIMLCIAVwNkgBg8iN6n9ARWG/WGedtX8cYG20riZ
 bWTPUW1bnLUbGCYPNHHOeXsz8jEgLaQaUaPyI+hRJKGsNwWMSuVGiCWmlNtBNxD3IwfNIXWab
 qvOvFpRUs4RG1Y9kvgdjJm3eXhELLU6hAIwB4uF4MIlB773QX9bJD/q0xkGPboFQq8GYBQ/fK
 hjdohY/HMrWeNBR0A6sG/uI88KR62y4bD1BgxEynuZ8d2+4OcuaqlDsply1REcAVvdcgGF86U
 CHLlj+x0d8m5vplkGTflkNQjb0knJW7QxaVJZDzogyHV0atJeEQzPKBF0iRRzqGZkBuUQkoXl
 97uc+r8lu2iM+uG/+GVF2FXsEt0SS/3M8Fgh5n4QFQOBbMm6SlwtcpuYg4SKYkXzhWpAHEj9t
 YIKG3Anxcwxe73+BnJ8A==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=lPWMV6tj;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

This is neither the proper way to restor CPSR (we do not return to Linux
on error via eret) nor is this needed (no relevant change to CPSR done
if we return prior to switching to EL2). So drop this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/entry.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hypervisor/arch/arm/entry.S b/hypervisor/arch/arm/entry.S
index 1425e0b6..814772ca 100644
--- a/hypervisor/arch/arm/entry.S
+++ b/hypervisor/arch/arm/entry.S
@@ -55,8 +55,6 @@ arch_entry:
 	/*
 	 * entry only returns here when there is an error before setting up EL2
 	 */
-	ldr	r3, [r4], #-4
-	msr	spsr, r3
 	ldr	lr, [r4], #-4
 	ldr	sp, [r4]

--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5a9b08b44fd429feb90abcaa4fe01b1867f66225.1609752982.git.jan.kiszka%40web.de.
