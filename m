Return-Path: <jailhouse-dev+bncBAABBB7IS3YQKGQERGLMDWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F6142CCE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 15:07:04 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id o6sf14124921wrp.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 06:07:04 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1579529224; cv=pass;
        d=google.com; s=arc-20160816;
        b=JkQ9qIXdtasjFO9vlnCOcoeYGaamQzO74c1fvdLQ6M3PYzt5AArGBGiOO33ctkoUP7
         qtFONpdYFvFZWj5LlesBm6aRimsAjjwPMxLebET11qwYIDgmGFEeC7cFWe/qsZufBdLH
         M4s8/wJWh9+nesMUbavik81E+/9Ug8s/xhjInDEu8yZSl8y1TEl6Pz6vYo1D/fE4wHYW
         iNNiAo0Ua6IhGDP+dA6FVrnMRKdGXjvLJafWXWXhf0/V12tWX2SKPzzDIU9nWPh3RVjx
         X4aBd+a8NXuxtiSvvCS5w4qSKO7qhFC/nbHN6NJxAehnGGouunCKDatTqsexffJQysJl
         vxEg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=uSiv0VoZVqvlqn9gnevvT16xiZKxqpolACoSy3dtX44=;
        b=m6mOCW22r8hAxjp7SllKacV4zERwTOnyRqGBajr9hDK+9CVdfZ2XUDw2y+E1qvcenw
         E76OwSmGWfhoujrIGG3uJ52se1WBubFKtyDJ/UVweU4zFmWJrxLXsXKqqVOBDx0TM8ai
         sopCrAvOqy39RGDNeTjp8nf7MpIlo/jq0IWUODRE80Pad3jIjR7aocIX98dKecgFFsI5
         RSX1POIBJ8m0syHxXXlx1zMmqpFjHuV71BA+2kNyfyfO8V8Jq7QIIkvoZjZxKWhobxX8
         QIXg8WcDxFmE2i4cSEwdf5UH5gueAXOggo8Dv5fx+Fe1ZZu+GHFGdWrhZoA967HR4N6b
         PKOQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kcA41WKY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of radu-andrei.bulie@nxp.com designates 40.107.21.69 as permitted sender) smtp.mailfrom=radu-andrei.bulie@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uSiv0VoZVqvlqn9gnevvT16xiZKxqpolACoSy3dtX44=;
        b=m6WQAZbJ+42Sp5883ZOYwRFwd66NIwAr8g0pS8nfmxEQ46YRyZYA9FxfOu2QADjmQ+
         Ny7Nzzbs3+mpGZeZ4CLvwvmeOr0mz3NMDOosMfogaqW01qKnlwIXlN7nGIXsgkQDepfu
         G1hQOgrMCa2ZT+wyfXsBaHXUcTYr8yki2+kadkBjVF1ULfWBGd+iO9j84N2LGfei9ze+
         oNJkXuZNvDRJrP9caq8Jw6VnJc15lVh5Nu40gtH2+cgSc3ZCOQCiLhZyoPAtnd2hSJwU
         uWO5cCzOyWJsYc9HhZqOkwa0AM+VzV6SOjR5CsKGBrd4a/3+08sZhrgfi6/GNHAMpmQm
         iLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uSiv0VoZVqvlqn9gnevvT16xiZKxqpolACoSy3dtX44=;
        b=po5NdqHXUAV0gdrgzHzEVFCDHEMgoycStFlLxIfhGOOmf7lVlcmAj9M2O6M3Rj/W6K
         /wAOsgvPNANhqROh+UYx1bjKSKSTa8JkOkZ0gCeNnM0wB2kLfEOWJxy0HDKoc0Zn/WvF
         whkYbbHS/PQADr+vniZkO9RBcUGvPHTTeGUqC7nOsUc0U2Sb+1HSbRngZE5fseghLUKX
         ap4OkFxDcGAl2lV/hWrNG8qmUdKyRpGBFo+pCzFyP3yylpkVW3t10LSVem6DuCfOIxEL
         0OVd+9t1HKsN2j/VEi1p4ekMvufUtK2rXT9lZ2IRuJSy5VnQPnBmBkmgQz99MGJS1zYD
         6n9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW5btHTe0WktXLKf/WpOZgygUc0NVffFEu2oEGpGVuZDUE6sS5n
	UbcySRR0ORUbkMyQKLy2Duk=
X-Google-Smtp-Source: APXvYqxlVOM7kYs44yWlBAvqCTAuKBpcn5MzTV/xHWSTj1CHvqx1dqDgIMd7fSsPJhcZ03TIsUatPw==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr18608192wma.159.1579529223707;
        Mon, 20 Jan 2020 06:07:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea84:: with SMTP id s4ls2610675wrm.11.gmail; Mon, 20 Jan
 2020 06:07:03 -0800 (PST)
X-Received: by 2002:a5d:5491:: with SMTP id h17mr18567209wrv.374.1579529222894;
        Mon, 20 Jan 2020 06:07:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579529222; cv=pass;
        d=google.com; s=arc-20160816;
        b=0hWYjav1yIBYU3hQ3asbl8vMI9G+VOEtpvA1a7mD/UeWRnP19WwbqaZZtU9khz86Dd
         jDNK4RBguvfiz1Oavz0IU4e5i2Er0p24oJRjQClyjjfiGNrC1jaTkscllOIUr6QL3RB2
         hD17BeKbTCA2OaPMvm9PykeoNFzUNimDLNgGOrXd0gchFBvbuUOKQ46YYcnfg1qnuQfM
         VCS9NtbbG2ktxy/nObvUbEhnt0H4M44gWd+y34n4UBh7Dt7bCbioTyG5LemVQ1t2vnVx
         GQZbC6u0MfeRvtCl4r/3j72gSsjvr4owXk4zIbWKrcZsWBE+k6/U7Gv8sYG9KXEv/HOv
         pTqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=j4DtRmdlmoVy756i2KBH/XR1A4urq/NGgfbPbu/EGi0=;
        b=YhZJCt8+uIRqeJguIFW1s0onpPxSM7vMUykGRd4hZJk7KAMD+3ulsJviKwI8pogmbL
         rZ1OgdChkQIvnwP0K044bJ440TcHo8nUAy0CSzFVRz0AHF55WBUqFHm11Nz2xZeXugOb
         xOV5hxDfJG9+1AyYknY9TKXYgNWkRrFDzdJDzo2nxm2+v9+LkP7t5MQNo0sVQkii7iUk
         lHYaGxWDsbcQltpWjjM+Yumq4voLJqxXrSutNL3vo3QH1bqAL5kHChlgk4pkDNiQ8iFj
         qRJD+y1QbQtW9N60b8bog7COYFuCC/Pmms6VNONgl+OtHzwSyBeXQPrKZKMVwCYx/zfg
         kkFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kcA41WKY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of radu-andrei.bulie@nxp.com designates 40.107.21.69 as permitted sender) smtp.mailfrom=radu-andrei.bulie@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com. [40.107.21.69])
        by gmr-mx.google.com with ESMTPS id s139si901750wme.2.2020.01.20.06.07.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 06:07:02 -0800 (PST)
Received-SPF: pass (google.com: domain of radu-andrei.bulie@nxp.com designates 40.107.21.69 as permitted sender) client-ip=40.107.21.69;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfWL6+moBqqW0Wr7nmqEN4Zs1bbOj+4o8ABgPR27wTx6/MefwYErcwBnUGdkECzvgosQ5XmawCy391ljonZgswON0+hUW28TPFO+KSBJI9Xz9a+d8o+sUI7ao2VfGAC0ulRe71+jdK52fqqrf+l135bmrohnbM12i9V7zT1Zjbxpd/ccJ7b3M77x0l1zcuGqQYRgb0gyCwgH3qlZAylM6vrkXxxWTtwJQaZlsJoe6tIJiVUaWjSNofqQ/bxHYi+s8z9kgfoF6MGpIrduEuzvBA+VbAwBbDg1AgxLAmdIw5gjjKfClPc1r3mI+Rj/N1Mg10owbwfdIXKxhb1yiWrCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4DtRmdlmoVy756i2KBH/XR1A4urq/NGgfbPbu/EGi0=;
 b=ehxYqv9CPZ9xfQ5N5OpXuUwDcdMqO+N1XyZS1VCrbKbIMHGdzCS1oi2ewkRomwIzzQMjHIm7+x++8WuVFXCGFC1iS4w2BtNi7keeixOQkpSiuvF4V3Glw888bzsobrssUX+7LR4U1C0qt3vc6Alfb1PJBYCuXUN/YP5kjU/dTNv+XLwcfows4e9YCSFeNIluMMBZMtPEDfpt043sxWuaQn298EGJ2+q8HvdQMtrlnTvAebwOVa4Ngwx/X93Zdzz5SfxHYL53N5yqUsZpWL/nxZICEtcpEhT3RhwScbvB4d6v1bDB1UVfoTOv49m4p9XcaZyoo8nUc1HxMFHoTTaIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4080.eurprd04.prod.outlook.com (52.133.14.149) by
 VI1PR04MB4495.eurprd04.prod.outlook.com (20.177.53.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 14:07:00 +0000
Received: from VI1PR04MB4080.eurprd04.prod.outlook.com
 ([fe80::90cb:60c7:8620:a9e3]) by VI1PR04MB4080.eurprd04.prod.outlook.com
 ([fe80::90cb:60c7:8620:a9e3%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 14:07:00 +0000
From: Radu-andrei Bulie <radu-andrei.bulie@nxp.com>
To: Henning Schild <henning.schild@siemens.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [EXT] Re: DPAA macless sharing
Thread-Topic: [EXT] Re: DPAA macless sharing
Thread-Index: AdU3uLpale3BDxFnTXinT5lj8XmhCwARV2UAAACJmRABieygsApCokqAACrJjIAAA+FRcABYXPWQAMYwtgAADfe+MAApZTOAAWqgTAAANfApgAA7PVqgAA/iUbAAAp3HgAAAW06QAAdd8ugAohq7QAK/kYKAAADAYAAFdmYMQAAMwCsAAAChi/QAILmRgAP0OEAQAJE7aAAAACxnAAAASXeACRHCgPA=
Date: Mon, 20 Jan 2020 14:07:00 +0000
Message-ID: <VI1PR04MB40801A942720BCBFDC77F587B0320@VI1PR04MB4080.eurprd04.prod.outlook.com>
References: <VI1PR0402MB28327FDB304C362E14CA96D7B0F30@VI1PR0402MB2832.eurprd04.prod.outlook.com>
	<AM5PR0402MB2817BD96669C6E885AAE4D24B0810@AM5PR0402MB2817.eurprd04.prod.outlook.com>
	<AM5PR0402MB2817D020C6BB1DA1757CAC13B0810@AM5PR0402MB2817.eurprd04.prod.outlook.com>
	<eb231a4b-1275-43c3-a7d9-de174eb6358f@siemens.com>
	<VI1PR0402MB2832A6EC8E238722AE54345EB0820@VI1PR0402MB2832.eurprd04.prod.outlook.com>
	<20191014172531.43968f0a@md1za8fc.ad001.siemens.net>
	<20191014174702.7ba52000@md1za8fc.ad001.siemens.net>
	<VI1PR0402MB2832EC3CAE371ABC6D343058B0740@VI1PR0402MB2832.eurprd04.prod.outlook.com>
	<20191111181238.0f389452@md1za8fc.ad001.siemens.net>
	<VI1PR0402MB2832AB71145873F13A3D541FB0740@VI1PR0402MB2832.eurprd04.prod.outlook.com>
	<20191112100743.6aa23242@md1za8fc.ad001.siemens.net>
	<VI1PR0402MB283259DE2B0ED1CAFCB735C0B0430@VI1PR0402MB2832.eurprd04.prod.outlook.com>
	<20191205102910.2a9f924f@md1za8fc.ad001.siemens.net>
	<c5079b24-6d19-a1e6-5411-1844dded348c@siemens.com>
 <20191205104221.4d0d74ed@md1za8fc.ad001.siemens.net>
In-Reply-To: <20191205104221.4d0d74ed@md1za8fc.ad001.siemens.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bf0a568e-34a0-469f-019b-08d79db2048d
x-ms-traffictypediagnostic: VI1PR04MB4495:
x-microsoft-antispam-prvs: <VI1PR04MB4495DBCA7E730848941F2725B0320@VI1PR04MB4495.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(189003)(199004)(45080400002)(64756008)(66446008)(81156014)(4326008)(81166006)(966005)(30864003)(316002)(110136005)(66556008)(66476007)(26005)(478600001)(186003)(76116006)(6506007)(52536014)(66946007)(8936002)(2906002)(53546011)(33656002)(55016002)(9686003)(5660300002)(71200400001)(86362001)(8676002)(7696005)(569006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4495;H:VI1PR04MB4080.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hay8LpFzlwSecpjB0pHYKA3ZDlPUZW+rNNTKAVuehtgIfIzL55eqz8h9RFILZ9OfXoRQzINEk5pOmbrdo/KyWQR6JPA888LQVK1zmAn0R1VGI8xufaBBAnAPrTDDx1oy/pnCA3mrOfRYw9rsJ6V3v1e0KgkVnoAXXpciDVizr/lZWqkRPoxU+so1TflaJCBgNn3gUAhsy9ysq0EEWju+yP0lLuiyzpv5Q3Q6GpTaBCGpE1G5AUrVtzxSMJmXyUfcYG0NhYYzZbx2wweam8gYqm9ZzpmBFBax8sBcpx1aq/WWwN0PjBCsULgsEwWkjEx55T6OjLqGSAm0HS12pYNBQwfyH0B9GD+PX8lVaELMTnlrV0k75AqDA8RTo5lfioeCsEOx9TyEAwqUHJRidTS5n8xGyjPEDo66U7FmUz+OMXtvTSOi5pG4kF4CQ8a2W2Z8x1C5diRjrmileHttmfyPQgShEetngIw1bnY91kQoIHCwF+OyUr4lJxoYWNoBmHixNbJ+0wI6v1bvk7p3KVYHbM0M/ccDrSaXZsP4Hh8qFa8c/pWuyYlkib39NYfC2jFS
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0a568e-34a0-469f-019b-08d79db2048d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 14:07:00.0524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEPHrRpyxxCs7e7joJ4b/60XxBb4csOLePHhl+3NNb6VB9hhn/xjj6YiGkYdJLoUMJ74gvAxPUfznbPUgpkfp6zFkUl+I8SxWya2nrQTnOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4495
X-Original-Sender: radu-andrei.bulie@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=kcA41WKY;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 radu-andrei.bulie@nxp.com designates 40.107.21.69 as permitted sender)
 smtp.mailfrom=radu-andrei.bulie@nxp.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=nxp.com
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

Hi,

The crash I've asked for,  was generated when the following instruction was=
 executed:
"SMC 0x0".=20
As I know, this instruction generates an exception and after the exception =
is processed in secure monitor, control
will be returned to the instruction following smc.

The crash was triggered because in my defconfig I have made a change - prio=
r to test the jailhouse- and that change disabled OPTEE.
Enabling back OPTEE,  the crash was gone.

Now I see a different issue :
When I enable jailhouse with :

jailhouse enable /usr/share/jailhouse/cells/fsl-ls1043a-rdb.cell

,during the hypervisor startup I see the following error:

this/out/build/tmp/work/ls1043ardb_jh-poky-linux/jailhouse/0.11-r0/git/hype=
rvisor/arch/arm64/../arm-common/gic-v2.c:57: returning error -ENODEV
FAILED

I see that there is patch applied on the dtsi file that does the following:


---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1043a.dtsi
index 26f56b85ac5b..3fc1ca8ef8ae 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -175,10 +175,10 @@
                compatible =3D "arm,gic-400";
                #interrupt-cells =3D <3>;
                interrupt-controller;
-               reg =3D <0x0 0x1401000 0 0x1000>, /* GICD */
-                     <0x0 0x1402000 0 0x2000>, /* GICC */
-                     <0x0 0x1404000 0 0x2000>, /* GICH */
-                     <0x0 0x1406000 0 0x2000>; /* GICV */
+               reg =3D <0x0 0x1410000 0 0x10000>, /* GICD */
+                     <0x0 0x1420000 0 0x20000>, /* GICC */
+                     <0x0 0x1440000 0 0x20000>, /* GICH */
+                     <0x0 0x1460000 0 0x20000>; /* GICV */
                interrupts =3D <1 9 0xf08>;
        };

--
2.21.0



However I've noticed that after the board boots - the values from the dts a=
re back to the old ones (there is some code in u-boot that patches the gic =
node and puts the defaults defined by u-boot firmware). I tried to change t=
hat code such that u-boot patches with these new values but I got into a ha=
ng.

My question is : is the jailhouse error somehow related with what I have me=
ntioned above or its something else?



Radu


-----Original Message-----
From: Henning Schild <henning.schild@siemens.com>=20
Sent: Thursday, December 5, 2019 11:42 AM
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Radu-andrei Bulie <radu-andrei.bulie@nxp.com>
Subject: Re: [EXT] Re: DPAA macless sharing

Caution: EXT Email

On Thu, 5 Dec 2019 10:34:08 +0100
Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 05.12.19 10:29, Henning Schild wrote:
> > Hi Radu,
> >
> > glad you could build it and sorry it does not work as expected. My
> > guess is that something needs to be different from your board to
> > mine. Something not part of the image. Maybe firmware/bootloader
> > parts i.e. if you did nfs boot.
> >
> > The error seems to be related to some low-level virtualization
> > stuff i am not an expert on. I did take Jan on Cc, he might be able
> > to tell you what this error is about. You could also take that
> > error message and ask your question on the jailhouse mailing list.
> >
> > Henning
> >
> > On Mon, 2 Dec 2019 12:22:59 +0000
> > Radu-andrei Bulie <radu-andrei.bulie@nxp.com> wrote:
> >
> >> Hi Henning,
> >>
> >> There is a crash while I try to execute:
> >>
> >> jailhouse enable /usr/share/jailhouse/cells/fsl-ls1043a-rdb.cell
> >>
> >> Initializing Jailhouse hypervisor v0.11 (0-g58052a7-dirty) on CPU 1
> >> Code location: 0x0000ffffc0200800
> >> Page pool usage after early setup: mem 39/996, remap 0/131072
> >> Initializing processors:
> >>  CPU 1...
> >> FATAL: Unhandled HYP exception: synchronous abort from EL2
> >>  pc: 0000ffffc02038d4   lr: 0000ffffc02038c0 spsr: 800003c9
> >> EL2
>
> This is a crash in Jailhouse at that PC address. You likely want to
> match that with the debug infos of the hypervisor build. Once you have
> the code line, we may have an idea what part is stumbling. Possibly,
> something in system configuration is not fitting yet.

The configuration is know to work on the eval boards Siemens received.
Maybe the board Radu is using is not an exact match, somehow causing
this issue.

Henning

> Jan
>
> >>  sp: 0000ffffc0220e40  esr: 00 1 0000000
> >>  x0: 0000000084000000   x1: 0000000000000004   x2: 0000000080003518
> >>  x3: 0000000000000040   x4: 0000000000000001   x5: 0000000000000001
> >>  x6: 000003ffffffffff   x7: 0000000000000029   x8: 0000ffffc0218020
> >>  x9: 000000000000002a  x10: 0000000000000000  x11: 0000000000000000
> >> x12: 0000000000000023  x13: 00000000ffffffd8  x14: 0000000000000001
> >> x15: 0000ffffc0218000  x16: 0000000000000001  x17: ffff000000fa62dc
> >> x18: 0000000000000001  x19: 0000ffffc0220000  x20: 0000ffffc0218000
> >> x21: 0000ffffc0220000  x22: 0000000000000001  x23: 0000000000000001
> >> x24: 0000ffffc0200000  x25: 0000ffffc0221000  x26: 0000ffffc0214000
> >> x27: 00000000e0400000  x28: ffff800058d1a1c0  x29: 0000ffffc0220e40
> >>
> >> Hypervisor stack before exception Stopping CPU 1 (Cell:
> >> "fsl-ls1043a-rdb")
> >>
> >> After looking into the jailhouse driver I have noticed that the
> >> crash occurs here:
> >>
> >> static void enter_hypervisor(void *info)
> >> {
> >>    struct jailhouse_header *header =3D info;
> >>    unsigned int cpu =3D smp_processor_id();
> >>    int (*entry)(unsigned int);
> >>    int err;
> >>
> >>    entry =3D header->entry + (unsigned long) hypervisor_mem;
> >>
> >>    if (cpu < header->max_cpus)
> >>            /* either returns 0 or the same error code across
> >> all CPUs */ err =3D entry(cpu);
> >> <--------------------------------------------------------------crash
> >> occurs at this call. else err =3D -EINVAL;
> >>
> >> Somehow the entry point is something invalid.
> >> I haven't changed anything in the JH code. I built the sources then
> >> booted using the generated images.
> >>
> >> Do you have any hints where I should look at?
> >>
> >> Regards,
> >> Radu
> >>
> >>
> >>
> >> -----Original Message-----
> >> From: Henning Schild <henning.schild@siemens.com>
> >> Sent: Tuesday, November 12, 2019 11:08 AM
> >> To: Radu-andrei Bulie <radu-andrei.bulie@nxp.com>
> >> Cc: Peter Van Ackeren <peter.vanackeren@nxp.com>; Madalin Bucur
> >> <madalin.bucur@nxp.com> Subject: Re: [EXT] Re: DPAA macless sharing
> >>
> >> Caution: EXT Email
> >>
> >> Hi Radu,
> >>
> >> it is all in the README.
> >>
> >> You want to take out/build/tmp/deploy/images/ls1043ardb-jh/
> >> sinec-jailhouse-image-ls1043ardb-jh.tar.gz which contains
> >> everything.
> >>
> >> dtb boot/fsl-ls1043a-rdb-sdk.dtb
> >> kernel boot/Image
> >> rootfs ... that tarball
> >>
> >> That deploy-folder is full of stuff and also contains some
> >> artifacts that can also be found in the tarball. So you can find
> >> the kernel, dtb, rootfs (different types) as stand-alone files
> >> there as well. Best compare the checksums of the stand-alone
> >> artifacts with the contents of the tarball to figure out which
> >> could be used stand-alone.
> >>
> >> After Linux has started you start jailhouse and make that
> >> root-Linux a "VM". After that you start the second Linux (inmate)
> >> the command for that is also in the README. Here the same kernel
> >> is used, the dtb is different and the rootfs is an initrd
> >> contained in the main image.
> >>
> >> I suggest you pretend you do not understand all the details and
> >> just follow that README, worked for my internal customers that did
> >> not need to understand anything. After you can confirm that is
> >> works you can go ahead and change bits here and there.
> >> This layer is anyways just a demo not suited for development, i
> >> develop by compiling kernel and jailhouse on my laptop and
> >> injecting both into a full features distro-image.
> >>
> >> My guess is that you might want to do the same, and that layer is
> >> just the working reference.
> >>
> >> Henning
> >>
> >> On Mon, 11 Nov 2019 17:41:05 +0000
> >> Radu-andrei Bulie <radu-andrei.bulie@nxp.com> wrote:
> >>
> >>> Hi Henning,
> >>>
> >>> Maybe I was a little confusing with my questions.
> >>> So what I wanted to know was : where is the kernel Image(in the
> >>> sinec directory structure after the build has finished) file that
> >>> I have to use for the master(also the image that I have to use for
> >>> the slave and also the root file system)? For example: I will load
> >>> the Image (will it be an itb that contains the dtb, kernel Image
> >>> and the ramdisk? or the kernel image and dtb are not put together
> >>> in an itb) through tftp into ddr at a specific address and I will
> >>> boot from u-boot. Then after the master comes up I will launch the
> >>> cell.(I want to know the commands for running the cell; they will
> >>> be run  in the master kernel after it has booted right?)
> >>>
> >>> So shortly said I would like to know what are the output
> >>> images(from the build process) I will have to use, to have a
> >>> master / cell runing (Image, dtb, rootfs for both master and
> >>> slave partitions) I am not interested in the commands that flash
> >>> u-boot or load the kernel.
> >>>
> >>>
> >>> Regards,
> >>> Radu
> >>>
> >>> ________________________________
> >>> From: Henning Schild <henning.schild@siemens.com>
> >>> Sent: Monday, November 11, 2019 7:12 PM
> >>> To: Radu-andrei Bulie <radu-andrei.bulie@nxp.com>
> >>> Cc: Peter Van Ackeren <peter.vanackeren@nxp.com>; Madalin Bucur
> >>> <madalin.bucur@nxp.com> Subject: Re: [EXT] Re: DPAA macless
> >>> sharing
> >>>
> >>> Caution: EXT Email
> >>>
> >>> Hi Radu,
> >>>
> >>> it still is of high interest. That script and all involved tools
> >>> can handle proxies ... unfortunately i know what i am talking
> >>> about. If you look at it, it will pass the env variables
> >>> "http_proxy, https_proxy, ftp_proxy and no_proxy" it does not
> >>> deal with their uppercase "equivalents". Maybe you are using the
> >>> uppercase, or your docker is configured for proxies
> >>> ~/.docker/config.json.
> >>>
> >>> Maybe you should start by playing with the unpatched image first.
> >>> How to flash/boot is something you probably know much better than
> >>> myself. It is all in the README.md.
> >>>
> >>> I am not sure i get your question about the image. The bitbake
> >>> target can be found in the kas configuration. If you
> >>> want to call bitbake manually "sinec-jailhouse-image" is the
> >>> image.
> >>>
> >>> That contains "sinec-jailhouse-cell-image" and "jailhouse" and
> >>> everything you need.
> >>>
> >>> I will have a look at the code. But the coming weeks/months might
> >>> be too busy with more pressing projects.
> >>>
> >>> regards,
> >>> Henning
> >>>
> >>>
> >>> On Mon, 11 Nov 2019 11:25:15 +0000
> >>> Radu-andrei Bulie <radu-andrei.bulie@nxp.com> wrote:
> >>>
> >>>> Hi Henning,
> >>>>
> >>>> I hope that this thread is still of interest.
> >>>> I found out that the kas build did not work because of our proxy
> >>>> firewall. Moving the sinec archive on an external machine (and
> >>>> simply run the build.sh) solved all the errors.
> >>>>
> >>>> The next step I tried, was to build the kernel with the patch
> >>>> applied, then I rebuilt jailhouse. Commands executed were as
> >>>> follows: bitbake -c compile -f virtual/kernel
> >>>> bitbake jailhouse.(as you can notice, I first had to rebuild the
> >>>> kernel otherwise jailhouse would not use the updated kernel
> >>>> image)
> >>>>
> >>>> I have a question:
> >>>> what is the image /images that I will need to use  and what are
> >>>> the steps to start a master and a cell?
> >>>>
> >>>> Next steps (after succeeding a boot of the master and a
> >>>> cell)would be to give the cell dpaa resource through dts. I will
> >>>> make more comments on this part, but when the time comes.
> >>>>
> >>>> PS: I also attach  the macless code for 4.19 kernel.
> >>>>
> >>>> Regards,
> >>>> Radu
> >>>>
> >>>> -----Original Message-----
> >>>> From: Henning Schild <henning.schild@siemens.com>
> >>>> Sent: Monday, October 14, 2019 6:47 PM
> >>>> To: Radu-andrei Bulie <radu-andrei.bulie@nxp.com>
> >>>> Cc: Peter Van Ackeren <peter.vanackeren@nxp.com>;
> >>>> Madalin-cristian Bucur <madalin.bucur@nxp.com> Subject: Re:
> >>>> [EXT] Re: DPAA macless sharing
> >>>>
> >>>> Caution: EXT Email
> >>>>
> >>>> Am Mon, 14 Oct 2019 17:25:31 +0200
> >>>> schrieb Henning Schild <henning.schild@siemens.com>:
> >>>>
> >>>>> Hi Radu,
> >>>>>
> >>>>> Am Mon, 30 Sep 2019 16:09:47 +0000
> >>>>> schrieb Radu-andrei Bulie <radu-andrei.bulie@nxp.com>:
> >>>>>
> >>>>>> Hi Henning,
> >>>>>>
> >>>>>>
> >>>>>> I gave a short try and run build.sh from the archive you  have
> >>>>>> sent me. It created a docker container. Usually on the SDK
> >>>>>> yocto releases a script is generated based on the chosen
> >>>>>> platform(. ./setup-env -m <platform) then I can run bitbake
> >>>>>> and build the package that I want.(kernel or other sw
> >>>>>> package)
> >>>>>
> >>>>> That layer uses kas because all else is very error-prone.
> >>>>> Command line args, local configuration etc. usually lead to
> >>>>> failing builds when transfering projects from one machine/dev
> >>>>> to the other.
> >>>>>
> >>>>> Using that argumentation i am very surprised that you where not
> >>>>> able to build. (docker is optional but recommended to make sure
> >>>>> everything is as expected)
> >>>>>
> >>>>>> In this situation(related to the archive you've sent me) after
> >>>>>> kas has finished the downloading process the console was given
> >>>>>> to me in the path:/this/out/build
> >>>>>
> >>>>> You either run build.sh or shell.sh, your regular outside-shell
> >>>>> will not work.
> >>>>>
> >>>>> You can also "pip install kas" (use a venv!) and "kas shell" or
> >>>>> "kas build" without docker. kas is just a configuration
> >>>>> management tool with a strong yocto focus, the clean up that
> >>>>> "mess". It deals with which versions work well together (git
> >>>>> submodules, repo ...), clean homedir (no funny config from one
> >>>>> devs home ... works for me), patching layers for your project
> >>>>> ...
> >>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fblog.3mdeb.com%2F2019%2F2019-02-07-kas%2F&amp;data=3D02%7C01%7Cradu-andrei=
.bulie%40nxp.com%7C22b61980ccde4d2af91408d779676ed4%7C686ea1d3bc2b4c6fa92cd=
99c5c301635%7C0%7C0%7C637111357472686112&amp;sdata=3Dv90Qo1SS6hLp0EGsdzceCc=
S8XY3sgmLprVHLonZ0Tio%3D&amp;reserved=3D0
> >>>>>> I run bitbake world but I got some errors:
> >>>>>>
> >>>>>> OTE: Resolving any missing task queue dependencies
> >>>>>> ERROR: Nothing RPROVIDES
> >>>>>> 'imx-kobs' (but
> >>>>>> /this/out/meta-freescale/recipes-fsl/packagegroups/packagegroup-fs=
l-mfgtool.bb
> >>>>>> RDEPENDS on or otherwise requires it) ERROR: imx-kobs was
> >>>>>> skipped: incompatible with machine ls1043ardb-jh (not in
> >>>>>> COMPATIBLE_MACHINE) NOTE: Runtime target 'imx-kobs' is
> >>>>>> unbuildable, removing... Missing or unbuildable dependency
> >>>>>> chain was: ['imx-kobs'] ERROR: Required build target
> >>>>>> 'meta-world-pkgdata' has no buildable providers. Missing or
> >>>>>> unbuildable dependency chain was: ['meta-world-pkgdata',
> >>>>>> 'packagegroup-fsl-mfgtool', 'imx-kobs']
> >>>>>>
> >>>>>> I usually perform manual builds and do not rely on yocto.
> >>>>>> In order not to stay and debug what happens in yocto in
> >>>>>> respect to the layers or patches,
> >>>>>
> >>>>> Use shell.sh, that will give you a working environment.
> >>>>> i.e.
> >>>>>  shell.sh
> >>>>>  bash
> >>>>>  bitbake -c cleanall jailhouse
> >>>>>  bitbake -v jailhouse
> >>>>>
> >>>>> But i do the dev work on the ubuntu SDK rootfs and just pick
> >>>>> finalized commits into that yocto layer, so i get where you are
> >>>>> coming from.
> >>>>>> is it possible to send me a list of the patches that I have to
> >>>>>> apply on the linux kernel (I will try to backport them to the
> >>>>>> kernel on which I made the changes for shared mac
> >>>>>
> >>>>> The kernel patches can all be found in
> >>>>> recipes-kernel/linux/files/4.14/
> >>>>>
> >>>>> That is essentially
> >>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
git.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3Dshortlog%3Bh%3Drefs%2Fheads%2Fjailh=
ouse-enabling%2F4.14&amp;data=3D02%7C01%7Cradu-andrei.bulie%40nxp.com%7C22b=
61980ccde4d2af91408d779676ed4%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C=
637111357472686112&amp;sdata=3DRD1KFQ7X7oPFFEZvJxZgWOcixcK%2BWxpax9DG61PVmQ=
Q%3D&amp;reserved=3D0
> >>>>> plus one ls1043 dts patch to reserve memory for the other cells
> >>>>>
> >>>>> patches to jailhouse can also be found in its FILESDIR, again
> >>>>> mostly mainline plus board specifics
> >>>>
> >>>> All patches should apply with "git am", i guess even "git am
> >>>> <path to>/files/*" will work.
> >>>>
> >>>> Henning
> >>>>
> >>>>>> - which is 4.1.35) then the jailhouse git repo (with the
> >>>>>> branch I should be checked on) and the patches that I should
> >>>>>> apply to be in synch with the patched kernel?
> >>>>>
> >>>>> from recipes-kernel/linux/linux-qoriq-jailhouse_4.14.bb
> >>>>> git://source.codeaurora.org/external/qoriq/qoriq-components/linux;n=
obranch=3D1;protocol=3Dhttps
> >>>>> SRCREV =3D "e3aede3681a610e6d42c397b96547dc90f6f9e87"
> >>>>>
> >>>>> Kind regards,
> >>>>> Henning
> >>>>>
> >>>>>> Regards,
> >>>>>> Radu
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> From: Schild, Henning <henning.schild@siemens.com>
> >>>>>> Sent: Friday, September 27, 2019 1:19 PM
> >>>>>> To: Radu-andrei Bulie <radu-andrei.bulie@nxp.com>
> >>>>>> Cc: Peter Van Ackeren <peter.vanackeren@nxp.com>;
> >>>>>> Madalin-cristian Bucur <madalin.bucur@nxp.com> Subject: Re:
> >>>>>> [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>>
> >>>>>> Caution: EXT Email
> >>>>>> Thanks,
> >>>>>>
> >>>>>> That sounds promising. I'll be traveling myself for the next
> >>>>>> two weeks. No hurry but nice to see progress here.
> >>>>>>
> >>>>>> Henning
> >>>>>>
> >>>>>> With best regards
> >>>>>> ________________________________
> >>>>>> Von: Radu-andrei Bulie
> >>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>
> >>>>>> Gesendet: Freitag, 27. September 2019 08:50 An: Schild,
> >>>>>> Henning (CT RDA IOT SES-DE) Cc: Peter Van Ackeren;
> >>>>>> Madalin-cristian Bucur Betreff: RE: [EXT] Re: DPAA macless
> >>>>>> sharing
> >>>>>>
> >>>>>> And one more comment:
> >>>>>> -although  the architectures shows this particular connection
> >>>>>> between the normal interface and the macless interface, there
> >>>>>> are no hardcoded paths - it means you can create multiple
> >>>>>> macless that can go through the same normal interface or
> >>>>>> multiple macless that are connected to different interfaces
> >>>>>> (you only have to add more rules in the pcd - for each macless
> >>>>>> an entry and to put also each macless Rx queue on each
> >>>>>> steering entry)
> >>>>>>
> >>>>>>
> >>>>>> Radu
> >>>>>>
> >>>>>> From: Radu-andrei Bulie
> >>>>>> Sent: Friday, September 27, 2019 9:41 AM
> >>>>>> To: Henning Schild
> >>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>> Cc: Peter Van Ackeren
> >>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>> Madalin-cristian Bucur
> >>>>>> <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>> Subject:
> >>>>>> RE: [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>> One more thing I forgot to mention; during probing, macless
> >>>>>> takes the mac address from normal interface and assigns it to
> >>>>>> itself (dev_addr field in net_device structure). Maybe is not
> >>>>>> the best practice currently but if I don't do that packets
> >>>>>> that are steered by the pcd will be dropped by the stack due
> >>>>>> to the difference between dest mac address in the packet and
> >>>>>> the net_device dev_addr. In the future we can think at a
> >>>>>> better approach for this
> >>>>>>
> >>>>>> Radu
> >>>>>>
> >>>>>> From: Radu-andrei Bulie
> >>>>>> Sent: Friday, September 27, 2019 9:35 AM
> >>>>>> To: 'Henning Schild'
> >>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>> Cc: Peter Van Ackeren
> >>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>> Madalin-cristian Bucur
> >>>>>> <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>> Subject:
> >>>>>> RE: [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>>
> >>>>>> Hi Henning,
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> I send you the patches that apply on Linux on SDK 17.03.
> >>>>>> Basically the macless was changed such that it looks similar
> >>>>>> to net_dev private, from o functionality perspective.
> >>>>>>
> >>>>>> As you will notice from the schematic bellow there is no
> >>>>>> coping involved (buffers are feched from different buffer
> >>>>>> pools for the two interfaces using the FMAN virtual storage
> >>>>>> profile. This feature can be enabled during flow steering)
> >>>>>>
> >>>>>> The role of the PCD is to steer the traffic between the two
> >>>>>> interfaces. Now in the PCD as you will notice in the xml
> >>>>>> model, there is a simple rule that steers the traffic based
> >>>>>> on IP source.(it can be changed in the future)
> >>>>>>
> >>>>>> The PCD will generate a hash(based on the key- in this case ip
> >>>>>> source ) such that for the first interface , frames (multiple
> >>>>>> flows with multiple IPs different from the one that goes to
> >>>>>> macless) can reach multiple Rx queues.(Q1 ..Qn configured by
> >>>>>>
> >>>>>> the dpaa-eth driver). For the virtual interface -we have only
> >>>>>> one flow so for the moment in the pcd there is only one queue
> >>>>>> as you will notice, although the driver initializes more than
> >>>>>> one queue.
> >>>>>>
> >>>>>> On Tx side, the virtual interface uses the Tx queues of the
> >>>>>> first interface. These Tq queues are connected to the FMAN TX
> >>>>>> hardware port.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Steps to run the configuration are as follows:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> -apply the following changes in your dts file:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> fsl-ls1046a-rdb-usdpaa.dts
> >>>>>>
> >>>>>> +
> >>>>>>
> >>>>>> +        bp16: buffer-pool@16 {
> >>>>>>
> >>>>>> +                compatible =3D "fsl,ls1043a-bpool",
> >>>>>> "fsl,bpool";
> >>>>>>
> >>>>>> +                fsl,bpid =3D <16>;
> >>>>>>
> >>>>>> +                fsl,bpool-ethernet-cfg =3D <0 2048 0 1728 0
> >>>>>> 0x0>;
> >>>>>>
> >>>>>> +                fsl,bpool-thresholds =3D <0x100 0x300 0x0 0x0>;
> >>>>>>
> >>>>>> +        };
> >>>>>>
> >>>>>> +
> >>>>>>
> >>>>>> +
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> fsl-ls1046a.dtsi
> >>>>>>
> >>>>>> +/*
> >>>>>>
> >>>>>>                 ethernet@4 {
> >>>>>>
> >>>>>>                         compatible =3D "fsl,dpa-ethernet-init";
> >>>>>>
> >>>>>>                         fsl,bman-buffer-pools =3D <&bp7 &bp8
> >>>>>> &bp9>;
> >>>>>>
> >>>>>>                         fsl,qman-frame-queues-rx =3D <0x58 1
> >>>>>> 0x59
> >>>>>> 1>;
> >>>>>>
> >>>>>>                         fsl,qman-frame-queues-tx =3D <0x78 1
> >>>>>> 0x79
> >>>>>> 1>;
> >>>>>>
> >>>>>>                 };
> >>>>>>
> >>>>>> +*/
> >>>>>>
> >>>>>> +               ethernet@16 {
> >>>>>>
> >>>>>> +                       compatible =3D
> >>>>>> "fsl,ls1043a-dpa-ethernet-macless",
> >>>>>> "fsl,dpa-ethernet-macless";
> >>>>>>
> >>>>>> +                       fsl,bman-buffer-pools =3D <&bp16>;
> >>>>>>
> >>>>>> +                       fsl,qman-frame-queues-rx =3D <0xfa0
> >>>>>> 0x8>;
> >>>>>>
> >>>>>> +                       fsl,qman-frame-queues-tx =3D <0xfa8
> >>>>>> 0x8>;
> >>>>>>
> >>>>>> +                       peer =3D <&peer1>;
> >>>>>>
> >>>>>> +                       local-mac-address =3D [00 11 22 33 44
> >>>>>> 55];
> >>>>>>
> >>>>>> +               };
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>                 crypto =3D &crypto;
> >>>>>>
> >>>>>>         };
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> +      chosen {
> >>>>>>
> >>>>>> +               name =3D "chosen";
> >>>>>>
> >>>>>> +
> >>>>>>
> >>>>>> +               dpaa-extended-args {
> >>>>>>
> >>>>>> +                       fman0-extd-args {
> >>>>>>
> >>>>>> +                               cell-index =3D <0>;
> >>>>>>
> >>>>>> +                               compatible =3D
> >>>>>> "fsl,fman-extended-args";
> >>>>>>
> >>>>>> +                               dma-aid-mode =3D "port";
> >>>>>>
> >>>>>> +
> >>>>>>
> >>>>>> +
> >>>>>>
> >>>>>> +                               fman0_rx4-extd-args {
> >>>>>>
> >>>>>> +                                       cell-index =3D <4>;
> >>>>>>
> >>>>>> +                                       compatible =3D
> >>>>>> "fsl,fman-port-1g-rx-extended-args";
> >>>>>>
> >>>>>> +                                       /* Define Virtual
> >>>>>> storage profile */
> >>>>>>
> >>>>>> +                                       /* <number of
> >>>>>> profiles, default profile id> */
> >>>>>>
> >>>>>> +                                       vsp-window =3D <2 0>;
> >>>>>>
> >>>>>> +                               };
> >>>>>>
> >>>>>> +                       };
> >>>>>>
> >>>>>> +               };
> >>>>>>
> >>>>>> +       };
> >>>>>>
> >>>>>> +
> >>>>>>
> >>>>>>         cpus {
> >>>>>>
> >>>>>>                 #address-cells =3D <1>;
> >>>>>>
> >>>>>>                 #size-cells =3D <0>;
> >>>>>>
> >>>>>> @@ -1090,7 +1111,7 @@
> >>>>>>
> >>>>>>                         compatible =3D "fsl,dpa-ethernet";
> >>>>>>
> >>>>>>                         fsl,fman-mac =3D <&fm1mac4>;
> >>>>>>
> >>>>>>                 };
> >>>>>>
> >>>>>> -               ethernet@4 {
> >>>>>>
> >>>>>> +               peer1:ethernet@4 {
> >>>>>>
> >>>>>>                        compatible =3D "fsl,dpa-ethernet";
> >>>>>>
> >>>>>>                         fsl,fman-mac =3D <&fm1mac5>;
> >>>>>>
> >>>>>>                 };
> >>>>>>
> >>>>>> As you can notice from above snippet, I added a bpool and a
> >>>>>> macless with that bpool, I removed eth4 (because I want it to
> >>>>>> be a normal interface not usdpaa interface, maybe in your
> >>>>>> case you will have a different interface id that will be
> >>>>>> visible)
> >>>>>>
> >>>>>> In the dtsi file I added the node - chosen node, that will be
> >>>>>> used to enable storage profile on the normal port using the
> >>>>>> PCD model.(Notice that the chosen is applied on fman0_rx4
> >>>>>> (it's important! - see the port mapping -
> >>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fcommunity.nxp.com%2Fdocs%2FDOC-343516&amp;data=3D02%7C01%7Cradu-andrei.bu=
lie%40nxp.com%7C22b61980ccde4d2af91408d779676ed4%7C686ea1d3bc2b4c6fa92cd99c=
5c301635%7C0%7C0%7C637111357472696105&amp;sdata=3DxRYfIp0nu7vYdoYy205mI%2Bg=
BCMjyMinhvsBJS5Q%2BqCU%3D&amp;reserved=3D0>)
> >>>>>> that corresponds to fm1-mac5 in my case; in your case you
> >>>>>>
> >>>>>> must put the correct id.). Another change in dtsi was to add a
> >>>>>> tag for the interface - peer1 which is used inside the macless
> >>>>>> to reference the platform device corresponding to this
> >>>>>> interface, by the macless driver.(why? To apply the storage
> >>>>>> profile on the normal interface
> >>>>>>
> >>>>>> based on the pool from macless, to take the tx queue from
> >>>>>> normal interface and use their ids in the macless, to
> >>>>>> configure the tx confirmation queues on the macless based on
> >>>>>> the info from normal interface)
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> -build the dts
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> -apply the kernel patches and build the kernel and finally the
> >>>>>> itb.
> >>>>>>
> >>>>>> -optionally edit the pcd.xml file and add as Rx queue the
> >>>>>> macless queue(one of the eight queues defined in
> >>>>>> fsl,qman-frame-queues-rx for macless ), for the flow that is
> >>>>>> steered based on ip.src (this was already performed but if you
> >>>>>> want a different queue you can do that)
> >>>>>>
> >>>>>> -mandatory- check what ports ids you should put in the config.
> >>>>>> Xml for the normal port (see the port mapping -
> >>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fcommunity.nxp.com%2Fdocs%2FDOC-343516&amp;data=3D02%7C01%7Cradu-andrei.bu=
lie%40nxp.com%7C22b61980ccde4d2af91408d779676ed4%7C686ea1d3bc2b4c6fa92cd99c=
5c301635%7C0%7C0%7C637111357472696105&amp;sdata=3DxRYfIp0nu7vYdoYy205mI%2Bg=
BCMjyMinhvsBJS5Q%2BqCU%3D&amp;reserved=3D0>)
> >>>>>>
> >>>>>> -boot the board and run the following commands:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> #when applying this command no errors must be seen. If you see
> >>>>>> some errors then you must stop, and contact me or someone from
> >>>>>> our side.
> >>>>>>
> >>>>>> fmc -c config.xml -p pcd_jh.xml -a
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> ifconfig fm1-mac5 up
> >>>>>>
> >>>>>> ifconfig macless0 up
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> -send traffic and check it reaches fm1-mac5.(tcpdump /
> >>>>>> ethtool)
> >>>>>>
> >>>>>> -send traffic that matches the rule in the pcd and check that
> >>>>>> it reaches macless(tcpdump / ethtool) and only macless not
> >>>>>> fm1-mac5
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Optional:
> >>>>>>
> >>>>>> - to see what buffer pools are being used you can add a printk
> >>>>>> with ratelimit in the following locations:
> >>>>>>
> >>>>>> In shared_rx_dqrr (this is the receive callback for macless,
> >>>>>> called when frames are in the queue of the macless):
> >>>>>>
> >>>>>> printk("from BPID %d\n", fd->bpid);
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> in priv_rx_default_dqrr (this is the receive callback for
> >>>>>> normal interface, called when frames are in the queue of the
> >>>>>> macless):
> >>>>>>
> >>>>>> printk("from BPID %d\n", fd->bpid);
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> If you see the same buffer pool for two different flows that
> >>>>>> are steered one to macless and one to normal it means
> >>>>>> something is wrong in the config.(it's unlikely to reach here)
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> The macless as explained earlier(and as it can be observed
> >>>>>> from the below figure) no longer uses copying and also uses
> >>>>>> napi.(before, it worked only on interrupt mode which added a
> >>>>>> significant performance drop)
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> The architecture for the normal < --- > malcess scenario:
> >>>>>>
> >>>>>> [cid:image001.jpg@01D577BF.E37EBB10]
> >>>>>>
> >>>>>> If I missed anything please let me know.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> One more comment:
> >>>>>>
> >>>>>> - starting from the next Friday I will be off work (aprox 3
> >>>>>> weeks). It's possible I will not be able to finish or even
> >>>>>> start the JH integration until Friday.
> >>>>>>
> >>>>>> If you have any dpaa problems you can contact NXP. For the JH
> >>>>>> integration I will be the main contact point and I will be
> >>>>>> able to communicate with you after 29th of October.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>>
> >>>>>> Radu
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Radu-andrei Bulie
> >>>>>> Sent: Friday, September 27, 2019 12:50 AM
> >>>>>> To: Henning Schild
> >>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>> Cc: Peter Van Ackeren
> >>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>> Madalin-cristian Bucur
> >>>>>> <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>> Subject:
> >>>>>> RE: [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Your assumption is correct. Using the linux interface with pcd
> >>>>>> connected to macless will mean no CPU intervention for flows
> >>>>>> going from linux if to macless (virtual); I'll send you a
> >>>>>> schematics and the patches that enable this.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Radu
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> -----Original Message-----
> >>>>>>
> >>>>>> From: Henning Schild
> >>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>>
> >>>>>> Sent: Wednesday, September 25, 2019 8:32 PM
> >>>>>>
> >>>>>> To: Radu-andrei Bulie
> >>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>
> >>>>>>
> >>>>>> Cc: Peter Van Ackeren
> >>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>> Madalin-cristian Bucur
> >>>>>> <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>>
> >>>>>>
> >>>>>> Subject: Re: [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Caution: EXT Email
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Hi Radu,
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> i meanwhile have some iperf3 measurement results for the
> >>>>>> jailhouse setup i sent you.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> The two Linuxes reach 3.6GBits/sec over the ivshmem-net shared
> >>>>>> memory driver from jailhouse. I assume two macless would be at
> >>>>>> that figures as well, since CPU seems to become the bottleneck
> >>>>>> here.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> For the bridged setup the second Linux manages to fully
> >>>>>> saturate the 1GBit of the physical interface i chose. But the
> >>>>>> first Linux gets one CPU "fully" loaded to bridge those
> >>>>>> packets from the DPAA NIC to the ivshmem NIC. I did not yet
> >>>>>> look into a 10G link, i guess 1G is more than enough for the
> >>>>>> envisioned applications. But involving the other Linux so
> >>>>>> much is not nice.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> My assumption for the shared/virtualized DPAA setup would be,
> >>>>>> the second Linux again saturating the full link, while the
> >>>>>> primary Linux is idle.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Henning
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Am Tue, 24 Sep 2019 16:07:00 +0000
> >>>>>>
> >>>>>> schrieb Radu-andrei Bulie
> >>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> Hi Henning,
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> I've made changes in the dpaa-eth driver such that:
> >>>>>>
> >>>>>>> - no copy is involved (a separate bpool is used for virtual
> >>>>>>> interface
> >>>>>>
> >>>>>>> - selected automatically by HW)
> >>>>>>
> >>>>>>> - a pcd model is applied on the physical port such that
> >>>>>>> there is
> >>>>>>
> >>>>>>> traffic that goes to the linux interface associated to that
> >>>>>>> port and
> >>>>>>
> >>>>>>> other traffic that will go to virtual interface.(this is the
> >>>>>>> Rx of the
> >>>>>>
> >>>>>>> vif) On the tx side, the virtual interface will send the
> >>>>>>> traffic to
> >>>>>>
> >>>>>>> the tx queues from the normal interface.(the tx queues of
> >>>>>>> the hardware
> >>>>>>
> >>>>>>> port corresponding to the normal linux interface)
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> I will send you the changes, and a write-up with a figure
> >>>>>>> and how to
> >>>>>>
> >>>>>>> use the config.
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> If everything is fine from your side after running this, we
> >>>>>>> can go
> >>>>>>
> >>>>>>> further to move the macless into Jail cell.
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> Regards,
> >>>>>>
> >>>>>>> Radu
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> -----Original Message-----
> >>>>>>
> >>>>>>> From: Henning Schild
> >>>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>>>
> >>>>>>
> >>>>>>> Sent: Tuesday, September 17, 2019 1:44 PM
> >>>>>>
> >>>>>>> To: Radu-andrei Bulie
> >>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>
> >>>>>>>
> >>>>>>
> >>>>>>> Cc: Peter Van Ackeren
> >>>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>>> Madalin-cristian
> >>>>>>
> >>>>>>> Bucur <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>>
> >>>>>>> Subject: Re: [EXT] Re: DPAA macless
> >>>>>>
> >>>>>>> sharing
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> Caution: EXT Email
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> Hi Radu,
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> that sounds like a good plan. If you need to write drivers
> >>>>>>> to enable
> >>>>>>
> >>>>>>> that, please try to make that virtual MAC/PHY inherit the
> >>>>>>> MAC-address
> >>>>>>
> >>>>>>> of the physical one it is wired up to.
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> At least that sounds to me like the easiest solution to
> >>>>>>> solve the MAC
> >>>>>>
> >>>>>>> address assignment problem. Static MAC addresses from a dts
> >>>>>>> are
> >>>>>>
> >>>>>>> problematic and only work if they stay strictly "internal"
> >>>>>>> ... are not
> >>>>>>
> >>>>>>> visible outside the device. Otherwise we will need a
> >>>>>>> different
> >>>>>>
> >>>>>>> dts/firmware for every board we flash + a pool of MAC
> >>>>>>> addresses. Or
> >>>>>>
> >>>>>>> does one DPAA own more MAC addresses than it has PHYs? Which
> >>>>>>> would
> >>>>>>
> >>>>>>> give us that "pool".
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> Or maybe you do have an idea how to best deal with MAC
> >>>>>>> addresses.
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> regards,
> >>>>>>
> >>>>>>> Henning
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>> Am Mon, 16 Sep 2019 15:19:00 +0000
> >>>>>>
> >>>>>>> schrieb Radu-andrei Bulie
> >>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>:
> >>>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>>> Hi Henning,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> According to your comments:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> "Before doing any JH porting or having two or more
> >>>>>>>> instances of
> >>>>>>
> >>>>>>>> Linux, i would like to divide and conquer ... Have that
> >>>>>>>> one "virtual
> >>>>>>
> >>>>>>>> MAC/PHY" in a plain Linux. Once that works one would just
> >>>>>>>> need to
> >>>>>>
> >>>>>>>> start a second Linux, share the memory regions for buffers
> >>>>>>>> etc. and
> >>>>>>
> >>>>>>>> move the dts-entries over to the other Linux."
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> I will not start a porting, for the moment, of JH on
> >>>>>>>> kernel 4.1 from
> >>>>>>
> >>>>>>>> SDK but I will try to provide you with a scenario that
> >>>>>>>> enable this
> >>>>>>
> >>>>>>>> case:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> [cid:image002.png@01D56CBB.348938B0]
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Ignore from the image the JH cells.(there will be only a
> >>>>>>>> virtual
> >>>>>>
> >>>>>>>> iface) There will be just a single linux partition with a
> >>>>>>>> physical
> >>>>>>
> >>>>>>>> interface, that uses the PCD model to steer traffic to a
> >>>>>>>> virtual
> >>>>>>
> >>>>>>>> interface.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> I will provide you with the changes (if needed) and
> >>>>>>>> configurations
> >>>>>>
> >>>>>>>> / steps for the SDK 1703.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> If everything work at your side I will do a port of the JH
> >>>>>>>> to do
> >>>>>>
> >>>>>>>> further checks.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Is my understanding and proposal feasible  from your point
> >>>>>>>> of view?
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Radu
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> -----Original Message-----
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> From: Henning Schild
> >>>>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Sent: Monday, September 16, 2019 11:19 AM
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> To: Radu-andrei Bulie
> >>>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Cc: Peter Van Ackeren
> >>>>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>>>> Madalin-cristian
> >>>>>>
> >>>>>>>> Bucur
> >>>>>>>> <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Subject: Re: [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Caution: EXT Email
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Hi Radu,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> now that i read that again, you want to port JH and are
> >>>>>>>> not
> >>>>>>
> >>>>>>>> suggesting that i should do it. I would be happy to
> >>>>>>>> support you in
> >>>>>>
> >>>>>>>> that, and you can always post your questions on the
> >>>>>>>> mailinglist.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> The setup consists of the hypervisor itself and a few
> >>>>>>>> kernel
> >>>>>>
> >>>>>>>> patches.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> The kernel patches are required for the shared-memory
> >>>>>>>> network device
> >>>>>>
> >>>>>>>> and for guest-mode (running a second Linux).
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> I assume jailhouse will just compile against a 4.1 and the
> >>>>>>>> kernel
> >>>>>>
> >>>>>>>> patches should be easy to rebase onto 4.1. Minor issues
> >>>>>>>> and merges
> >>>>>>
> >>>>>>>> might be required but i do not know about any major
> >>>>>>>> blockers
> >>>>>>
> >>>>>>>> preventing a backport.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Henning
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> Am Thu, 12 Sep 2019 09:46:12 +0000
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>> schrieb Radu-andrei Bulie
> >>>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>:
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Hi Henning,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Do you see any issues / restrictions if I try to port
> >>>>>>>>> the JH on
> >>>>>>
> >>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> 4.1.35 kernel (which is the one from SDK)?
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Radu
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> -----Original Message-----
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> From: Radu-andrei Bulie
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Sent: Tuesday, September 10, 2019 6:42 PM
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> To: Henning Schild
> >>>>>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Cc: Peter Van Ackeren
> >>>>>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>>>>> Madalin-cristian
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Bucur
> >>>>>>>>> <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>>
> >>>>>>>>> Subject: RE: [EXT] Re: DPAA macless
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> sharing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Hi Henning,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> The solution for that is the third approach. (P1 instead
> >>>>>>>>> of bridge
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> will use FMAN (PCD)  which means no GPP intervention)
> >>>>>>>>> But as
> >>>>>>
> >>>>>>>>> mentioned
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> before the PCD support is only in SDK.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Radu
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> -----Original Message-----
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> From: Henning Schild
> >>>>>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Sent: Tuesday, September 10, 2019 4:43 PM
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> To: Radu-andrei Bulie
> >>>>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Cc: Peter Van Ackeren
> >>>>>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>;
> >>>>>>>>> Madalin-cristian
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Bucur
> >>>>>>>>> <madalin.bucur@nxp.com<mailto:madalin.bucur@nxp.com>>
> >>>>>>>>> Subject: Re: [EXT] Re: DPAA macless
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> sharing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Caution: EXT Email
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Hi Radu,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> for now i will stop working on the topic since my
> >>>>>>>>> understanding is
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> that i will need a SW connector (i am currently using a
> >>>>>>>>> Linux
> >>>>>>
> >>>>>>>>> bridge)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> anyways. What i do not get is how that macless/shared
> >>>>>>>>> ever made
> >>>>>>
> >>>>>>>>> any
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> sense on topas/kvm. Virtio should be as fast as macless
> >>>>>>>>> dpaa VM
> >>>>>>
> >>>>>>>>> <->
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> host.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Here is a picture of what i currently have:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>                 Linux0
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> _______________ eth0
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> |   ___________ br0, eth1
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> |   |            | .
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> |   |         ---- .        Linux1
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> |  DPAA       |  eth7 ______ eth0
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> |   |         ---eth8 ______ eth1
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> P0 P1 ... Px
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> eth7/8 in Linux0 and eth0/1 in Linux1 are virtual NICs
> >>>>>>>>> based on a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> shared memory region and an interrupt. The way i connect
> >>>>>>>>> Linux1 to
> >>>>>>
> >>>>>>>>> a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> physical port (P1) is a SW connector just like you
> >>>>>>>>> suggested. (a
> >>>>>>
> >>>>>>>>> Linux
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> bridge)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> High amounts of traffic Linux1,eth1->P1 cause high CPU
> >>>>>>>>> load on
> >>>>>>
> >>>>>>>>> Linux0,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> which i wanted to avoid.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Replacing my shared memory vnic with a shared memory
> >>>>>>>>> DPAA vnic
> >>>>>>
> >>>>>>>>> will
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> not help at all, i need to use dpaa to connect my
> >>>>>>>>> virtual eth1 to
> >>>>>>
> >>>>>>>>> P1.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> I attached a complete yocto layer with build and run
> >>>>>>>>> instructions
> >>>>>>
> >>>>>>>>> for
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> you to reproduce my exact setup. A jailhouse
> >>>>>>>>> partitioning
> >>>>>>
> >>>>>>>>> implementing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> the above picture. You will need a ls1043 dev board with
> >>>>>>>>> both
> >>>>>>
> >>>>>>>>> UARTS
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> connected and P0 P1 connected to some outside network.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Henning
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> Am Mon, 9 Sep 2019 19:17:37 +0200
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>> schrieb Henning Schild
> >>>>>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com>>=
:
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> Hi Radu,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> i finally had time to look into that again. Indeed i
> >>>>>>>>>> was missing
> >>>>>>
> >>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> seeding and the buffer-pool definition did not work.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> For the sake of simplicity i now go all the steps in a
> >>>>>>>>>> single
> >>>>>>
> >>>>>>>>>> linux,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> before moving to jailhouse and a second linux.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> What works so far is two macless interfaces on one
> >>>>>>>>>> buffer-pool
> >>>>>>
> >>>>>>>>>> where
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> i connect that one linux to itself. I assume when i
> >>>>>>>>>> assign all
> >>>>>>
> >>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> right memory that should be easy to split and
> >>>>>>>>>> distribute the two
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> interfaces across 2 linuxes.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> So we have the simplified picture with the grey dotted
> >>>>>>>>>> box.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> The problem with this "alternative" is that SW copying
> >>>>>>>>>> packets
> >>>>>>
> >>>>>>>>>> from
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> macless_1 .... to Port0. I am coming from such a setup
> >>>>>>>>>> and want
> >>>>>>
> >>>>>>>>>> to
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> get rid of copying. For performance and for dependency
> >>>>>>>>>> reasons,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> cell1 should ideally have networking even if primary
> >>>>>>>>>> crashes.
> >>>>>>
> >>>>>>>>>> I
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> guess we will not get there, but the copies are what i
> >>>>>>>>>> want to
> >>>>>>
> >>>>>>>>>> get
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> away from. At the moment i have two SW copies and the
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>>> alternative
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> gets me down to one. But at the cost of being stuck
> >>>>>>>>>> with SDK and
> >>>>>>
> >>>>>>>>>> a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> macless driver from the past, will not give that to my
> >>>>>>>>>> customer.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> I am using the SDK drivers and am currently not
> >>>>>>>>>> interested in
> >>>>>>
> >>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> mainline. The macless and shared and init-only drivers
> >>>>>>>>>> are not
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> available for mainline (afaik). And the macless needed
> >>>>>>>>>> to be
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> forward-ported to 4.19, was dropped by nxp > 4.1.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> After i had that two macless thingys running i tried
> >>>>>>>>>> connecting
> >>>>>>
> >>>>>>>>>> it
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> to port0, based on the mail before... And things did
> >>>>>>>>>> not match
> >>>>>>
> >>>>>>>>>> nor
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> work. I guess this mail explains that what i want does
> >>>>>>>>>> not work
> >>>>>>
> >>>>>>>>>> with
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> DPAA, and the current driver stack.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> Custom patches on the questionable SDK driver (already
> >>>>>>>>>> dead?)
> >>>>>>
> >>>>>>>>>> are no
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> option! I already hated pulling that macless out of
> >>>>>>>>>> 4.1.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> If you see an option to implement the last option
> >>>>>>>>>> based on the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> mainline driver, we can discuss this and i can spend
> >>>>>>>>>> some time
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> providing you with a jailhouse getting-started.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> Sorry for getting back to you so late. The mails and
> >>>>>>>>>> TODOs
> >>>>>>
> >>>>>>>>>> sounded
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> like i wanted to give that time. And then i decided to
> >>>>>>>>>> work on
> >>>>>>
> >>>>>>>>>> them
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> one by one ... and the last told me to not work on it
> >>>>>>>>>> ;). My
> >>>>>>
> >>>>>>>>>> fault.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> Henning
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> Am Fri, 19 Jul 2019 12:02:50 +0000
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>> schrieb Radu-andrei Bulie
> >>>>>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com>>:
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Hi Henning,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> After the last email I've sent you (with many
> >>>>>>>>>>> details that
> >>>>>>
> >>>>>>>>>>> might
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> confuse) I will try to simplify things, such that
> >>>>>>>>>>> you will be
> >>>>>>
> >>>>>>>>>>> able
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> to have a scenario which require configuration only
> >>>>>>>>>>> (and no
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> software changes if that is possible) I will start
> >>>>>>>>>>> from your
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> initial setup that looked  something like below:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [FMAN,Primary partition,Cell 1,Cell N] [PortN] [Port
> >>>>>>>>>>> 0] [Port
> >>>>>>
> >>>>>>>>>>> 1]
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> The problem with this setup is that DPAA1 doesn't
> >>>>>>>>>>> support
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> isolation.( FMAN will be shared  across the Primary
> >>>>>>>>>>> partition
> >>>>>>
> >>>>>>>>>>> and
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> the Jail House)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> An alternative proposed was this one:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> -having a primary partition that behaves like a
> >>>>>>>>>>> proxy. The
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> partition will contain all the physical ports.
> >>>>>>>>>>> Traffic
> >>>>>>
> >>>>>>>>>>> received on
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> these physical ports will be steered to each cell
> >>>>>>>>>>> using some
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> virtual interfaces, each interface being assigned
> >>>>>>>>>>> to a cell
> >>>>>>
> >>>>>>>>>>> like
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> below:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [cid:image028.png@01D53E43.0569D310]
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> As you can observe, each macless (for sake of
> >>>>>>>>>>> clarity you can
> >>>>>>
> >>>>>>>>>>> name
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> it virtual interface) from each cell has its pair in
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>>>> primary
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> partition.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Let's zoom on this alternative and have a simplified
> >>>>>>>>>>> case.
> >>>>>>
> >>>>>>>>>>> The
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> simplified case will be as below:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [Port 0]
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> The grey dotted rectangle focuses on two macless
> >>>>>>>>>>> that are
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> connecting Cell1 and the Primary partition. This
> >>>>>>>>>>> should be
> >>>>>>
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> first test that must be performed: -check that you
> >>>>>>>>>>> can send
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> traffic between these two macless devices. (their
> >>>>>>
> >>>>>>>>>>> configuration is
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> done in the device tree, similar with the
> >>>>>>>>>>> configuration for
> >>>>>>
> >>>>>>>>>>> Topaz
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> - check the SDK document I've pointed you to, and
> >>>>>>>>>>> also my
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> suggestions sent before)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> For the second part, sending traffic from the Fman
> >>>>>>>>>>> port (port
> >>>>>>
> >>>>>>>>>>> 0)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> to macless and also receiving from macless to port
> >>>>>>>>>>> 0, this
> >>>>>>
> >>>>>>>>>>> needs
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> to be discussed: -all the traffic received from
> >>>>>>>>>>> port 0 goes
> >>>>>>
> >>>>>>>>>>> to
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> macless 1 and all traffic sent by port 0 comes from
> >>>>>>>>>>> macless1
> >>>>>>
> >>>>>>>>>>> or
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> there is traffic that goes in the Linux stack,
> >>>>>>>>>>> ingressing
> >>>>>>
> >>>>>>>>>>> from
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> port 0 and traffic that egress from port 0 (from the
> >>>>>>>>>>> stack)
> >>>>>>
> >>>>>>>>>>> while
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> other type of traffic goes / comes from the macless
> >>>>>>>>>>> (that
> >>>>>>
> >>>>>>>>>>> means
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> multiple flows , some going in linux,  some going
> >>>>>>>>>>> to
> >>>>>>
> >>>>>>>>>>> macless)?
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> You can infer from my question that I am thinking at
> >>>>>>>>>>> the fact
> >>>>>>
> >>>>>>>>>>> that
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> each port has it's own pair of RX/TX queues.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Notes:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> If you want to send traffic from the port 0 to
> >>>>>>>>>>> macless_1 this
> >>>>>>
> >>>>>>>>>>> will
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> probably require changes in the dpaa driver for port
> >>>>>>>>>>> 0. The
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> mechanism for sending traffic between Port0 and
> >>>>>>>>>>> macless_1 will
> >>>>>>
> >>>>>>>>>>> be
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> in software (upstream driver does not have PCD model
> >>>>>>>>>>> so no PCD
> >>>>>>
> >>>>>>>>>>> can
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> be applied to steer the traffic without core
> >>>>>>>>>>> intervention,
> >>>>>>
> >>>>>>>>>>> from
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Port 0, to the Rx queue of macless_1) The
> >>>>>>>>>>> explanation for Sw
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> driver rectangle is that the communication between
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>>>> physical
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> FMAN port and the macless will be done using the
> >>>>>>>>>>> Port 0 dpaa
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> driver
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> - so no offloading to FMAN (as stated before, the
> >>>>>>>>>>> PCD
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> functionality does not exist outside SDK) To
> >>>>>>>>>>> summarize here,
> >>>>>>
> >>>>>>>>>>> we
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> will need to discuss how to connect these two
> >>>>>>>>>>> interfaces.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Another option to steer the traffic from the primary
> >>>>>>>>>>> partition
> >>>>>>
> >>>>>>>>>>> to
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> the cells, is to use the shared mac(for the sake of
> >>>>>>>>>>> clarity
> >>>>>>
> >>>>>>>>>>> think
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> of it as a normal  interface that has a PCD applied;
> >>>>>>>>>>> the PCD
> >>>>>>
> >>>>>>>>>>> can
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> steer the traffic either to the stack on some queues
> >>>>>>>>>>> or to
> >>>>>>
> >>>>>>>>>>> another
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> partition through other different queues) but in
> >>>>>>>>>>> that case the
> >>>>>>
> >>>>>>>>>>> PCD
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> model is needed for the shared mac. The picture is
> >>>>>>>>>>> like
> >>>>>>
> >>>>>>>>>>> this:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [cid:image030.png@01D53E43.0569D310]
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Each physical port, based on a PCD applied, will
> >>>>>>>>>>> steer the
> >>>>>>
> >>>>>>>>>>> traffic
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> to a queue (macless_C1 Rx queue, macless_C2 Rx queue
> >>>>>>>>>>> and so
> >>>>>>
> >>>>>>>>>>> forth)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> As specified before this scenario(applying a PCD) is
> >>>>>>>>>>> not
> >>>>>>
> >>>>>>>>>>> supported
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> on the upstream driver.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> I hope that I clarified a little bit the plethora
> >>>>>>>>>>> of
> >>>>>>
> >>>>>>>>>>> options,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> related to DPAA1.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> A question I have in the end of this response is: is
> >>>>>>>>>>> it
> >>>>>>
> >>>>>>>>>>> possible
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> for you to share with us the Jail House setup? In
> >>>>>>>>>>> this way it
> >>>>>>
> >>>>>>>>>>> will
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> be simpler for us to debug a setup that might have
> >>>>>>>>>>> some
> >>>>>>
> >>>>>>>>>>> apparent
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> issues at your side .
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Radu
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> -----Original Message-----
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> From: Radu-andrei Bulie
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Sent: Thursday, July 11, 2019 11:53 PM
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> To: Henning Schild
> >>>>>>>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com=
>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Cc: Peter Van Ackeren
> >>>>>>>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Subject: RE: [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Hi  Henning,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> A macless has 8 RX queues and 8 TX queues.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> The 8 Rx queues are initialized by the driver while
> >>>>>>>>>>> the TX
> >>>>>>
> >>>>>>>>>>> queues
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> will be initialized by the other consumer
> >>>>>>>>>>> (interface), macless
> >>>>>>
> >>>>>>>>>>> is
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> connected to.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> So for your macless you will need the following:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> fsl,qman-frame-queues-rx =3D <0xfa0 0x8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> fsl,qman-frame-queues-tx =3D <0xfa8 0x8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> According to the manual:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> . fsl,qman-frame-queues-rx - a list of base/count
> >>>>>>>>>>> pairs of
> >>>>>>
> >>>>>>>>>>> frame
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> queues that will transmit frames to the Macless
> >>>>>>>>>>> Driver.
> >>>>>>
> >>>>>>>>>>> These
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> queues are initialized as PCD queues.(please do not
> >>>>>>>>>>> try for
> >>>>>>
> >>>>>>>>>>> now to
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> digest this assertion) If you have less than 8 cores
> >>>>>>>>>>> you can
> >>>>>>
> >>>>>>>>>>> put a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> smaller value instead of 8.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> * fsl,qman-frame-queues-tx - a list of base/count
> >>>>>>>>>>> pairs of
> >>>>>>
> >>>>>>>>>>> frame
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> queues that fetch the frames from Macless Driver to
> >>>>>>>>>>> the next
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> hardware device (TX Port, O/H Port) or to another
> >>>>>>>>>>> Macless
> >>>>>>
> >>>>>>>>>>> Driver.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> These queues will only be created, but not
> >>>>>>>>>>> initialized. It is
> >>>>>>
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> role of the next software module in the data path
> >>>>>>>>>>> to
> >>>>>>
> >>>>>>>>>>> initialize
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> these queues;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> As you can observe the Tx queues for the macless
> >>>>>>>>>>> should
> >>>>>>
> >>>>>>>>>>> already
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> exist so, the 0xfa8 for instance should be an
> >>>>>>>>>>> existing
> >>>>>>
> >>>>>>>>>>> value.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> What I want to say is that....the TX queue must be
> >>>>>>>>>>> something
> >>>>>>
> >>>>>>>>>>> valid
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> otherwise when the frames will be sent they will
> >>>>>>>>>>> reach and
> >>>>>>
> >>>>>>>>>>> invalid
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> queue.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> If you want to send frames from a macless to another
> >>>>>>>>>>> tx port
> >>>>>>
> >>>>>>>>>>> you
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> must get the queues for that port.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Let's say that you know the port (interface). It's
> >>>>>>>>>>> eth2
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> First run this:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> find / -name "*fqid*"
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> A list of ports will appear:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> ..
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> /sys/devices/fsl,dpaa.13/ethernet.19/net/eth2/fqids
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> ..
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> You will do a cat on that and you will see:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Rx PCD: 5000 - 5007
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Tx: 5008 - 5015
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> It means that the queues for the macless should
> >>>>>>>>>>> start from
> >>>>>>
> >>>>>>>>>>> 5008.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> That means that in the dts for the macless you will
> >>>>>>>>>>> put
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> fsl,qman-frame-queues-tx =3D <5008  0x8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Regarding the seeding:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> When the macless is created, it will have a buffer
> >>>>>>>>>>> pool
> >>>>>>
> >>>>>>>>>>> associated
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> with it.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Seeding means that the macless driver will put
> >>>>>>>>>>> buffer pointers
> >>>>>>
> >>>>>>>>>>> in
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> the buffer pools based on the following property in
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> pool:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> fsl,bpool-ethernet-cfg =3D <count size base_address>;
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> In order for the macless to put buffers in the
> >>>>>>>>>>> buffer pool, a
> >>>>>>
> >>>>>>>>>>> user
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> must define a physical base address that will be
> >>>>>>>>>>> ioremapped by
> >>>>>>
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> macless driver.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Buffer pointers will be taken from here, and put in
> >>>>>>>>>>> the pool
> >>>>>>
> >>>>>>>>>>> by
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> the driver.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Another property that must be put is this one:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> fsl,bpool-ethernet-seeds;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> When a frame is sent on Tx side by the macless
> >>>>>>>>>>> driver, a
> >>>>>>
> >>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> pointer will be taken from macless pool and the
> >>>>>>>>>>> frame will be
> >>>>>>
> >>>>>>>>>>> put
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> there and then enqueued to TX queue.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> When a frame is received by the macless on the Rx
> >>>>>>>>>>> queue, it
> >>>>>>
> >>>>>>>>>>> will
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> be copied in a skb allocated by the driver from the
> >>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>>>> pointer
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> address found in the frame descriptor.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> After these explanations I will also like to send me
> >>>>>>>>>>> a
> >>>>>>
> >>>>>>>>>>> simple
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> picture of how would you like to connect the macless
> >>>>>>>>>>> with a
> >>>>>>
> >>>>>>>>>>> normal
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> net device that has a physical MAC associated.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Also please see the inline comments.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> -----Original Message-----
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> From: Henning Schild
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> <henning.schild@siemens.com<mailto:henning.schild@siemens.com=
<mailto:henning.schild@siemens.com%3cmailto:henning.schild@siemens.com>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Sent: Thursday, July 11, 2019 6:34 PM
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> To: Radu-andrei Bulie
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com<m=
ailto:radu-andrei.bulie@nxp.com%3cmailto:radu-andrei.bulie@nxp.com>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Cc: Peter Van Ackeren
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> <peter.vanackeren@nxp.com<mailto:peter.vanackeren@nxp.com<mai=
lto:peter.vanackeren@nxp.com%3cmailto:peter.vanackeren@nxp.com>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Subject: [EXT] Re: DPAA macless sharing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Caution: EXT Email
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Hi Radu,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> thanks for the information. That is a lot to parse
> >>>>>>>>>>> and
> >>>>>>
> >>>>>>>>>>> understand.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> And i am afraid i will only understand that along
> >>>>>>>>>>> the way.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> But some good hints on debugging via sysfs.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> I will shortly describe my scenario to you.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> I want to eventually have two linux partitions where
> >>>>>>>>>>> one gets
> >>>>>>
> >>>>>>>>>>> one
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> or more physical DPAA ports assigned, while the
> >>>>>>>>>>> other one has
> >>>>>>
> >>>>>>>>>>> all
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> the others.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Now that is not possible so i will probably end up
> >>>>>>>>>>> using
> >>>>>>
> >>>>>>>>>>> macless
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> somehow wired to the mac.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Before i move the macless to a second linux i would
> >>>>>>>>>>> like to
> >>>>>>
> >>>>>>>>>>> get
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> the same running on one Linux kernel. So 6 macs via
> >>>>>>>>>>> the real
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> ethernet driver and 1 via a macless.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Now what i hear from you is that i can wire a
> >>>>>>>>>>> macless to an
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> offline
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> (virtual?) port or a physical one. I guess i want it
> >>>>>>>>>>> as direct
> >>>>>>
> >>>>>>>>>>> as
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> possible and would want the physical one.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [RB]On the current kernel , I am not sure if fmc is
> >>>>>>>>>>> supported
> >>>>>>
> >>>>>>>>>>> (PCD
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> model), so connection to offline and a normal
> >>>>>>>>>>> interface can
> >>>>>>
> >>>>>>>>>>> be
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> problematic, that is why I told you to send me a
> >>>>>>>>>>> simple
> >>>>>>
> >>>>>>>>>>> picture of
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> the connection between the macless and the other
> >>>>>>>>>>> entity.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> I started off with the usdpaa dts and wanted to put
> >>>>>>>>>>> one
> >>>>>>
> >>>>>>>>>>> macless on
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> top of a "fsl,dpa-ethernet-init".
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [RB] Use something similar to what I have sent you.
> >>>>>>>>>>> Add a
> >>>>>>
> >>>>>>>>>>> new
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> ethernet node and add the properties corresponding
> >>>>>>>>>>> to the
> >>>>>>
> >>>>>>>>>>> shared
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> mac.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Find my latest guesswork in this dts jungle at the
> >>>>>>>>>>> end of
> >>>>>>
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> mail, it does not work. I also commented why i made
> >>>>>>>>>>> changes
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> inline. And i would be happy if you commented
> >>>>>>>>>>> inline. What
> >>>>>>
> >>>>>>>>>>> is
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> wrong, good, missing.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Now what i got from your email is that i might just
> >>>>>>>>>>> be
> >>>>>>
> >>>>>>>>>>> missing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> something that seeds. Maybe you can explain the
> >>>>>>>>>>> meaning of
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> "seeding" in one or two sentences.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> --- fsl-ls1043a-rdb-usdpaa.dts  2019-07-05
> >>>>>>
> >>>>>>>>>>> 11:17:17.233325314
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +0200 +++ fsl-ls1043a-rdb-shared.dts    2019-07-09
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 19:02:40.064908070 +0200 @@ -31,7 +31,23 @@
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>         bp9: buffer-pool@9 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 compatible =3D "fsl,p4080-bpool",
> >>>>>>>>>>> "fsl,bpool";
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 fsl,bpid =3D <9>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> -               fsl,bpool-ethernet-cfg =3D <0 0 0 2048
> >>>>>>>>>>> 0
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 0xfeedabba>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               fsl,bpool-ethernet-cfg =3D <0 0 0 1728
> >>>>>>>>>>> 0
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 0xfeedabba>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               fsl,bpool-thresholds =3D <0x100 0x300
> >>>>>>>>>>> 0x0
> >>>>>>
> >>>>>>>>>>> 0x0>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               dma-coherent;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> The idea here is to make room for a new bufferpool
> >>>>>>>>>>> (numbers
> >>>>>>
> >>>>>>>>>>> stolen
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> from some ppc dts)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +       };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +       bp16: buffer-pool@16 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               compatible =3D "fsl,p4080-bpool",
> >>>>>>>>>>> "fsl,bpool";
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               fsl,bpid =3D <16>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               fsl,bpool-ethernet-cfg =3D <0 2048 0
> >>>>>>>>>>> 1728 0
> >>>>>>
> >>>>>>>>>>> 0>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               fsl,bpool-thresholds =3D <0x100 0x300
> >>>>>>>>>>> 0x0
> >>>>>>
> >>>>>>>>>>> 0x0>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               dma-coherent;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +       };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +       bp17: buffer-pool@17 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               compatible =3D "fsl,p4080-bpool",
> >>>>>>>>>>> "fsl,bpool";
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               fsl,bpid =3D <17>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               fsl,bpool-ethernet-cfg =3D <0 2048 0
> >>>>>>>>>>> 1728 0
> >>>>>>
> >>>>>>>>>>> 0>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 fsl,bpool-thresholds =3D <0x100 0x300
> >>>>>>>>>>> 0x0
> >>>>>>
> >>>>>>>>>>> 0x0>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 dma-coherent;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>         };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [RB] If you will going to use 17, then add the tags
> >>>>>>>>>>> I've
> >>>>>>
> >>>>>>>>>>> mentioned
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> and also a base physical address. You will need to
> >>>>>>>>>>> reserve a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> physical memory region then use it here. See my
> >>>>>>>>>>> comments
> >>>>>>
> >>>>>>>>>>> regarding
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> to the base physical address.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Here we have two new bpools taking the free space,
> >>>>>>>>>>> they are
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> overlapping because i have seen that in other dts
> >>>>>>>>>>> files.
> >>>>>>
> >>>>>>>>>>> (where a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> macless and a shared where used) my guess is that
> >>>>>>
> >>>>>>>>>>> overlapping
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> bpools are a "wire".
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Just wonder why the two that are supposed to get
> >>>>>>>>>>> wired do not
> >>>>>>
> >>>>>>>>>>> just
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> use the same one ...
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [RB] It does not matter if you define two identical
> >>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>>>> pools.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> As long as they have different pool id they will be
> >>>>>>>>>>> treated
> >>>>>>
> >>>>>>>>>>> as
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> different entities in BMAN.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> @@ -42,7 +58,7 @@
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 ethernet@0 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                         compatible =3D
> >>>>>>
> >>>>>>>>>>> "fsl,dpa-ethernet-init";
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> -                       fsl,bman-buffer-pools =3D
> >>>>>>>>>>> <&bp7 &bp8
> >>>>>>
> >>>>>>>>>>> &bp9>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       fsl,bman-buffer-pools =3D
> >>>>>>>>>>> <&bp16>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [RB] An interface that has the above compatible tag
> >>>>>>>>>>> defined,
> >>>>>>
> >>>>>>>>>>> is an
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> usdpaa interface, not visible by linux and not
> >>>>>>>>>>> initialized by
> >>>>>>
> >>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> dpaa_eth driver.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Usdpaa I do not think is supported in the current
> >>>>>>>>>>> kernel
> >>>>>>
> >>>>>>>>>>> version
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> you have.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Is your intention to use usdpaa or will you use
> >>>>>>>>>>> other
> >>>>>>
> >>>>>>>>>>> framework
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> such as dpdk? I am asking this because I see that
> >>>>>>>>>>> you made a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> change to an interface that as I said will not be
> >>>>>>>>>>> probed as
> >>>>>>
> >>>>>>>>>>> Linux
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> interface.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Here i switch the first physical port to the bpool.
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                         fsl,qman-frame-queues-rx =3D
> >>>>>>>>>>> <0x50 1
> >>>>>>
> >>>>>>>>>>> 0x51
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 1>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                         fsl,qman-frame-queues-tx =3D
> >>>>>>>>>>> <0x70 1
> >>>>>>
> >>>>>>>>>>> 0x71
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 1>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> @@ -89,6 +105,17 @@
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                         fsl,qman-frame-queues-tx =3D
> >>>>>>>>>>> <0x7c 1
> >>>>>>
> >>>>>>>>>>> 0x7d
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 1>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               ethernet@9 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       compatible =3D
> >>>>>>
> >>>>>>>>>>> "fsl,dpa-ethernet-macless";
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       fsl,bman-buffer-pools =3D
> >>>>>>>>>>> <&bp16>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> My macless wired with bp16 ... should maybe be 17?
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       fsl,qman-frame-queues-rx =3D
> >>>>>>>>>>> <0x50 1
> >>>>>>
> >>>>>>>>>>> 0x51
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 1>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       fsl,qman-frame-queues-tx =3D
> >>>>>>>>>>> <0x70 1
> >>>>>>
> >>>>>>>>>>> 0x71
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> 1>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       //fsl,qman-frame-queues-rx =3D
> >>>>>>>>>>> <4000
> >>>>>>
> >>>>>>>>>>> 8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       //fsl,qman-frame-queues-tx =3D
> >>>>>>>>>>> <4008
> >>>>>>
> >>>>>>>>>>> 8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> [RB]  4000 =3D an RX frame queue id. There will be a
> >>>>>>>>>>> number of
> >>>>>>
> >>>>>>>>>>> 8
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> frame queues, one per core. 4008 =3D tx frame queue
> >>>>>>>>>>> id.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> You must not comment that code; comment the queues
> >>>>>>>>>>> above
> >>>>>>
> >>>>>>>>>>> them.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> wild guessing. No clue what 4000 means ... but the
> >>>>>>>>>>> values
> >>>>>>
> >>>>>>>>>>> above
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> are what the physical port uses. Another attempt to
> >>>>>>>>>>> wire
> >>>>>>
> >>>>>>>>>>> things up
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> to see packets flowing
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +                       local-mac-address =3D [00 11
> >>>>>>>>>>> 22 33 44
> >>>>>>
> >>>>>>>>>>> 55];
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> can i inherit that from ethernet@0
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> hardcoding in a dts is not an option, only of that
> >>>>>>>>>>> thing
> >>>>>>
> >>>>>>>>>>> never
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> becomes visible on a real wire.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +               };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> +
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                 dpa-fman0-oh@2 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                         compatible =3D "fsl,dpa-oh";
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>                         /* Define frame queues for
> >>>>>>>>>>> the OH
> >>>>>>
> >>>>>>>>>>> port*/
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Henning
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> Am Thu, 11 Jul 2019 10:29:05 +0000
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> schrieb Radu-andrei Bulie
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>> <radu-andrei.bulie@nxp.com<mailto:radu-andrei.bulie@nxp.com<m=
ailto:radu-andrei.bulie@nxp.com%3cmailto:radu-andrei.bulie@nxp.com>>>:
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Hi Henning,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> I am from the Apps team and I will guide you with
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>>>>> macless
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> scenario. As you may already know, macless devices
> >>>>>>>>>>>> are
> >>>>>>
> >>>>>>>>>>>> virtual
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> ethernet devices constructed on two DPAA1
> >>>>>>>>>>>> infrastructure
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> components:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> QMAN and BMAN.( there is no physical port
> >>>>>>>>>>>> involved; though
> >>>>>>
> >>>>>>>>>>>> you
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> can
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> connect a macless with an Offfline Port, and thus
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>>>>> macless
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> can
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> transmit / receive from the offline port. The
> >>>>>>>>>>>> offline port
> >>>>>>
> >>>>>>>>>>>> is
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> similar
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> to a normal port but it has no connection with the
> >>>>>>>>>>>> outside
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> world. It
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> can be chained with a normal port for further
> >>>>>>>>>>>> packet
> >>>>>>
> >>>>>>>>>>>> processing.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Macless can also be connected with a normal
> >>>>>>>>>>>> physical port Rx
> >>>>>>
> >>>>>>>>>>>> or
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> TX.)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Basically the macless consists  in a pair of RX/
> >>>>>>>>>>>> TX(QMAN)
> >>>>>>
> >>>>>>>>>>>> queue
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> and a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> buffer pool (BMAN) There are several scenarios in
> >>>>>>>>>>>> which you
> >>>>>>
> >>>>>>>>>>>> can
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> use
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the macless:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> - two linux partitions (one of them will seed the
> >>>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>>>>> pool
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> with
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> buffer pointers; both partitions will kmap the
> >>>>>>>>>>>> physical
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> addresses from
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> buffer pool when receiving/sending a frame ) -one
> >>>>>>>>>>>> Linux
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> partition
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> -that communicates with usdpaa. In this case
> >>>>>>>>>>>> usdpaa will
> >>>>>>
> >>>>>>>>>>>> seed
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> buffer pool. -one Linux partition- macless is
> >>>>>>>>>>>> connected to
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> either an
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> offline port or normal physical (Rx/Tx port)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> For more information about macless scenarions you
> >>>>>>>>>>>> can check
> >>>>>>
> >>>>>>>>>>>> this
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> document:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> https://www.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> google.com%2Furl%3Fsa%3Dt%26rct%3Dj%26q%3D%26esrc%3Ds%26sour=
ce%3
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Dw
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> eb%2
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 6cd%3D1%26ved%3D2ahUKEwiCt8y6r6zjAhXR-6QKHa1RAJgQFjAAegQIABA=
C%26
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> ur
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> l%3D
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> https%253A%252F%252Fwww.nxp.com%252Fdocs%252Fen%252Fsupporti=
ng-i
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> nf
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> orma
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> tion%252FQORIQ-SDK-2.0-IC-REV0.pdf%26usg%3DAOvVaw1Y6aESv_OQE=
HIxe
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> VE
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> OMX8
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> f&amp;data=3D02%7C01%7Cradu-andrei.bulie%40nxp.com%7Cdf243a9=
3a1f74
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 7b
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 8af8
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 108d706153b8b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C6=
3698
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 45
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 6057
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 1820577&amp;sdata=3DSngXQddjMx29s9UZoJcgo7S1bPi6%2B%2F%2BxQx=
nLNn3c
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> zj
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> U%3D
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> &amp;reserved=3D0 Searching for macless in it will
> >>>>>>>>>>>> give you
> >>>>>>
> >>>>>>>>>>>> more
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> info on
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the different contexts. There is a particular use
> >>>>>>>>>>>> case, in
> >>>>>>
> >>>>>>>>>>>> which
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> macless is "mapped" over a usdpaa interface
> >>>>>>>>>>>> (usdpaa
> >>>>>>
> >>>>>>>>>>>> interfaces
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> are not
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> visible under linux). Check ipsec_offload use case
> >>>>>>>>>>>> from
> >>>>>>
> >>>>>>>>>>>> page
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 1535.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> What you should notice are the VOF and VIF nodes
> >>>>>>>>>>>> which are
> >>>>>>
> >>>>>>>>>>>> in
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> fact
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> macless interfaces. For example VOF interface can
> >>>>>>>>>>>> receive
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> control
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> traffic from the physical RX port. How this is
> >>>>>>>>>>>> done? The
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> physical RX
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> port has a pare/classify/distribute model applied
> >>>>>>>>>>>> on it
> >>>>>>
> >>>>>>>>>>>> (this
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> enables
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the FMAN packet processing block to do advanced
> >>>>>>
> >>>>>>>>>>>> offloading)and
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> also
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> has configured a classification table. (exact
> >>>>>>>>>>>> match table)
> >>>>>>
> >>>>>>>>>>>> When
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> no
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> entires are hit in this table, flows will go in a
> >>>>>>>>>>>> QMAN
> >>>>>>
> >>>>>>>>>>>> queue
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> that is
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> in fact the RX queue of VOF. Also offline port has
> >>>>>>>>>>>> a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> classification
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> table on it and traffic that will not match the
> >>>>>>>>>>>> entries
> >>>>>>
> >>>>>>>>>>>> from
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> there,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> will go in VOF - another RX queue of VOF.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> On the other hand the shared mac device uses as
> >>>>>>
> >>>>>>>>>>>> infrastructure
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> components: -an existing MAC
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> - RX and TX FMAN physical ports
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> -QMAN and BMAN
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Traffic on a shared mac is steered based on a
> >>>>>>>>>>>> parse /
> >>>>>>
> >>>>>>>>>>>> classify/
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> distribute model (PCD) on the FMAN ports. You have
> >>>>>>>>>>>> for
> >>>>>>
> >>>>>>>>>>>> example
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> two
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> partitions, and in the PCD you have to
> >>>>>>>>>>>> classification
> >>>>>>
> >>>>>>>>>>>> entires
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> that
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> steer the traffic to one queue (first partition)
> >>>>>>>>>>>> or the
> >>>>>>
> >>>>>>>>>>>> other
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> queue
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> (second partition). There is another scenario in
> >>>>>>>>>>>> which you
> >>>>>>
> >>>>>>>>>>>> can
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> have
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> only one partition and the shared mac will steer
> >>>>>>>>>>>> the traffic
> >>>>>>
> >>>>>>>>>>>> to
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> usdpaa
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> or Linux. In this case usdpaa wil seed the buffer
> >>>>>>>>>>>> pool of
> >>>>>>
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> FMAN Rx
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> port and the shared mac driver will kmap/kunmap
> >>>>>>>>>>>> for Rx /
> >>>>>>
> >>>>>>>>>>>> Tx
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> side.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> For shared mac please consult the documentation
> >>>>>>>>>>>> provided in
> >>>>>>
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> above
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> link.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Now let's see the dts stuff and your unfunctional
> >>>>>>>>>>>> case.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> For the dts part I will provide you with some code
> >>>>>>>>>>>> snippets,
> >>>>>>
> >>>>>>>>>>>> I
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> am
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> currently using in an existing scenario for ipsec
> >>>>>>>>>>>> offload
> >>>>>>>>>>>> -
> >>>>>>
> >>>>>>>>>>>> on
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> B4
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> platform. (it should not matter the SOC in your
> >>>>>>>>>>>> case)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>               /* ethernet@16 declared as MAC-less
> >>>>>>>>>>>> interface
> >>>>>>
> >>>>>>>>>>>> with
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> no
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> "fsl,fman-mac" property.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                * USDPAA will seed buffers to this
> >>>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>>>>> pool
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> and
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> initialize 8 TX Frame
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                * queues. The ethernet driver will
> >>>>>>>>>>>> initialize
> >>>>>>
> >>>>>>>>>>>> 8
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> RX
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> default Frame queues.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                * On receiving frame at this
> >>>>>>>>>>>> interface, the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> ethernet
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> driver will do
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                * kmap_atomic/kunmap_atomic for
> >>>>>>>>>>>> that frame.
> >>>>>>
> >>>>>>>>>>>> */
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>               ethernet@16 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                       compatible =3D
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> "fsl,b4860-dpa-ethernet-macless",
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> "fsl,dpa-ethernet-macless"; fsl,bman-buffer-pools
> >>>>>>>>>>>> =3D
> >>>>>>
> >>>>>>>>>>>> <&bp16>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                       fsl,qman-frame-queues-rx =3D
> >>>>>>>>>>>> <4000
> >>>>>>>>>>>> 8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                       fsl,qman-frame-queues-tx =3D
> >>>>>>>>>>>> <4008
> >>>>>>>>>>>> 8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                       local-mac-address =3D [00 11
> >>>>>>>>>>>> 22 33 44
> >>>>>>
> >>>>>>>>>>>> 55];
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>               };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>      bp16: buffer-pool@16 {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>              compatible =3D "fsl,b4860-bpool",
> >>>>>>>>>>>> "fsl,bpool";
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>              fsl,bpid =3D <16>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>              fsl,bpool-ethernet-cfg =3D <0 100000 0
> >>>>>>>>>>>> 2000 0
> >>>>>>
> >>>>>>>>>>>> 0>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>              fsl,bpool-thresholds =3D <0x100 0x300
> >>>>>>>>>>>> 0x0
> >>>>>>>>>>>> 0x0>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>      };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Now pay attention to the bold property. The last
> >>>>>>>>>>>> two 0s are
> >>>>>>
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> base
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> physical  address defined for the buffer pool. If
> >>>>>>>>>>>> the base
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> address is
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 0, the macless driver will not seed the pool and
> >>>>>>>>>>>> expects
> >>>>>>
> >>>>>>>>>>>> that
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> someone
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> else does this. (for example usdpaa)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> In your case, if the property is like this, the
> >>>>>>>>>>>> macless
> >>>>>>
> >>>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> pool
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> will not be seeded by kernel. So when you try to
> >>>>>>>>>>>> send
> >>>>>>
> >>>>>>>>>>>> something
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> over
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> this interface the following code will be called:
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> int __hot dpa_shared_tx(struct sk_buff *skb,
> >>>>>>>>>>>> struct
> >>>>>>
> >>>>>>>>>>>> net_device
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> *net_dev) {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> ....
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> rr =3D bman_acquire(dpa_bp->pool, &bmb, 1, 0);
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>         if (unlikely(err <=3D 0)) {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                 percpu_priv->stats.tx_errors++;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                 if (err =3D=3D 0)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                         err =3D -ENOMEM;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                 goto buf_acquire_failed;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>         }
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> ...
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> You can check the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> statistics :
> >>>>>>>>>>>> /sys/class/net/<your_macless>/statistics/tx_errors
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> to
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> validate my sayings.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> So in order to be able to transmit something , the
> >>>>>>>>>>>> buffer
> >>>>>>
> >>>>>>>>>>>> pool
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> macless has, must be seeded. At page 1000, there
> >>>>>>>>>>>> is the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> following
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> figure:
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> [cid:image003.png@01D537EC.5F5FC8A0]
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> To seed the buffer pool by the kernel you must add
> >>>>>>>>>>>> a
> >>>>>>
> >>>>>>>>>>>> physical
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> base
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> address and also the propery:
> >>>>>>>>>>>> fsl,bpool-ethernet-seeds.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> After you will do this, you will no longer see
> >>>>>>>>>>>> errors on
> >>>>>>
> >>>>>>>>>>>> Tx.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> You can
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> quickly check this by looking at the tx_errors
> >>>>>>>>>>>> when you
> >>>>>>
> >>>>>>>>>>>> bring up
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> interface.(there are 7 neighbour solicitation
> >>>>>>>>>>>> packets that
> >>>>>>
> >>>>>>>>>>>> are
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> sent by
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the stack) Further you will have to configure the
> >>>>>>>>>>>> Tx queues,
> >>>>>>
> >>>>>>>>>>>> in
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> the
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> application where you xmit the frames (remember
> >>>>>>>>>>>> that macess
> >>>>>>
> >>>>>>>>>>>> is a
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> pair
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> of Rx / Tx queues)
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> For the shared mac, here is a snippet of  code
> >>>>>>>>>>>> from device
> >>>>>>
> >>>>>>>>>>>> tree
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> (I
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> used it on a LS1046 in a DPDK context): ethernet@4
> >>>>>>>>>>>> {
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                       compatible =3D
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> "fsl,ls1046-dpa-ethernet-shared",
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> "fsl,dpa-ethernet-shared"; fsl,bman-buffer-pools
> >>>>>>>>>>>> =3D
> >>>>>>
> >>>>>>>>>>>> <&bp16>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>                       fsl,qman-frame-queues-rx =3D
> >>>>>>>>>>>> <0x6e 1
> >>>>>>
> >>>>>>>>>>>> 0x6f
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 1
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> 0x2000 3>; fsl,qman-frame-queues-tx =3D <0 1 0 1
> >>>>>>>>>>>> 0x3000
> >>>>>>>>>>>> 8>;
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>               };
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> The buffer pool considerations from macless apply
> >>>>>>>>>>>> also to
> >>>>>>
> >>>>>>>>>>>> shared
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> mac.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> I hope this clarifies a little your scenario.
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Regards,
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>> Radu
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> >>
> >

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/VI1PR04MB40801A942720BCBFDC77F587B0320%40VI1PR04MB4080.eurprd=
04.prod.outlook.com.
