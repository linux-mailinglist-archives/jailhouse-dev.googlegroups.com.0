Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBB2EZ3XYAKGQEE7GQSYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4B135D3E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Jan 2020 16:55:21 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id be8sf4100896edb.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jan 2020 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:content-transfer-encoding
         :mime-version:original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WBY9/IHQinrCwbFiAfQghxVblEqJtiBWU30cUS5EnTA=;
        b=NmRH3xLIzPwOgkK6/mF8v6/5AtTQwnWiYJwSNi5ELut9Xj7xHJg5WKmzfBFMBsN1Y+
         0ZY8RN4XkDk74dK9jJkPcteiPoXFbk5LQbonPSau9fYMepVB8ff79TGt5NgqhYcyGCfj
         w6uQPV7Ys1FvwL+pkEA3XnTu+f061J7NYDpVi9470H9kJxzs1/7Y7SWn1Pk1pTyIEKNr
         zpeGwGb6V91QDKiQYa2+13fnrWYvh8MruPY+tsYT/lPbrafmodlygZeNGzqIaHvIcCtE
         s8WHSI5wirbbZ9PvRldNCPgwo3UHb/xIVay3ErACdBnOa+sEKyS6ipsiAz/qlxb4MYSy
         pHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WBY9/IHQinrCwbFiAfQghxVblEqJtiBWU30cUS5EnTA=;
        b=hNyznxr98F1LyPNM6kn2406TweITkwEmujAR1yFIO6jQGreSx5jA/fizXSqdrthkPE
         GmWPOeCNTatVreJaIiu9EvuEr3K1xmIISB5v0SXxYxhzDvGi04Q/DrhtB2DSgGifP8Rj
         ZqDpWyQcALV6ED5ZAiTh5VQwu8GRl463JvgsejIy5AeIWxmOKK7T4mdNQGMfUogELdLm
         swqZJoM8eC76vSSilOK9lac4MZhJ+POkeTnWjegfurgMMxBpQ0cwJNz7HISuV7r5SqDE
         ibaOLhrC6Lj2+w80by00f269fuaYD66Occz0ncru3+J+eC0BUbmo41ui+QdNATK2O6Ab
         Z/9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUuweKWjH6lu45Fup12tdJL2bDue0g6IwSVUFnMWjm/xSABIMsI
	/cfQagJVLajGhDGOz2U6MEQ=
X-Google-Smtp-Source: APXvYqxVs6miQPD2LPQO2GvmQefIQaBLUnWgrWZ9ulyLWrM0asOFEQTGMg7DJ1pZBYpD0qRv4MPjsw==
X-Received: by 2002:aa7:c751:: with SMTP id c17mr11873030eds.293.1578585320875;
        Thu, 09 Jan 2020 07:55:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f01d:: with SMTP id r29ls563143edl.6.gmail; Thu, 09 Jan
 2020 07:55:20 -0800 (PST)
X-Received: by 2002:a50:fa41:: with SMTP id c1mr11845598edq.153.1578585320360;
        Thu, 09 Jan 2020 07:55:20 -0800 (PST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2052.outbound.protection.outlook.com. [40.107.22.52])
        by gmr-mx.google.com with ESMTPS id w19si357961edr.1.2020.01.09.07.55.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jan 2020 07:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 40.107.22.52 as permitted sender) client-ip=40.107.22.52;
Received: from VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) by DB8PR08MB5050.eurprd08.prod.outlook.com
 (2603:10a6:10:e2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.11; Thu, 9 Jan
 2020 15:55:19 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR0802CA0041.outlook.office365.com
 (2603:10a6:800:a9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10 via Frontend
 Transport; Thu, 9 Jan 2020 15:55:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Thu, 9 Jan 2020 15:55:19 +0000
Received: ("Tessian outbound 28955e0c1ca8:v40"); Thu, 09 Jan 2020 15:55:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ff194e57aef42fd
X-CR-MTA-TID: 64aa7808
Received: from aa7137a1a6be.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 83CA08E8-C51A-4797-8996-CEBE11D7E56F.1;
	Thu, 09 Jan 2020 15:55:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa7137a1a6be.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Jan 2020 15:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA6LMM6QlrRwr+VfXLmAUVt3gOIDLc8VRceHYXbPva5jy3ApMPX/Dek+Ztb5zFri6dFFv1PcpY0JiNbMJjoSUkeWbFoHfqgxCEUGARvVUQ/7oqmpBgZ6g+Nj+tVcaja2oIh3UhrdtjsEDT+6GFL3yUXhjM+ARVEYe/JSuhrc2Ej9+Dgk7BI1uRbUdUui5eb8bzJ87ylIWnlwgWtuGil4L8Lz4nNrtj4dDzNpcJ0CQav/i1hT5h7UgAfLgh4IazJ/9fHlKATIaQpv8/LeYlI+S23IabnJm+eOq4snPAQJLWOl9l4vIIzuSfXocQR5odrWArwawTCCV+FbM2LY6uRcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKI9gVZrHNivs2BjCY9tIK6/kZVQjNdcphrxzQmAyj0=;
 b=LYSO2DGTG6EkoDEoNUNmcl0KqOYhHqluGAQh8mIb56e/Dci7UaDCom8ft5xTriZ5JGfCEAmvMRiLd/yk5/3RdAmFqlQmCpSlYyhMdhn7087ufvmG3M7/NZtJupXUAhxSQvaxB3ky06ICMKaHHAs73k58cP6MCIg8zFANBHriHOxe4jvbhiDE/kLJg0qEcYb8YhAfU1cS+40fCwTfIafi4qOY6LqlRN05ZE/9HPLCN+n6na8AVPTXZgZ4Zf0UIsGklMbYkUNiUOX23XJmZiwU6+OXo23jEIs8jauiIgkZR+UcaRFNAPUiy+fdke4nMt+Jlya7nBOrTWn8omxZsBm/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB4893.eurprd08.prod.outlook.com (10.255.114.77) by
 VE1PR08MB5088.eurprd08.prod.outlook.com (10.255.158.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Thu, 9 Jan 2020 15:55:12 +0000
Received: from VE1PR08MB4893.eurprd08.prod.outlook.com
 ([fe80::6c64:6ee2:dc9c:a885]) by VE1PR08MB4893.eurprd08.prod.outlook.com
 ([fe80::6c64:6ee2:dc9c:a885%6]) with mapi id 15.20.2623.010; Thu, 9 Jan 2020
 15:55:12 +0000
Received: from login2.nahpc.arm.com (217.140.102.7) by SN4PR0401CA0027.namprd04.prod.outlook.com (2603:10b6:803:2a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend Transport; Thu, 9 Jan 2020 15:55:11 +0000
From: Chase Conklin <Chase.Conklin@arm.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: Chase Conklin <Chase.Conklin@arm.com>
Subject: [PATCH] arm-common: gic-v3: ensure LR writes are visible
Thread-Topic: [PATCH] arm-common: gic-v3: ensure LR writes are visible
Thread-Index: AQHVxwUsrmKcnXcJuUqGA5r2y0Jjrg==
Date: Thu, 9 Jan 2020 15:55:12 +0000
Message-ID: <20200109155423.125000-1-chase.conklin@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0401CA0027.namprd04.prod.outlook.com
 (2603:10b6:803:2a::13) To VE1PR08MB4893.eurprd08.prod.outlook.com
 (2603:10a6:802:aa::13)
x-mailer: git-send-email 2.22.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.102.7]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c2e0df1-9eca-410c-f8b4-08d7951c539d
X-MS-TrafficTypeDiagnostic: VE1PR08MB5088:|VE1PR08MB5088:|DB8PR08MB5050:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB50503FB47504A7EB75F49C45FB390@DB8PR08MB5050.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:9508;
x-forefront-prvs: 02778BF158
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(189003)(199004)(40434004)(186003)(16526019)(6486002)(81156014)(66556008)(8936002)(6916009)(36756003)(86362001)(2906002)(4326008)(44832011)(316002)(66946007)(52116002)(8676002)(66446008)(81166006)(2616005)(66476007)(64756008)(71200400001)(26005)(7696005)(5660300002)(478600001)(1076003)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB5088;H:VE1PR08MB4893.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CYa+hVz6BY1eXrzesQXDysJuUaifx5I0W5PzRoz02GwZQX5zTNXF9foJwCz5n4dyMWKw+KdnimXL92a9fmcuN4xmMprLVsOULSFRuUNFqDTl77W4jsQ2fN/B9OLv5AuaLUhF8wXS17yAeHLLqnoMiOPbWvu99FfL8/RCFzKe4UtftNpzqsvLn33hYruEAPcLf384OxdSAYQ5jfItSW7r2AZHeJtl62jMfxkkWl8vx1IE1T2cWq2jqpvu3urr6AMcEeLhQdChygTMZgd0D5k6kVUsKXicZuWLojhIMZLNOpaymAH4f8Qm7W9oxTG+NvIdOhtpBZpV7gt/PX4gv7VH5KNIz1FoZNnjClS2wkM0pDe06qFaXQhXMpa8Wt+hbtafueUTpFSUSim2vnquvmeYtqqEIjdRgSwmkc5hjrr3xyn7uASDvp+/QJOs+RgrQs9abxkySNQpmNqkWGLHEreY3+I5oUexwdSGZGvNrsYS2WCWn1/CurBNbCuvGYzhxwnu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5088
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Chase.Conklin@arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(40434004)(8936002)(5660300002)(6916009)(81166006)(36756003)(316002)(36906005)(2906002)(356004)(1076003)(478600001)(7696005)(2616005)(81156014)(956004)(6486002)(336012)(86362001)(26826003)(8676002)(4326008)(70586007)(26005)(16526019)(186003)(70206006);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB5050;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8f9f4777-b094-4a59-c9f6-08d7951c4f4a
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzElesq013PzJ+2ogT5BVS0HFVmC5xANNrfme4nxnHXsxgCbCM9d6FH2B0G6obomzBaBHreUVb+GNGcXcCYgZarN70assToJbCZ256uoY8ps0VfJTr0ISo36l3Sj4Z5F+xOka4ooaW8i9G6aNZtOWtTzGuZi2f55C3EvWVO7DBAUhG4t7jZpV3mRdgNeC6+R8OZp/OYQ4YPFxcJp1wf1HKcf9xfhsKnDgp2lAwYBk17EWgMr4t/QpkeWFbd+VTI42YqKP4CA4swEL+/nL2/YGuiZb3vJUtCEz6+R5mzHNPtolc4nuAWLExKMsBqEEZBzPNf0vjPSPT7tY4IV578CuDXQW7vy5JxQ5wC8HLiKjHSrlAhWXt0pCw0JH59uTzAkTEgtb2tN6KsVoOxTSnAEzgP5YS+9fGjRob2nI7gPLcd8fxSVAyRz2KkHeof7VKyokdJduevNKhOZZ22jbExMm0WMs68e2WhNHG6FV+FodjhnpB74pNK10bSy+O9LRBbI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 15:55:19.0068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2e0df1-9eca-410c-f8b4-08d7951c539d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5050
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b=8R12h2nn;       dkim=neutral (body hash did not verify)
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b=PeImppD9;       arc=fail (body hash mismatch);       spf=pass
 (google.com: domain of chase.conklin@arm.com designates 40.107.22.52 as
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

The GICv3 architecture does not guarantee that writes to the list
registers are self-synchronizing. As a result, it is possible for a
valid interrupt to be written into a list register but have the empty
list register status register report that list register as not holding
a valid interrupt. Since the empty list register status registers are
used to indicate which list registers can be used to inject an
interrupt to a cell, it is possible for a valid list register entry to
be overwritten, dropping the corresponding interrupt.

Fixes: 2ce9d14ca4e2 ("arm: GICv3 initialisation")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
---
 hypervisor/arch/arm-common/gic-v3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-comm=
on/gic-v3.c
index 906d9a8d..6a1d90f8 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -113,6 +113,12 @@ static void gicv3_write_lr(unsigned int reg, u64 val)
 __WRITE_LR8_15(7)
 #undef __WRITE_LR8_15
 }
+
+/*
+ * Ensure the write to the LR is visible to the GIC (so that ICH_ELRSR
+ * is updated to indicate that the just-written LR is no longer empty)
+ */
+isb();
 }

 static int gicv3_init(void)
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
jailhouse-dev/20200109155423.125000-1-chase.conklin%40arm.com.
