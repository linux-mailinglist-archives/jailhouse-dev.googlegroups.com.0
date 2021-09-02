Return-Path: <jailhouse-dev+bncBDGILGE54ELBBS4VYOEQMGQE4TRN62Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13d.google.com (mail-il1-x13d.google.com [IPv6:2607:f8b0:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278B3FEE3E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Sep 2021 14:59:57 +0200 (CEST)
Received: by mail-il1-x13d.google.com with SMTP id q3-20020a056e0220e300b0022b19efba3esf1105873ilv.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Sep 2021 05:59:57 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630587596; cv=pass;
        d=google.com; s=arc-20160816;
        b=NTBj+Nc2kyxa7d69L/+KTUZHl7GWz6P0ol9x/b9uimuZSYgr2hDHMB/xGytVmiI206
         0VcJS8KGFw3C8ueBYeaqvQghhwvxYQ/fDB8U1YWH01zXNCUnGRWO6l3agX58/gpf0TLI
         1LWxQVnRcMPKwEBaeWiukOzg7NB69c1xpNid6W7LrT/gzK++yQDzKPR8joZMq1Dtx9O5
         lqxv+13z6p8yGc2XbHQ4ReMuRqd6p3pydkXjAs1nUuzLAYnMDad3F3a6btEqwoG7Snng
         FfgeP+aJIovdJ7+ZZIynsYqvVO917V4YGWew0Wn6MJysRlvF8JcL2cGXBhAwd+NTYnG4
         0mYA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=mTkWuyGI4mksLtxM1VvTneHt/pXLYGePKIyuDVa4h7E=;
        b=kmU1aWyWcSxN5eFn/S70ElTxK4wnajXFGxFy7zMS90FapEwhwk3THvFFDL/h4DOsPX
         OWjssbrY0xtS/3piNjZXPnyv67eJ0NCc0K3xs3WIyOtR5fYAZByqWFRJcFvvI6m37TFH
         AUhNdipA8RsTNW9UqEmhqAWGi66s1lGLgK6WqvPpPzyYqr0SrgjPvjdt5gK/cBH9a8I8
         +uhOdNrEOXozewXslSDT14pkFFAPQO1oBGe8fJSOuvAhBub5lmQdq7E98XgC+7F+GDoe
         m/+p+ouX+9gLaZNxUfYgbA7/Y3onWUBeZ/b+F5xWF5KFQjNDYAkCX/ebrsMb9qOEN2r3
         PXUA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=g8EXWCWU;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.4.93 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mTkWuyGI4mksLtxM1VvTneHt/pXLYGePKIyuDVa4h7E=;
        b=F4tMFcNQvGQY2TVvk4S7Albl/oA/mUJHLmKhhIAAkrd3uz98tiQQ0M7myDQWZuh/dD
         qUYvQlmo1miXVMC+ZCnnku/FqVx+OXTk7QHa9ap+8lavESKrhJmmpM/c04w1xWcAF21l
         BbDjVCykmuUNjYu61DZsnWQ6gqdFpZniugaod7paw0/DREPq6DZcZMK1jlnFI/tbOBgq
         kdYg/Kr67vmRRe4hZvhP6Z4lRLcGB6JR6nn99foQS5Of05h+cwjc8byrGkBgmdzDnNmF
         KFa+nifpigAeP3JXkZdEoMydktgWbYyupXogEoguW4V9Y4odZfFx6e/bTUMnGUpsZ6E0
         9r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mTkWuyGI4mksLtxM1VvTneHt/pXLYGePKIyuDVa4h7E=;
        b=RqLgPJd93fQvcsNPkfp4Ojulow5sCWjHyrjyPT9K52PGoK/wtPXSU1m+oseSrxAnBU
         sMUcVUEnMaqpqnRWsDZ49TlWG/mswa1rvE16UG9r3Av6Oa4uWGyO3TRNwnSOlHrTaZG+
         JS4u7neWbPkh8WpJVnaeGbEZffZLBR3dVjYz4F7O6aczaTXDXrqWhopMfdszizlZn0iw
         rOHjIVIEs2LlvN0xM/JC1jk7YBbDcqLVgwEkuFuOta1HLd8NTfa0rM7FA8DaH4E5Xzqy
         maFfn2USxCovWVZzHv21pVzUicVyjSChqwHTL+yDy5wDTG3eCWuLYA5P2FB8j2C+ZKxV
         Tzag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531E+zxjvuKmlsnTx7n91WxC0V6Hc5DsQzhESXpd9ik1qA21N4JN
	vaZhmatIcKQHSkQ6g7NII7E=
X-Google-Smtp-Source: ABdhPJzC5eUfZol0lVwtfwRBPLxvvzEpR6w3fzJFq2m/RI3Mk745Z2+6yUlJYbkYqJ7rf5SsYt/ahw==
X-Received: by 2002:a05:6e02:1906:: with SMTP id w6mr2364059ilu.295.1630587595972;
        Thu, 02 Sep 2021 05:59:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:fa18:: with SMTP id p24ls303629ioh.9.gmail; Thu, 02 Sep
 2021 05:59:55 -0700 (PDT)
X-Received: by 2002:a6b:f904:: with SMTP id j4mr2639402iog.208.1630587595450;
        Thu, 02 Sep 2021 05:59:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630587595; cv=pass;
        d=google.com; s=arc-20160816;
        b=sGaVDUKSTQRyvSHu2jyS9UbDI7pYoT13C2Qz8bk6gxc6JROQu6uKW+9c/WgAIIiTh3
         23itqh9vvD5s5VsZsEPaWmJ17fDaMndSF8n5TfKyE4KKXZbunYbk0wNLSCjhEXms3XGD
         CuoHHPPTOtk7yKHjXll2uxnO3aC7Rvf67LuXmU6B28xptpV8kBUs/Osaxna8X1Y4uK6Z
         Yk/YnXrjwaq2EgilkLt+IMiDh13bJY2d9bE8A8cBSTxLEcySIfVF9cKXGGmSwJuPIDh8
         IQZEbZ3nxxrwmONTpwYZW6USFO3q2hQswCkCA7YOGbb+QzGQ6KDV+e3SxHN2J+1KdMcl
         8SDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=zC5P34YQbbO9lGgdp8yUbelEaUSjC58qcwlUBCF1Rfo=;
        b=M6QuxVfJxuOwYMMfcOgzXfYd37QslTusDVeXBqnHi8dFr5WBZRvForxCIZnyjvdMiv
         IvJsJVYrzHOAN2J2mplZRl3I8F3+YntqzlrDB2Zv1XAe71ZQtK022KLG3i69WbXNjtFh
         XDFNPpgKWvtjmGGOfPbNod+LMF0TC2r5SrtXqWZy/VgrWXTrF24vKUXEeB7WecbbALXl
         n7rNvgMOTc96PQ4w/gpk1I0NsnQVJVns4Qsb9zHbKSneALdQ85sXGdGgNKCeKi6/cX/N
         FoaZzfcKczQXkDK1WObLgKpDPaBwLNc6660BYKAjc2YjyIZXKFhmlM7K7xte3tNFsvK1
         CxyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=g8EXWCWU;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.4.93 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40093.outbound.protection.outlook.com. [40.107.4.93])
        by gmr-mx.google.com with ESMTPS id y129si21662iof.3.2021.09.02.05.59.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Sep 2021 05:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.4.93 as permitted sender) client-ip=40.107.4.93;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h76ECl8IisulzDXFDxS3ZKFxPuP8J8dmQ1jLs70+UnT92XOHztlGYxFoe9SLwdAJG/Qsodq6DvrRbxDr7lD9uFzgwjyFuKq1dQslVfVEjCuX7sz1XVugrWpKfIen+ZPju79Ko3xZQVajaR3pPEVybTeevXr2gvZ7Bk9toavhdU1DayJz84n5nDnT/VCZm/PpG/0bc4E+HyO9lry4lW1F29S5p7mIXw/v7BLDjWZ/fhxsR4rsUsRjlpe2a8a/AUQWDokLxDzF9h9x6zbKwm15m8/eB9CI7dAyGat/JClnADBwA2F6CiwESzn5TcDGNKdg0QkSt3U9c/LgZ9acfdx86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zC5P34YQbbO9lGgdp8yUbelEaUSjC58qcwlUBCF1Rfo=;
 b=JQc2Z7Zr5jYplYFE/06piLVhASJSk+tdxJTFf4dkklMIk9FoXk4p3mh0kmIqbMAqBFFTdKy+9RJpGbitYeSNGxwu74zf1jmPf2PLfIKMOgUBekn6b/51+26NznU06qv34Xnmfed107825kVA24A22OqIDbUGpWYDLgZdTZQZKqH29/UbFBQvqUs5NwDiJ9p1Qo4uWlFAfhzl0v1i7jHD4DMF7uTJS+9s2vKyFEAVBpxumdheUWYnSHlS3Q4FwyWMflEbwbwHqZF5DPJuVNt/eqP194uKBV3aPhY3zjOdDjyGUIjL4mtf2SjU0rrt5Wxo1DLGm4wcyoJxQjed7xvcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 12:59:53 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb%4]) with mapi id 15.20.4478.022; Thu, 2 Sep 2021
 12:59:53 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: FATAL: Invalid PCI config write
Thread-Topic: FATAL: Invalid PCI config write
Thread-Index: Adef+ZADmnbIWFeMQR6b2O8ANYoNIQ==
Date: Thu, 2 Sep 2021 12:59:53 +0000
Message-ID: <AS8PR02MB6663EB3E5EBA4CBBF44D1C1DB6CE9@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a79d2a9e-d631-4535-7522-08d96e118e71
x-ms-traffictypediagnostic: AS8PR02MB7237:
x-microsoft-antispam-prvs: <AS8PR02MB7237900DA548B3317D616E18B6CE9@AS8PR02MB7237.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QDGiEHXJqXTuSMFRw0eQ4N72qQeuwquF+E+ysqHrxguUVcr/7Tz4VG4QRjTT+paSotOR3UUGuZKeFU9dm9N+8CZShdkwYdIvcsT32QEC4jxV7Hz9upya/x+1fuA2KBnRcET7EVoBA6emO8m4UtdSNCVDmt4VwwNAL4BejKq79WEEAf7nEhlHc62oLRFu4JJ3ElMJR3+O5wI5zjCif8VbgT+NnPqHAjczObVriDA7iZL46zCpIowppo8vt1pCDmKPDQgoQsKNVzA4p3hePTkOV27h+fFp8UBE+AtFwujsF3H+aRv95D4z4EaH8ypYTnjwvIC2+hkyw2L7kLWKEL0qwQsqCL7GnNxKY6xrx1c4jpBoa3n+LXZ5c3XqjiXzkru5tt5WGwXU9AFFVcsmMo6PZIsmGFArq5EJ4TaTyvXuiF07QBPmTB81mri73vpw9e353CTl3if3VPoyk102i1Uvma5iG6qp4q0f3a1T+0C/dcitqOXeRXYCMUBA7N/7GoFXP5b8zjp+aCVLLMKGDbm5deRrz+CzRH6u4VajTjY2StXnqqaP2TGGOCInib2d9RAsQP5/voZYm/M/w+jIrkuBqQ2NsxA43kETpCePjUBQrK9LtnR99XdHCMBlFMPCgIHgPzzY76tNVQZSORKJlsQQENZFU9iZhERyvRdZVwAvPTzduA2yYr58EWoUhndcPkvju7ku2eQpp5HM2SHZmnuEEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(6916009)(38100700002)(83380400001)(44832011)(38070700005)(8936002)(52536014)(8676002)(76116006)(66946007)(5660300002)(316002)(33656002)(66446008)(66556008)(66476007)(122000001)(64756008)(71200400001)(86362001)(6506007)(2906002)(55016002)(9686003)(478600001)(186003)(26005)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9/yIFJFE7hyXgBVRazzdWz0Y/9Ut9UBsW11lTDHYLgxk6dH/aCKtpCp2C5eb?=
 =?us-ascii?Q?NRld5lERYFpEgllRtX8r/ADhwJNBzbsMB/ZBVd3RB/njSXzm8HiVPLwJ3lu0?=
 =?us-ascii?Q?pjwFHeM4szvstWHAh/d9O14wyhB2FTEl6Zj+5o+z6IzhB9lUhvViwRAtR2Aa?=
 =?us-ascii?Q?QGMp072N6sdLd+vgC1WkgajFsKDuvx0qax3OOpUSy4YSlwUrA0QGgh/BMLWW?=
 =?us-ascii?Q?PKgub7wYigld0GNicjBSz9kmQ6OGfdoJAWrN++xrn6TF4tOjKehtWL+OQj6e?=
 =?us-ascii?Q?iTmVEfObb9YMd/KFI2siJ2jm8bKv6m4FOAj4YpJmbadbHJo4kYWJKP/nF0vK?=
 =?us-ascii?Q?jAkmR3LmtGGPHu4zoB4vbn9sGBrC5uzWZyTf39Kepq4WWq6SfD1/81i7ZJpI?=
 =?us-ascii?Q?2NPyxl2a063ks3BMn3sYLsLjjC8IyNi8fgBZkmSypdghw8VYtcw5bSmCsMP1?=
 =?us-ascii?Q?JA3ngU+w1J+dMF3kGj1nD/AAxhaCdWdFHpkRspm4ihOyPEA3CgpOyze14yjw?=
 =?us-ascii?Q?Djf5qW2L4Rt5OrFR0JPbDApiDnSnfU0DnGUkt+pjbs32bmGkupmiAQplAAlN?=
 =?us-ascii?Q?3r70nC1NgAlCZlofFuGEoqEyZunKfFMqDnj+AHVfOEmuE+ce9QcN9EpsXV1U?=
 =?us-ascii?Q?hJFNE/2y2seZ+uu91TgX+DdVntd5gxsq0+7/ui2LK06RcQL6ETcyKTYgrdpO?=
 =?us-ascii?Q?Egx96JRPHBP+fl2IphGHRPqVDvYsd7YdXgvA+iWeG3pBsAeqvGsNj2y72wwb?=
 =?us-ascii?Q?a0MbKMsDfyjrcsIFGN6XYuf4uBsPWFIBfgpwpsUugP1bCgtzl+GMWH6RlBtq?=
 =?us-ascii?Q?ZrqIfDjLbBAiaTUZM2PWHNs/g60YvCC/z++QdTOEaeZQRVuq4z4oA5zqMdMo?=
 =?us-ascii?Q?5f8ghjiWXMlD2lc50gyL6apm68Km9v4QfJKmFRbOjmS9T/tVUDcwfk/QGKBn?=
 =?us-ascii?Q?JTQ1VFwoIk+A8ozPda0X9kWhosVkW7+Y/jEWwVCDLg78yF1eWFjpbmzxgHsF?=
 =?us-ascii?Q?SEoOwOO7OBt767nBOrEvapHPRzj7D+g7xz0vhW9HigIIycN6/H/3BlG8gxFs?=
 =?us-ascii?Q?itY40MpXnE8hlQfY/OG0oEnOThCtYcAQivnA6tou21HTM1seiTbsvXAq2yS2?=
 =?us-ascii?Q?aQ46AGONBj5W4a+wN5zB21m3aNQSFnOx18kJQeDmn5Q7LkRRm+hAXE9dwdCM?=
 =?us-ascii?Q?j2tcSNE5bvGswl4okXifLrWs1fELwbkMj/99LANAGtioG7sjR8ghvDfnarR2?=
 =?us-ascii?Q?xJmMSOI774IBqsnTO07nJxW5yRswW1HXMI6xs5P88YmT/GlAnOxHACFxyZox?=
 =?us-ascii?Q?uw2JkSlDUcOAtN4s6Twz5/ZL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79d2a9e-d631-4535-7522-08d96e118e71
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 12:59:53.2328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIiMzMqoRDH36wRmtpa7MD3su8sa2aR1JTWH9v4A52XMHNUHnc0E224Oo/sXtCKl5GtE09Fk2xrIEM7Q6UBp+6dHKQ6XnOz+buszaysWHf3TPlDWWFAdfj5U7gs24pIHYfCC3hPHpBxoAa/DS1j8bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7237
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=g8EXWCWU;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.4.93 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Dear Jailhouse community, 

We are currently running into an issue when using PCIe caps beyond 0x100, e.g.
those in the extended config space.

We want to write to some address, say 0x480. We assign the PCI cap to the
non-root cell as shown below.

> .pci_devices = {
>         /* PCIDevice: 3b:00.0 */
>         {
>                 .type = JAILHOUSE_PCI_TYPE_DEVICE,
>                 .iommu = 5,
>                 .domain = 0x0,
>                 .bdf = 0x3b00,
>                 .bar_mask = {
>                         0xff000000, 0xffffffff, 0xff000000,
>                         0xffffffff, 0x00000000, 0x00000000,
>                 },
>                 .caps_start = 0,
>                 .num_caps = 1,
>                 .num_msi_vectors = 0,
>                 .msi_64bits = 0,
>                 .msi_maskable = 0,
>                 .num_msix_vectors = 0,
>                 .msix_region_size = 0x0,
>                 .msix_address = 0x0,
>         },
> },
> .pci_caps = {
>         {
>                 .id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
>                 .start = 0x480,
>                 .len = 0x80,
>                 .flags = JAILHOUSE_PCICAPS_WRITE
>         },
> },

If we now write to this address, we get: 

> FATAL: Invalid PCI config write, port: 0xcfc, size: 4, address port: 0x843b0080

Even though the address port looks correct. Diving into the hypervisor, the
value of address in hypervisor/pci.c:pci_cfg_write_moderate is 0x80 instead of
0x480. Due to that, it cannot find the cap.

The same happens for reads, however, with no cap these are still performed
apparently.

The wrong address seems to originate from 
hypervisor/arch/x86/pci.c:x86_pci_config_handler, which has the following
snippet:

address = (addr_port_val & PCI_ADDR_REGNUM_MASK) + port 
		- PCI_REG_DATA_PORT;

The extended config space, ie bits [31:24] from addr_port_val are dropped here. 
Hence, no config access can be done from 0x100 onwards.
I think this should be:

address = (addr_port_val & PCI_ADDR_REGNUM_MASK) + port 
		- PCI_REG_DATA_PORT
		+ ((addr_port_val && BITMASK(31,24))>>16);

Is this a bug, or is this intentional and did I misconfigure the PCI extended
capabilities? I can happily submit a patch, but given that PCIe usage is so 
common, I expect I have misconfigured something.

Best regards, 

Bram Hooimeijer

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663EB3E5EBA4CBBF44D1C1DB6CE9%40AS8PR02MB6663.eurprd02.prod.outlook.com.
