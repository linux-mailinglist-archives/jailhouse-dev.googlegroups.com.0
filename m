Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB3NHR6LQMGQESNI2VGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1B58501C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 14:34:55 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id p12-20020a05651211ec00b0048a43993b48sf1586149lfs.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 05:34:55 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1659098094; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yb3slCvcw8eC8mY5skDKoZFqJ1vucX+vWcpndMrTl6Z9JiTX1M/jN7xQBbFFbrRqly
         FHcUobuzZvhhDr2go6rFtlVZDL0UzSmwxztGwIlsDayQfK5HaRCaHCXZatKL/kihBm+c
         XRcLCHoM4ks3tFrDQ3FVVD0AmRDSl6X57WrHE2GNpkQH8AakIfgJEXOXsTsrqkg+unfv
         UsQcAiObY5U5lMbPOhya/zvjLMEUuWEJsApIJDMsBcw8MmFR1NS2zFzJ9ie3GwzLmkXq
         HEqQY/8Cam5LFjv3SDfTE4w51pjqMu3YYYQACADdQg/7F2X4wjHxudxwlStJ/m7taFeL
         9ubQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:subject
         :cc:to:from:date:sender:dkim-signature;
        bh=SKZX02smZTesJTC6fP1VG12WM4jRH1b2WRt7UsE92Tg=;
        b=NvnjmgKraBOPhlyl1uAug6IYOtWhFU0la7CZflD7JLak9xDGNGWxLsySSrzc81ejf/
         Sm6Lt009JhlHp984wrILJEnttdi/GtAQJCcDWIEsiAr6DYcU4TFsYgjiP2C5ICEmsgoC
         /AJg0qyh6Jwp5E7eXVvlkWpBNL0SMwIhBGeMuMd+82RgtKdbOAYVk4nxfVKatpq4rc6B
         IsUOOFONE2yg92ZzP7zX7ZHUSw7hzdwri6KsaxWeefGHg2prHZVGPEWvdLrAfyG/EPBV
         eUgNIMrBeyXz/UrKmE9og53fb3MsyGKAeU47EioiZlvSx/YmYCS1hWGO+11DezlZfBwp
         Nbew==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=wBh+oCmp;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.14.55 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SKZX02smZTesJTC6fP1VG12WM4jRH1b2WRt7UsE92Tg=;
        b=TJyYmPrUw+Q0nBWyVOKfLEYBNjclGxEMmIJko0dULaAWMG2LNhiAKLfNONv+ZFZXuH
         6CyzywVCTs/U8AXlFg4Etlu1IQmYyvPDOkSl6qqfyBjEd8aoEt6BEZ6t9s4VDekVpRaE
         tvZ3BMFMTj1Moovj2jc1OwC7oLamcgDzSTX77OxNcvoU0b6uykebnMEryjWVpbwwmBLR
         x2TzL98QJI0GkLgF2oPwlc7QcmJ5d1kj/qaZYxBp8U4wRBYwgGJPaABGjHScBouVQcUb
         hBTl6AUBjWQPm8Bi2ldWCBlv8DPZzXNdLtPp1gouJYqJboRt7HBpvIys6uaMiGCUcfB8
         wnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SKZX02smZTesJTC6fP1VG12WM4jRH1b2WRt7UsE92Tg=;
        b=uTNtfY9K70Xp23rdvoGfW8+EwsTncVTQ5ma6CxcwMXdQFyP4OnATLbQWnXXaOfI4eF
         N/7vrNAzXlp+VoFS/183HEG6eTmCXAGGdnZz+iU5d5SzzPS+xUoWd85IADq8v2v5q8+S
         s1KN6vKfEnE5Ms9hla7zv2ebb0ZU64INnW+6jyyX2+9ulh9V3/87+Q6DQ+lxvwS7tCDg
         GrPAe6rFyp2JFnGdHY4/mwrm7RwZJOnI5s4a7v8iM2GRoqUGbcQsFfRumnU+U3QCppWS
         A7p4aT7JUmySNhtukItuVH8FjpY78CY8kWC3IIEZdJdjBFxTMJoOgkQDQfPgwMkwytnQ
         uNQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8psXp8KdL3q1nKheJANr8Jh9L8lxHn8FF2OmF0ZetTdURGgC1C
	W6poZ2CKqhopVeKjpk0o1lw=
X-Google-Smtp-Source: AA6agR5uprdX4v0I62ZJPDS8IOrsqSSqcfGz30p3zJuQcZhGaZtme9n/MRayt9/vUkMofmQsg7D0Gg==
X-Received: by 2002:a19:ca59:0:b0:48a:79a1:731 with SMTP id h25-20020a19ca59000000b0048a79a10731mr1129596lfj.365.1659098094224;
        Fri, 29 Jul 2022 05:34:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:208b:b0:489:cd40:7a25 with SMTP id
 t11-20020a056512208b00b00489cd407a25ls391958lfr.3.-pod-prod-gmail; Fri, 29
 Jul 2022 05:34:52 -0700 (PDT)
X-Received: by 2002:a05:6512:1047:b0:48a:e6c9:ba9a with SMTP id c7-20020a056512104700b0048ae6c9ba9amr199406lfb.619.1659098092457;
        Fri, 29 Jul 2022 05:34:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1659098092; cv=pass;
        d=google.com; s=arc-20160816;
        b=i1ZcU4d6mQi0TtT3E52/4D3PCiGBsCJbu0YBPsXe61ntGiLtEnQwDuxXgQQUE2T+fZ
         GPJOPdH+hVEWyXCWpt0yQCx8JfChGkKkM63LlLxMpoZyJdr+aP/D5aa1wtX1DsGLqz8i
         UTQd1faetSBPuzL9x6kSxWIp/iGnwPAX/Hwcq07uuz4onMUzSMNHLzVF2SyGC7Pi6RyE
         jGYK5s7qyVOtsH8VGdQwXdHsTehr3sjULWSZoOzjmQfKy33Di7wTCGjn18iiM+/ERh96
         QqBWYU7/fcBVKBWIjoIRlUHlDHIHe/uIN5NjBnikW9OQh+IhgBXQMaPENtrrfU/3PTdG
         vDNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=l4dr9CH73i0mtIHgVJ6pBSDKsMqCK6bpZ3opizMAuiQ=;
        b=VtwoIuQPUpaBneRDQ6GRF0qYgOLWRLBfwb7z6TqBMoSbfM3a3T3orU4yNgGFa3LvFb
         plUBakjuFmqTAv/iSNelL3Y3RGcnyegZrSTWRQ9UTp57Wzj9uwnVbhFtyd3vU/tIY1NO
         KK8h8PILaeQs2NnIJJV/0FXxPjkICa+LYF8AWi2JSo4Uamuv9qU6QFw83vj20ImpXp7P
         rYj/mjye31drVz3gBFZMVj+Mqw635lWzAT0SlJf7BcReWALcOxUmFx2yHvzRPT9ZLwSL
         N2BCNW/VzE2azwZEW95+ykwjlzt3OLwt4ZeSTBN0p57KOTIojaoWIE/8XbIBsIxRoM+y
         8p8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=wBh+oCmp;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.14.55 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140055.outbound.protection.outlook.com. [40.107.14.55])
        by gmr-mx.google.com with ESMTPS id e10-20020a05651236ca00b00489d2421c05si143532lfs.4.2022.07.29.05.34.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jul 2022 05:34:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 40.107.14.55 as permitted sender) client-ip=40.107.14.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i23+hWEuy34dNUHt1x2yWKPG1fWUF72ZKKxtiHGNxHo6XRr+1PKsW3Kfi3EIUZiVlxuaSzkMRsh+Ov0HHLDbv5j+PCu/Y0vR7mDofduPKzqHqRIgDSaJSNtEcTRHMOQjvXFdeXw21vn/3MsArMhbEWtYPTr2aSpwntg8YX9ELF9WHVvqGTDN1e1WWfDv26hVqao6N4H73eP44IZwL48ztJC4hQa6xNlSdHI5V8JBA6pizzSiJdyeFneHIt//kPvquzqTv+jeGJggBbDw8Ciwq+2YJkfeKYVOgR1RAr2GeYy/PlxDVLIFQPhkpuZjySG3NtrMePMcAKK9wcXmdTm7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4dr9CH73i0mtIHgVJ6pBSDKsMqCK6bpZ3opizMAuiQ=;
 b=jCZ2zTleob58Vki5iosbq7ng8zAUHAl381gk9nyjwEolzLX04ZHy7rEN5f+kb2TyN1PCL4hK5aVUbUA3IQdy3s6f2U4PKgJq6ozzP9RN8uY/AGy4sgYf8KbWFVY9y3vPY5ElBBY+2YBp+YsWxxurUeHBPG71Lm1Gz1wXFFXoQ6lFIPYNP5MqETgMJ6chi7H8XeLzGkzSFXWKwf9mZcPCId0yKzqn9zNUL/f8BAtXyFvcueQO3ELFHK9x6mDWJguzwRT/fuaLX4XSkokf/kAsPmW7keBNKRjfClE0fMm3e0HAV8u7K+2Oz1cSyUSKDAL9AHbxWg24QCQ15349CN4FTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by DU0PR10MB6297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ec::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 12:34:50 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b%3]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 12:34:50 +0000
Date: Fri, 29 Jul 2022 14:34:39 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Sara Alonso <alonsosara44@gmail.com>
Cc: jailhouse-dev@googlegroups.com
Subject: Re: Troubles running jailhouse
Message-ID: <20220729143439.11e5a2d8@md1za8fc.ad001.siemens.net>
In-Reply-To: <CACD6wFMHN3rqW0sEAAtQMW7ha81Sj20CeLXyGayA5oGR-CJFOA@mail.gmail.com>
References: <CACD6wFOpQ3ZNBDtPoz+LLS57gxAZ3JuDOi_1orGKqPKiC7s4jA@mail.gmail.com>
	<20220729124412.4f8aecc6@md1za8fc.ad001.siemens.net>
	<CACD6wFMHN3rqW0sEAAtQMW7ha81Sj20CeLXyGayA5oGR-CJFOA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CH2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:610:20::34) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1acbe7dc-bf02-47c1-e82c-08da715ebafa
X-MS-TrafficTypeDiagnostic: DU0PR10MB6297:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIEyeVWHGpNHGM1eMPEjeoYgAY5ZkhMrulcakgV/Z1fCzeO6L/+9tedR/pxbV0SxgazLEShWbRyvPSNAId6elFbToBOv+QGi8WYeJZBnZyEdm3B5KAER0gll6skHlqNK4y7sbcDfOZpVdLKe/Tl+YK10AriDlo22fbjzCMATPWUOBplN9jwsyog0s975R7LJOPMP4sit8ErVh4jqzFo4FhOzfIY2e5U13q3fX/NrXBwQctwDOB2QoYUo9RBEN2yRcF5SxfqwDHteR6vzYoy6yymTgJaeDpiTkUFfJNVZeqW0QLFVGU0uI7qjeJh4csNLlnUlZSWryY4JZliYQswdXMbQRDUI4igD6jYtNF8GLZAXBJk1Yhm4yeuYdbyJ49xN50rQIXCLCkuhY3GQ40D2RxQV1sAmbBshH6sLNwuLgtUJT4XLEeREM+UJ8s3bySdeRDQFntBTZVPAXFiH2ZG1KqqrRaIiri4H+HyAmvLcYhvSB99+ToIv4qEuVU9bICI0zA0TkMS+BrkhThz+5wHG/gEi4xtn6Pd08Gn7Z6hogN1+nuw2Z2j1Xew0ZCaUUb3op2leKgnz+8JUc4G+oCYVcxujVwX3aUB0cVFvUSH3qvdGgZP/BsFrovKm9ac1AKeQ/Pu+8rumMM+jQ4OyOenFHkx8M5GLj5uhuSieo/VIIRQLsavVhOiGcXjd9QDLtiUTfG/bfvDVdKATOGkoA1nsaCscEqb1ycqzjL2/dtG87KJLqjE5Wp3WXOiHwyPcOyi1HiHzSannoBLVn93rzAA6rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(86362001)(66946007)(26005)(4326008)(8676002)(66556008)(66476007)(9686003)(6512007)(7116003)(82960400001)(38100700002)(3480700007)(2906002)(41300700001)(6506007)(6666004)(83380400001)(478600001)(6916009)(5660300002)(186003)(1076003)(966005)(6486002)(44832011)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmQ0MlR1SmFPQzdvYVUvcFJDVGNhZDQzOHV3Smw5SFVJdWxqeHhvVlU5VnFN?=
 =?utf-8?B?eko5em0yK1VTUnI1U1lKL09VTUJNUzJyRkF0eURYZWhSREc0U3hVZURNZnlU?=
 =?utf-8?B?aWZiRWw5MVhLSkJocldYTm92ZzU4NnFCSTlQU1hweVF1TzJtQ2VYcXdUaG5j?=
 =?utf-8?B?R0dVVEpMaDZPdk8yVXYrWnpIWWJzQk91N3dvWU5acUlMSDNiSldPVy9ncHh5?=
 =?utf-8?B?RnY4cTNycUtpOVRaTkI2cTRyaEdjZWIzV3diSDZSLytyZ01sOFJZUVBKYk9H?=
 =?utf-8?B?RDg0cEtJdE1zNEFrUjdJMXVLUk14Q05oK0xmb01pam5VU0VvS0dlays0TzRu?=
 =?utf-8?B?TXlpK0R2bnhpeVRkUURGcW9sRWxMKzJQcFFhVzBRLzFNWm03VUZvUkNxdGVE?=
 =?utf-8?B?RDFDeTZmQW5QL1ZXQ2I3eVZIdjZ1TGY1UVFrQ2FnNGlOeHZRWXJ5b2w0NnUw?=
 =?utf-8?B?bEtOZjdsOURuQWw5OGNWdENKMnRocDFORjRhK0lvNGpiNW4zTXVzUCs0dHYz?=
 =?utf-8?B?K2pKcFdqb21QZmhlNkxpU1Y1MmNwMXB6c1BReW5CSmpLUU1LcjhBblpUNXVy?=
 =?utf-8?B?YU9sUUdFZGhEdjhwWFJIZGZ6NnNoZUI5dXhJL1pMTitSVDZ1bGR6cDhnTGd1?=
 =?utf-8?B?bXUrQjV3UE1PNG43TzhqWkpSN29zY0FNRUpNUzdReWpuMCtjRzYreUJocDAz?=
 =?utf-8?B?ZzNnZjFLOXRheVd6ZnYyenlQRFU1L0RBS1JpbitzM0pwak9WQXN1eEtoRVdJ?=
 =?utf-8?B?OUhFazM1bVJhOFBSWE5yUGFFcTN1UFZQRFZSSDUxOXhjS3ZmOFNkYThnanEr?=
 =?utf-8?B?TGRIYkpIY1FFcXJhTndBcFNtNjk1SVRSNVZHZmx4bytySW9CUGxaMlkwcFpz?=
 =?utf-8?B?VXA0MkpHMmtaQU9XbzZjOWhOWlJ6akZ0NlJwZ0NtMWYwaGg1VktPdHQ5V2M1?=
 =?utf-8?B?Z1hFLy9ubGxXM1Uvazhta2xWL2xtOXU0c09VUUNMN3ZBUXkwZnR3c2RUMDQ0?=
 =?utf-8?B?QmxCUmg4NVo0ZGdHbGh4ZlRsUkVBbDJ3RmF4TjJUb1JCYW1wdEEyeWtNZ2Ra?=
 =?utf-8?B?czFOWWgxUGhpaHhDNUZIeU9mZGFaaHRPRG94WndDZW9zRW1wM0Eza1N6SmxY?=
 =?utf-8?B?ejhzRTlXTnFJRUcyVkVMd3dNOWQrVVc0L0s2MmRpQ2VUTTYrOVF4TUQ0NEZ1?=
 =?utf-8?B?ME1RRlg2eXpXYzlTREtFcE5kUHlQY1k3cHRUUnpFS2ppSGhQRFVZNkljKzVV?=
 =?utf-8?B?bjg2ZXJxOHd1S1p0THlJaTRCMVpzV1dwSzFqL1NTYVRvdEhtYXBkQmVtUGlK?=
 =?utf-8?B?ZFpjQUFSb1pVdnk2TFBSSjlzWjZyMmo3UlRqMndmMnhmN3ljNkY0WkNUSjZU?=
 =?utf-8?B?RFJmWEw0Z1V0SzhubU1WTTM5VGRocWRETGRwQ1hsNWk4QWN0RFBhMG9saWhV?=
 =?utf-8?B?SlVGRm12YkFGRXB3ZDE4NUR2Y2w4ZEhDcUx2NnVQSmdBZi9hSnFVY20zTFND?=
 =?utf-8?B?bnR2SE1PQWxxMnJPVmRDWWN4bkdjclp0ZmsxY09LRm5zSVg4Qmd6WWYyUzNi?=
 =?utf-8?B?QVdYaHZnb0hrdjFralY3NzdxeHVqQnFiOU5tdWpoaW1TUEdtWUlNcDdqU2Fu?=
 =?utf-8?B?VXlKcEo2UkhIQnAwb0dDSGJ1YndINTZnd0J6UWVmSUZBcUpiM3Y4bFJtdUV2?=
 =?utf-8?B?S3hWM0g3eDN4aUM3RVdRb3FYbEJjUmVIZkxaZzFMaFV6RFExYkovSloyYnkw?=
 =?utf-8?B?MzF5S1ZZZlF2MEpiUDNjTmxFNHN5WkdWeVBTQXA3ckcrTGhaUkRDbVBjSk5G?=
 =?utf-8?B?eXI2VXhlRGw3cWY4Z25iK2FxMUNJVUNaM3BENWFPdFlHM3ZQaWt2TGM3bTd4?=
 =?utf-8?B?cGtJekVab09kTjBjZWNHeVBSNU1RRlBEMlJPdVE1WjROdzR0UHB5RWUzNk9B?=
 =?utf-8?B?L1V2aU9ZQVFjalpGTFhFa2R2VlhxcGdJbkNxMzRzbU5hSmxyT29WRTd2VWpK?=
 =?utf-8?B?emJqVStjRnAwNDh6ald0cWhYcG82aE9TUjd1VStTYmJjbm9DK2VPQVVrbjJ3?=
 =?utf-8?B?VXJNcmZ0Y3Y1SEhYUU5lMXNPMzJybGJOanVNaU9hTzFxQVJtdXhIc1J2NXhm?=
 =?utf-8?B?T2E1cWROajc2dWhJcysxcHdYdHRhQWEyZzJHV2cvNi91VDFCZVE3aW5VZGFj?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acbe7dc-bf02-47c1-e82c-08da715ebafa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 12:34:50.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krVJiwf3jc8DyybSypL5Y28VWwBpWeDWRU73ouo1UNiHfZCX4E93KghAlE71MKs7E2Jfxiv8JfFqdQur4iQBx8QyscL/c/QQx4LhS2/yi/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6297
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=wBh+oCmp;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 henning.schild@siemens.com designates 40.107.14.55 as permitted sender)
 smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

Am Fri, 29 Jul 2022 13:02:55 +0200
schrieb Sara Alonso <alonsosara44@gmail.com>:

> Dear Henning,
>=20
> Thanks a lot for your help. It worked with insmod. Now I can do
> *modprobe jailhouse*, but then, when I do* jailhouse enable
> /boot/zynqmp-zcu102.cell* I get this message:* -sh: jailhouse:
> command not found*. Is there another step I have to do before, or do
> you know how I could fix this?

I bet you made some mistake in actually installing all jailhouse
components into that rootfs. So that module was somehow missing, now
you are missing the jailhouse binary ... next will be the hypervisor
binary and so on.

Please double check that "make install" maybe with a V=3D1 to see what
gets installed where. You should be able to specify any temporary dir
as DESTDIR and all you find there should exist in that rootfs at the
same location.

Maybe the jailhouse binary was installed just fine but in a directory
not in your PATH, something like "/usr/local/bin". In that case maybe
add that to your PATH or try calling it absolute. But i guess for the
later runs where you might want to have a linux non-root it would be
good if all things are installed and binaries all found via PATH.=20

Henning

> Thank you very much,
> Sara
>=20
> El vie, 29 jul 2022 a las 12:44, Henning Schild
> (<henning.schild@siemens.com>) escribi=C3=B3:
>=20
> > Am Fri, 29 Jul 2022 11:33:32 +0200
> > schrieb Sara Alonso <alonsosara44@gmail.com>:
> > =20
> > > Hi!
> > >
> > > I am trying to run jailhouse in a zcu102 board following this
> > > tutorial:
> > > =20
> > https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on=
-zynqmp-zcu102.md
> > =20
> > > But I am new at this and I have some troubles.
> > >
> > > I have built the petalinux-project and also jailhouse.  I have
> > > copied into the SD: the image.ub, BOOT.BIN, system.dtb,
> > > inmate-zynqmp.dtb, zynqmp-zcu102.cell and
> > > zynqmp-zcu102-inmate-demo.cell in the BOOT partition and the
> > > rootfs.cpio + the lib and usr files installed when jailhouse is
> > > compiled in the ROOT partition. I don't know if something else is
> > > required or if something is not needed.
> > >
> > > The project is running, but if I do "modprobe jailhouse" it says:
> > > modprobe: module jailhouse not found in modules.dep
> > > I think I have followed all the steps of the tutorial. What could
> > > be happening? =20
> >
> > Jailhouse uses a kernel module which you have to copy as well.
> > Double check that you did. It should be called jailhouse.ko and end
> > up somewhere in /lib/modules/<kernel>/extra or something. For
> > "modprobe" to work you might have to run "depmod -a" first,
> > otherwise you can also "insmod /lib/.../jailhouse.ko" and load it
> > by file instead of by name.
> >
> > regards,
> > Henning
> > =20
> > > Thank you very much,
> > > Sara
> > > =20
> >
> > =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20220729143439.11e5a2d8%40md1za8fc.ad001.siemens.net.
