Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBBF3276QKGQEVTUPG2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6F2B8A2A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 03:50:45 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id d20sf1539260lfn.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Nov 2020 18:50:45 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1605754245; cv=pass;
        d=google.com; s=arc-20160816;
        b=pU2uFez2WRFwlOcSX0DAvPZYKInid5UIFCIlou3KxziJ8lFMe+rvX/p7AAuKhxmYTE
         A+tMcWuR4tWonn89NdbMxGdbm0PjWvTpb5BEi3BzqTh4bQiVGm7JXrkBnogbtwdiao74
         YjtT+QWkA1IU0AiVYza8a0CMwKQSzXwNGEMcvOfOC886T1cIYcd51J1iCjHfLOy+Dwud
         HdM2FwE2vgcm+/npzdSsGrDJ+J7ZWjZp2SOliu40kA+4ULqYrtTjBbYDHnWpQXlFjkDC
         7q2HGMzicPeeCCehtcgz+uIu00V8HKp9VMaZeIbMMiT8XpQ4geFgr4Ustl12Drnem1ca
         9Jnw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=IrYZmNgeNnAJdlGbvycC4WQT2AVjuTtfrvgEP6UnwCY=;
        b=L0OewPOT/H5YQTbvOxhfI+BgIGVA1m3h37Bd03UFMGnW9XR7dOwjrWpbuySJzPzTgn
         DWmvOGZ1Fs9RehqV9r38So5/Hn3sReGwIVa/doVFOWru47ShyD/wqmb1nsF5PXlcHkb6
         LcWdqn4G1ec+qw6NyyboDPUGuDmrPYzUqVENOxNIqtnIN+V7l+vX/Y7IUT+MMvOyhFxB
         HQVNzYzZHJ/sPdZbhNKb17pDBXy3rkPIPGBy/e2rQS4bKE1S4E8LmtxQB2PCq0K2p1n+
         bOi9ZAkohkuOOF/RIpoHUAVfggtU2eto0ULhvJRwB3ULh6AZHqsXMhlhimA6fO0cv3SH
         wB7Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WfQD3B7Z;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0c::617 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IrYZmNgeNnAJdlGbvycC4WQT2AVjuTtfrvgEP6UnwCY=;
        b=rirA4ECWBpnSGHPY0IgstMGoYDeF4qFXN9uTi11PaZ9ToIWPomwlxS/QBVsEEL7V6D
         MdYHX86GHreIB4ZiscTfVs8yNY5pxl+KNQOCgqeiz0L/Nzq7diCV6mTkNamIhI/750eq
         Xb+HPfBcV2yH244jkiddZ7H+ovvehAZq5XjF2mNIbJr2xCoB/KFqqclUJxZnNkq1oADB
         y02KGcgTdv9pCVTlTfrucwtF9pPo7hiATHT5OaOBuc3h+KVS9sltcd04Mi2RgktnBiBX
         s7lwQDofW1t38OGDco/m+3PVlWa+Hpls4Wgplkzqtyc51Jer3CExeDQKpWJ/AVbmE/YE
         h8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IrYZmNgeNnAJdlGbvycC4WQT2AVjuTtfrvgEP6UnwCY=;
        b=i+vQl0lnHAlUiM/D2QC4dTArlqUdesmCnNpESgH/dkR3WmH9DkWc/lT6Qcyx8p9vux
         1hKQu1j8DphFrjXvwEcHTMDlEHQTHww0FUwp2d+6NJs07YXFnhbJzKwh5vgkYx/MUauD
         ddREKjMClE3OyUxIjEghmpm1ngNqDiaW3oGUQAd5YIwO+QXmQFvD3PdbBp0xX5VRwqCo
         DNxT92CsPvx9zSgaB5n9wpHTNZWjzE1YAlridD4MS0nyzdomUOa3FF98OGOtzb8Fa4fs
         /DDNb+0FNUrbyfYxQXKhNZTjnDIvYFaEKEuHqCJ3A4oXnbm173ggMQAmslPhFlJEAjcT
         pHrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5325BA3U/u58ZovI1JsLQ80pNfVpy+Ah01FHpNMAoeJ935nMU68E
	TtaJ2ygk+fhGquSAJh/bQAQ=
X-Google-Smtp-Source: ABdhPJy9abq3+bGzUbkdczJDGzY54/NmX0bgNQ+Nm1xvEI/udYf+3SYaOrp5WQMxHmZk5SAhfRu7CQ==
X-Received: by 2002:a19:8346:: with SMTP id f67mr5922029lfd.569.1605754245282;
        Wed, 18 Nov 2020 18:50:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:480e:: with SMTP id v14ls898912lfa.2.gmail; Wed, 18 Nov
 2020 18:50:44 -0800 (PST)
X-Received: by 2002:a19:60e:: with SMTP id 14mr5115727lfg.566.1605754244104;
        Wed, 18 Nov 2020 18:50:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605754244; cv=pass;
        d=google.com; s=arc-20160816;
        b=skqbKsMC/YOfQU6x7RbnceAw/Py0KpGEsvT4dSHHgdHakWbbyDw2dwWZTMSf4z3qP+
         iNxYS9vla1M89YVi7Wc+DiPTGe3fueh6TjADuXc8brn2vVtPDpIVZKJNVBj37yo+Bcnz
         iu44obRSTBbtvgV47ghqm/B6UeGICZ109ac/o161AOt4iPRjB6T5m0AmSRG9NtkYopZl
         lKmxWmdJYQrr78Ul/n6HFkAybKEHFOMpYCHh8x45TUOWi7D5fW7MxCVFIvYVLCUF3ZrN
         dYj29xRhHxS6X2NMAfvSsdGWBzauDbSVtouUxd8oK+Ffw4Vi0CwMjstRhXgg+p30PcNN
         PaCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=uIsjCCHBIbzCtqfujfHZbHj7KAezkPKqby++ZFZBgo8=;
        b=pjVWNuUDf47KtLgAWTjDFvXV2DTviN60RENcsouQFvtN8ZNgNTeuxCJ00YeVo6W4GM
         IZQUEOu02a6wb1kSuyzP7jti/QadK15QzBe0bu333+VWexeQTAfS1rSMG7cz64mfIsUR
         LhmNPUaSX7zbGBXMnKz80PhVdwvxR7ZmqXZAHxx1bGhiVOQyed9Srs6QSBSDwY621e65
         ru5yKYSj6b+JYHCKXhpkcGS7lLitQkO6BSKeX96iItXIG1NLs7Y/eBCcRCETcZJ6/pbt
         pD6yHBZfwK/vB6aAIj4eRczQcHAyCJPtf0tye/Ju97bHCVy+XZ0vhP7I6pf5XBLNDiqt
         kvFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WfQD3B7Z;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0c::617 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0617.outbound.protection.outlook.com. [2a01:111:f400:fe0c::617])
        by gmr-mx.google.com with ESMTPS id m9si390044ljp.6.2020.11.18.18.50.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 18:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0c::617 as permitted sender) client-ip=2a01:111:f400:fe0c::617;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiS4MPXATY/1pVlvzxP8+12Zgaw0D22oZmPtMzz3f11Va3mZ4IPsL61zWQOtOgYYGNajgYUtYj4vyvv7ZYvE+2+B9JoR0mcBADjZu6cmjGVJRuJs/XaRDd6LYqnSwDwVDdMevcnmfBSQEvxUuqGRjc1e6FvNJOJm0aslID3ujjybxtgJDod+hd/vqV9L4mwSGfK3FO7P6+gXuM0swRFaPvRwXq/5qi/3C7LbMzlzKbG4fPCxQlYsoAgi7qm3QDNPxMLyb/QyDZur19iVz+3WO9CqZeCip4s9cLtfnzFfPijWaebbqNIOJaUpz6YQw61MjC+6M+rUJfWVcpxe3jzLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIsjCCHBIbzCtqfujfHZbHj7KAezkPKqby++ZFZBgo8=;
 b=BP+3G4GF/GTxYaOWA7mQ4vjugwEQ+Q8VG9RVoi11O/uhrFJWFrkxEkXQG9KbiBhZQ7GeE/d9qIdyTI32/8GKDavhyRPxB5HXmfeeXT7SCifb7l+8yT+z0o7WXnOeTNc2QJxinim5d4qFGnGgo+nOx6+jAsQxG6P36VLjMcSeh2uQp8b3QrToICuqs9ozGeChisLg5ENvR3OOhNpfbd4ZCG6Rhy/lSvKIeWvw8R13O2XMPVXKWIf1boAq17sKdsaxxfrJX/q00TfJKZW5jZOFUuU7DzRGdtu9gbhW6FWR8ol618GOcsoJxr/dVVjtAbKgBClcww+z6FHIIl8u3KW1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB5658.eurprd04.prod.outlook.com (2603:10a6:10:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 02:50:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 02:50:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: zephyr ARM64 SMP runs on Jailhouse
Thread-Topic: zephyr ARM64 SMP runs on Jailhouse
Thread-Index: Ada+HotgWPdpOhbSTKucu1X0S1ipHQ==
Date: Thu, 19 Nov 2020 02:50:41 +0000
Message-ID: <DB6PR0402MB276052104C2CE78B10D2BD5188E00@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 33f20094-7114-45ae-7e89-08d88c35e752
x-ms-traffictypediagnostic: DB8PR04MB5658:
x-microsoft-antispam-prvs: <DB8PR04MB56587E7F8BB88C115DAEA95788E00@DB8PR04MB5658.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1nToClrzcqz13Fun4RO5/ZTCpPBC4PrRBl7gpP7RHQtTZNNyouAkodWEYrFhv6SzZi8XhUZlfYFPR8FwzCYD1azj1Io8p7oPfinwhaTq/XRvmdf46VbHzKIh/Ec+FLxv+eioXE4fI7Z0XOYGx7K/LuVaiHyLDoyb80i+KBMSswg6YFYN+IIw3HTWiybzUYO81D15rq3ouMmvn031YoF7B69xad0q5J2g5HLbJY3NrU68hJXdhEDZRyH7JhEqDbz7wzu1pRuKYgW+XiQ933VICOx2lMlePugbZ1/r1j4k/y2OXuuR6WVcmpAiEq7euDF1wi/5zV6lgpmL/cUKRdZtnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(6916009)(44832011)(7696005)(9686003)(86362001)(26005)(186003)(6506007)(8676002)(316002)(8936002)(52536014)(478600001)(71200400001)(2906002)(5660300002)(76116006)(55016002)(33656002)(558084003)(66946007)(66476007)(66446008)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: CRrL5vzGe97nbGfuaSxJ7783iniJ1h8adUS/VsucCXs7/0xjs31dxEt06FZ4Lr8Q9QJMHR8NF2Q388MujDl/VXkL8zkux6Xn1F/yNmxhsT88DtP60gJK/CTm2Fae1Utf3BkqIhcUBrPWqHCiiWYSsQmoawHWaF/UTjKWyI+JDfWEXVRgW2kU2lVom8vv4euIeVHo1zaZV9OESjTS6RSv9Pf8/dAFThxEkeIxump5hOjdu05R+A105d5qKmItK3aHAE27uT06wsJSFd7aYKnFLRfVuolvKCWsRUtVDu7CijOgTUQVdlfeNq55cf/oXip/2KWltq+vffDdBlaaVvEAwaOSjMwbYS2KQXTBBQwehzqzm6r9DXhxXlEorXqqOOV/fXXxhpn0o7geJqGuo52TMTQPFfTVj5f1WEP+UGvUNT2ot/z0UL3hKfeFOp7EUw1gvqLuptUyZ1gxf9gJQvSTHxwndmI7eZIE1+Y9U73t/6K64s9VMSvx4VBdkREERXfekT18BI1RRGkba1gt+/b1OYCuPObGiVy3kJZ4ug2++/JHeXbZuYlTHXjEMFwLQxKXaIxYK9dZxzDHk22mshOCUMSPPlKIUoZXwQ1FvAvUpsLwmSy17ifOe/HcJYZpROcOV9OK+Lk8jWEwsforL7vxHw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f20094-7114-45ae-7e89-08d88c35e752
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 02:50:41.4184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PnEwujedIy6Hzfbr2szOdiKwM7B4Ucu4aRWjhm1jf43MsLCiQQNyVo9CFBgGNakOAR5Va0pSTHIAsUrIkhRlZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5658
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WfQD3B7Z;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe0c::617 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

Just share info, we have enabled zephyr ARM64 SMP on Jailhouse using i.MX8M

Regards,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276052104C2CE78B10D2BD5188E00%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
