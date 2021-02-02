Return-Path: <jailhouse-dev+bncBDGILGE54ELBB5UC42AAMGQEESCPIEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2230C643
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:38 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id t4sf4129418lfe.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 08:44:38 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612284278; cv=pass;
        d=google.com; s=arc-20160816;
        b=OX2fcwtGurRtsfWeB4azgqiUps6h47Qz9jJll1R+fykL7gm7iNkc7sBIJqYzqxjxdj
         VzUDNo0LepEwcvySWXl7ocNrStJNaetjxukSm8wqTIkYEB/k+hv0f2LKyhiVPPQTDVdo
         635ML2W8UFn2OgDI01m9QLHegJ6YTnnKff5RGgBP9lDfUcpJ4y6x2Z73TDG7O2hsFFM2
         Wv2fcQJ0JT0goBMP9brUW24g9qJkBQeE6Pw6po16Om0GL/6ucEbhJsQLAD5oYuceSmoY
         nT6FEagpbylI+E36KCx/psEpY28478N/kPh6OS67IoR9afU1giKEv18I8PIss2F/VfrP
         kKqw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from:sender
         :dkim-signature;
        bh=2PqGaBOf0nigVoxEIV965cPH4XD52ZV0xNAKSYloWfM=;
        b=CLEnDLfTQbhhsBaUwA4/XX/dLEirzj+x/eMqeYiN1ECMiEf56ajbUQaIgaLLW1b0N+
         hIVX70LFP2eejrqVdrIERB2V6QWFs8bFEAnkLb17bUux2DztIKDQntrW3HZUq3a0uGg2
         e2OIleGmC8TTdEtHNJdl2upmkSqEvPXEyhtpAkSty6eM8JB3jhE6mXsVgVHIWVUztNCF
         W/Em0r755A8OYMdNZ+kI35JHNOSN6Ig6/wbqv/MYtDY1KYr3x74NPHLLBWb0nVgUUA0L
         xlIgzQTz4AtRZ6VNfCLNwgOBLNB9/h6zCmVT8rilybPpionOiyzyCDUK8ZD+pSuH1pOC
         6vSQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=KqzbyZvs;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2PqGaBOf0nigVoxEIV965cPH4XD52ZV0xNAKSYloWfM=;
        b=JRfy1yJ8r8KpmNd6vL/08v13oeUuWDUHelfbBEq4dbqz9dznDAtsklSajsYQ9qN7KB
         Oma8cn6OEeAji/bURyJ05vFQHoKI6s3wRg5eJuTb13aIsFSOXjIl4qPgiAmFHCsuJ/Zs
         mfOZQ1funjcIBkE35y+hHVdElDw0Ohx6jlH0NlTB6SP2voj2H2OYD+/2Nhll9XtbTTHe
         Hld9DYb6bOfsXeemgqmwJwNyQT2eu3JTsn+DdYnSk1M7zmS9I1Fx2NnEkhCJeIUQ0hUQ
         bN72znknlF/FxLBBPBhIpmo0HZKSV4HuDGK1d5QMI+d83aWMapW/UZhCWF6owFhnUhnC
         MYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2PqGaBOf0nigVoxEIV965cPH4XD52ZV0xNAKSYloWfM=;
        b=F2T/ip5c1+6fDZOtJL5D0wCDoyNmhtiQ1JYUBQStYaxCwlPvz7vvtVy/8CgZDiIidL
         tYGEmSK5hInIK/D94uwR0NjnSOWX3fGIYZzWsTiW51s5DN4cLn/R54Id6SWOs9TbRYRt
         wKthPaAFwf0PDCCdN43niadk3WlRK46MLQfXYs5IXJNM6u/TkSAn9vBqi9ieJ2qkSj/J
         3vyPX1G42NIZRj4H6lX7AyDTPIOU8eKrZPpDKQHOi4qwGJcH43ccRBc6DMBMBxq0AzNT
         wlGsjxpwdpF+z2AEZy42ICjRZzCN62aGQEKJxDRq/PKUfB+qv+jGf/MRVCr8SHQqcF1w
         FKmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5321beF4QGVz/yWq1t+N6m5yxq78Cg1GuumerEw582CUXmyCtmdC
	ZodFK4E5Ly5k65Ooy1C7nkI=
X-Google-Smtp-Source: ABdhPJxVCpHXrfh4BOufxCz+1ryiy/25gqf8F+2DCs9aCIggpTfG8gUp4l6ExGkANuNsDZ7icMUaHg==
X-Received: by 2002:a05:6512:33d0:: with SMTP id d16mr11085862lfg.88.1612284278262;
        Tue, 02 Feb 2021 08:44:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5519:: with SMTP id j25ls3563819lfk.2.gmail; Tue, 02 Feb
 2021 08:44:37 -0800 (PST)
X-Received: by 2002:a05:6512:3048:: with SMTP id b8mr11646693lfb.485.1612284277270;
        Tue, 02 Feb 2021 08:44:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612284277; cv=pass;
        d=google.com; s=arc-20160816;
        b=zIYNbbB07+jhqxIXRnwbmQ1BLEkLzFxclD1mcFUxfa97Y7lUbQX6l/+eWGNl5j5W47
         IyEl+ic9ZRMX0FVz5H2o2SVkWJ4aUqopekPyKtYUpS2W7zxorxsIRzSvVkizDZ4Ch67r
         cbfe+IkS+d8Pad14lCwXWVE5+eEzPz8nOz2lHXc84bwsL6xgIu4MWWVk/RkzowmaJugQ
         kQD23S5RXNXaxoFpHLgGPIzynbXBFb+DWKjc+HCVgTYU3nvPR47YkwUdMQ3cWfcr/WLT
         W+zR4a/0NiyGS6qVow7qNtKb60BshouVslpiMXzc3yu4MHCHYdeABfRDjWsknaV157JJ
         wgIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=IT5TRFR6c2OFXI+zXLXn5wzGmOefLhTF4wQN0Hu2Q+8=;
        b=Myq99n3mg+z3v7dpt4HoyJOMx5h8Ngfr8Ja2bryhTX7kwfFie3PyfEP73PDflR8hvO
         kI6n21KIxgG5qoUzAIacdI5j+d6/TLIrndNa6xvkgv4Rq4KB7smQD+bd8q8Us/ri27jt
         c90bYgbl3IbiUWBb04ZCfvpu1sdm1r1P7fyKvuQVpXRcihcfeS4HpBCPq9RfuN0KEx7J
         LuPumY+rLgXw5z/Pz0+b0cOWsqgOwDXb8i541GeUjunU6qQr76HblB1ZicfNA/feCRxs
         N1pTc3SqEajTjLJWoUc2H065g9hOCMCcbDpdI6Y1+VKD63R/8iMtZ4z2zYHBPbj+z016
         Qfcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=KqzbyZvs;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2136.outbound.protection.outlook.com. [40.107.21.136])
        by gmr-mx.google.com with ESMTPS id s5si24682ljg.7.2021.02.02.08.44.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 08:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.136 as permitted sender) client-ip=40.107.21.136;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUvLhgqaHt2nvdE6Q1t429QydameVX4tkEUtMRTUGtcXSqPwNXfD622ED4/rFnIdm5Oke+szsI7rbbqx0A5E6G+fFP6U8aDMhDYSlvtshnSeHYr4MsjWr+JG0sX882zVCeFv0INIqQI4wCrrS2oxLvYzFr7FifF4rKh6WFn0AqLUlmdxVn6Vwi9CuZbC0pBCZOLwYIlcUPfIDwoCV/EJxfoeGnZ+oZtUmFGLjWkiCwgc60zYSOiBJspLLe44J+M5LX8c/bk4lcrNrALeiVzN3urHRbnWspONDVYqPxgfN8hetdr7RnFNZ3M8KpEeGkUMKx1GoBHlax1RgMz120UvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IT5TRFR6c2OFXI+zXLXn5wzGmOefLhTF4wQN0Hu2Q+8=;
 b=Ek/4W58zABG6UbOidnphll1EpZRNoxIphlraP318tcIM7g6Mjubz1SBQ01vKxx5rUS+FVNgXN0WZyUSNm4WgzlfqNkBLjqTcYOYISF8bcgykXLoqa6vW40wzIR2pnGgA+q5ikkDq6ZphPrkxZKonGyMXq1HB3ay9CpAaIfnAtTNt6w0MvNnyR9MQnsQixJhPwHEIm5MVB075hkUA9hchvsSQWG5xr1pFq5qJfO6aDIRxCN9dz2i5L2vbssurCMgiIXTp1P2AXhaBCIRdJCyE/9Zf6Rj7u2lSovxHdKRXyeNhceDuy1nqhwdsNzqblhGtdYg3nkm885tviRdPmrzZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PA4PR02MB6910.eurprd02.prod.outlook.com (2603:10a6:102:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:44:35 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378%7]) with mapi id 15.20.3805.019; Tue, 2 Feb 2021
 16:44:35 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: [PATCH 0/6] Fix unexpected behavior x86/CAT Module
Thread-Topic: [PATCH 0/6] Fix unexpected behavior x86/CAT Module
Thread-Index: Adb5gNRYivIxkOZOQByCY1H1R4Jytw==
Date: Tue, 2 Feb 2021 16:44:35 +0000
Message-ID: <PA4PR02MB6670EC0868445B5454C42969B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86458a91-370d-4e7a-9638-08d8c799d2d0
x-ms-traffictypediagnostic: PA4PR02MB6910:
x-microsoft-antispam-prvs: <PA4PR02MB6910F11EB68043C09EE8E7ACB6B59@PA4PR02MB6910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5NX+pI3fZHnMz5w4A3B6mNkrYPac38Egch1RgSYBnmEVk75GIP3ot3hxGPGj3OeYyuX4GLYAZas6j5b5Y1USdFeLxZkcNqsEo8O3QJ3f6WDoLc8zbJVNUBdz8rzkCEdS8BhtfvpUWl9/neQ56Wn8KO3dTFrMLAqPZKiaqmFL7wLXO9hj4VphoRZrsxxyxT4JLoT4nFmdqrLq6mWmDJQgK1vSfXsO1lsZIf9ic8BCmJ/JtOqwaneni3SvJ0ukLBiCJf/5ZOBAIUHVBQfycMTD1u6rNi3OSPN583cucaPD61X2K/m6gqmrtd5OuobZZalRO/27gCLGcDXvSRQjaRj+M+pwKOSJloEszDbvscNlLs36vsompmz5ra/htxfiAqEVVZ1z//ctJ+s54ZdDe5x/WG+sliJNL75zoNBWe99UPaVcbzIRqZWnkf5C+wWJTzBFJt2OtqKWtNT85mFVXbTRB4Xj82Kdf8meSOFcCOGfFfVnvGqcOF09+aQLu9yz+2MScLcV2tPhYIvqzfHtXitIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(33656002)(83380400001)(66946007)(8676002)(52536014)(9686003)(2906002)(478600001)(26005)(6506007)(8936002)(76116006)(66556008)(7696005)(186003)(44832011)(86362001)(66476007)(5660300002)(71200400001)(110136005)(316002)(55016002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rAx1PQgFQy3YM499bq767Ro5a0KBJEknqqXJX8co8uclbTEmp9/uomltjtpH?=
 =?us-ascii?Q?Z20IZIZ4bTSrfYNGRx2FN5KSu8UBF3ins/ZZXaqsubzgfR/WcBSs1t1gRkqB?=
 =?us-ascii?Q?ndJr/H69Bkte3fDDzNWITqRqqDbKWKXWxkBD6nJg2HcH2WbJCYd6K3CqljJ6?=
 =?us-ascii?Q?k2w21B5RuDZITJ1HYeEzLNdTeKLMA550kvUnMIkm63ISsuMz1CkUAJ/xQON/?=
 =?us-ascii?Q?UANp5rS998tyMVil7wKMOqet83ymh0kfETm8zdW6o9a96c3gId/CjAmreCqy?=
 =?us-ascii?Q?wUdAwfpfX0iRDz6LgYhkun0Ct/LR+KsdA7X0Rkq8W31Myzna2vxOa2HQIo9a?=
 =?us-ascii?Q?EKhr4uf+N3SnHvkoYqTnEneWPnzkkvNu178RAbCPjQx5/+le5H8HyiJD/9Kl?=
 =?us-ascii?Q?KScAJx8cH6EHDUcJshCMstJlnxwTJ3bMtM52mBTMeEYvetjJ0iyph/RgKOEK?=
 =?us-ascii?Q?ys/iN5niAYW2oLPv+6TkEdgAIqxMBkFZKPXOiqqrQhm43CFwgp7K3aocuBAT?=
 =?us-ascii?Q?6USlj40xZZMwWIX7y3jdrZOzFfxdwGzdLaQyKUMrNH1uh3TTxAK88SjCN4yc?=
 =?us-ascii?Q?JGj71/GhB7sJSGGc415Tp1VZb/baaKFXDhsiLUhVab1TVcqgwrx409cg0LF1?=
 =?us-ascii?Q?hd424DpqOd3a4Mpop998bqDQWEiGEBJFqT0CURUD4QB/F1Gap8iDc2tv6E5W?=
 =?us-ascii?Q?0jWaIG8hezO87VCnm+3o3cCnytzB709H9S/Gzz/6ltff8yjwj6HQlPdnf4fw?=
 =?us-ascii?Q?IBDTvhFvO4s6F8r4UyKn9eNJHwoHldSwJOQ9OVjOaR0waTKTgpLnkCiUUnyl?=
 =?us-ascii?Q?oceOy3MLI4Y9M79YbnMBN+nApqYbAgK9zhH85tNqCwELg1UJZGAiZsE5gdfK?=
 =?us-ascii?Q?R++gOqEP+UAsMO6bRPWPyyKvdyX+TisLttc6mL1/ByuJuP0jfhB0ia7GkObR?=
 =?us-ascii?Q?HuFJE5TsYqbb2hp+r8LA1XcWz5YWSVTK8/L+M2oWjCppz2NK6LR7cNIOSG0N?=
 =?us-ascii?Q?ylsKOfslDxDon/D6K6GEp1qr1r4x8TFpNnY5/HcVXU+mIHAiVOH8v0E772e4?=
 =?us-ascii?Q?z3I8nT0H?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86458a91-370d-4e7a-9638-08d8c799d2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 16:44:35.2668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymsDdURc8m0EaL3gSdF5g6U3wF5CyYVHw90qhQof3Bf5EqLFvTZlrwpHFhWumOQL9Lqdv5DETLhcgTPcLgVCYn+gTfdNrqg0g9XpOboqvEujRJTH7MEm5+YjCgnAAZzIE2NZRaBamhvsJSLbUykdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6910
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=KqzbyZvs;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.21.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Dear Jan, dear Jailhouse community,=20

We are running Jailhouse on an Intel X86 server-grade processor and use the=
 Jailhouse CAT module to isolate cache usage between cells. This patch seri=
es contains several fixes to the CAT module, to ensure the root cell remain=
s isolated from non-root cells.
I have tried to explain the grounds for change in each patch, with counter =
examples where needed.=20

Jan, I hope to extend the CAT module in the future to allow each cell to ch=
ange its CBM during run-time, e.g. to distinguish critical and non-critical=
 sections. Now, the module dynamically allocates each cell a COS, and consi=
ders any write to MSR_IA32_L3_MASK an illegal VM exit.
Disregarding the last patch in this series, each cell had its own unique CO=
S, which might justify a cell changing its own CBM, for example as long as =
it is a subset of the CBM in the config file. However, in the last patch of=
 the series I drop this behavior due to issues on larger CPUs -- the number=
 of CPUs might outrange the number of COSes available.=20

Allowing a cell to cleanly edit its own CBM, without affecting other cells,=
 is difficult if the COSes are dynamically assigned at cell creation. That =
is why I am considering to extend the cache-regions in the config file to a=
llow for a statically allocated COS -- and make this a statically partition=
ed resource just like e.g. memory.
What are your thoughts on this? Any reason why you omitted this in the firs=
t place, and opted for dynamically allocated COSes?

Thanks,=20

Best regards, Bram Hooimeijer

Bram Hooimeijer (6):
  x86/cat.c: Fix type freed_mask
  x86/cat.c: Fix CBM for non-root cell w/ root COS.
  x86/cat.c: Fix returning bits upon cell exit
  x86/cat.c: Fix off-by-one error
  x86/cat.c: Fix overlap on moving the root COS CBM
  x86/cat.c: Add COS re-use in cells with same mask.

 hypervisor/arch/x86/cat.c | 140 ++++++++++++++++++++++++++------------
 1 file changed, 95 insertions(+), 45 deletions(-)

--=20
2.28.0

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR02MB6670EC0868445B5454C42969B6B59%40PA4PR02MB6670.eurprd=
02.prod.outlook.com.
