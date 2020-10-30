Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBHEO6D6AKGQERUCZMEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3e.google.com (mail-io1-xd3e.google.com [IPv6:2607:f8b0:4864:20::d3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466A2A055B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 13:29:17 +0100 (CET)
Received: by mail-io1-xd3e.google.com with SMTP id q126sf4178243iof.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 05:29:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604060956; cv=pass;
        d=google.com; s=arc-20160816;
        b=vIz7K3suktk1GWLfaIwz0J4bEcWZ5/Z7f5CLgyZ+CAxEJfy3WnxK54WK47MUGdqbpG
         2UV9vbFflgsGEvpp8pWAsl4fI/0sXVhZOoQ0UUGph7q1a60XjQK2Z4Fqk52yL9U2MkS/
         25Nc61LlI27WhYLSSZs0IA7pXB1k2fu8p3jxgHyCgFoo1RucO5tc1TxitpAYXhkFmHIN
         b/ouZE3lCEf4B+i17+k/N29xux5KVXvSVUzNUlLxNHp39GbmJE/yHz7b/vEYOFpVgdru
         rrda8PRU7JkVN8gJ/KU60FIgFD/Z1WwdEDeJw4ZqWzd9lTf+c9JrU5pWYfzwpBUR8aws
         D7Sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=QP3X9hETrK1QhUpUqNsZpytN6Dm+LbRd3kg/OEn+6rU=;
        b=dxwf+YE7micEuWQ1EMDusx+cj02khvT+5CxXOx4AF56IFwGGzwjkxTptyRmKPIbjbj
         q8ruK60N+RLtullkt9tIt+LordKpoacPQSkPGj2vkTa6KgxxmIfayG4C+OfNWaJxOMV6
         1zxABfENDRmobEOSiQPZ9XBF77npLEfGcuuEbLj2qN01HQKfKjlw1KHApV12eDr2SPq+
         KC+pqO5ZWoj80tImSItY953AMx46kwjat7gh5o0cDFm6JBfexj1zhh0Hv2S2qUdzC47O
         71ZdlRUCvgUhB8I0Jm+gXTfBjfcstXHlNVDjnVtKclgY4AObOD2Oi5jyWMN4OImjWRk+
         78QQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kLvs8xRr;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=QP3X9hETrK1QhUpUqNsZpytN6Dm+LbRd3kg/OEn+6rU=;
        b=bWOCHrKkwKBvMyQUHE9eXGRE/dw0Ea6IzROIQlsCVOLIYlmeNi2l1t1iCDkMvlLlqZ
         mFC3lW7z1wTCj0NrmV4wlfXfiaE4X3TJ0q6OVPwNYOBgjD3mW6gc1q6Y1OKGj0Rm3QQx
         LdnI6Z36Bvct5Z7z6xL7JBY6lm6vR15WSqk6oLOLQfgOQ3q2mCO34CBHGW48uKDoQyQQ
         irf243GKTla/+MJUNSRakvGhJCnEe9eZTX2BqsZ6UWahom8cktDOp/bDa6vGgrRKN6Hy
         nI+6pL8aV32VU9cqwjbubMePWnvkoJNE6oH2dhuOIpUFHQG5xdlIbGIXJC4kdUTKzq4O
         cIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QP3X9hETrK1QhUpUqNsZpytN6Dm+LbRd3kg/OEn+6rU=;
        b=uRBaX++wyE4gj5vG0YIBKd4wkeKIokRB6dU7M7z6jHHoNnv31xhyu28vFIuKmob4ED
         wee2BCKsbv28DmqgC0fm6AGsQWYSJcVxqfhG6klH9ZD1P5JI4HZ+8jOoBUUTsLZ2GZ4R
         UJ041vwK5f+U4vKk93ygEira9vRi0+niDm91Q0sOMMyWGAPwVw2cXRMhklbsbjQtjCkb
         yEIvVMPx43durxU3B/3JyCBkLT0FF2RQ7fZuqAGTxmWzMdzB+hvt3OMd9e4dIMNePOjc
         oz2fMK0s/GeHpyaiSYaC/EPpJwNkbBITKRl9tlOBlQ1f0+u7J1/hEEV/GqK1jX3H9ol3
         CBxA==
X-Gm-Message-State: AOAM531B5C0A3MiY4+aQjq9ZIvAM7JaRmdIoYe0hsUXTkeFRs8khW+lR
	Xjzo8jnW/EDsRGWsPYGPnaQ=
X-Google-Smtp-Source: ABdhPJx+HRjjv+AHrjWctgE1WY8FKWOdMxkw19mh5hqtSpA9BiqnAyleWUTsWNuHjBvTurPLB5Z49A==
X-Received: by 2002:a05:6638:24cc:: with SMTP id y12mr1746542jat.144.1604060956612;
        Fri, 30 Oct 2020 05:29:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:140f:: with SMTP id n15ls1428822ilo.4.gmail; Fri,
 30 Oct 2020 05:29:16 -0700 (PDT)
X-Received: by 2002:a92:d803:: with SMTP id y3mr1744699ilm.227.1604060956042;
        Fri, 30 Oct 2020 05:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604060956; cv=none;
        d=google.com; s=arc-20160816;
        b=z+zFUz3TjD5hN5lLeGyied1CEmuEghGprQMwDw3EDjXTI68p5tO4X2vmz7US9n9Rk5
         tF9M6SwXfMnrs66U7F8AbbeVval9NmYTMcums4Zkzrlw5cuLDZcMen3lIcr8WSK2+t6m
         Jd2cu3inJmvN/w5kqvY/uuEdFICRucQ3WEdg9q7JaZPGcNDRR1VW0nNqyr1LsDGBaLJc
         NmV4Tbk7wijYBSpmE53nEloguoXfvMA3AEmQBwEQWBnXUTrpPiIupjMQfAgLFBKd9DsI
         rsVkppuGTHYyNmCoXWXwv5jY+lGxQs8Y4BeTmJCy7O9y4sUYJxSG1p+ThQjbHFh9BqQW
         AaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BS4Vn9F2THH1CJ19QK+An/PLpNG7oSw+JVprw5h+6yk=;
        b=vKL0k4j9tpmje+zD03rmOd6X+/zNgKLwr77IgEVzNrJHOqqakplYftLsGI6Y8fbKzH
         ATp6uiLBCg6fvPnDYJ0LtvYA9NOtxthENE2kxDsfLlUJtOCJs/U95I7p+0B2eB9NoEi3
         ROau++4175IdcMxmDBzzkCr3kk4t/qk8VhMvkSkMZNpRMcZZU5yYY1mC+kmUQZVangK8
         iK4JMGR84bZSJ+VbhyeVsGiNAv4B6Fn0yVAdco3dbmaDigCfYEWyeq2qrH+TTU6F0BDc
         GmGsb8x492MPZr2F/XqPiyxZGaXBQXUZG+48deyjqlS6gLauBd8Z17/zIjJuUiMg0FN/
         gzkg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kLvs8xRr;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id p5si348585ilg.3.2020.10.30.05.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 05:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UCTF33068362;
	Fri, 30 Oct 2020 07:29:15 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UCTFDA113693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Oct 2020 07:29:15 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 07:29:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 07:29:14 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UCTBNR085697;
	Fri, 30 Oct 2020 07:29:12 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] hypervisor: include: Add a BUG() macro
Date: Fri, 30 Oct 2020 17:59:09 +0530
Message-ID: <20201030122909.12737-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=kLvs8xRr;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

Add a new BUG macro in utils which can be used in places
where you don't expect control to reach.

Whenever this happens, the code will intentionally crash
via a null pointer de reference.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 hypervisor/include/jailhouse/utils.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hypervisor/include/jailhouse/utils.h b/hypervisor/include/jailhouse/utils.h
index 411f6365..39615945 100644
--- a/hypervisor/include/jailhouse/utils.h
+++ b/hypervisor/include/jailhouse/utils.h
@@ -21,6 +21,8 @@
 #define ARRAY_SIZE(array)	(sizeof(array) / sizeof((array)[0]))
 #endif
 
+#define BUG()			*(int *)0 = 0xdead
+
 /* sizeof() for a structure/union field */
 #define FIELD_SIZEOF(type, fld)	(sizeof(((type *)0)->fld))
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201030122909.12737-1-nikhil.nd%40ti.com.
