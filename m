Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBP7V4WTAMGQE623OMZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79977AF11
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Aug 2023 02:52:17 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id 5b1f17b1804b1-3fe73990c03sf23134855e9.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Aug 2023 17:52:17 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1691974337; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pa7cQY8Swgl6GuQ8bx2R8ptJqqGCURVar6kHbYLj/IB0nRl6uWLX5DC4fI5GTEokpr
         LRm84mNS9HsuC8CpRWVUcheFWH8+Fe54Be2CBJt0b91TDj62RNOeS/TQt/3X5yledhlV
         n+fkq9eL/iOrC/89JHbhVJB36brBCWU+00Bmjep+Dux/URfkphtO4wRKe1/ackHPwDNf
         M6xhO8QcY0GfiVjmVo+JL9XDbMmwHiKPp7hWj881sReFEA53B1Nt2CDvSYB7Li9qTLPB
         uybaMExJVO8Fm4VdfgPDYhYXY98JCmWpd4chEw1uNN3PzhVpYqCkWXu8cL0z2xuz993t
         XaIA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=OTcmuv+tnqDtBHqRTg8nl336ffxpjwCu+sOHufh+EuA=;
        fh=xb1PcDJx9jhH+1R/WRMTNf58iOrl57MDgsyew/We1dU=;
        b=qxmjF9LuBMTGY68Wq1Wz4THLqM1ndqw16PqtMrvpa4rK05MK2ydoJXGh3Asw8Vwdsb
         I6M+lMWbEPenHHOWJMj2R75rAqU9u5Hg3RPYv06mRhBfVe/BrZOZ/YCX/wX3Dcm39WqJ
         H8r5uZYBfnfxwtcuKTzQY2S96xTaVovnl4QApfqnDeGr+FV/7DA03ywaJ162RpMeOyFw
         WQXL+dPPW4Xqy59IIi+NZHepDOFPCx/Com155IL8nZ6QfF6OravewSEDo/jaK4udZniR
         4Exzfy93iLYIqm/LpINnuIP/AOT9eN6wUD460nBG9WNSicKFojTK0YY2FUVv0JKM2fTE
         YzNA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TUNmkN6l;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:7d00::622 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1691974337; x=1692579137;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OTcmuv+tnqDtBHqRTg8nl336ffxpjwCu+sOHufh+EuA=;
        b=dkUsPnOQMQ4Y4BzNlg0BV+/oV7wnNqspuHsDmpWmUqdQH3e/K4bSrU0sLtMEjrKCj3
         8zBaQgI3Hi4VStEDh+YsbKgSfeR4qMcKhbIJKwrUvCKlKNSQph8GohDCS/LfddG8HY6C
         J414gl6Rw/wQq8HxEU/x6bxeDXgsEc82wd+oE7zuaJGsPmhYgJDFOqXCTX5LoI16aaU5
         y/g4fpk1SmKpFcGqfF5sNRJK1cM1PhXB3iEFoHdYMNkkLEWxJItxcTc6Udmg6C1u1j6t
         ZhRBUgtLTJNOaUKuvgJdjBpKjcmx83xeJPx1JgYZXQ72DlZ+b8BBPGOuD7v6F4y3CaXY
         zKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691974337; x=1692579137;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:x-beenthere
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTcmuv+tnqDtBHqRTg8nl336ffxpjwCu+sOHufh+EuA=;
        b=l4sjU0AlKY4KTJvTnj38pewW/WB0oS5gVK4Mru2hUB9QZHIbBIjH9KWm200kDX2WfE
         YOJsxo8T0uysQDMG37QmPd9VVdl+ZJsygkohalG74Nna1RWWvV921tmlzWPYp0T/ttMG
         ZBB3mAL+4DsRNFLR0z8tuc65xn5R8IgrtqgEbG8+elRwD2u2q3k7cgD7FfuwCdPFFSE2
         PJxlED/Rw18TBQooSL5u4lc/jPFaWfP3+YpHJdg3+19QI/S9RGk8IDA+NODf0OXQzoMX
         SQnCdevO/TW4KpTpVk/DUP0xMzjp9kXkEkJWU7kFTxpaVWQyN4OEz/z5lx/vSUNvhCll
         n+bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwY1PeoDQK9HeUiVBF9tppL8h/EuzOZ6mjNwqfHmktBCrWHdJge
	Cy2oOE75H3xtvgs3ZZzaMxA=
X-Google-Smtp-Source: AGHT+IGMshNAjbLCjlbpbRDjO6W4e0aMvH6QugSLG1iXUUtNcMYOnXiiBBi/UViDbOduc6cHD8QWcw==
X-Received: by 2002:a05:600c:260d:b0:3f9:c0f2:e1a4 with SMTP id h13-20020a05600c260d00b003f9c0f2e1a4mr6253305wma.34.1691974336070;
        Sun, 13 Aug 2023 17:52:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d02:b0:3fe:16c0:5bf5 with SMTP id
 l2-20020a05600c1d0200b003fe16c05bf5ls1478221wms.0.-pod-prod-08-eu; Sun, 13
 Aug 2023 17:52:13 -0700 (PDT)
X-Received: by 2002:a5d:410e:0:b0:317:6846:2344 with SMTP id l14-20020a5d410e000000b0031768462344mr6054937wrp.34.1691974333660;
        Sun, 13 Aug 2023 17:52:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1691974333; cv=pass;
        d=google.com; s=arc-20160816;
        b=r1XDTKnrWm4cO6uTik7alTTs0qpadMxyTBqEvxWMSYt70shuQyjmJLoFdWjBYA0lP3
         7P+jwd8o0qghXE5iIoyLDgUqLUevKcXVTX9bpnJUy4XhYjMCsIH8IiIfkYy2a4IKdC6y
         El1oCSGogFI4KwCeskRxJinKmXWh6C+1s2aSsw7wTef60t8cPulP9WOYLymC1EXjmHuS
         3U3ZiAfNaIeL1RAdnkDHpr9It8a65e8ipte4m/wC57VfIURbdAx+szGhW6TU66IrhHDB
         6/uRHhxUd2vpJuKl5o7Be6eF7AEvk87e0e79gi8s45qN38ADydR5mjeZAx1TKbOH1Zj9
         lfPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=7eerqVGjJAhJYsCkWhCw2ws+Q1Y10dRKZOIHOJHKEv4=;
        fh=xb1PcDJx9jhH+1R/WRMTNf58iOrl57MDgsyew/We1dU=;
        b=BIW7qieINeC4PlLZlFd7eXpglSM3TvRTz/O80RZX4sWvszpbI0oVnkQySVuUC5u/LB
         qpBcCpi062sRR89F9hf46IVXP/92lgJdBi1xsqO/kn+VitVlPx8n29GDktSrCzRoslQZ
         7bWqogIa7NHZH9i4ofbZ2sE2eI7RYvFWZAjQvDVixmBWb8Zse5tZQyhJjFGWFR7Mbsd8
         2D8rQvsL5wTEEjD6Vwzi9hTsK3EDnjSfxnoKRb+UeY+lYp+LLXmrQpEYb4Wx0rbHXxoE
         sHG1eXP1+2XKQ3HioyhGyotqUFNNTQRCfCyjH9PA8/TalayVI4SdbsoD1DdZ1rI4m/zW
         ABGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TUNmkN6l;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:7d00::622 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20622.outbound.protection.outlook.com. [2a01:111:f400:7d00::622])
        by gmr-mx.google.com with ESMTPS id k8-20020adfd228000000b0031596f8eeebsi834869wrh.7.2023.08.13.17.52.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Aug 2023 17:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:7d00::622 as permitted sender) client-ip=2a01:111:f400:7d00::622;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/5wQrJ6YKeVMTAFSi0OucKr+WJQGHHxyrF0t/XEAdM9GMd/bdk/1KU0oGCMRUHcgfrW5IWnh1dmdFlTtX6l3x8o5AwhybhfFFJMiiVbYVkdySIb5ptv9QExmas5LGwyFBjIA21+mSRy7HxUyfNX4OJM4j9GJmaLWF9TURBBTotqIJaoBHszL7kOOwd4OtYgt3rKU+f3shwawLOoR+JPhAcqlNv8tfRwK6L/GmSU4ytBhOaSj6r6rDNA9lT6/eiSZwZ+QJgtJSxPh0eJiTYkn+aHNj8UlvvCGhwZCZf4qdm+oeUUByalzCHUK52CzrckLKhUrl4msHcFrJFN25f3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eerqVGjJAhJYsCkWhCw2ws+Q1Y10dRKZOIHOJHKEv4=;
 b=Ga7cY9E+eyua3xtJAq0V1BS//XClvPPkzB3RsdEmzTtZ587CcwPXPTpRH8nqaMN3IEltPEn/EjmYnQHq90zDz7S9IWI6jWt+5pq/EpugGcyagqtTjaXlUi6uJRVUtNnytqp75GuO8v/rZLhH8UWU1H6HwFZR8xFyq5kumqJbBrnX3K/4+Ecineeb9yu4cWaqLQp3RDGM5m6g4XBdWmusNiySPqve26+t7wLYZNpyJpT7ZYC9W2oBYDJNaF/W/ghwdWWBWRmVr4JmAKZ7RMj8UX88Te+fNMegVrUhMANiA6PAyGzCmhXcdqwgQ94Nk5IglDeqSLoJRHaGTB81r+Mz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8639.eurprd04.prod.outlook.com (2603:10a6:102:21e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 00:52:11 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2b3:d8de:95c8:b28b]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2b3:d8de:95c8:b28b%3]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 00:52:11 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bharathiraja Nallathambi <bharathivlsi08@gmail.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: jailhouse - Linux demo on imx8mm (IOT-GATE-iMX8 - Industrial IoT
 Gateway)
Thread-Topic: jailhouse - Linux demo on imx8mm (IOT-GATE-iMX8 - Industrial IoT
 Gateway)
Thread-Index: AQHZyzwzNUhJGzlGpESf/zNKYJKpn6/o/IbQ
Date: Mon, 14 Aug 2023 00:52:11 +0000
Message-ID: <DU0PR04MB94174AF5A7AB203146DCE2138817A@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <CAGA=GbyPEO8Z9bAgpfRaAaFAg2sqHuvfEzCbCNCUguag4-Nfsg@mail.gmail.com>
 <CAGA=Gbz2Ex86ay715NTjSCDYhqAeOgfO+PemStDzjNOoS+8NWw@mail.gmail.com>
 <CAGA=GbzySq2VRdiufBc2oc3rJDhgPq4q1iky3hpmmhOAD62N8g@mail.gmail.com>
 <CAOx58ZZ3RzsGxDjTys_yoK1d96+dTUgB2aAVVhnegyEWnr5rgQ@mail.gmail.com>
In-Reply-To: <CAOx58ZZ3RzsGxDjTys_yoK1d96+dTUgB2aAVVhnegyEWnr5rgQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB8639:EE_
x-ms-office365-filtering-correlation-id: f705d2cd-e719-460f-fa03-08db9c60b1e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pw3KiySQACbivnYhVu6Q1twCFhWl5k07EN0gJ0MMCvHsk5JetZYhNtYU3It3NBBTD4VVD/cPdN/V8RNi93QJj1/VAnp2IJ8mB1Ag1E6rkOLdY4Zpn51x7NHs+KasiedhIqYQIQZYklrJSo20qkFzpmxSzYyORdr2oCExiUAsH148yzuE4+Ho+mbfMnaAunaIscLaDQJo0PBffdJ2VXQbELXy4u/enOOnaCQPcmGlhm1JjkcUvpP58EvOgq1KPleqwU+nhJheyYk+AQ/UkCJ9l9wkkD6IyAiZ7PaSscuYoNs/UBw3fx5gLQdxK+EdBYOezmIr03zp4NGkZXwZz9EazmoJVAmU8HmKy+Dsu2gz+A8qUgNdsnPZU4hnryvrLGYzJ2u/xw05MNNU6AOIlA/tfmtmeyxtyw98f06TuF+TAvNDaJ089UX+xSuC1UxGKpDGgpzrzjDtDugrACQ3N30CRvbqqKyrLrFSvF0NDv/eNP1Ic/sidJ+H0cMyJaALGAkIMgls7PIO/aRgSdBGrEbTUfB7e0Xf+TrAUXGGL2zS/9Z9Zk+Z/F690f59r1l58Zp4onwnXv1p9WUVG/S/rae1uMJRnaKSJSvMIRW2Q/7gZM5c5h93+3CfmSxiNNZfxJy9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(186006)(1800799006)(451199021)(33656002)(83380400001)(66899021)(86362001)(55016003)(38100700002)(41300700001)(110136005)(478600001)(38070700005)(66946007)(66446008)(66476007)(66556008)(64756008)(76116006)(316002)(122000001)(9686003)(8676002)(8936002)(52536014)(166002)(5660300002)(966005)(44832011)(26005)(7696005)(6506007)(2906002)(71200400001)(53546011)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZWNQZ1pxTklnSHpkRkJBTE02ZDJ4UDkyM1luekNTY1FuNmZhalZHbFVzbk5O?=
 =?gb2312?B?Z3VycGY1NXBZQVVOWG5DYm5vbEg3cmpTTUkyVjhVRGRINjIvNzhyTVZib3gv?=
 =?gb2312?B?M2tvWkE0OVdXeW5hTng4TVJ5dk9HT29HU0xkVHdrNTJlSXdhSGtXOXNha253?=
 =?gb2312?B?UzZhMlRKWVF6SXRjdExNcGNuR0VSb29Mc1hRR0c0WmYwa2FLcWo2a05oSkU3?=
 =?gb2312?B?bmM1SjZ4SGJ6QitIVzQ4eXNWOUdQSURjL0REY1lhc0VjclI3MlcwVmRQWnFi?=
 =?gb2312?B?M2FLc0hRYUg4ZDNzUlNQaG5jYVhCNkRMZWJ2QmVjakNBODhtTGxvOGhXaGFt?=
 =?gb2312?B?SGh1TXFVTFpUN2YvM2JYZDBSYXB2VklDQURPa3pUTDBrLytpV01ibjQ1SDhT?=
 =?gb2312?B?M1N6SW1HSWtZMFBqaTJIOWw3cUVrZXJsaW15RmdLU282Wk43enNkR0hxUG5G?=
 =?gb2312?B?cFlSeG1sTi9UT2JUYjgyYzRwcWpPdnN2d2xud0ZjVDNMRGthTzM0SUxUbGkr?=
 =?gb2312?B?RE5mYjJKQy9HVU9hY2lKNWVHNUZMU3lRTkYwN2lUYzV2QXgvQ3VlcExiT0VB?=
 =?gb2312?B?dTMwZnhScTdSOGVSbFV0VzM3UE9vSFdCVXR0dXdpT0lpQkpqRDYyRm9PYThw?=
 =?gb2312?B?cy9ESFRVd2x4SnBzaVVkS0RCTVNmaUJYTnFTU0x4eW5vS0RBQmo0alhscUc0?=
 =?gb2312?B?M1dTNXQ1MDJqS2hCK3VicjFiQmpqMkMzVFptdnZZWUx1QUI5S3dlMmdrZ05E?=
 =?gb2312?B?SVpsNjgyenN3TXoxZXlQVUlHcy9Qa0RTNmt5VitEdXJiMzR1cUZ3M0V5OGtn?=
 =?gb2312?B?YU5ucFdsUnBGZEJEdDdnUTNmSkp1RGNJSmdOLzNlN0EzaG00Y3ZwRFZhZWl4?=
 =?gb2312?B?ODhzVkMvUlJvaGRTcE8xdThGdkJEbktZMGZWWDJPaTUrek9TdU1IL2RFNjRu?=
 =?gb2312?B?bmV4UzZzYXBRRFJHT0ZnWXQ2NFZYbEpvb2M0MmlRSHNlSVdDOU9xeDVEdWdr?=
 =?gb2312?B?L1BQWkY4WXJ5ckR2ZFkwbGFka1JsN1ozcGZwTzZkcC91VzRYcGxhRDMxL1ND?=
 =?gb2312?B?dDBmNzREMXVjcFRRV3VaMFR4Sm5ZSjlRVTdXaWZGRE9Ndk8zRFE2TmlqeDZE?=
 =?gb2312?B?MCt0ZGtwdzdvK2g0TFdiOTVZajM1cThJc1U4dDhtdklXQ0ZXM3RBYm1wUkxR?=
 =?gb2312?B?QXpkZ2IrRXpabWpaU3VoSVlINGN4VlFGeWFpRHMyZUJmY3YweURaeGVVVjJO?=
 =?gb2312?B?aVoraDdrNVpJa3JIVG9vaE1xejhWak95czVHWG13eDhJdU5LYktETkp5UmFs?=
 =?gb2312?B?c01wUTltMmJiSUhxZTdadUxNVTRjeUUvRml3d1hlQUZuRmdyMHZWMWVwREJk?=
 =?gb2312?B?SkkzSlJoQ0toVXl1TVNCTEYwVEJqZ3hLckd0emtpZHRGTDBPdDVLWm1hK3VB?=
 =?gb2312?B?TTN4RGZpSm5sNzRhYkFXaFR6ZFhPMXBrSVhWV0Fic1RnNEJXQ1c5eUt4cTRq?=
 =?gb2312?B?dVJsNG9lM25rZ0ZTSTJDaDU1VGZHQmNxMUFVOW1zMkVMNnlYVUpweDRhZTZy?=
 =?gb2312?B?SkxXeE13Y2JlT2gwYlk2VXBnV2tKUFRaellmWDZrdjROWDF3VW90REdHWjdM?=
 =?gb2312?B?amkzSVJ5Q0dCby9sRUNTNU5JRGx6QzFhWUJmam9IekJwN1FZN0VuMGNwaUNa?=
 =?gb2312?B?aHBMNC8wSlRkYWFhODhCbmZtUjVaQUl2cmJoRC9TZEUvbUFFdnBMYkdybzhK?=
 =?gb2312?B?MS8yUmN6S01mcnpDakNxRWtQL01xVDVGT29VMUNDVktzNnNxbVdySEkrMVUv?=
 =?gb2312?B?cVJaYXJyV2QzdjV4NkJMOEhtbm9LSFNxNHhIeHFWOWV5MHY2Z0o4SlFLSHpl?=
 =?gb2312?B?MFVYd1RMUUFNQkp6NHZWelZ1eWJlWW5JeUZrQndvOVA2WVBrTkhrQUwrc3M0?=
 =?gb2312?B?UmI5SGlnOHZ3N3VwaU02amdVcjMyT0VXQTI2WUtiZ2svTjVUTUp4ZUUrWE1D?=
 =?gb2312?B?ZnRMSFFSMmcrYVZEUmxPMWxyZkR5ZmdLYjJsQ2ZVQkpzTkV1RnVkcGJRV1FC?=
 =?gb2312?B?SFpDS2N5NVdTa3RQRkNjQUMwbkpId0cxcWhMQjFkbnlJdTJibzN5VEJYc0E5?=
 =?gb2312?Q?kJd4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU0PR04MB94174AF5A7AB203146DCE2138817ADU0PR04MB9417eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f705d2cd-e719-460f-fa03-08db9c60b1e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 00:52:11.8070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bm5orn6EaoC9SPxWLcJFIPV+FJipdUKNmSPqMxKMCTqOrNPbdPFZ4rGnC5XGOZ3i2zUu5obHlhzkvZfe69B9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8639
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=TUNmkN6l;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:7d00::622 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

--_000_DU0PR04MB94174AF5A7AB203146DCE2138817ADU0PR04MB9417eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Have you ever tried a simple inmate demo? Like gic-demo? Does it work?

Regards,
Peng.

From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> On Be=
half Of Bharathiraja Nallathambi
Sent: 2023=E5=B9=B48=E6=9C=8810=E6=97=A5 11:39
To: jailhouse-dev@googlegroups.com
Subject: jailhouse - Linux demo on imx8mm (IOT-GATE-iMX8 - Industrial IoT G=
ateway)

Hi,
  As my previous post is marked as spam, i am posting this from my differen=
t mail ID.

I am trying to run jailhouse Linux demo on imx8mm board (https://www.compul=
ab.com/products/iot-gateways/iot-gate-imx8-industrial-arm-iot-gateway/)

After the dts patch and kernel re-build, I am able to run the jailhouse inm=
ate demo (gic-demo.bin) without any issues.

When i tried to run jailhouse Linux demo on imx8mm board, i face the follow=
ing challenge,

#Enable Jailhouse:
export PATH=3D$PATH:/usr/share/jailhouse/tools
insmod /lib/modules/5.15.32-iot-gate-imx8m-3.2.1+/extra/driver/jailhouse.ko
jailhouse enable /usr/share/jailhouse/cells/imx8mm.cell
jailhouse cell list

#try to run Linux
jailhouse cell linux imx8mm-linux-demo.cell /home/root/jailhouse/vmlinux -d=
 /home/root/jailhouse/sb-iotgimx8.dtb -c "clk_ignore_unused console=3Dttymx=
c2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifnames=3D0 root=3D/dev=
/sda2 rootwait rw"

imx8mm-linux-demo.cell - file attached for reference
sb-iotgimx8.dts - file attached for reference

#jailhouse console output
root@iot-gate-imx8:~/jailhouse# jailhouse console

Initializing Jailhouse hypervisor v0.2 on CPU 0
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/993, remap 0/131072
Initializing processors:
 CPU 0... OK
 CPU 3... OK
 CPU 1... OK
 CPU 2... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:02.0 to cell "imx8mm"
Adding virtual PCI device 00:03.0 to cell "imx8mm"
Adding virtual PCI device 00:00.0 to cell "imx8mm"
Adding virtual PCI device 00:01.0 to cell "imx8mm"
Page pool usage after late setup: mem 63/993, remap 144/131072
Activating hypervisor
Adding virtual PCI device 00:02.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Adding virtual PCI device 00:03.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Created cell "linux-inmate-demo"
Page pool usage after cell creation: mem 77/993, remap 144/131072

#jailhouse cell list output
#root@iot-gate-imx8:~/jailhouse# jailhouse cell list
ID      Name                    State             Assigned CPUs           F=
ailed CPUs
0       imx8mm                  running           0-1
1       linux-inmate-demo       shut down         2-3

#/proc/cmdline
console=3Dttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifnames=
=3D0 root=3D/dev/mmcblk2p2 rootwait rw panic=3D5 oops=3Dpanic

#/proc/iomem
root@iot-gate-imx8:~/jailhouse# cat /proc/iomem
00100000-00107fff : 30900000.crypto caam-sm@100000
18000000-1fefffff : pcie@33800000
  18000000-180fffff : 0000:00:00.0
  18100000-181fffff : PCI Bus 0000:01
    18100000-18103fff : 0000:01:00.0
      18100000-18103fff : iwlwifi
  18200000-1820ffff : 0000:00:00.0
1ff00000-1ff7ffff : 33800000.pcie config
30200000-3020ffff : 30200000.gpio gpio@30200000
30210000-3021ffff : 30210000.gpio gpio@30210000
30220000-3022ffff : 30220000.gpio gpio@30220000
30230000-3023ffff : 30230000.gpio gpio@30230000
30240000-3024ffff : 30240000.gpio gpio@30240000
30260000-3026ffff : 30260000.tmu tmu@30260000
30280000-3028ffff : 30280000.watchdog watchdog@30280000
302b0000-302bffff : 302b0000.dma-controller dma-controller@302b0000
302c0000-302cffff : 302c0000.dma-controller dma-controller@302c0000
30330000-3033ffff : 30330000.pinctrl pinctrl@30330000
30350000-3035ffff : 30350000.efuse efuse@30350000
30380000-3038ffff : 30380000.clock-controller clock-controller@30380000
30820000-3082ffff : 30820000.spi spi@30820000
30860000-3086ffff : 30860000.serial serial@30860000
30880000-3088ffff : 30880000.serial serial@30880000
30900000-3093ffff : 30900000.crypto crypto@30900000
30a20000-30a2ffff : 30a20000.i2c i2c@30a20000
30a30000-30a3ffff : 30a30000.i2c i2c@30a30000
30a60000-30a6ffff : 30a60000.serial serial@30a60000
30aa0000-30aaffff : 30aa0000.mailbox mailbox@30aa0000
30b50000-30b5ffff : 30b50000.mmc mmc@30b50000
30b60000-30b6ffff : 30b60000.mmc mmc@30b60000
30bd0000-30bdffff : 30bd0000.dma-controller dma-controller@30bd0000
30be0000-30beffff : 30be0000.ethernet ethernet@30be0000
32e28000-32e28003 : 32e28000.dispmix-sft-rstn dispmix-sft-rstn@32e28000
32e28004-32e28007 : 32e28004.dispmix-clk-en dispmix-clk-en@32e28004
32e28008-32e2800b : 32e28008.dispmix-mipi-rst dispmix-mipi-rst@32e28008
32e40000-32e401ff : usb@32e40000
  32e40000-32e401ff : ci_hdrc.0 usb@32e40000
32e40200-32e403ff : 32e40200.usbmisc usbmisc@32e40200
32e50000-32e501ff : usb@32e50000
  32e50000-32e501ff : ci_hdrc.1 usb@32e50000
32e50200-32e503ff : 32e50200.usbmisc usbmisc@32e50200
32f00000-32f0ffff : 33800000.pcie pcie-phy@32f00000
33000000-33001fff : 33000000.dma-controller dma-controller@33000000
33800000-33bfffff : 33800000.pcie dbi
3d800000-3dbfffff : 3d800000.ddr-pmu ddr-pmu@3d800000
40000000-55ffffff : System RAM
  40610000-41ceffff : Kernel code
  41cf0000-4206ffff : reserved
  42070000-423bffff : Kernel data
  43000000-4300afff : reserved
58000000-93bfffff : System RAM
  6a000000-91ffffff : reserved
93c00000-b83fffff : reserved
  b7c00000-b7ffffff : Jailhouse hypervisor
b8400000-bb6fffff : System RAM
bb700000-bbbfffff : reserved
bbc00000-bfffffff : System RAM
  bd900000-bfbfffff : reserved
  bfc6d000-bfc6dfff : reserved
  bfc6e000-bfce5fff : reserved
  bfce8000-bfce9fff : reserved
  bfcea000-bfceafff : reserved
  bfceb000-bfcfefff : reserved
  bfcff000-bfcfffff : reserved
  bfd00000-bfd35fff : reserved
  bfd36000-bfffffff : reserved


#dts patch

From aaee5eb45ada7121c7c34af7049c0db11ea2b572 Mon Sep 17 00:00:00 2001
From: Bharathiraja Nallathambi <bharathiraja.nallathambi@xxxxxx.com<mailto:=
bharathiraja.nallathambi@xxxxxx.com>>
Date: Mon, 31 Jul 2023 17:14:42 +0000
Subject: [PATCH] adding reserved memory for jailhouse

- adding reserved memory for jailhouse imx8mm

Signed-off-by: Bharathiraja Nallathambi <bharathiraja.nallathambi@xxxxxx.co=
m<mailto:bharathiraja.nallathambi@xxxxxx.com>>
---
 arch/arm64/boot/dts/compulab/sb-iotgimx8.dts | 38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts b/arch/arm64/boot=
/dts/compulab/sb-iotgimx8.dts
index 08de87e55d0b..6539aa8c83f6 100644
--- a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
+++ b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
@@ -315,3 +315,41 @@ MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20 0x140
  };
  };
 };
+
+&{/reserved-memory} {
+
+ ivshmem_reserved: ivshmem@bbb00000 {
+ no-map;
+ reg =3D <0 0xbbb00000 0x0 0x00100000>;
+ };
+
+ ivshmem2_reserved: ivshmem2@bba00000 {
+ no-map;
+ reg =3D <0 0xbba00000 0x0 0x00100000>;
+ };
+
+ pci_reserved: pci@bb800000 {
+ no-map;
+ reg =3D <0 0xbb800000 0x0 0x00200000>;
+ };
+
+ loader_reserved: loader@bb700000 {
+ no-map;
+ reg =3D <0 0xbb700000 0x0 0x00100000>;
+ };
+
+ jh_reserved: jh@b7c00000 {
+ no-map;
+ reg =3D <0 0xb7c00000 0x0 0x00400000>;
+ };
+
+ /* 512MB */
+ inmate_reserved: inmate@93c00000 {
+ no-map;
+ reg =3D <0 0x93c00000 0x0 0x24000000>;
+ };
+};
+
+&{/reserved-memory/linux,cma} {
+ alloc-ranges =3D <0 0x40000000 0 0x60000000>;
+};
--
2.34.1


There is no console output. The terminal froze.

Can someone help me here please.


--
Thanks and Regards,
Bharathiraja Nallathambi


--
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com<mailto:jailhouse-dev+uns=
ubscribe@googlegroups.com>.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAOx58ZZ3RzsGxDjTys_yoK1d96%2BdTUgB2aAVVhnegyEWnr5rgQ%40mail.=
gmail.com<https://groups.google.com/d/msgid/jailhouse-dev/CAOx58ZZ3RzsGxDjT=
ys_yoK1d96%2BdTUgB2aAVVhnegyEWnr5rgQ%40mail.gmail.com?utm_medium=3Demail&ut=
m_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DU0PR04MB94174AF5A7AB203146DCE2138817A%40DU0PR04MB9417.eurprd=
04.prod.outlook.com.

--_000_DU0PR04MB94174AF5A7AB203146DCE2138817ADU0PR04MB9417eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.gmailsignatureprefix
	{mso-style-name:gmail_signature_prefix;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Have you ever tried a simple inmate demo? Like gic-d=
emo? Does it work?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Peng.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> jailhouse-dev@googlegroups.com &lt;jail=
house-dev@googlegroups.com&gt;
<b>On Behalf Of </b>Bharathiraja Nallathambi<br>
<b>Sent:</b> 2023<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E5=B9=
=B4</span>8<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=9C=88</spa=
n>10<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=97=A5</span> 11:3=
9<br>
<b>To:</b> jailhouse-dev@googlegroups.com<br>
<b>Subject:</b> jailhouse - Linux demo on imx8mm (IOT-GATE-iMX8 - Industria=
l IoT Gateway)<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal">&nbsp; As my previous post is marked as spam, i am p=
osting this from my different mail ID.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I am trying to run jailhouse Linux demo on imx8mm bo=
ard (<a href=3D"https://www.compulab.com/products/iot-gateways/iot-gate-imx=
8-industrial-arm-iot-gateway/" target=3D"_blank">https://www.compulab.com/p=
roducts/iot-gateways/iot-gate-imx8-industrial-arm-iot-gateway/</a>)<o:p></o=
:p></p>
<div>
<p class=3D"MsoNormal">&nbsp; <br>
After the dts patch and kernel re-build, I am able to run the jailhouse inm=
ate demo (gic-demo.bin) without any issues.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; <br>
When i tried to run jailhouse Linux demo on imx8mm board, i face the follow=
ing challenge,<br>
<br>
#Enable Jailhouse: &nbsp;<br>
export PATH=3D$PATH:/usr/share/jailhouse/tools<br>
insmod /lib/modules/5.15.32-iot-gate-imx8m-3.2.1+/extra/driver/jailhouse.ko=
 <br>
jailhouse enable /usr/share/jailhouse/cells/imx8mm.cell <br>
jailhouse cell list<br>
<br>
#try to run Linux<br>
jailhouse cell linux imx8mm-linux-demo.cell /home/root/jailhouse/vmlinux -d=
 /home/root/jailhouse/sb-iotgimx8.dtb -c &quot;clk_ignore_unused console=3D=
ttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifnames=3D0 root=
=3D/dev/sda2 rootwait rw&quot;<br>
<br>
imx8mm-linux-demo.cell - file attached for reference<br>
sb-iotgimx8.dts - file attached for reference<br>
<br>
#jailhouse console output<br>
root@iot-gate-imx8:~/jailhouse# jailhouse console<br>
<br>
Initializing Jailhouse hypervisor v0.2 on CPU 0<br>
Code location: 0x0000ffffc0200800<br>
Page pool usage after early setup: mem 39/993, remap 0/131072<br>
Initializing processors:<br>
&nbsp;CPU 0... OK<br>
&nbsp;CPU 3... OK<br>
&nbsp;CPU 1... OK<br>
&nbsp;CPU 2... OK<br>
Initializing unit: irqchip<br>
Initializing unit: ARM SMMU v3<br>
Initializing unit: ARM SMMU<br>
Initializing unit: PVU IOMMU<br>
Initializing unit: PCI<br>
Adding virtual PCI device 00:02.0 to cell &quot;imx8mm&quot;<br>
Adding virtual PCI device 00:03.0 to cell &quot;imx8mm&quot;<br>
Adding virtual PCI device 00:00.0 to cell &quot;imx8mm&quot;<br>
Adding virtual PCI device 00:01.0 to cell &quot;imx8mm&quot;<br>
Page pool usage after late setup: mem 63/993, remap 144/131072<br>
Activating hypervisor<br>
Adding virtual PCI device 00:02.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
&nbsp;&quot;imx8mm&quot;<br>
Adding virtual PCI device 00:03.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
&nbsp;&quot;imx8mm&quot;<br>
Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
&nbsp;&quot;imx8mm&quot;<br>
Adding virtual PCI device 00:01.0 to cell &quot;linux-inmate-demo&quot;<br>
Shared memory connection established, peer cells:<br>
&nbsp;&quot;imx8mm&quot;<br>
Created cell &quot;linux-inmate-demo&quot;<br>
Page pool usage after cell creation: mem 77/993, remap 144/131072<br>
<br>
#jailhouse cell list output<br>
#root@iot-gate-imx8:~/jailhouse# jailhouse cell list<br>
ID &nbsp; &nbsp; &nbsp;Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;State &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assig=
ned CPUs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Failed CPUs &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
<br>
0 &nbsp; &nbsp; &nbsp; imx8mm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;running &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0-1 &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<br>
1 &nbsp; &nbsp; &nbsp; linux-inmate-demo &nbsp; &nbsp; &nbsp; shut down &nb=
sp; &nbsp; &nbsp; &nbsp; 2-3 <br>
<br>
#/proc/cmdline<br>
console=3Dttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,115200 net.ifnames=
=3D0 root=3D/dev/mmcblk2p2 rootwait rw panic=3D5 oops=3Dpanic<br>
<br>
#/proc/iomem<br>
root@iot-gate-imx8:~/jailhouse# cat /proc/iomem <br>
00100000-00107fff : 30900000.crypto caam-sm@100000<br>
18000000-1fefffff : pcie@33800000<br>
&nbsp; 18000000-180fffff : 0000:00:00.0<br>
&nbsp; 18100000-181fffff : PCI Bus 0000:01<br>
&nbsp; &nbsp; 18100000-18103fff : 0000:01:00.0<br>
&nbsp; &nbsp; &nbsp; 18100000-18103fff : iwlwifi<br>
&nbsp; 18200000-1820ffff : 0000:00:00.0<br>
1ff00000-1ff7ffff : 33800000.pcie config<br>
30200000-3020ffff : 30200000.gpio gpio@30200000<br>
30210000-3021ffff : 30210000.gpio gpio@30210000<br>
30220000-3022ffff : 30220000.gpio gpio@30220000<br>
30230000-3023ffff : 30230000.gpio gpio@30230000<br>
30240000-3024ffff : 30240000.gpio gpio@30240000<br>
30260000-3026ffff : 30260000.tmu tmu@30260000<br>
30280000-3028ffff : 30280000.watchdog watchdog@30280000<br>
302b0000-302bffff : 302b0000.dma-controller dma-controller@302b0000<br>
302c0000-302cffff : 302c0000.dma-controller dma-controller@302c0000<br>
30330000-3033ffff : 30330000.pinctrl pinctrl@30330000<br>
30350000-3035ffff : 30350000.efuse efuse@30350000<br>
30380000-3038ffff : 30380000.clock-controller clock-controller@30380000<br>
30820000-3082ffff : 30820000.spi spi@30820000<br>
30860000-3086ffff : 30860000.serial serial@30860000<br>
30880000-3088ffff : 30880000.serial serial@30880000<br>
30900000-3093ffff : 30900000.crypto crypto@30900000<br>
30a20000-30a2ffff : 30a20000.i2c i2c@30a20000<br>
30a30000-30a3ffff : 30a30000.i2c i2c@30a30000<br>
30a60000-30a6ffff : 30a60000.serial serial@30a60000<br>
30aa0000-30aaffff : 30aa0000.mailbox mailbox@30aa0000<br>
30b50000-30b5ffff : 30b50000.mmc mmc@30b50000<br>
30b60000-30b6ffff : 30b60000.mmc mmc@30b60000<br>
30bd0000-30bdffff : 30bd0000.dma-controller dma-controller@30bd0000<br>
30be0000-30beffff : 30be0000.ethernet ethernet@30be0000<br>
32e28000-32e28003 : 32e28000.dispmix-sft-rstn dispmix-sft-rstn@32e28000<br>
32e28004-32e28007 : 32e28004.dispmix-clk-en dispmix-clk-en@32e28004<br>
32e28008-32e2800b : 32e28008.dispmix-mipi-rst dispmix-mipi-rst@32e28008<br>
32e40000-32e401ff : usb@32e40000<br>
&nbsp; 32e40000-32e401ff : ci_hdrc.0 usb@32e40000<br>
32e40200-32e403ff : 32e40200.usbmisc usbmisc@32e40200<br>
32e50000-32e501ff : usb@32e50000<br>
&nbsp; 32e50000-32e501ff : ci_hdrc.1 usb@32e50000<br>
32e50200-32e503ff : 32e50200.usbmisc usbmisc@32e50200<br>
32f00000-32f0ffff : 33800000.pcie pcie-phy@32f00000<br>
33000000-33001fff : 33000000.dma-controller dma-controller@33000000<br>
33800000-33bfffff : 33800000.pcie dbi<br>
3d800000-3dbfffff : 3d800000.ddr-pmu ddr-pmu@3d800000<br>
40000000-55ffffff : System RAM<br>
&nbsp; 40610000-41ceffff : Kernel code<br>
&nbsp; 41cf0000-4206ffff : reserved<br>
&nbsp; 42070000-423bffff : Kernel data<br>
&nbsp; 43000000-4300afff : reserved<br>
58000000-93bfffff : System RAM<br>
&nbsp; 6a000000-91ffffff : reserved<br>
93c00000-b83fffff : reserved<br>
&nbsp; b7c00000-b7ffffff : Jailhouse hypervisor<br>
b8400000-bb6fffff : System RAM<br>
bb700000-bbbfffff : reserved<br>
bbc00000-bfffffff : System RAM<br>
&nbsp; bd900000-bfbfffff : reserved<br>
&nbsp; bfc6d000-bfc6dfff : reserved<br>
&nbsp; bfc6e000-bfce5fff : reserved<br>
&nbsp; bfce8000-bfce9fff : reserved<br>
&nbsp; bfcea000-bfceafff : reserved<br>
&nbsp; bfceb000-bfcfefff : reserved<br>
&nbsp; bfcff000-bfcfffff : reserved<br>
&nbsp; bfd00000-bfd35fff : reserved<br>
&nbsp; bfd36000-bfffffff : reserved<br>
<br>
<br>
#dts patch<br>
<br>
From aaee5eb45ada7121c7c34af7049c0db11ea2b572 Mon Sep 17 00:00:00 2001<br>
From: Bharathiraja Nallathambi &lt;<a href=3D"mailto:bharathiraja.nallatham=
bi@xxxxxx.com" target=3D"_blank">bharathiraja.nallathambi@xxxxxx.com</a>&gt=
;<br>
Date: Mon, 31 Jul 2023 17:14:42 +0000<br>
Subject: [PATCH] adding reserved memory for jailhouse<br>
<br>
- adding reserved memory for jailhouse imx8mm<br>
<br>
Signed-off-by: Bharathiraja Nallathambi &lt;<a href=3D"mailto:bharathiraja.=
nallathambi@xxxxxx.com" target=3D"_blank">bharathiraja.nallathambi@xxxxxx.c=
om</a>&gt;<br>
---<br>
&nbsp;arch/arm64/boot/dts/compulab/sb-iotgimx8.dts | 38 +++++++++++++++++++=
+<br>
&nbsp;1 file changed, 38 insertions(+)<br>
<br>
diff --git a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts b/arch/arm64/boot=
/dts/compulab/sb-iotgimx8.dts<br>
index 08de87e55d0b..6539aa8c83f6 100644<br>
--- a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts<br>
+++ b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts<br>
@@ -315,3 +315,41 @@ MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20 0x140<br>
&nbsp; };<br>
&nbsp; };<br>
&nbsp;};<br>
+<br>
+&amp;{/reserved-memory} {<br>
+<br>
+ ivshmem_reserved: ivshmem@bbb00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbbb00000 0x0 0x00100000&gt;;<br>
+ };<br>
+<br>
+ ivshmem2_reserved: ivshmem2@bba00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbba00000 0x0 0x00100000&gt;;<br>
+ };<br>
+<br>
+ pci_reserved: pci@bb800000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbb800000 0x0 0x00200000&gt;;<br>
+ };<br>
+<br>
+ loader_reserved: loader@bb700000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xbb700000 0x0 0x00100000&gt;;<br>
+ };<br>
+<br>
+ jh_reserved: jh@b7c00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0xb7c00000 0x0 0x00400000&gt;;<br>
+ };<br>
+<br>
+ /* 512MB */<br>
+ inmate_reserved: inmate@93c00000 {<br>
+ no-map;<br>
+ reg =3D &lt;0 0x93c00000 0x0 0x24000000&gt;;<br>
+ };<br>
+};<br>
+<br>
+&amp;{/reserved-memory/linux,cma} {<br>
+ alloc-ranges =3D &lt;0 0x40000000 0 0x60000000&gt;;<br>
+};<br>
-- <br>
2.34.1<br>
<br>
<br>
There is no console output. The terminal froze.<br>
<br>
Can someone help me here please.<br>
&nbsp; <br>
&nbsp;<br>
<span class=3D"gmailsignatureprefix">-- </span><o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Thanks and Regards,<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Bharathiraja Nallathambi<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal">-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to
<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailhouse-dev=
+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAOx58ZZ3RzsGxDjTys_yoK1d96%2BdTUgB2aAVVhnegyEWnr5=
rgQ%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter">
https://groups.google.com/d/msgid/jailhouse-dev/CAOx58ZZ3RzsGxDjTys_yoK1d96=
%2BdTUgB2aAVVhnegyEWnr5rgQ%40mail.gmail.com</a>.<o:p></o:p></p>
</div>
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
om/d/msgid/jailhouse-dev/DU0PR04MB94174AF5A7AB203146DCE2138817A%40DU0PR04MB=
9417.eurprd04.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB94174AF5A7AB203146DCE2=
138817A%40DU0PR04MB9417.eurprd04.prod.outlook.com</a>.<br />

--_000_DU0PR04MB94174AF5A7AB203146DCE2138817ADU0PR04MB9417eurp_--
