Return-Path: <jailhouse-dev+bncBDGILGE54ELBB6UC42AAMGQET2ZETFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0394A30C648
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:43 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id e15sf12773699wrm.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 08:44:43 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612284282; cv=pass;
        d=google.com; s=arc-20160816;
        b=OXBXqVF2xtdIA8r4wvF3ILOZVdtw84BqBcELPwh9by5vgjiCV3RT1aviloPujHEB1+
         VENdzweoISaO11fsjeRrmAy+nPBRqt7Mc9ygjgqqpOW0m0L2Og9v9pB5BICj2sT4dJ59
         qrlhiAWjUPHRomv1F49v++MdpwlpqWqhSVdgVW9OfexbfQzEmNTGHbhUXGinmf11YpN7
         1bG4oC0SBbuu3Bs1zLBXxceo8wCbrt9c/36cWsPBoYbPWuC4Hg/HCjxn2/VhlE3kIiYI
         +YB2+1hBJ+Ncbkfp1iBfqPBY5Q71pneM2RoRgbFX/zeyMfobtD9sYqMTWDaTcXUC+lLG
         Qkvg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=kkWqJ0Y5j6CbgfxhnPlsvChq5BVEwhAlANyTlBbsj08=;
        b=Wsg2V7RhDaB46eLJvbimPO60R3F1RCyDVRJ1lJgC2B2ZRxLLzsM4Kalb3bXHH/1KQT
         1YC+VK9PeN0klfIJQhDpgtjwLBQ/t46sOu1H7eG3jh+waBNL3cXIGssXiH4ibzuptClu
         3t6yf9Hrbxo2TzRH8ETG9FK+wtejZa2x5wJbPu+FNSkOYU1MRySd0KlT0LToZkyYWb9L
         2jC9UGo3WNR8dWE7mzj7p4ZWnl0nuJLtKEQK1iOLAEjtDi0VubatucJaG3pQtbc9Ydyz
         Z3s5LJBIbpzhLFwAxE9wqILO+PUUVCV50E/HcknY0Aps88btMCb7sspbfeBt1l6PwzRf
         chjw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=grCLIJlo;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.131 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kkWqJ0Y5j6CbgfxhnPlsvChq5BVEwhAlANyTlBbsj08=;
        b=tVENMe6eAZTU8XCw7fEfuGefAuq9WoiFnECjQKO857YaKlAbhxFgcC1pCtwl61P6qT
         rMKeSccrpIm6bVkcF6stG8UYLP3x2/jameDK8RVBakgcAp2irIsqfwhLLnEs8N6OsvBV
         G7s8U79ZS/nb6uv/EehVe8J4LdOoZjMD0opS6RVCskKXVehQsiRvoutFv+hpZjLMeoMP
         m1XtxDtqTi3QatiLbfuoijqjdDyPId0QlpoBvNVwDQ7+wFW7e17VOw573wXaV0OUqA34
         9zCyIKR7UEDEYnW6gazcIEnkxehxJ7v5nc9m+U+jeW2kdaxn/TBw86TYMc7/7ro0KvSj
         Hm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kkWqJ0Y5j6CbgfxhnPlsvChq5BVEwhAlANyTlBbsj08=;
        b=LnEmN0CgP0vcTu8pVqx9ElqK4dlYx1OerOsNDo7/Xg73tMMRghk6NVwVMuLKfEU++a
         rY3O2bEnuVdPoNRB8+EXIxCMT7swaxwHLSDEyZeysjeEYsdo0WfFz9eynlh9zeYtkaF2
         iMwLiKwWbTsNHUYBrCe/s2eVRURph8vSoXi741DB/sqLx3Zayt6vqDxGiYyi2mT34l0y
         EMd78X1CHJzLIsBkjC0GzrZQOJo/q7pkDswQAinXKo5Ez2iviWZWkTgZgRsk7qyjTnMN
         OxojWM2Jc3Yb/k8DD5pQFMWI12G7NSqRi45i4+r+sRmmHswOy/CG6IlyMA0n+KCVn/WR
         HDNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533eZplrqaXhDl5BdmmYk8Ct9CwKFguR8d6HoqQBnSppgLWg/r0G
	630dzm2hOE4tbzBx4WfaKRI=
X-Google-Smtp-Source: ABdhPJzLoDz5STKEd/fL+K7+Y4VABhCWaJidI8w5OARr2PFFgvVHB8J9pyy/9Ur5ONU8C52/3RnHFQ==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr24496008wrw.399.1612284282719;
        Tue, 02 Feb 2021 08:44:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd09:: with SMTP id e9ls1570962wrr.0.gmail; Tue, 02 Feb
 2021 08:44:41 -0800 (PST)
X-Received: by 2002:a5d:4ec3:: with SMTP id s3mr23803200wrv.79.1612284281871;
        Tue, 02 Feb 2021 08:44:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612284281; cv=pass;
        d=google.com; s=arc-20160816;
        b=X3DUlON7goQhBiiyxnyRDWtcVdrp/ZUKDSKNwAhUyICpyTFnfL2A8lNq+Gi0p1cxgv
         D/vwDQtQqgTwVlcH+ySVJSTXnGws62QnfupT8ffRtkGp3BNEvnQa9oWNWZxedFNyD1mE
         g/uF5jHTTWnGQI43AcvmB5JWPQYMZ+ZgTUon0SMKKEtK0QYDmCKv/+XRA0Rzu/lNFiTe
         WvbwMSyyVfpIX4MI3ryk8GfPREGMszunG748S4Kb1jMSHLC0acToymRbS8Ok8UTDfuz1
         sLJATbY6rVCfpCCFG0ggG94Md0rM5sE2Qw147QNsJ4MIOs2QsV2fTtMIE1oK2fcAk2LH
         6raQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=vkYj7FBmmvS8oNMl/XMJUiCZzfRjmSXsDWQI5HBxPBQ=;
        b=pwhsIKjfoWZ5qRg/ORzYeawKBoUf7oMswv0JjPRrzQknTtZs5tgQnKecjS5o6XzFnh
         LBI/mEe6t1MAOtdBJ4gbMikXDiGnbmnVI7UGdR/do4elN7cHMgaVfIbWr1gRBnHWPvxq
         dohQ7GAXhCaXHBHDce+q2zkG7SBUekm23eGnTCD5dyJpm2ABa/ak9eWzfkIVDIPJSIt6
         s9nbM9FZXH/FKFDuVc8KkbhvWuCuufkzSQnEnx84xNbow+ezOKCf7f67W5493b+CM8K6
         o5GHwumKRhyW9O9begK1pj47QvOhcunFhvGfEoul9HPORT9WRY56aA3ySB2xQTb73gA5
         sNVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=grCLIJlo;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.131 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60131.outbound.protection.outlook.com. [40.107.6.131])
        by gmr-mx.google.com with ESMTPS id e11si556030wrd.3.2021.02.02.08.44.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 08:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.131 as permitted sender) client-ip=40.107.6.131;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI54u7j/H+8guiKw3IGFlXPg4SCc5ObJ/6F68M1DCLvci17GpcQypItpJhSWiY1+H2uzVrT3WXr3igOLyBAsWt8gt20AP0x/2e0YlkiW0hnCjPqRAvqgpcZx6cgqLDVln4Q9Q6yImzN6Ahe8B48mZI8wTAcR+uecp/yXLckN/v1E3exCzQLUKN9Ne2AJzaEs6cW6mpVKS0dQWZVEMvLEWqfbX9u+OP5ALoViLpoYAXVRL+G3taEipdh4cO55QUEsJArG4CN1CrT8SDthFxNFTDhah0NUK+pzxowXa+1lfQvf8f7EIf928/cHTFe10nd8lDSGTTEKwAeqUc8SgKBnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkYj7FBmmvS8oNMl/XMJUiCZzfRjmSXsDWQI5HBxPBQ=;
 b=A4JWwHmvJ3ZEh9XEtXmb4RpL0ArZnZFWsOB7BfF9Kl4ktr3xocdU0EGmzTGTl2x5FVcKcpATgNAOH3g9ceyW/XdC7DEwaPWMS/lgQmUwSI2UHiEHiggnvqVlOLyn4jOh+akb2RW/TDuJNSKoq5lLE6K2jNHVnzeSWjlpoNnEx9NIxjoas9/v8NHGH+4K8Ew9nyouLoDhfL14/t3RZvlpSutmHDIGYdJHf9di2YPCCmdEoDClVvQWwve87fSNGoTbOf73DXhvVe2CJSxC8znCh0EmCbQ9suQP8MC0etgiwMVbj8uzuRjd/Lnu0a9/ES/D0Tt6LEfbG/ork/y6L58qRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PA4PR02MB6910.eurprd02.prod.outlook.com (2603:10a6:102:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:44:41 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378%7]) with mapi id 15.20.3805.019; Tue, 2 Feb 2021
 16:44:41 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 5/6] x86/cat.c: Fix overlap on moving the root COS CBM
Thread-Topic: [PATCH 5/6] x86/cat.c: Fix overlap on moving the root COS CBM
Thread-Index: Adb5f7oX8OYdCdO3Q82DQA55SBE0PQ==
Date: Tue, 2 Feb 2021 16:44:41 +0000
Message-ID: <PA4PR02MB6670FDBC485820011AA5E9C4B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fb69a0d-17ae-4eb2-6b35-08d8c799d648
x-ms-traffictypediagnostic: PA4PR02MB6910:
x-microsoft-antispam-prvs: <PA4PR02MB6910C0A31A370EF2F0885826B6B59@PA4PR02MB6910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OSOcntM0+WJbxGzgB73JbG1Zc8NVyjE/WvvjhZu+UqfGBHBIAlEtwrFKGqYv5zWTLTjeDNVOBn3mXh4Pv9EKRAdrGNBe+cOfFXdTmKAAJ/iRo9ELR5u7J3jlYFS0baB3mZV0bO0wnEKJCTI9JYG9kFmO+z3TpV2a25dLfT682YrwEK5tiuY0bMaOclUB2b75bSgfrGm5oewz8WLt6FSFzsa99XBqZ5F2m/sRtzQfZkQ/DjOmbDi5EN5O66MljKYWDIUay0Ai+8mhUeF+Vo6z65HjGmYDBhzQper+b5wqneLvZuR4DnLh4JBGhuT9e2rseCqlrEOCWfsBeIP8gHa8fauHwUWT7ooy0/pBgnYX3M56AMmeV+q3ZEkPk5+YNAWhusThGhlMK06VynzUXy1egXC0MEITEKpgDSqbmISOQUCa5UAILpXfs7fJ6s0GLW3UQ+iNeWUfbLFhBdcEC9GoYkKwx6u6/EbpO7uEiCz91JYunWODzqoHz5vjp19mdVR2kWTPKgcLkvlWl+ASVRv/1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(33656002)(83380400001)(66946007)(6916009)(8676002)(52536014)(9686003)(2906002)(478600001)(26005)(6506007)(8936002)(76116006)(66556008)(7696005)(186003)(44832011)(86362001)(66476007)(5660300002)(71200400001)(316002)(55016002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tz5MlbXWU6rqi6q+iNPSV580u992lB36NLbI8FzOzDjH7ZBRKJ+jLCjEdwXK?=
 =?us-ascii?Q?cDAiKYveX2k2K9/DX3FLHwWeWBBLzxx58gXyTZ8k98gX9WgeJVv0thaiN7MZ?=
 =?us-ascii?Q?+D+p4NkijIVt9qsr2AXVBouoPARZ9dtlzlq0cMvSALkEG9blXwM8u8QkvI1n?=
 =?us-ascii?Q?y9Cl15Btl78QOvSdCFJV/ZFXPiHG+TWt0NQHJqU9xtiZwXF/UDdSvoUgRM1D?=
 =?us-ascii?Q?QrWtAt25bGBKgRHzdo7gyYawfJp1eE7MCIHbLCCFNNc/xx65wSkpM1+4DYPy?=
 =?us-ascii?Q?hOiCR/pqCI7Axbc8sI116jdkFZqE3PdCfzri6rPLwM0qdeypLWIgCs9TBePg?=
 =?us-ascii?Q?R8Vigcn3fl6kxbzjxcuL1/uglyNGMiisyK1DH8g2ZnqAaI0SQLVw+xmYmDJl?=
 =?us-ascii?Q?OckOt2F9oB/XMbvz4J1AuLeeaTW5b3kRoIVtFXQ6jCMKj978IS7tjYFhhrBL?=
 =?us-ascii?Q?H/dRYVgf8YSBZnYOoHszhWBLTRn68plyIGlQ7yRx94+UtEnfYEM4gqQhtFlK?=
 =?us-ascii?Q?uQPcncn/7lE8nUiQwNVQhEB1eAA0XXEmmxZ/xs/eixgwswHYIITtkwP6StrG?=
 =?us-ascii?Q?vbg5iThog/YZ+jS8hOPbw+WZtCRTy5slPtNUnCpCc5T6f0ZnE9viPJZnBb1x?=
 =?us-ascii?Q?vYwKAG2Ru9swAWQip0xKn25K7fjhB1+Rg2b9ZO++GBw91FN+A0pLTJFDf1Rv?=
 =?us-ascii?Q?+CDpXrorFrNtIFcjBafihwoZ48bOBxtJtdu0PT04EH/GK7kovxZTxra6rOdZ?=
 =?us-ascii?Q?Um+oj4/RB1ZoFGy7qhOZeSDjCDeDbUmXUNEMNxoIDxsExZ7KDBT5KkBgpDuK?=
 =?us-ascii?Q?OrE8ahCU4c3Mb+0bG7feStdBj+fY92CRZ2vbeVLxMJ64YZqelTLSbWyhQ6AS?=
 =?us-ascii?Q?3u3REBNkAGRO7ZM0xI3nXyjZFjRjVjvdfQ0KSRzZx8vqRh0mb2oSmt5mvovH?=
 =?us-ascii?Q?P4IRWK9fJHIa3Fw3UIBxsxKUyu5PMFwqRUZkLF4PsLIUO/jS1ARlyoasr51D?=
 =?us-ascii?Q?cECdCzAy5ZdkggS2CjU6x9q8Sq4rLzeCDVw2imAu0Xh88bg9Z/nvm2dOJ76z?=
 =?us-ascii?Q?LAE+ep1i?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb69a0d-17ae-4eb2-6b35-08d8c799d648
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 16:44:41.0714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FaGvXX57oduZA0P6neS+dpXFsQ9Eji7BMDRt3lJOJp5BvGJamd5QZFVJAMqVno74qb2FY2r2WSAW25rh0PbVuBKco5BdgmqA0wejPnV/ItEPzE3vr6cKPIrWFCT1uPR5Ss+Kp29GYPZvWA5Rck9GmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6910
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=grCLIJlo;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.131 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

Upon cell creation, the ROOT_COS CBM is shrinked to prevent overlap
between the ROOT_COS CBM and the CBM of the newly created cell. Here,
the new ROOT_COS CBM is prevented from becoming empty, and in doing so,
the ROOT_COS CBM potentially moves to free bits.

There are two additional situations that need to be reflected by the
code:
1. It is possible that bits which are listed as 'freed' are also taken
by the newly created cell. Given that the freed_mask is not yet updated
with the newly created cell, it should be checked explicitly whether the
freed cells prevent the ROOT_COS CBM from becoming empty after moving to
the freed bits.
2. Even if the ROOT_COS CBM is not going empty, it might still overlap
with the newly created cell. Hence, moving to free bits should not skip
the shrinking, in the else clause.

A minimal example to demostrate this bug for a 10-way (bit) CBM:
jailhouse enable: creates a root cell with COS0 and CBM 3FF
jailhouse cell create: creates cell1 with COS1 and CBM 1F0
  The free bits are now 20F, but as the CBM has to be contiguous, the
  root cell has CBM 200. Free bits are 00F.
jailhouse cell create: creates cell2 with COS2 and CBM 3FC
  Cell cell2 requires the top most bit (200), hence the root COS CBM
  takes free bits 00F.
  BUG: Root COS CBM gets bits 00F, overlapping with COS2
  FIX: Root COS CBM is shrinked to 003, preventing overlap with the new
  cell cell2.

Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology support
for Intel CPUs")

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 hypervisor/arch/x86/cat.c | 53 +++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index f4c6f5d6..c91560a2 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -105,32 +105,35 @@ static bool shrink_root_cell_mask(u64 cell_mask)
 
 		root_cell.arch.cat_mask = 0;
 		merge_freed_mask_to_root();
-	} else {
-		/* Shrink the root cell's mask. */
-		root_cell.arch.cat_mask &= ~cell_mask;
+		/* Check again, as freed bits might also be in cell_mask */
+		if ((root_cell.arch.cat_mask & ~cell_mask) == 0)
+			return false;
+	}
+	/* Shrink the root cell's mask. Might still be required if freed
+	 * bits overlap with new mask. */
+	root_cell.arch.cat_mask &= ~cell_mask;
 
-		/*
-		 * Ensure that the root mask is still contiguous:
-		 *
-		 * Check if taking out the new cell's mask from the root mask
-		 * created two halves there. Then shrink the root mask
-		 * additionally by the lower half and add that part to the
-		 * freed mask.
-		 *
-		 * Always removing the lower half simplifies this algorithm at
-		 * the price of possibly choosing the smaller sub-mask. Cell
-		 * configurations can avoid this by locating non-root cell
-		 * masks at the beginning of the L3 cache.
-		 */
-		lo_mask_start = ffsl(root_cell.arch.cat_mask);
-		lo_mask_len = ffzl(root_cell.arch.cat_mask >> lo_mask_start);
-		lo_mask = BIT_MASK(lo_mask_start + lo_mask_len - 1,
-				   lo_mask_start);
-
-		if (root_cell.arch.cat_mask & ~lo_mask) {
-			root_cell.arch.cat_mask &= ~lo_mask;
-			freed_mask |= lo_mask;
-		}
+	/*
+	* Ensure that the root mask is still contiguous:
+	*
+	* Check if taking out the new cell's mask from the root mask
+	* created two halves there. Then shrink the root mask
+	* additionally by the lower half and add that part to the
+	* freed mask.
+	*
+	* Always removing the lower half simplifies this algorithm at
+	* the price of possibly choosing the smaller sub-mask. Cell
+	* configurations can avoid this by locating non-root cell
+	* masks at the beginning of the L3 cache.
+	*/
+	lo_mask_start = ffsl(root_cell.arch.cat_mask);
+	lo_mask_len = ffzl(root_cell.arch.cat_mask >> lo_mask_start);
+	lo_mask = BIT_MASK(lo_mask_start + lo_mask_len - 1,
+				lo_mask_start);
+
+	if (root_cell.arch.cat_mask & ~lo_mask) {
+		root_cell.arch.cat_mask &= ~lo_mask;
+		freed_mask |= lo_mask;
 	}
 
 	/* Cells using the root COS are also affected by shrinking. */
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR02MB6670FDBC485820011AA5E9C4B6B59%40PA4PR02MB6670.eurprd02.prod.outlook.com.
