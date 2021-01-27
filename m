Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBF63YSAAMGQETRBDEIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D0305679
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 10:08:40 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id d27sf916834ljo.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 01:08:40 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1611738520; cv=pass;
        d=google.com; s=arc-20160816;
        b=Rlyf0XXLVSV98Gt4mLyJNHrslOy/o+ATsKBMmnUzz+SVOVXU6xRejThDc8SOOxxF00
         q+9hKuUqqumthygizEPebS2+kxqAsP/cOCD8IyqzkkluCNThC+3+SucuRMN/QWnylC0T
         OffmAAxQbG1YzJpeiksI/lvNmA7TMqW69d5oKvpqRerWM7+Mar6d9+LXAxlMqzacYyxB
         X1o+Jjhr9CVLOrxDyvxF3qSHwIRfREOHJCYt+379LQEbmHQ/1Sk3eRCXM1TkpAK7tWO6
         4X1zMsnmnZRItLUO6p5tjqJMEhmH+XCv+ERRBmPCwbAjJgqwKsKbHmWDmYi5u5gMOX2t
         z9mA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=7iDRYTIqf66KhsSEr4PVdSMKVsD7iOA5Nvn0mSS4/wQ=;
        b=M3+DS4X+fvKXeJQH8i9DmcsCM1vnrCD90gQomGQ98ao5o5kFw7bW78rXE7kVNMftES
         QLElnVmhwdwWPX3/sJm/et2zl4KCHd0JPlqx4mAqgS9V6ZQeSx/Kvrr20cF5mKJ0O4gs
         ywk5FjsOqfzfCvdUhIetbSyUkjc4eQkHSot2vfkjs1b9GiLM+AI2ZKtxq6gUPz5CXAfx
         cA+YqNJnlaskLqineu5ZWuRLpWA3ul6Wbw4u7D226QHoKdUwmu+1lFm7rZHWV5PxiJOc
         7gQMyUgpqHh1npW6IRawV0+wmZnljTI/PZ2EBRM25TSHod0o6o/JbmFwrR4qBcx1hJ3i
         CLpg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WxOQweP4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.43 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7iDRYTIqf66KhsSEr4PVdSMKVsD7iOA5Nvn0mSS4/wQ=;
        b=GNxnrBHBNX8unmczmoXipoiSxZDwveXrdns9Pw6LamKCnZ64m7E5KgwdVsAZYQHj9n
         2kOfHmbsEg1ImFcH1VRU7jJ9UoBktgYHBf5etfn4b4Cl7Vsq9Vg3ZuhtCePfge4gxU5A
         p6NJ9THfDeZX4x4nUNdGLg5A+GL+ltVTHO6k8Oq2uNPZg9tTgA7RY6d1kNVf71VEO7hg
         II484GU7wcEcqRWxQD5+kf0nEmREtsI8E5T27oQj8L0ERf9LhnrLl0ZE27I9r6YntYJO
         8+dFtX9uEnvoRDTcFFve89Z1rztSI05zDZshAh5MlXVf95iaLTcDBh3vXTe8/fIbGgqt
         fNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7iDRYTIqf66KhsSEr4PVdSMKVsD7iOA5Nvn0mSS4/wQ=;
        b=NXpyg5YcFfWa7pScR3Xksrpxi8IK2yLB1ju5L+b/0kvmX4Qe4RlGo6gPVAqaIxNQ+F
         /aSj1fc3sCEyVSRfAMkQXWZbybY8UDAItIbSTZjiSOFLYYniBF2qHpWiaijxTRhRcgry
         CkANfJFrb3IXKTAIqclTUPKhQnsue0iD8m1J8WStVF7XehhRenh5HseLx9Yq+D19kwAf
         Iyr9oqMlcsPubuLbDhZ+ZGV+RztqVlMt+OHNeTdbuy/JyCzCvScuMx5VjvNPQCMUmJF0
         nqUJWU6oeyFHROyoYFPMk8ZumFW2I6zxhbK6ebD/Jx60/4cVfUKIZcgcQyDo5iM6ggnl
         jARA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5323aq9ZnOjGnA558Xs23fDe0Lwiuy0g86cfLE4WgR5EwZm6I35n
	eXPttPA/euShJPGMGDGJQ6M=
X-Google-Smtp-Source: ABdhPJyaId6qHrlXKRBjXbzVbPTGmujfwFBe1FpRZC0OKSXrj7PRdEoX9nkxtBxrr37rHeEWQiwEpQ==
X-Received: by 2002:a05:6512:79:: with SMTP id i25mr4496210lfo.549.1611738520158;
        Wed, 27 Jan 2021 01:08:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b549:: with SMTP id a9ls227659ljn.1.gmail; Wed, 27 Jan
 2021 01:08:39 -0800 (PST)
X-Received: by 2002:a2e:9c87:: with SMTP id x7mr5118074lji.319.1611738519047;
        Wed, 27 Jan 2021 01:08:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611738519; cv=pass;
        d=google.com; s=arc-20160816;
        b=cYp/HAlDUIAA/P1qdg8v8XN5Z1FbxZqsz9pfhaPNpt714BZbYhKvyc9VNUbZpOGb4b
         J+vxkmV3eQJSx8hQaPidbll0mwSKYIdOch4qeE8N9mF/LyTizr7MS6gnTxqoZ2w+Sib2
         ObCbY8r+eTnqRw4NM8KLn6W7ngLKvDDvrq2j8WIyscyZLk3/PP/jB0RXXiLiaDvBzOUN
         jQanpH3DsqmTPVO0Fiyh0Ko0ePmKjfG7gOcyKwHSs07/6EVgWSVfoWUT/D74PqWTvhfv
         2A+b58T0mC3Gpn7UPCahxZXL9GZLmjjwSF/OHIIOah9ojW4LaEE+VvKmvjf/mrK96gxQ
         uOZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=J6CZeHOcTfvpEVe6yVEwe/+2t701++9VESOhmfXBX+k=;
        b=YBo7OglQOluHmPCjUGJK4SMPBN2KoP62vlPRSNRarrcIn4vQbqyVQcf2F/UeGkgQSf
         aj/RxCHopWUmXPlkktDmvvZOC4Y2NKh8P/2ujI2Jbi4ACnRFR2JxFTqAD6DZKYnRZtAj
         o4caXukMK4UeLTdvb2vIW9YNI6Qt3mFIPBYIRy7xewQYIpcOB3yv3A9kPzEaxBQTwj11
         wi06JOUbKN5b0jgpYDQXBCogQBGY7dY5fUjMaGNmJM7NGTAKgjrZdz2a1D7kJOl8kijp
         r1+Vr2xcwa7bDjnlI9dZHsVgL3kGEAGXCAM936xDoo46CK1ZdnMajJ1SoBu6avWEASYB
         8XCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WxOQweP4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.43 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70043.outbound.protection.outlook.com. [40.107.7.43])
        by gmr-mx.google.com with ESMTPS id v15si67765lft.9.2021.01.27.01.08.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 01:08:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.43 as permitted sender) client-ip=40.107.7.43;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8Q+k3dQn2DUBnwIrTmEtoHEj4Lv7TxIdI+SZZEARfsv4b8DuD6t4es/iUS6VF7aW1GtU7jeFVgAFDnfztNzEfWBu9ON1Sl9ppXx5G2pHpFCqrUcE4v/apjhPWcMDRYWWGXNobB7d62A45cCYLSSjHb0TiJhkBhIDUydmqhiO+/rNk/jIQ8oDia7jvirk7l668nESQFI0xcpCKguxRz5W4xEOv3th1LOe/em65rFoo+1s/72bpwkqzOZRxx52deAYhZEdTJSEulXvZ0IyrCB3CcKm/uxFjrIrB/k/nITgRpX92dbASTOOcaJeM2o7lF4JXGRrW2r6kJkrl605Qr2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6CZeHOcTfvpEVe6yVEwe/+2t701++9VESOhmfXBX+k=;
 b=PizodKt56h3O/BYWxSOSMRezD9iOcia0Q69N67+Tj6xPQ6PXOiQmWI3c6Ylw+oPZpWmdQphuFqqjO2tnndmMs5LKgjlfk0cYDOxlAb4CCMWiXq7TgizIZMC2Jf/+V6JhsvWAsEDCvn5Eq30c3cRA4RQzkrlWfGZXZUMr29iIgjCAlnmo1AOfbIvd+DLWaAT1zP9Le88vrg1lIHtisIlFSy5qiA10jcNqe5InJ/ed2ofHdEhs12XqlCRNOzjwKddgLqJzWGQ/7wfjkdVLyXySwCSzaA8VJwE9bqCX8Y6m3HACjrxvauh33RkFnQbh4xsUXm3abi9ynQvyRnJFbwHeUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3660.eurprd04.prod.outlook.com (2603:10a6:8:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 27 Jan
 2021 09:08:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 09:08:28 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan
 Kiszka <jan.kiszka@siemens.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: ivshmem-net issue
Thread-Topic: ivshmem-net issue
Thread-Index: Adb0i/jBtp5nKiTfRr2PQZyagum/Cg==
Date: Wed, 27 Jan 2021 09:08:28 +0000
Message-ID: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 77f59f8e-b96b-46af-ef12-08d8c2a31c6d
x-ms-traffictypediagnostic: DB3PR0402MB3660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB366057993A533FFCE4D61F4088BB0@DB3PR0402MB3660.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7hQUsiTaY9UyyQ4vRnzXj1L9iJreSrQ4KqrCDP+NcPIlxEkgxqmuTca02cMV27ZIQf+lpoX8gzB6c49AcI5c1SqGykqLYQZD0s58OYzR1mDcBDlpvg+eAY3bKRerhMb0tsFgZSCaBEs6zvD0NTdBpiXFCH7A4IrAGGDu2z4YPCKdsRR0gq50EwpDhf1Rt3uEOX2lGPuH0OhEFTcfIy9P0Q3lyWh/CCASy8JFooF6Shb952kgxdSDBzj4R1VIgiun4WAkkwyb2JqB8BI4ieMBWRx/gALpHeee4iSGlUDWmujppJyvLmrxWiY5FjxvlLORbuX+wvKrZAwGQKJEA+65LQ+z10Apn2deuCQTqpD9gdPfG9yniFUwkqqRDIBjCe3ouae1DmOui3zX3zDfPnFRBxLVYAMCbBBaHhhylIDGfik8yXpswNbqpxFTaBxzTMq2xGEKGDKXB4oOSCwSQbNHYvBXpfvquVdo6le0JwkCv+ZaKfr+WyQjkC9fZ5S5fpz2uV9IIFLTYMnXGbDUk4Hm2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(64756008)(26005)(6506007)(316002)(66446008)(66476007)(66556008)(3480700007)(66946007)(5660300002)(44832011)(52536014)(7696005)(76116006)(83380400001)(186003)(110136005)(9686003)(55016002)(71200400001)(8936002)(478600001)(86362001)(2906002)(33656002)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?RBS08znwKdUPRxdx9xcJ5Bp9gjY8qKk9M27SeqlrFLWoXMhcivXRXVHkPFvl?=
 =?us-ascii?Q?eU9ak/gD6RPTiEeUJRNNF3cdA3/5WEz97jsxxQlGbWZJbrmPQOHcBpFD14gc?=
 =?us-ascii?Q?gXwyqMpbDZihLYbTlSmRlh7v1JcenwWOsZLYd3DItRmqZ54huHKp2rfzKNhF?=
 =?us-ascii?Q?1+c+BwD6wexs8c0/DeNP1zaK/hhhcAi08hnbJFilJVvcQ8hF1VlJ31ZkK/RS?=
 =?us-ascii?Q?hI4LrGxnnC68kT6ldF+ou2sMyaATv2V8o1nm8bjoYaXC+r+MzHBrfdXUaLOr?=
 =?us-ascii?Q?3LCeE7yLZwNI64nWeZ200hnUNmATSxoTqmuBLy30AK9aqEIl1Yl/4gcZsl1j?=
 =?us-ascii?Q?Bnz0B5BTMIlqrEtbGvjvp4UooQBWNICHYNWgK2iAdny060wV/86ho/x1Nz0o?=
 =?us-ascii?Q?hQCwvCTxoRTsSSPVaQAV/2r7cDvpn+TwaBp0jkpDVg29yp1JEC4gBjaTn8bj?=
 =?us-ascii?Q?g6EDv/HiAuePMQg91lp3fUzdVaMRbjKPC5tmF++hJtxa1x6vBfElD03BCxQG?=
 =?us-ascii?Q?TnD0aBqeyDEmjiR3XkdlUHGkacU9ufFltf1K5iAlCJp5B9lNb9LzHh/DJzNt?=
 =?us-ascii?Q?diXWsoPedScLxXeAy/LjeBs7QLCTGMjmMubXaW8fZ0a7bRFkzcP+rmO0c3th?=
 =?us-ascii?Q?lOCuO5EccfeyNmRFmVF8icGCBHhL9eJMfCTkWIup4z9nB7IQUoIkfb1wHTKR?=
 =?us-ascii?Q?oZ0/zt01lL0tvcRst7NsQBpGUoJjOcwq3yUtIp5El/+ZnZ5trlC3PXBc+mxh?=
 =?us-ascii?Q?TgE+q5HWUHboZFDcDVRrKc6pF9N6Y+4jMgR9/lQYifNUz6kdUvuyLiitCM2I?=
 =?us-ascii?Q?mKZ4pq/dFI33wMNktOYE/q66yjndhuXITJTfyssDkh3e8bAC139dhpb2WJQP?=
 =?us-ascii?Q?Eu8TjK8Rskp8oFGdra9h49X1iJ/j5o6U/D312pAVaAItYVrbh8lJn3ECY33o?=
 =?us-ascii?Q?2lB4wfMHkWIKrdg55jEsDlaY6izD66pvGlNT1CCEz6iIO7NNzkSvpWI3kUNa?=
 =?us-ascii?Q?xNR6KjQ2ZAzmBh7SWqGuDUe6OciWDyDkrBeWscFBiKoAuct/6K/7jOBewyNh?=
 =?us-ascii?Q?+QqdLttc?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f59f8e-b96b-46af-ef12-08d8c2a31c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 09:08:28.3800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3AjdKKAg+KungXTivFx95VfBoWTTd/knJ8EhH4kV1GPpPoiyOSwwNA2DrKP/0VZuTXzDZ+mG7m6xvHaxZPC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3660
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WxOQweP4;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.43 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

When booting inmate Linux, I have ivshmem-net configured. In root cell it shows as eth2.

I monitor system network, and see eth2 is assigned a random address.

[ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255 scope global eth2
       valid_lft forever preferred_lft forever
[ROUTE]local 169.254.232.89 dev eth2 table local proto kernel scope host src 169.254.232.89
[ROUTE]broadcast 169.254.255.255 dev eth2 table local proto kernel scope link src 169.254.232.89
[ROUTE]169.254.0.0/16 dev eth2 proto kernel scope link src 169.254.232.89
[ROUTE]broadcast 169.254.0.0 dev eth2 table local proto kernel scope link src 169.254.232.89
[ROUTE]default dev eth2 scope link


And also in route table, it added two entries going through eth2, I not understand why
it will add one entry that default use eth2 with gateway 0.0.0.0
#route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         0.0.0.0         0.0.0.0         U     0      0        0 eth2
default         _gateway        0.0.0.0         UG    0      0        0 eth1
10.193.102.0    0.0.0.0         255.255.255.0   U     0      0        0 eth1
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth2

It added the eth2 route table and will break nfsroot if we using 10.193.108.x for nfsroot server,
because it will match the 1st entry.

This is not jailhouse hypervisor issue, I just not sure the eth2 behavior, it is systemd does that
route change or we need look into ivshmem-net to avoid update route table when creating
eth2?

Thanks,
Peng.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
