Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBLHU2HTAKGQE2BWNQJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA919244
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 21:06:20 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id t16sf2662826wrq.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 12:06:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557428780; cv=pass;
        d=google.com; s=arc-20160816;
        b=R9cvM0JvhujdB1yHAsEf7J+2uZObyK4vT0zEMaSMdRGp8PIqdDf50vSUDMzNyPKWb+
         29d68IUdLAAcDMgbJcKa3KOgwbvU8mdgO3YtAI6cHf4x+NrlRHRK1kckwAAtdeIJJbVg
         osDE5YauyjuH1we+FhMFDbAehi9Zmcvb4xIF2Vudne+pTGH40T4LUyWIaMF38Wn8wKbQ
         JlLwpXkzaJG2kqFyU8Ta+pXIfU6AcV7/YVWGSk2KLf+lq5IixrSchDJr7x56Gi4eAepk
         d1NAWGvVHKxQZHvdGzRD1rF8tLLKSH5a05gOFKfaFDbq3fl6iXHp7atjFKJch8u00790
         I19g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=s1IlqCY5UYYIYLCvyw4cqscrJfHuoL6Bx7HxaVR4qoI=;
        b=JpaKOgZ6wwKwQyFZCzrzstRP01+om9RJMKr808RFVzBkW2r4M2tuzPwGqRVe78dpWw
         nQzFpPzcW2axPe6HPQKceG3AsIQVBVxpyoWX5WZDTJiSsJjKNDwhjUzoxSQkMNV57j4T
         aSHZtYwE8pGCDQzcDvxbXOi6qo9vHoyIcnv7FahVHVx+Juk+KBRAcWWQP98FFAA4LFVY
         q0e28R2Q/YCoD07F+D2kStjycPeB3Ni+2M1NxPp8HIG4QyNEkwyryTT0e8HUPuueCJwa
         hMl95rfYXgzym55K22nHGcl5lQuiD2lSSPq+eJuTVnA490Tb+AXHOKPCzv6v3p1CtBwm
         kZuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=Vt7iqqay;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.1.127 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=s1IlqCY5UYYIYLCvyw4cqscrJfHuoL6Bx7HxaVR4qoI=;
        b=iV9qskvmldxljZhmEeMwYx+ydv5VXKPvwfYL7h709crLRJDTyMAv3Yva+x2VnCpLkT
         b5Rrh1mPbQ8twq+7vDl4D6u9E21Rl30Ku0aA3O1M/16eUFhqTajpp7Tl79GM96q9DyHB
         kQuP6NkXHl2e/qckKLYksxbG4XNKvaI3g1oul0bA3MowOAvKTMKCxGtMNi7BXxPnJdPt
         1QrI3CXyfcRH0bZbH4IP2geGxW3ltmRdHGccFlCgxFKhxbbx2NoaTRxLk41+E6QMAw2X
         E94vywryzmH2LW+QbU+eJlvmLlIKvPIcivJLB7XtdiaLZMyvPvV/FIqXPr00rRPcvbyu
         BIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s1IlqCY5UYYIYLCvyw4cqscrJfHuoL6Bx7HxaVR4qoI=;
        b=VfC+UoG0s0irgZ26+Ua1Ncqt4bI5BaT1OWiccivCOuBqhIdgioHZJGT8RRm3S0TDN9
         3AnNkInp/JNeVg36jwAYYlJMV9nTBLpNh6cr01VbadNS5WfKGUupu1ZfMaVE4xjm6DtR
         q1fbPWwU+cLL6eIo6CyMX29uuSEPbnFfUhShAcrMR+3LS1OxuM+BpoWxUkPmfDuF2YBa
         bcmje16mT9+G827+lmaJiRaIrhF6v20gQ3VBqLyb+v2hcdsBKa3oV0ziAbpm1NpCDN/F
         4cmjScq6+44oTwfmKgq2chsX9oWVqYPm24LpkAGNC1/ynvvBb8FnUve59y8MZc1TcqO5
         1BDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWePRcui3nUerXmw09mwwg1XFLM7z732CuY/kmZT8Yd+3LlPxBQ
	OItdort0GkGuhnAaP9U8fXE=
X-Google-Smtp-Source: APXvYqyFRCkBpXyK2MjDWVHNtq9SsZFWJGeyGkzLcBzSWqQijQYNkLSFUQb0le5qZJUBQpdkWZXLkg==
X-Received: by 2002:adf:c98f:: with SMTP id f15mr4521424wrh.279.1557428780592;
        Thu, 09 May 2019 12:06:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b642:: with SMTP id i2ls789702wre.13.gmail; Thu, 09 May
 2019 12:06:20 -0700 (PDT)
X-Received: by 2002:adf:8184:: with SMTP id 4mr4617573wra.27.1557428780102;
        Thu, 09 May 2019 12:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557428780; cv=none;
        d=google.com; s=arc-20160816;
        b=zPnXSU/CeXB9t+LznX2epdDB1j6xw8xHbMCX+Og8CSVQxZZEsL3FPfmud5ZuY94fWg
         8DmbO3jvZjtdzlZrwP9ebWQvVgIvPLF+AZmjb14PbJBK1hXkSMTCtsd1xOnAdp/lYEpq
         Qn8ewG7IXdb2qsQF+2OLRMX2Dz0w4QzYlY3hB03ct7h6yn8X+jHkzlKVDoDYmjgYorRp
         S3N5t+oOiCId/qn1gjDQM9yYgJV2jywjtN0ae1Sil8XCsFYEAQLUV00uvkx3zN4cjBGH
         kcIQ99GVPdJDfPQJ7Q552MZP1PAaerHCVNmU27vNksLnfPikB6zSCMFfZDFuxH236FTP
         UU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=7IZL+WDF6fnSlovmh9yCv7LU48wtVdL104SXns8OF3M=;
        b=0ygvR78vYKuck5qGPBp7crh2NcoeypU6L3jue81jPBcz7cGSo5cQkPDQ8PPf6a+vOM
         I9fPJp7OWCumu5x1CygRwdjLPnNOJJIzyD7ojlPacuu+YH5V3BGMPJuOhuCwAhWjm5Ea
         S2QZ6cWboVguaiFhJDdpvLnPZ3EjXNi84i0MZHbstNpIzkLyJReF5YJCmiUDymXTP5dK
         LUt8L2SdrLsE565ehLdiXenuQ5mN06d3IZ43JovvAg76/Fim9N0TUeb68AoeJDhbpOzG
         mibHhv5Ym8eGoAIbgFrgv1NggLY6Uvm/3GiS4v+luwL7lDnWpQIuRJMcLpe3cM/eTJ5S
         DvwA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=Vt7iqqay;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.1.127 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10127.outbound.protection.outlook.com. [40.107.1.127])
        by gmr-mx.google.com with ESMTPS id x4si783494wmh.2.2019.05.09.12.06.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 09 May 2019 12:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.1.127 as permitted sender) client-ip=40.107.1.127;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2379.eurprd02.prod.outlook.com (10.168.146.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Thu, 9 May 2019 19:06:18 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 19:06:18 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Building on Orange Pi part 2
Thread-Topic: Building on Orange Pi part 2
Thread-Index: AQHVBppHHinIiqNX3E6acQP8uXAbqQ==
Date: Thu, 9 May 2019 19:06:17 +0000
Message-ID: <B9572A15-BD81-4DAE-9052-931E11167750@softube.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [81.230.58.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab27b7e-dda3-418a-9a58-08d6d4b16a96
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2379;
x-ms-traffictypediagnostic: HE1PR0201MB2379:
x-microsoft-antispam-prvs: <HE1PR0201MB2379BE7FE8CC894AB104B031A1330@HE1PR0201MB2379.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39850400004)(366004)(136003)(396003)(189003)(199004)(6506007)(5640700003)(2351001)(99286004)(66066001)(86362001)(33656002)(25786009)(316002)(36756003)(71190400001)(256004)(71200400001)(508600001)(85202003)(6916009)(83716004)(82746002)(6116002)(3846002)(476003)(2906002)(5660300002)(81166006)(81156014)(8676002)(8936002)(305945005)(7736002)(14454004)(68736007)(53936002)(2501003)(6486002)(66946007)(186003)(66446008)(64756008)(66556008)(66476007)(6436002)(73956011)(486006)(76116006)(102836004)(2616005)(6512007)(26005)(85182001);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2379;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qmgz3l81ZUI9xmCnidM8xOBnRCLcQm/JLSELdQLmIWhbs1zGiUA2vB8VPelp3mjxDT3gHIqehvr4L/axkXmweXfk0ywhZdIELqda0+P88xu85ndp/24vzv/VsVTOCzyAi/f54Mohd/a9JolZOIT20SXGhwfJbLzPIoSdq/2X05cjn7MafhUOjgVJIlY/VdJDShUBSuIecnhtv8f4V3E7hpu45B8a9n7CPUoP5VoSRk/mzsiK9ca7FmZbJ7h4aQiU7lw6y+wXPh4uIOw0gNSFZ4MEDQT2Ie97j48izFbDpFgjO6KS+w7DORhM2R+4LOV+5iFVhtaeM1OBt6W82EQ10NtidTGxs8QHQCzUg+mOrWeunZ2cVTXHpHlJb7tAMm1LJ+8VbakUMaOmZK7Z6NhiTS8ktG/IE1+hrO185zNm7Mk=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2A5B05BDA5DF524B9F2F7FCF5FFF9EBB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab27b7e-dda3-418a-9a58-08d6d4b16a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 19:06:17.8705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2379
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=Vt7iqqay;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.1.127 as permitted sender) smtp.mailfrom=arvid@softube.com
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

Hi again,

I finally set up a computer to cross-compile both Jailhouse and a stock ker=
nel for my 256Mb Orange PI board. For reference, the Armbian kernel that co=
mes with the standard Orange Pi images, are all compiled with thumb2 encodi=
ng of the instructions, which isn't compatible with the assembly files in t=
he jailhouse repo.

I have tried both kernel versions 5.1 and 4.19, both with the same results.=
 The kernel compiles fine, and a chose to copy the kernel config from the j=
ailhouse-image repo for the Orange Pi board. This yields a kernel with mini=
mal features but no undefined references when compiling the jailhouse sourc=
es. Jailhouse.ko loads fine too.

However, before calling jailhouse enable, I need to reserve memory for the =
hypervisor. In the jailhouse-images repo, this is done by passing the kerne=
l arguments mem=3D128M and vmalloc=3D512M. If I do the same, my kernel neve=
r makes it past "Loading Kernel image ..."
If I change the arguments to mem=3D192M, it works, but then everything hang=
s if I try to call "jailhouse enable"

Can anyone recommend how to proceed here? Do I need to change anything else=
 regarding the kernel or some u-boot thing for mem=3D128M to work? Or, coul=
d I go with mem=3D192M and modify the cell config somehow?

Best Regards,
Arvid

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/B9572A15-BD81-4DAE-9052-931E11167750%40softube.com.
For more options, visit https://groups.google.com/d/optout.
