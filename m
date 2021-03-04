Return-Path: <jailhouse-dev+bncBDEN32754MOBBVW3QKBAMGQEMEUWESY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE932D010
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Mar 2021 10:52:22 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id u15sf4236688wmj.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Mar 2021 01:52:22 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1614851542; cv=pass;
        d=google.com; s=arc-20160816;
        b=kdY2tfnRTZlRHR0zmC/4aLt4gxz7JsZUzO7tAAsUfF4yB3zDgbcRmZLgmYLjvaDK1Q
         4QJnhyacHGkkRIDMPCA6JmXs8wa3W477tKecsBjJ3uL55wpxszlCzkWwesZWbbJxXq5e
         jzlxMMmEgeoiP7HLbcRtB9F0uDMoxlE7G0WRreZI1Xt79RTe/l8ZMuh42xMtRN30fEDm
         W0A6lrCdUpB8NPZfUKbJECaeFu9cy/HcZ8Hn0d9RZbQ1KvvISSZbhUhZ22mAmwTgH64W
         51diyJTW8DYx9EMNTtj32CxwfqourEgqWC6FRvGaQmHxPyeZOS3M03CEd7KGKtjtxwmC
         uvBA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=8rd2EGoZgOmHsrr9jMDIzjWnSDzyGtJeAfBRXb8JZgs=;
        b=rUTRhRMLRn5uVdpAC37F+kWUaU2cF95eTUumFO9hQpQkIbeKVqfkbc0oig7KCGXkmp
         YSffYWwz+GZWqqFIGcribMAf1QvZkLYGXq3oxfGJt8n/irO6ExCagHCzu+gA1wCN2ZyB
         /vy39R7FvF9QuKcz0Qutm3iDh7x1Z2/sKIAbz9tPf1OmZHTV65+tOjLPTDGqUWPJDUHS
         XV3bg3/dDzQHLlauOr5DxMtJ1IyIi5sODRf26t25vNXUgvXU01Cc3xBEnVFnFHrpTglL
         t1nRcU/d5QJHO3RQViUImXpwp48I7N+wsYsiL/zUXYHxuJ7iXtHHSasMPfBiSrOF6IsM
         f63A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WGNBh05E;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.22.83 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8rd2EGoZgOmHsrr9jMDIzjWnSDzyGtJeAfBRXb8JZgs=;
        b=TfwRoAMuYQvZQwn1cGPO8Y/sJ/2uQf4nqzqpxhZGo+J1PO19eULXfcvy/bOZabPAIe
         y8xwqMNCpDE7Nl0XeJ+j/erIWd/r/KfYCw5lfiAL7JluOUJe8ubzZdARePSivkqAiCtG
         OmgFofH97yDWXzyYIGdgsShleO3IfMTYMyLRdYllRGr8z+qfGusXwOH3l6TubE1+EQa6
         tAYNVUuZnOHnrbt4vMwa6nIzfsBHSwyEnu3bh3TnViTE3LoP/S9yVUhg5pB69SCvWTSY
         TrjdbpvRx/pFJ/K8AL6fNwyPXTV4P9eP9MAyhm/F/uvW33ov2ILfrNw4WRaB0pMRgkIv
         XV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8rd2EGoZgOmHsrr9jMDIzjWnSDzyGtJeAfBRXb8JZgs=;
        b=Sr91lKB+cgDn9+8sYbq4eCYF7PewEBZNdwGuFkxOYXoSTLrf21u+XR7rUUho2GXIs8
         Fi6w9VPPtntN2vQQje9u6mGe/mzipFUYkxinAA/nx0YnMSik7K7uESOq9+CvJep9bG3y
         MCKDd3YHlDV5+6evDNFXUW4GWBAOAuS3wZ8h8Wz7MMHil/oLyJ9lomXBQM8Orce5k9Fg
         jXcgJ7nlOoYHHmbkZL2hnWSzyPUsFkdiBqmBqIKYDf+qfKbiScpntxRxfjvVpOVOsH51
         MqtJSPD8hU+zXUAUhP/POIpecoyJE8dvjTkUbfIG8nV9LhGJIhOAyLxL4bRMdFWYKxyv
         4Ozg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531NK2tSM8yXu0dJsEUYERpA/+CnpijEjhe21k+5q3//FVQhZ9XE
	I5wanVfn6bQcwCkZtMa4UgQ=
X-Google-Smtp-Source: ABdhPJx8Jvx581Jd5oOpf3HxyNq5EAHtqHshKXoxtUiYGyBFd6kiD1Hy/Y/ywF/v4WMFzysPnnt9ew==
X-Received: by 2002:a1c:c244:: with SMTP id s65mr2648971wmf.2.1614851542633;
        Thu, 04 Mar 2021 01:52:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a89:: with SMTP id s9ls2609497wru.2.gmail; Thu, 04 Mar
 2021 01:52:21 -0800 (PST)
X-Received: by 2002:a5d:4c81:: with SMTP id z1mr2997933wrs.85.1614851541814;
        Thu, 04 Mar 2021 01:52:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614851541; cv=pass;
        d=google.com; s=arc-20160816;
        b=mr5qaLETTEvyuY29v8XxQfH6zZw0gNGZZrEUraJ/yUsudLqE8qqsdqh3kivDRsc3kj
         sxalDs2lzNrLDoKHQG40CTofwtvUibMqeA6iqqkHtpmsBaiIFny5lXRAszkWIxoEv2K8
         0sqkUMuvCxXOyYVGmyu9NnwxYPC2sZXCBch1eZcuFacJFx9BYKMigeXRAcdU4Buq6XE2
         Kh/DqbuXjhNUpUR4jKOV+Y/snmjVupqn4E2o+XmQQt8nVJrO1ctjMQIhq1DlNoAk6fQd
         oNzNKrzmxic4Z2RdSP0ZPk/FXSGdGPxSYcts1bfnG0HmLYGRujlvx7ghrc4bMwun9KoE
         0qnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=4ObfKy3MuxqLMkHiabTdF0L2UxyCyn5OPaWNlqUSNdY=;
        b=W3qpBP6GfKarNpj5fyczfQVHNGeq6X0hWN2FoOOSdFmK/AT/9MRzapbLDxZchpWgWP
         m0+Ky12FToF9wVQwEIJzXUa1LI9m++zaLDOKSAEUlXCOOS4uTqBRfnGN52ST0DjlPOcf
         XgUeNbcb0dMO4iX29UdiZC1TZt118tuMObXHwp1TLoFyTV6BjqfuhxC8TrmK5AQNE2SH
         iOZDolfyhTbBN3x020Q2quAhecelTHPYLTel6XMUv5gDBMmozW/TCgXVQW1XecP6eGsr
         wpFK7qz2JrDgQ0MrHOrxljGKJEgDL7am0i3PedeED597DsrLe13tgm+uAD9xf/hEr5Yc
         yOXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WGNBh05E;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.22.83 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com. [40.107.22.83])
        by gmr-mx.google.com with ESMTPS id m3si648816wme.0.2021.03.04.01.52.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 01:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.22.83 as permitted sender) client-ip=40.107.22.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShAI29Yai7cHGLNbq2hkZo1+usr8qKSqvit3kUGJgHnvoqaIkJAx4UPtu4wBdr+3VFLngl2d7liC6xpbOvCDQjsv8c1VmnLkYXXEeSQUX4gfl22x19LbuFKp4l+6oV7cg9anDNVQ3ZU1469oLiVv3a4Y4uo5kQwi9zGZ5WRTBtjP3aiQfJi4ycmIEMEagrkRk7tp2Iyf5TWhaNVZkxPp6WG1gehQIXwCwfepTBr5kKGe57E505NRaZTEW9J6YbqGq5ZjI6IuL2v9JfiaZ8eduG6e/SS6Np5//cK7m7VmQJZYZOShiHMEVhuWIaf7sONANcI1teVzJzklQn7UQndtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ObfKy3MuxqLMkHiabTdF0L2UxyCyn5OPaWNlqUSNdY=;
 b=bt1sBeq5o4YL9dOsd6J0VloUAy2Tn7cDWtWSjmyJGLXN4LQhwutPk0UYsi4QIDEn0b5ZuIlb3lYLBoiZb7WOh4RjJigCsucQMS79quNvKl9M2771eXMT1mcPWXndWjW6qxNaWBqwVSxMBV2HyzuvrlmR2mt6+mig/dMZFIq4k40+TcuODJjUw9i1lWUuIl3vmOXJG4Qczz9XiDuJhYIOA7Bh1AHo/El2RC0GHnzjPXxfDG3FFE8M3M8IyJFRiH9kpPO/8Ugqez7DI//indW9oJ5EgqOlmMK5rKn1zqQdCYqFlcmo99ZIQ925oY9WYKKt3GgdLBg03mFSu0hs5gElGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
 by AM6PR04MB5240.eurprd04.prod.outlook.com (2603:10a6:20b:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 4 Mar
 2021 09:52:20 +0000
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::394e:4132:3afd:7d94]) by AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::394e:4132:3afd:7d94%3]) with mapi id 15.20.3912.019; Thu, 4 Mar 2021
 09:52:20 +0000
From: Alice Guo <alice.guo@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan
 Kiszka <jan.kiszka@siemens.com>
Subject: Can you put patches about SDEI of the branch wip/arm64-zero-exits in
 the master branch?
Thread-Topic: Can you put patches about SDEI of the branch
 wip/arm64-zero-exits in the master branch?
Thread-Index: AdcQ3A2zNAbQoFNZTd2JW+VLCrWO8w==
Date: Thu, 4 Mar 2021 09:52:20 +0000
Message-ID: <AM6PR04MB60532B8A62EBE93C38ACA24DE2979@AM6PR04MB6053.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6e924a03-9216-4b1d-173c-08d8def33438
x-ms-traffictypediagnostic: AM6PR04MB5240:
x-microsoft-antispam-prvs: <AM6PR04MB524063207749B23C06D5801FE2979@AM6PR04MB5240.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0w3yoFWaIj5MDqnOjgkM+ZYA5oX+e0VDkd2aurlC2jo1v3qD0M5/8MRouqujH3Edg3cXHendohsxzkRtT3VNwZowXKD1LV9Rau1cmc488DdlRMfBgET1j7otgxBNuMVEgj4y+rKgYotkXcjq2GiA5OffBYEIG9/ePvPnRPlha4uN313XNfwvoMxoQKF/c8OSwTLlE9PDeiLX41JapBF6nDW5rlZbb+TCJZCJfPqV8Q4YAGt8iv3pAfrnbg6UsaR/J14Zk+4JQHjc0CIlHIuzZAfd1cjm5bCBMs/b/EojPaVK29fPy9sibI4DnI8hj1zQ+MQuEF+osmaAPEoB7dRtYVXZFk7ayAt7cFe/FsDzmbsa3KgLX/4SXZRo+mZCfrZcaEA/mquwIYlqQ2Is88VSD01tTeJXpHMBC8LIxY3j9QGtYIWRGt/boopyObD2asr/z9SYoqxLijLMgZ3JmrsoLb4iAjlBBlbJ7j+WifOW5KUIUI/2EwpeDjwUV6Rb9EezckdU0k0e0xXH+fzL3Ac/oQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(52536014)(2906002)(186003)(5660300002)(110136005)(33656002)(498600001)(558084003)(26005)(6506007)(71200400001)(8676002)(8936002)(7696005)(44832011)(66446008)(66556008)(64756008)(9686003)(76116006)(66476007)(66946007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?uU7TKjpWaunsWZMOUI24PFRt/xuholN6FkkK8Y1KFSIVZLPgJsWKuqvCeFjq?=
 =?us-ascii?Q?SBs+2jm+khU3iijlekDU3xQ6AzAlYuPvDk91qOPr6sww5N2I0CdF9rXpmNAj?=
 =?us-ascii?Q?gGuJcinvmzE4m90n6/x2wmlAUVv5SwHy5g/CZWQWlYPCgkIjMBhg+NMIN4bD?=
 =?us-ascii?Q?KoIySlUiy0rvAZ3e8neAvSdNk0mY0R27+YDnuMeQbYAs1/wupOvOSDrqvrSS?=
 =?us-ascii?Q?6alQjRmq71+21n86rA1X+Vg8ZznTsmU9miQIuhqLeEcMKtKN38eGTquoVRM2?=
 =?us-ascii?Q?4ndSkpFPw+5ER/hBGSbSyMWE6dvdul9ZL+EyWV8lM4aMYKO6fLLujl0vqtld?=
 =?us-ascii?Q?568sBS/rOfhnJIu3X3vMXupKKezcNL5j5TaNF8oAnTJtlKpsZh0yIxauVmvM?=
 =?us-ascii?Q?DCzBz9b2agjffsR9YQXLULpic3oQaaqLRMwpNZ47hk0lL9PYUdf18iwZygPp?=
 =?us-ascii?Q?TAM+65/feGzsNlc328JdxQJW0cKMgDEBubjogiSP9EiQVQonO9GRH6l34FvG?=
 =?us-ascii?Q?FgXMmNfoxO0J7YQTMgAHHAGiaMbWTS0ZPK0ZjV9Ny4SLGgPH4aLusJlgr+aO?=
 =?us-ascii?Q?MsGi2Ubxc41YO5KqY9p6TTyh2f30Wr6APDMwYkRa7mlsp7mgZxoUUF+Pv7z2?=
 =?us-ascii?Q?OL3lBXzRYAYf74QhruyQgpZ1p1VgR1HTQwtRIEgnt3mKuPq3UX6KEfN6RMni?=
 =?us-ascii?Q?80HYF7r9QWq4lQaCaFsXnhSL8cwjKdWPXUT/43v0jhJeH55rj+6dT5mySbjA?=
 =?us-ascii?Q?OU1+1pcQX/2oo06ldv78AeUlJan3tthIOVw3iMszWItHVG0uV6iyyWT0jD1o?=
 =?us-ascii?Q?s4gdLITy0Ob/CoSRS3IlPPvuf5i2K0xyipJ0uzRRrZxkBJyw3UqsIeiz6IGs?=
 =?us-ascii?Q?YTFzkMTfBUkbCg2P0gnGAiCFb+Qe7N/611C1js1WWtEqCj6RguaFB7af+Gp+?=
 =?us-ascii?Q?MAlyoCVlEx+NqXCKQ5WzamuEVV4JOAgprYEI3Ex2tcBHyvwX/1DMzphza8JC?=
 =?us-ascii?Q?OP4T5gSmAh6huo4JBScMHDrfDudtIkA10Z8uN9PAMaNo3b5wFjpPUQM9XP0B?=
 =?us-ascii?Q?uIDbCk9NCr7f5QFlQq8GGSOGn8b78EpEB/kkIdu0Z8qmWQjqQuqQRJHjA1QZ?=
 =?us-ascii?Q?2NgNKWSSXCM+DOJOOM952yGNlNLw+OAM451G2ofeYJyZbgaeNGFr2RMHNi32?=
 =?us-ascii?Q?76gI2h7Nk5cPDiQkaO4uyEoIPx3TXzuofY76GHK1StDPDINlbAtZs2vqkFFe?=
 =?us-ascii?Q?VUslvwrqpLfkJ9mmciiJwUqPAxEcixNx1IN+QDadqvMBE4t+xVjhATuqzufQ?=
 =?us-ascii?Q?UdA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_AM6PR04MB60532B8A62EBE93C38ACA24DE2979AM6PR04MB6053eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e924a03-9216-4b1d-173c-08d8def33438
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 09:52:20.6755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i45Nmyf345NxJqhkFyMbs/TlyBtPXNnxwl1hPXSa+O91kkp3X8o+U19omR/zp83V6g3UdbU3rmD2LTSBUcLftQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5240
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WGNBh05E;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.22.83 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

--_000_AM6PR04MB60532B8A62EBE93C38ACA24DE2979AM6PR04MB6053eurp_
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

I have tested these first 7 patches of the branch wip/arm64-zero-exits, which are aimed to use Software Delegated Exception Interface(SDEI) to manage interrupts. These patches can work well on our platforms.

Can you put them in the master branch? Thank you.

Best Regards,
Alice Guo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM6PR04MB60532B8A62EBE93C38ACA24DE2979%40AM6PR04MB6053.eurprd04.prod.outlook.com.

--_000_AM6PR04MB60532B8A62EBE93C38ACA24DE2979AM6PR04MB6053eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif">Hi Jan,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif">I have tested these first 7 patches of the branch =
wip/arm64-zero-exits, which are aimed to use Software Delegated Exception I=
nterface(SDEI) to manage interrupts. These patches
 can work well on our platforms.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif">Can you put them in the master branch? Thank you.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif">Best Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif">Alice Guo<o:p></o:p></span></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/AM6PR04MB60532B8A62EBE93C38ACA24DE2979%40AM6PR04MB=
6053.eurprd04.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM6PR04MB60532B8A62EBE93C38ACA2=
4DE2979%40AM6PR04MB6053.eurprd04.prod.outlook.com</a>.<br />

--_000_AM6PR04MB60532B8A62EBE93C38ACA24DE2979AM6PR04MB6053eurp_--
