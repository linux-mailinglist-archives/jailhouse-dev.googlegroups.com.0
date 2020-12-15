Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBSGF4H7AKGQEYLHKC7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA242DA869
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Dec 2020 08:16:25 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id bf13sf9499706edb.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Dec 2020 23:16:25 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1608016585; cv=pass;
        d=google.com; s=arc-20160816;
        b=GZYK7gVCsQSZNMCNubZpaXiPhPFZmsE9/eOvCc+24W7L6KZtQFC/bb0Cg51EEuCmYK
         7zTonyItiqA8xdG6FStXpPVRDtBhDhYPrrtS9BayRtuNOcJLQkJiXMHF+c8qfBhQ3xa9
         pvaYWqXvi26dEUN4P29bx1Z6M1rZY4zabnVgNxBGX7Yo15mtQaL+y8EGs4iRKjTRtPUj
         cU5jupxOMcmVqr2c/SpHrAjH4w+e7XdOuVgMeyXgRyZ/+sRk4XPLnDgb6djyBHtXIIeG
         pWXrL2pixKhllOMDhmy6FxjCV51bmNHYAAkL19bn293M9z4G1apGyGpQeCq6+0JtFSah
         qSxA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=vtn2Nq2mIcpZsmipZ/dFTmIsmnZ+5+UESOTSxls5U5U=;
        b=EzvtZ0I5/L017Jrz/zUQpujfQDqzhlG+VxQH1n1muq+OFLsN425T71Xb7ENvQ/ne/E
         wh5yoxbByg7JzG558E5Kpne+R+orQ8AVIhimu7nmhQ7jFwgJHSuNNTBDQfiy4/PiCIP2
         0v5Ln2sBMfehzc+GXA3KcrD2Wl2g39QGfnAZpIcoc9R0TcZIy8XvxJlmSuCGVEt1P4Kr
         V1nQJvq0NtDVdMb6eGcurB+pYSMRpdNXX29kY4l878/12Mzcud2qNXhsvCcrF0W3h07r
         mS4qmM+THhCDTxt+joHHFteNGQDhOXfdwhcGQAycm0JCcVO4eNwkKgET2MaTk0AOl3kK
         jQyQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=r9FleQwc;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vtn2Nq2mIcpZsmipZ/dFTmIsmnZ+5+UESOTSxls5U5U=;
        b=YZI+dcBHyf/B6Xb87DK+8SBmCLH74HlunJhuUpL3bL9KQQznPgodxU4d0u4FwDG3kC
         EuoAMGFWAE0ct6sr7WGTZ0avs29P0D/3PNp+vQ1qMP8PlQE+3o2Rb27XECIcFk87Q2dL
         yvYdiUspKxllDvnYwrnzcfr9YHvjfLLuTcezsZ0REpsQDrBxsf4uRiaaEbciYGEZo6s6
         C+lK6NbuI1du0OH57iozOMQ20nWRPbNvsy3xEjCes09jZcWPc3rvlxVk/XC/rDNapCxv
         090WTDxGI8hYyCoYYlvBVJNqIKdYOzwJrbMZrdl/+vQWE/IiUGDO9FhK5Y4adPAeQBiQ
         WdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vtn2Nq2mIcpZsmipZ/dFTmIsmnZ+5+UESOTSxls5U5U=;
        b=qQJRsEdKqq/awyfFdnGWCTNcJ1z5pg65lV9/qCEzrhCYBG9EJhUPGF/HBf3j3zuvgG
         CeUG40L+UxszsP2dXN8Xvjz7iIMBnswnlW6UTmuJeaQ7C9DMJkFwF4SlpBx5H6s98Rmm
         A8bpiaOzXatuFTCq9lhu7SaQEWZHkXTgyEsTEJuVDgdS+hKhoEs5lpe52jFmIgoXamQF
         EsIQzPV+r4v+btK+v0jw1USN+6CX/gQlqw5q7kc+8O+NpTna1OTj2kSSTvLCinSHTNnt
         WM56wAwI3+UzgO2V9Nr1ooMRJUm41Rkqi8FkF3QQOn6QrHON8WUyNxLV2ldzDScz7331
         fLlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Dt6oKocW/7T3izQiScbjE08AeTRlDFYYyGxL/hdNh1tLN9Y4U
	UWqjZ2I4AOw2auq8A7dymHs=
X-Google-Smtp-Source: ABdhPJxjmNs2ltNHE4uYssSzH0UxR8zGiTLfgFePWgfVPc8mqS7uU9Y7eYHTWzpyeZyZoJ7VgYDmOA==
X-Received: by 2002:a17:906:ca47:: with SMTP id jx7mr26676042ejb.237.1608016585261;
        Mon, 14 Dec 2020 23:16:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8a9b:: with SMTP id j27ls3615085edj.3.gmail; Mon, 14 Dec
 2020 23:16:24 -0800 (PST)
X-Received: by 2002:a05:6402:104e:: with SMTP id e14mr14814963edu.316.1608016584253;
        Mon, 14 Dec 2020 23:16:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608016584; cv=pass;
        d=google.com; s=arc-20160816;
        b=KWN+V0II26m+2cGU2Db570uaWzyZbFk9kH8wSMPxmcXXZ9OsLk83jnNQ8cIgVIj2ES
         UuZflSUl8Jea9bxWzybmZpvlTIxxgCIsREwD9/lIChanK1kboR2jf6kflMGYqC4ArYV5
         eq7x8elgMT7GjD9iyFfhj/Kt5O9igwx2UtYFWIQU14LJLB9dIk9k6tpBRz0fXsF9e4S1
         CyZrkAXyt1QX3c7EHjFdnMQe0N07QnM+rv37X+UOxqryix3NV6hxJUJQHb+rQKzxIaLv
         h0AOAdQP8gHIWVamtI+KXc6uYWLM1DABoYR7a4gM66kL3uq9VX7oR4/8l+T7+Hiooa7a
         Q25Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=QEm6tLaCnqj1qb7oOY7gOFEwlMvgmO6MBrr1fBq4nso=;
        b=HiewqYDgI9pZVKeZadAD6ll3wCEoTfpe8OAjzn034nGz5wkIOK32Pj5fnYLVhaL6vx
         H46NQN+yCqPD/oecE5lhHe8P+pNz9perYpCQy+E6SJZytupXrkm+VwFzH2JRHtkXel6Z
         7x9Q199HuJcj8rS8AHMxVazwqz8CsKwpSuQmA1xej7PLJyS1RqXculKvvhHBjopcl3B+
         YBoH9rO4C9V2xwxXeiOvSh9iskew78218jvUD1jrWNvtow1NGuEwF26DIWo0Gi3H5A/p
         LAq1KrK/T8OurICLdB3vt3OOFYzXcz+QRCOw5Noe8O6B2PBohuY3vFvsVPsLJd9tSM68
         IkPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=r9FleQwc;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00044.outbound.protection.outlook.com. [40.107.0.44])
        by gmr-mx.google.com with ESMTPS id z13si45135ejb.1.2020.12.14.23.16.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 23:16:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.44 as permitted sender) client-ip=40.107.0.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccG405kmPPoY58kBdKqAcKjK+nHHhjfW4qgcWVjMQfbXDdUc36nkxkaz+eHQSaWQFlA34FL4OW8kyMuFJhVf2gi2AIVgFCx+pwObdYE7UOl6tFVQ9Emfl2bEU6/FPG66HL47KqVkcXpiy7/z3fwpmKEEcb91SCq+KstPbOkC764aC9Hb3Y9NLZEf9zXafPtyuDX59nehWQeo7ytT2A/RdoVN2fwne62BcAyh/HqAoQsx/RqIee3DlMU9i3SBpFwKAh2fe9++kPhZebxXyk3pI4Cw4MrLmaPM1sroo92j+Eq+x3uVJrNz7+0lHEXDusC5wp1i9tU0hgqEcG9PTk/hHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEm6tLaCnqj1qb7oOY7gOFEwlMvgmO6MBrr1fBq4nso=;
 b=OzY5ze9agX03CANWJ16+YvKHFJih6mUcF0PhjpW9AD/emGyQlCJaM7APpRdsHa0DsWl5ES+x5LO7EEp24kOS1Wx0H16f4HEM4q/2oTdeFZ0+ICAIoErlFDuhpAUFQB/bdEqGq9ha7gYNOCQSJHFPBrevNd2WjCh8Js1nHshdY4+TGRJryvjQZfdTbaRGUmBx/w3MIZU5KqTeeEL1cbnqLuoVESA6aWtP5tAqsXUJ2nX8zGHVua4/JTKG9fOEI0lR4b0XbhREhFg4jypvdOoPy8YeLdFdrga7blRl3+FfQywvdewH9wtJ7h4+LCYSvG58fsNaVFyeUI13YK18zjszpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 07:16:21 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 07:16:21 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
Subject: arm64 zero exits
Thread-Topic: arm64 zero exits
Thread-Index: AdbSsg07Ih7IhzzqSB6NTgER6Lavbw==
Date: Tue, 15 Dec 2020 07:16:20 +0000
Message-ID: <DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9617b6a2-3a4b-49d6-948d-08d8a0c952c4
x-ms-traffictypediagnostic: DB7PR04MB4489:
x-microsoft-antispam-prvs: <DB7PR04MB4489D71911A5EBA4E594013788C60@DB7PR04MB4489.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: szB0wm4QvV1QcRJtWAsavNOofBKFWAY5h8mvEd7d0/BnrB6/6d37B7Bt1sZFDMcFtMKuatAzbjvu2dBHwAc36lS3ZIRMsBIKEf6EknSRb5+nBYsB/gaAjfl0k1a0rwg/R5K+8EeQRBkCDV2beiw37VktY87AvFmJWn3rdndb4z7VFVX/+KfjpYFfvjMF3Tsk3QoS6/X42tpzzdA/vent2CsYN1uzCRlbqsqd3eCoNu3cRjKZYlTxnbAUwBtcUsg0YCivFOxoQCpsoSN+P1rO1oXT2WtNmc9id8o4KfuvpU9xKchZqCrkY+P6BOwyUZHi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(33656002)(71200400001)(6916009)(186003)(4326008)(7116003)(7696005)(558084003)(478600001)(316002)(6506007)(76116006)(86362001)(2906002)(8936002)(26005)(55016002)(9686003)(8676002)(44832011)(66556008)(66446008)(66946007)(64756008)(66476007)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iRQFHY1xR9wKFPYYmDifxIdu6SV9U44PmYPjEvCaVgUZrLnJE40YMfrZS7X9?=
 =?us-ascii?Q?g4azfdMUHinCbRjoDnUVI4A4IHEYKYS1e1Qu44LvHqZHdofVHLv+Z3zLrP2n?=
 =?us-ascii?Q?dfQz1H93+D0o1D8yu8hTgT8hh4G/iNnH5GO+1DwtENmpRkK71DdESwixSe4m?=
 =?us-ascii?Q?aRhmqNE0v+eQqY63uY6JrcLrSQCREmGoMVJ78anhUduRKi7bZU5Kpe2RGLR+?=
 =?us-ascii?Q?e5BfXu5IgKA8ey6NJfYNgmawFVoN/AdnT8Em7P5j5i9z5rXNeaY+7iES12EU?=
 =?us-ascii?Q?UdJiZbcsV8d/+VtUfFf7anAU3okyImjMOzJmSLdvi/UCjxGODc3kRX1xB1i7?=
 =?us-ascii?Q?nLt5fGcLwOlhaEysE8rt6sQ37ypr7DXZ+DurQSejhO8i50e96f7PyJiJ8eJF?=
 =?us-ascii?Q?J60j2o7+rsM3O55gRX/QqxYfFfdoUBkHdHQwbYBoz3eSbBaZhSyM7YOTdI5m?=
 =?us-ascii?Q?Hex7n700rqvl71dl3YZhWNOZ6lUmH2+nTOodp+QTw6i8K66X06PEEChTpKtD?=
 =?us-ascii?Q?SDH4/rM7SsBwRRS6rU+51c77kBH7CAyFzSFmdNQMvfum3iurTD2NbqOpp7On?=
 =?us-ascii?Q?Owvr7kbsxb897g7nnlAb85TyTckGHHRg8O6/8sJbRiS2i0w52YX/6Adwctn2?=
 =?us-ascii?Q?15/Zb/n9ixZMWGw7I8K7RhvQCQz2vh/1+ZfAtMIw+N4PCOmGiaZovrnw8V55?=
 =?us-ascii?Q?q0hPITOW/p0iPwUmTSrczi3paQozJQy9mNUuaWUzgSlVxd19eaJc4xUGW+Z8?=
 =?us-ascii?Q?6lbnQsfcudhVtRtoRz1C+b8L/qyQ18y2QBUaThg4yJA2NUz2JMJSSciEm5/H?=
 =?us-ascii?Q?HvMoyDJivJqAfSku3Qsv/U2lNakXvqZQ5ClqIblvVo4+nu02TIpVOXmwzg/T?=
 =?us-ascii?Q?u9aM+Jch8mb8NousjobL9sijyJ8RdpLhteulxUO7ACdyyMJg38uJ0JUDPRtG?=
 =?us-ascii?Q?hrrw8Z/abH5BbiMT0w3zS8xXGlR2sdChj3SjFBN55Mo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9617b6a2-3a4b-49d6-948d-08d8a0c952c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 07:16:20.9321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WujoCf4YdY9MpoO6d26qeRo8ubL1ZxVa5xrenaSohViS5i/d6aOoN9A+Cltn2F07dGKTT0ejngi6hkJ8ec11+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=r9FleQwc;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan,

Will you merge the arm64 zero exits branch to master? And when?

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
