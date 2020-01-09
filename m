Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBBRU23XYAKGQEUIZKSTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E34B135D41
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Jan 2020 16:56:54 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id g11sf4116326edu.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jan 2020 07:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:content-transfer-encoding
         :mime-version:original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=re0paMvRjOdYJcI+bzIG+ijjiK5X/dCrL+1pljnkTx4=;
        b=M0fVFZl3Bmm34+N6tCiYiN09FHtHneQL1NZnODCrCADx746Zw1nUJfgLkkUqBjEJlj
         he2AYHoJbBoesfN0V2cpbOLTQXYMfKQmvfF46qneObVHgoqxqJLrVOPzAvRkiqcsLaye
         nKTCXvNfZ9bHmuP8IKimGVCEe8LNCG3SS5fD8mD8RfE5ZTEkZmVfp7tKRRDzF08nMQi2
         3Cp28Styy4niiLPZtF2f4L8pfAb5t7zSN/Hsq4/i/YLY2sZ9UbzGi8MBWBarVUIMpKKv
         latlM7OfdS/3mo9etGA1Q5SMuo6VSHZtX5LIbzzgVOZmZSlnAxVwkpthUdYrMgazAafE
         +Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=re0paMvRjOdYJcI+bzIG+ijjiK5X/dCrL+1pljnkTx4=;
        b=HC/PLdJuC7WNkf0COJdw5vHT1P3AX/DDnifntaa4kcjrpt/qT21QSAfIIvDqBEdjiL
         oZH4fYDJldZdp2lhKxZ67o1G1fxqLdBWo8WkyVWBcGk649CfZnjZQDR/JiKOMDFlTxFt
         tNeZDI9mDdtrfV56vK5VPnpC6LXKRM1TarQIM+XOlkLiORP2/r6Lb6WIa6ATGpFTz7Bo
         A9yoybBqhDw6Pchaq1mKb6oceva8jzsxYODPCC8qgyh4uP59O8P14zkbB0oa7mD93Irv
         eq2bYTZ7EKkNcwk8aPcM+a6UzdOGxfjjqev6NWBcoRADCqnjPYbyNMylbBNVT6sEvYiR
         Qj2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWbOGrroC2L1IZxfGG7KXmPDJDdqIJaGp+RhLIG3N8p5U348mc7
	KTn8fj0FQssdObkf0rpgkwY=
X-Google-Smtp-Source: APXvYqzeobTxcisbUn5qMeLmM3rg8gIEUnWD8d9mc+Z9Y2jvD/1yN1BzaDuxqf4oVrAEO+kJKE71kA==
X-Received: by 2002:a17:906:1f45:: with SMTP id d5mr10932941ejk.169.1578585414231;
        Thu, 09 Jan 2020 07:56:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9ac2:: with SMTP id p60ls565179edb.7.gmail; Thu, 09 Jan
 2020 07:56:53 -0800 (PST)
X-Received: by 2002:a05:6402:1595:: with SMTP id c21mr12052851edv.32.1578585413627;
        Thu, 09 Jan 2020 07:56:53 -0800 (PST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50083.outbound.protection.outlook.com. [40.107.5.83])
        by gmr-mx.google.com with ESMTPS id z20si257044ejx.1.2020.01.09.07.56.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jan 2020 07:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 40.107.5.83 as permitted sender) client-ip=40.107.5.83;
Received: from VE1PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:803:104::32)
 by DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Thu, 9 Jan
 2020 15:56:52 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VE1PR08CA0019.outlook.office365.com
 (2603:10a6:803:104::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 15:56:52 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Thu, 9 Jan 2020 15:56:52 +0000
Received: ("Tessian outbound 1da651c29646:v40"); Thu, 09 Jan 2020 15:56:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ed3a03f74aa23f0
X-CR-MTA-TID: 64aa7808
Received: from e363198cad68.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C8CD74A7-EAAF-4C8E-8BC1-B7FA9C4ED23C.1;
	Thu, 09 Jan 2020 15:56:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e363198cad68.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Jan 2020 15:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCpxB3JmQn0tshljtrwQu5qavDapaQKAzzESxoAriqtd//K461E5piQBOW35TtBdZ4ldnPwh9X68xM+OHhHXm4/XYmUSIhxO5H5guvJz7ZrPv+J/7nxm6K9IVTqb0dtcInCs9QkvE+Oh8A7BNXe7aapFY76vLOpT981jKbFA0rvabVKtLRQnaXAs/ERKfproPEcR3CEHrzTs+HrpuXcC4lXGQ43umOjasWL1KH5rNqN6yedQv22lwyx8e51VTF8ncvnL9NPATU7JrNaqbvXkvHnxgKGyHGFEqiLFnzWVXK8Xi+jzpSumcqhkVcVOB1kldLhayViEO16ZJ4BY1wplZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BkP5DGOMFkhUaLR3XRHbldkKrEnPadfU5VHecoYd/w=;
 b=DHkHyZTfe8myRsFc8YZ2WDFiZiyfrwOi115qzB8dN6HBf26Bc8DJYg+UX5RLH1xv9BgVLzTRD52IVTRq20wNh4aC4nTI0xAIcMrjaZtnQLE59ZWOZCBFrLm4Ver5aRqaWiB/Dy0u88Tln/CvOVN1flzGlHq/GQazeAX59LnqmKr8tmhTe16bj/HnJSL2Edz7IDFejhJphfmI5ntMBQ4Nc52YlOmvd5/WrMmsK2Dnf5UgGvN9W5N/RT+4/NZB1Ve4lmzMZg1sZRxB8lfSizR82Clp7SSnhUZuKkY/LQiC1PEDQI7l+u0B22gHFfOzGnRGqoHbtZ/syWgKBxmrlF24Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB4893.eurprd08.prod.outlook.com (10.255.114.77) by
 VE1PR08MB4845.eurprd08.prod.outlook.com (10.255.113.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 15:56:45 +0000
Received: from VE1PR08MB4893.eurprd08.prod.outlook.com
 ([fe80::6c64:6ee2:dc9c:a885]) by VE1PR08MB4893.eurprd08.prod.outlook.com
 ([fe80::6c64:6ee2:dc9c:a885%6]) with mapi id 15.20.2623.010; Thu, 9 Jan 2020
 15:56:45 +0000
Received: from login2.nahpc.arm.com (217.140.102.7) by DM5PR20CA0013.namprd20.prod.outlook.com (2603:10b6:3:93::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend Transport; Thu, 9 Jan 2020 15:56:44 +0000
From: Chase Conklin <Chase.Conklin@arm.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: Chase Conklin <Chase.Conklin@arm.com>
Subject: [PATCH] core: fix hugepage splitting in paging_destroy
Thread-Topic: [PATCH] core: fix hugepage splitting in paging_destroy
Thread-Index: AQHVxwVk+L/xSFc5pkWeaGIGlwPtOQ==
Date: Thu, 9 Jan 2020 15:56:45 +0000
Message-ID: <20200109155626.10732-1-chase.conklin@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:3:93::23) To VE1PR08MB4893.eurprd08.prod.outlook.com
 (2603:10a6:802:aa::13)
x-mailer: git-send-email 2.22.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.102.7]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26e41dec-a3ca-40d4-767a-08d7951c8b15
X-MS-TrafficTypeDiagnostic: VE1PR08MB4845:|VE1PR08MB4845:|DB8PR08MB4969:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4969F98C6A4EDF622CA5EFE5FB390@DB8PR08MB4969.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:8882;
x-forefront-prvs: 02778BF158
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(189003)(199004)(40434004)(8936002)(44832011)(186003)(2616005)(64756008)(66946007)(66556008)(66476007)(66446008)(16526019)(26005)(6486002)(52116002)(7696005)(71200400001)(5660300002)(36756003)(316002)(956004)(86362001)(478600001)(6916009)(8676002)(2906002)(81156014)(4326008)(81166006)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4845;H:VE1PR08MB4893.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YGDc3Dd5mRVUa9Kq7/OZOUZLqhC891nrq8kpeRvVQ6Iuydb0cKvs9hsHcTCwfbHyZb+y4aGhakDuiK+fRPh537vqiXDCYl9z8hZBExHQCEiNjB0wTxSeO+B5tgWJGdpEJzGhAmKDAXDltYCGsoAdRKLI6swxgMOtGWrCUyLbpYcu1lMSTxtLQm063elny4S8Lry+oe9lkFRqmdATHHUnwR8/4gYPUIZGSjTMNdXNhD4q4X6oJyvr/cCj4KbrO3H//Rfl8bLT/LFGsx/zTU37Q33ABuZw2NS3T4Uj1XyaZG+bK2/Blb+seinu3BtftVBw5+opINdAHfaAWaAQSt5nyZ4RWOmezKDUX4BYnyazrJ+ax5ZeGEngjk3k6Cc4jbtJeqdDrf+T0TI0AXrIp5AYyf7LPW2HdyGKGhzVAU2nJdGPUHO30zIajwurHJIu6CKFNCP93JdNqexRTNn8xi7TnARvTuhB1SjUgTKuTvoez3Y/EVluQS7a4LujInLQQh41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4845
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Chase.Conklin@arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(40434004)(189003)(199004)(316002)(7696005)(2616005)(956004)(36906005)(5660300002)(356004)(8936002)(4326008)(86362001)(6486002)(186003)(16526019)(81156014)(8676002)(6916009)(81166006)(26005)(336012)(2906002)(70206006)(70586007)(36756003)(478600001)(1076003)(26826003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB4969;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6c785e49-bb8e-4eb6-b54a-08d7951c86f8
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vjfHxP8ePnO18hwky19jnbXIkUy/PNcQw4wnXP06sMv2bH0zvnWVCMo7lSYS+qOx6eWx0IdXdJ1xXjXn3oFQ/miLlVZTIBKPHb8PGabzWq0ZDX01ajXCRBYYjJ5H4SdkkglnDMhEQ6Otr5j+QvWiyaq8fZaHNohj0mJ8bsee0Kx9Z2Ip8lRALNwYBeM2KmqcbRoQ4XWY3CMbqjQTYwHrOOMAdZmIzV61rk6N0vlYRFBSmIvJ+05WD9JWcBbZ/klKgocWZ6KEJyWQvxyoeyShRy6XlyYv2Wq2v+OKmZlM/1kl4u7uUzKHGjdGrx+ylBhSnr7MAFxaNosmY0Bc5DWqJTre/45+ySEPuyJ4wygzpHRNNJ7J0RQEITnw/vx4VrfP+znknlxQA0YVEeuSI+HjK9+gwXHVVhfcrqe0wSBpcI1fHJnY03kMk2EsoKx+eDD/B5ptk/ZoyjCHhr/yLby0amKVS0OIi/d5EgLVUEozXkKP+kRM0yKrUIkrJJJzWz4M
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 15:56:52.0706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e41dec-a3ca-40d4-767a-08d7951c8b15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4969
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b="VbC/cNZ3";       dkim=neutral (body hash did not verify)
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b="hHfUE/OZ";       arc=fail (body hash mismatch);       spf=pass
 (google.com: domain of chase.conklin@arm.com designates 40.107.5.83 as
 permitted sender) smtp.mailfrom=Chase.Conklin@arm.com
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

When unmapping pages, it is not sufficient to compare the size of the
page to the size of the region to be unmapped to know whether a
hugepage needs to be split. That approach does not split hugepages
when the region to be unmapped is larger than a hugepage but does not
cover the entire hugepage, resulting in areas outside the region to be
unmapped and leaving areas inside the region mapped.

Instead of comparing the size of the region to the size of the page,
check if the region overlaps only part of the page and split the
hugepage if it does.

Fixes: 1f7784032531 ("core: Add support for creating page tables with hugep=
ages")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
---
 hypervisor/paging.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 4a24c1f6..83cdcf00 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -389,7 +389,20 @@ int paging_destroy(const struct paging_structures *pg_=
structs,
 if (!paging->entry_valid(pte, PAGE_PRESENT_FLAGS))
 break;
 if (paging->get_phys(pte, virt) !=3D INVALID_PHYS_ADDR) {
-if (paging->page_size <=3D size)
+unsigned long page_start, page_end, region_end;
+/*
+ * If the region to be unmapped doesn't fully
+ * cover the hugepage, the hugepage will need to
+ * be split.
+ */
+page_size =3D paging->page_size ?
+paging->page_size : PAGE_SIZE;
+page_start =3D virt & ~(page_size-1);
+page_end =3D page_start + page_size;
+region_end =3D virt + size;
+
+if (virt <=3D page_start &&
+    region_end >=3D page_end)
 break;

 err =3D split_hugepage(pg_structs->hv_paging,
--
2.22.0

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200109155626.10732-1-chase.conklin%40arm.com.
