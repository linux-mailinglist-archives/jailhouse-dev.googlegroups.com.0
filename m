Return-Path: <jailhouse-dev+bncBCWKP54GYYIRB5MVRKLAMGQEAPV7AFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 66972564DC5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jul 2022 08:38:46 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id s1-20020a056402520100b00439658fad14sf6666165edd.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 Jul 2022 23:38:46 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1656916726; cv=pass;
        d=google.com; s=arc-20160816;
        b=hcNIsnZ0afVn6YGx8/OSlKkLl3mZccDHfShbWD91Am/wp4D4hGYgYyEkFsiay9U92I
         M8XwJwbu5r3lwIKEvnKUgvDfYMnDh9pfFSjRxsbY+HTmvvR+gy20ZyiwqfTAh8ZfL7FY
         jXG0vlHUiM96DxhLcm75jdbYkRc3XCwdvGrD1d+sxeROIF4t04OnX/kXobLsSzlqpYPW
         zKhLJbN1H7Asqhc/DOvsJSIjhHU+8gnu7rb37JEBZeTrGs957XlZy9BGcvbvTE6EWSQf
         9ehcQZXr/KUNF3oVjRtuJdLwNiwS+Pc3GXTIRoVGHQeCMdRwtgXNbwKBeWiykuKbGTU7
         CxwQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=n+KFsgegVSxU3eYiNSUM1R6F9SyfmGLH1WbxFFinzg8=;
        b=Pjtj9ZWYE9ae2zC2xAITbeTbuAsPJhTO1/nI1JETeTGF7blsdeWlzHwZkzH4HblDeV
         +78QjWM1XZIBxTP0JSETW6WazlqgzzGdgjI4sxmjA9KnKmYGglY7LNidMDlbzzgHgcae
         cp1Is7Yb9FEUyD8H5rd8Pim6M+njaB7XxBeR2wojxq/0kbf7/+1f8ZhaY8c/USZDS0Qb
         khqnW4JgNIU7XqoiZHoBIDrtM9k0jid7HW1J4QBzi8sOluR2XoznAwwYEnL9OzCEKART
         XK363FUQ2X7S6KUgtcxXijF35e72G4Z5/s+9GycsDeBxl0rdL7ekjDMYv8VI4B/H2fIK
         9BGA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EM7ZlLTu;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.104.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n+KFsgegVSxU3eYiNSUM1R6F9SyfmGLH1WbxFFinzg8=;
        b=W4XMX1oMEsppRqMOh6GtYfDWUIWOFLLyTtebm+W2J2kCERsEqTej2aGLT0xKuWFqiE
         RFpuB1yUXJ8XgErP3R1LroLOT6t2KbquB7CBJQKhsJ0YjMoF/QJPwRQSYifsMUF8HSQz
         Bj+9oYKu8YMiYaXOX3vD/lJWtz08ZhZPpIPdrnjqfI2OmPKsavUUk7qeOO/UIDQ7Cw7A
         TCowESGFqhp1//jztfZVkdJ1AHnwb01w3nGVUrR729HTKgCu6waCKI7igB63uF/9t2WB
         fL05l+ql6kvdq2vMmL7Loe0C+4oz3yAlm7KT+7+/vcsci5wgs9s281e4syczEQZN/JXx
         8sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=n+KFsgegVSxU3eYiNSUM1R6F9SyfmGLH1WbxFFinzg8=;
        b=VdJaNaqhkYUqw3lVHCVuke0POVqXYmT11U9/oFn/Agt5f3IPshFF3vjkxZY9mNqqG/
         aeT5nsBr03Dk7VYBik7VSy5BWy5YfQYMomP1Kh08dONzXfG3YmFVBasXux/FSRv0/KGR
         QismyZseAFpOSZDjkqQfANvUqKOQUDCIaS0fTmDjr2Y6DtxE4k6F5bfDg3BmtcHV60JJ
         ds8MP7l7ya0Ei5FnEY9zmQBHUX50bBi2ZyEV5YX/iRkV2zfhy0iXOPtErt+I969MNFa0
         hf2HBabP4DhA4VDbz4vQyVEAkUfebVsS0HoH9zU/u+o0VL8Ig2bnfG3qFId3V/B9PPir
         eeHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora83REn9Yz5sQyN+O0qc4bFXDcLo1k8X0CPhK91NhR12pxVENHlw
	/qeHcE/diacPB9e8Vk16VRM=
X-Google-Smtp-Source: AGRyM1tlP4zObEIP1F9A3euaXEvfvuWehyq4c6fPswrShB0AiXubxW2dXoOmFy3veafCac8mhM4pwA==
X-Received: by 2002:a05:6402:538a:b0:43a:298e:bc2b with SMTP id ew10-20020a056402538a00b0043a298ebc2bmr7723372edb.125.1656916725888;
        Sun, 03 Jul 2022 23:38:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7e9e:b0:726:31a9:49f2 with SMTP id
 qb30-20020a1709077e9e00b0072631a949f2ls5639185ejc.8.gmail; Sun, 03 Jul 2022
 23:38:44 -0700 (PDT)
X-Received: by 2002:a17:906:f284:b0:726:efe5:b8f2 with SMTP id gu4-20020a170906f28400b00726efe5b8f2mr27780748ejb.647.1656916724153;
        Sun, 03 Jul 2022 23:38:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656916724; cv=pass;
        d=google.com; s=arc-20160816;
        b=M5cq41D0hfP98wxCUJM5xy65mHVHVaVRJ6Jydew0fadMqD+7FczgxR5C+Mi6bS9+8+
         LxsXyc2Sepdpvxsr7qnXMyBZOFDa1X3NRHYDHiiywPAUzSUv0QJlqnuIlBVBAI5My5GT
         JNkFfKdFrf8jPjGc2cWvxPaHc165SV9kuZp+6VSHV+JCNdMipEG2FoX1drTwcXmLMozc
         If+rkJsPVoscPyuN+ewfwGJcOMzCb6KCEiJ/ANYwkf/sYi9z1p9ZBdP1bDvElJwZyPGs
         RFl+EHFe1D/b3Xey3JvVnE/BhRwY422TVeMXgE21zVIV56MJ0Cg06TubpMyZl25/H7kn
         az7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=/GHBHz8TZG2lu+zFGT4lnr4egVbCZ7eERGsCyjm4HxQ=;
        b=uksvAp84eoMjdDv+Dm72QTdJ29BON1K4MeVYwSR/60kaKa+ms/uUPxNDxcAvyAEils
         mM51hOGdmjQKIHZMyt7A4D7xrngZwkvD5elPNOa/SmiKtgMdYUVgAKLVCWrnpz6trGfq
         z1zkBYYJ8iqKW9RUjwtYZdMLeHBWmud1mk4Yq1FusmphxGrG8busE/FlC13DX+h0xHF/
         kYrP4qLuz9FvkaRGbr/L8KOZS4sbTFQIERXFTEDcVfsHd+7zvsZ1S66ZjfQ4NHBFIfPs
         felM+5GtJFks8wy25CZ1UX0nZaSzWl1Xc44wdNOZSWBobv8p5AO8uVYFmvoZcZ86Kil9
         dLMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EM7ZlLTu;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.104.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2065.outbound.protection.outlook.com. [40.107.104.65])
        by gmr-mx.google.com with ESMTPS id p11-20020a056402500b00b004359bd2b6c9si1360237eda.3.2022.07.03.23.38.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jul 2022 23:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.104.65 as permitted sender) client-ip=40.107.104.65;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO2ijlCvrbwxyWliofBdGk8BkjX2UejTmuD2eNU1c1+JR+Z68Wr7no1cb2pWqOls84BbodQn+vsnmmunle8VrEXMVOiC/4im5barWXFocOq+MNoRLDl+NLYJsvHwhSdrg1GM83zLut6oEn3SuYAOh+WfFF1i9JHhsYvYnCn2c4WFQ70c3xwscma97gxc9uFZ6Cm/24q6aKYZlLepcwmt4fKSnotCuvlzGVelgOYywthtaJKJKQCCj417AphuEGIt051VFOJFnF41rPsXDpPDHK3ndFgoBx1Z+/K+GneapC+Lva/ledoNX6m5wgx1zZrhWZgwNDzRbYGy+7LCnbUs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GHBHz8TZG2lu+zFGT4lnr4egVbCZ7eERGsCyjm4HxQ=;
 b=WTrZIkBB2DH+73xIKENzdd3unACGgZdilTrksZmVuErx8QvUEA7URLVqg31rRsz7z7UvWEeuIO6bvZBoICCvEc70zeNSe2UdjSkeRA4ayAg+70Sy1VvAFrMNPhElxvnL8+WLYy/H3evWRxWDuNqA2REG0LwA80z1CES4yEJ2e2ZrjnApIF4Drnxybv7vdQYWQgq8iyvJNiFytw1fOA5aXscI+dh/WgoplYKs0/Oqh9nvNfaRB2pj+klXHC4SyG0POrUTBXXTV5iE7BaDPTcDXBoVv6UNXDbqMhLqOYfNI7Py4waWdEJ76DNFr5qcg089NV/MW26sXTbyOm3emyMD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by HE1PR0401MB2412.eurprd04.prod.outlook.com (2603:10a6:3:24::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 06:38:40 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 06:38:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "vsun...@gmail.com" <vsuneja63@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: i.MX8 : Facing issue while loading image in non-root cell of
 jailhouse 0.12
Thread-Topic: i.MX8 : Facing issue while loading image in non-root cell of
 jailhouse 0.12
Thread-Index: AQHYdFvCyGIn3qJSf0C0dSa89TOzf61Sd6wAgBuAyNA=
Date: Mon, 4 Jul 2022 06:38:40 +0000
Message-ID: <DU0PR04MB9417128E148DDB41EE4F2D8E88BE9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <c58f3a6e-a1d0-4b7e-896d-42a1ee0fa40en@googlegroups.com>
 <e3d17a73-37b0-4250-9168-e37a134a4af4n@googlegroups.com>
In-Reply-To: <e3d17a73-37b0-4250-9168-e37a134a4af4n@googlegroups.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20ced55e-c3a1-435b-0278-08da5d87d549
x-ms-traffictypediagnostic: HE1PR0401MB2412:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3zN+0VFBldqJHa2ZAMHQsrCExQfR6s/jJsqm+zUhZ6FNLLa1+3wdXmGXGIvfH/mJi41E5fC/XLLPj9zSw1W18WSiPgekso3uut1R7a9lyE9jQyZCyR130UlwF690ZD+qucwDK/tCps2kJjDp51CUG6roB8gGFClssavXAmsi85TOj/7E9frpc56HppuvEiTYHGCXERrvuYhvY+OUEQcJlKnnut/Fz0Nbd/kXhha1pRBfCUQGZmo7evB2tUNszJOhwebazxRbauM7vdYGR1iBTUALFWpWqe4qe+3KIhmkOe0Q9P/D38KTCKzT/6Ex99ZvOpmPTR19Uktu4fPGepY8tCDIZgSTTU34eX4EkC9OeknRqm16a5h9ACKtC17IoBQURzRNivAyo/Yznwd3Xlo9g5aVdt8a5dMXY2UgD4ktxuZeSlSWpKJLOYecT9E5gtZBXO6+KF5ttpMqBLJpMyIhxFKWzn/Eesu6h0+MEx0J5ks1g3qndD3LkcaX2Kv67eewQkhTUDA6LGgWuFR+lmpfst+LgznEZp7z5bQ7RZkBYbYFXXeJbnfOohaumqaizSmTADZJRPlcCzITN6ENwopgDL/jqw4YsEpmdp7Lux3hlf7koxredDx2ppSp/tTaqGq8saw4ubyO5niCe7xJSycuPugjmGwAOYmgGqejarqfyCKwgCFegDr4xfkVf/1SO/Z5nCiRXeskI0SvriSDGLHuHWkt3EVYl/v6qaY9tnO1e8lPxm7ukc1nYFU0eS8ZyDlqkdJ1/SLUMV3zb3RU6F4sR7fWqdNga4v19yuTsz04jkDc+IhhLNHNbrATVOwH6STYhQ4tcWEL5MwLc4Tgbp2LVNnyJo1Z5mY8snmarBeiy+0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(44832011)(30864003)(2906002)(52536014)(8936002)(5660300002)(55016003)(83380400001)(122000001)(38070700005)(86362001)(33656002)(38100700002)(71200400001)(45080400002)(966005)(478600001)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(110136005)(316002)(186003)(7696005)(6506007)(41300700001)(53546011)(26005)(9686003)(491001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHZkOTBRREdKQ2gwTVFNQUdhSXF4TGovT0k3YUE1YjJlT2pDaElsL1k4bStI?=
 =?utf-8?B?RHlkbTNsVWJkOGp4TG1WTzJObWpCRkJJaWlRL1lpcUNMYUdWVk0wbVo1R0hm?=
 =?utf-8?B?ZUxHeGVyZFhYS01oeTJwUVJYMjhGaXcyb3FGazZ1L2lWakpDY1hvekwvSjUz?=
 =?utf-8?B?Vy9Ya25pRHpqQ0EwcGlOOWRETnZVZW9VL2VHYS9QaWQ2T2NZSERJMzBiT1J0?=
 =?utf-8?B?SXd2RE4vdWhPQkFsSGYxaE1hTUVrOU5WNlB1WU1YRzRFUGhlejB1eWJ0Lyt2?=
 =?utf-8?B?ZnZlSXJFWEVtT3RDSEd6eHE2aTFBNm1CYVM0NjVTNUJRL01mSUhEdVRyWG9l?=
 =?utf-8?B?cVR0RVQxMjVNdkVHejk0K3RaSjRZSm84aUpQanFpVVd4Wkp6Yk9PT255WW9C?=
 =?utf-8?B?eWNtTnZISFJMdnNSL2ZORWNDTG9LN29NbElMc0RZZmtqdmthdmN1Y0pLdTM2?=
 =?utf-8?B?NVMvK2I1elN1R1RjMVhUUmxPOWxsL3NXSXBkK3lXcVFBVFFuY0pxQVQwNk1I?=
 =?utf-8?B?NUJ6TmNMaVVQTndyVUFXZ2FtWTErTURob3BrSGx0enVPaTkxWGhkUTNDQzFn?=
 =?utf-8?B?dy8xRkRraFFKdUMwUHoyTjVXQkFDa3ZXVDIrcUVwMWtzWG0vNmpKVk8zNjl1?=
 =?utf-8?B?RmUyWldLd0ViMFptN2x6akRuNmhzcnRSdnJmZmllUnlwampyd1hWSDdsK3Fo?=
 =?utf-8?B?ZnJ0dW9sZDd3dFlaOG9lVTRpa1pmVVdnY1EzWXE5aWNkYjNDTlgvL0lpQThy?=
 =?utf-8?B?UkV6RjhzOHcxRUw4MkZTK2VoSm5RRkJwZXMrNzBzN1l6clJsNlFMdE8yaVJO?=
 =?utf-8?B?dHBDUnNlTVdydFdxa2RUMngwK2ZJRFFwaC9QN0NqQXJDZ29OWjJ5c25SNWlk?=
 =?utf-8?B?YWtwQjFQdGtLNDNRcVphVlk1d1RiWllDMi90T3gyVU52UzJML0tsUXVYMWtN?=
 =?utf-8?B?aTdBLzRTbU1YOFJjK2JDTk1LeGtQRjA0STgyK3h6Qi9zbHh1OWlXRUpwRENO?=
 =?utf-8?B?bmJ4SDJPendUTWtKNDUrSHo2bloyc2Z4OG1FL3U3ODBIemdwZHVyUnNBMUhq?=
 =?utf-8?B?Q3R5cnpPREltNU5YTDFYMFFoZG03WW5oR0dVZHhiK0kxVHpOdnpEKytsZHZl?=
 =?utf-8?B?Z04wSUF4dEh6c3VaTmdtd0l1L3pVTkR6R21kZ1g0djAyVlRhL0ZuMWw5KzJs?=
 =?utf-8?B?T0htOFRxRU5BU1R5bUg4RWRyZXp3V0h6TDZ2azJ1VkFLc29wY3R1OWwxVmh5?=
 =?utf-8?B?OTROWkZZRlZYYmd2cW5lZFhlaG9uSFBoWXRtYXVtK29jb05jVjlyODVvK2pn?=
 =?utf-8?B?bUd3QlZRdzdRb3o5aFkyUXJFV1BpUEt6ajhYbVV6L0x0emxnaUtTVUJwWjBX?=
 =?utf-8?B?QjFZWUtvRWV4M3U3ZVNabEQ4SWZvQTUyRWlQdUd0R1pjcE11Q1Rld2s1dTcx?=
 =?utf-8?B?NGo0a1B6K2tZNTd6QkFqV3l3V29RVkN6L0t2d092T3VNaEtCSDZudjRTcjY0?=
 =?utf-8?B?b1NSVW5pZGhEVjlQRDljWWxTZjhzSmc3TnZzY0lrYXZsUFhmeVpqZTVnQi9C?=
 =?utf-8?B?MzFRZDVVMEpvTFQzMW9oTXF0b21vRnlEV0RRS2t0R0QvSER6eVpHWXhZcDBM?=
 =?utf-8?B?M2FLZk55T3g3L0t2UU1hNC9EQXBBdXN2NU03SVFHRnZOMmxKS1g4bVBkYWNt?=
 =?utf-8?B?dkl2S2hLV2FnazNzdjB1T1Joc0dqcC9mMVN5OEZaWGlLQUhIMFk1cDYyR0JP?=
 =?utf-8?B?TmM4bExUcmo2ZVJRZy9EV2VTeHNOZ1Awc1pNdlNvbEpybDNTSUtoNlpxQXlN?=
 =?utf-8?B?cGp4bXBYMDNRM21CYUJWRlMyVFJ4MXM1Ryt1ZTVJY0VwamZWWDBxUjR2aEhv?=
 =?utf-8?B?OTJHaUJ5b0RMNnVUanRKMlFMVnRzbm8wKy9adWhCdFBhTlRQandKZ1h5SVBt?=
 =?utf-8?B?ekNTdUNuV0R6aFpKUkZJY1p6UjVLeG1zcklXNHdtWU8xMktrVG1DbklCYWtI?=
 =?utf-8?B?WHRCUTNLOHo4K01rYkxWc2w2TTc1c1B6Z0lUZUlkWUJ6cEkvdlFnalY5blhh?=
 =?utf-8?B?ZUZIZTFPbGxGbUd1YlBiRjI3cDVOb3ZBOEFseGNuSGltUXpheFNMaG4wM3FF?=
 =?utf-8?Q?Faao=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ced55e-c3a1-435b-0278-08da5d87d549
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 06:38:40.6177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8C25X0q6nZ9TjVN9J4ojr7dnAka/nER2NrJweJiJzzQb/FI/K33fQjUf+KSQaDX9QI9W+ssq2EPUFOLwLutkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2412
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=EM7ZlLTu;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.104.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

As I replied in nxp community.

1. you are using wrong console for inmate linux.
2. mmcblk2p2 not detected, so you not burn a valid rootfs into your eMMC st=
orage.

Regards,
Peng.

From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> On Be=
half Of vsun...@gmail.com
Sent: 2022=E5=B9=B46=E6=9C=8817=E6=97=A5 2:38
To: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: i.MX8 : Facing issue while loading image in non-root cell of j=
ailhouse 0.12

Hi Peng,

Any input from your end?

Thanks & Regards,
Vipul Kumar
On Tuesday, May 31, 2022 at 1:00:42 AM UTC+5:30 mailto:vsun...@gmail.com wr=
ote:
Hi,

I am trying to load & bootup 2nd linux image in non-root cell of jailhouse.
I could port jailhouse 0.12 in kernel 5.4.147 . Flashed the image in SD car=
d & emmc of i.MX8. Initiated SD card image with command "run jh_mmcboot" & =
could load jailhouse driver also. emmc has mmcblk0 & sd card has mmcblk1, m=
ounted mmcblk1p1 & mmcblkip2 manually.
=C2=A0
After driver is up used below commands:

jailhouse enable /usr/share/jailhouse/cells/imx8mq.cell

export PATH=3D$PATH:/usr/share/jailhouse/tools/

=C2=A0jailhouse cell linux /usr/share/jailhouse/cells/imx8mq-linux-demo.cel=
l /run/media/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq-evk-inmate.dtb =
-c "clk_ignore_unused console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x308600=
00,115200 root=3D/dev/mmcblk2p2 rootwait rw"

2nd image not booting up, below are the logs:

root=3D/dev/mmcblk2p2 rootwait rw"mxc0,115200 earlycon=3Dec_imx6q,0x3086000=
0,115200
[ 2102.362388] IRQ232: set affinity failed(-22).
[ 2102.362464] CPU2: shutdown
[ 2102.369562] psci: CPU2 killed (polled 0 ms)
[ 2102.422343] IRQ232: set affinity failed(-22).
[ 2102.422642] CPU3: shutdown
[ 2102.429741] psci: CPU3 killed (polled 0 ms)
Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
=C2=A0"imx8mq"
Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
=C2=A0"imx8mq"
Created cell "linux-inmate-demo"
Page pool usage after cell creation: mem 80/992, remap 144/131072
[ 2102.486660] Created Jailhouse cell "linux-inmate-demo"
Cell "linux-inmate-demo" can be loaded
Started cell "linux-inmate-demo"
[ =C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x0000000002 [0x410f=
d034]
[ =C2=A0 =C2=A00.000000] Linux version 5.4.147+gbbb2e2b (oe-user@oe-host) (=
gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Wed Dec 1 22:21:40 UTC 2021
[ =C2=A0 =C2=A00.000000] Machine model: Freescale i.MX8MQ EVK
[ =C2=A0 =C2=A00.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (op=
tions '115200')
[ =C2=A0 =C2=A00.000000] printk: bootconsole [ec_imx6q0] enabled
[ =C2=A0 =C2=A00.000000] efi: Getting EFI parameters from FDT:
[ =C2=A0 =C2=A00.000000] efi: UEFI not found.
[ =C2=A0 =C2=A00.000000] cma: Reserved 320 MiB at 0x00000000e8000000
imx8mqevk:/dev# [ =C2=A0 =C2=A00.000000] NUMA: No NUMA configuration found
[ =C2=A0 =C2=A00.000000] NUMA: Faking a node at [mem 0x00000000c0000000-0x0=
0000000fdbfffff]
[ =C2=A0 =C2=A00.000000] NUMA: NODE_DATA [mem 0xfda0e500-0xfda0ffff]
[ =C2=A0 =C2=A00.000000] Zone ranges:
[ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x00000000c0000000-=
0x00000000fdbfffff]
[ =C2=A0 =C2=A00.000000] =C2=A0 Normal =C2=A0 empty
[ =C2=A0 =C2=A00.000000] Movable zone start for each node
[ =C2=A0 =C2=A00.000000] Early memory node ranges
[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00000000c0000000-0x00=
000000fdbfffff]
[ =C2=A0 =C2=A00.000000] Initmem setup node 0 [mem 0x00000000c0000000-0x000=
00000fdbfffff]
[ =C2=A0 =C2=A00.000000] psci: probing for conduit method from DT.
[ =C2=A0 =C2=A00.000000] psci: PSCIv1.1 detected in firmware.
[ =C2=A0 =C2=A00.000000] psci: Using standard PSCI v0.2 function IDs
[ =C2=A0 =C2=A00.000000] psci: MIGRATE_INFO_TYPE not supported.
[ =C2=A0 =C2=A00.000000] psci: SMC Calling Convention v1.1
[ =C2=A0 =C2=A00.000000] percpu: Embedded 33 pages/cpu s98072 r8192 d28904 =
u135168
[ =C2=A0 =C2=A00.000000] Detected VIPT I-cache on CPU0
[ =C2=A0 =C2=A00.000000] CPU features: detected: ARM erratum 845719
[ =C2=A0 =C2=A00.000000] CPU features: detected: GIC system register CPU in=
terface
[ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility grouping on.=C2=A0 Tot=
al pages: 248976
[ =C2=A0 =C2=A00.000000] Policy zone: DMA32
[ =C2=A0 =C2=A00.000000] Kernel command line: clk_ignore_unused console=3Dt=
tymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk2p2 r=
ootwait rw
[ =C2=A0 =C2=A00.000000] Dentry cache hash table entries: 131072 (order: 8,=
 1048576 bytes, linear)
[ =C2=A0 =C2=A00.000000] Inode-cache hash table entries: 65536 (order: 7, 5=
24288 bytes, linear)
[ =C2=A0 =C2=A00.000000] mem auto-init: stack:off, heap alloc:off, heap fre=
e:off
[ =C2=A0 =C2=A00.000000] Memory: 632620K/1011712K available (17212K kernel =
code, 2074K rwdata, 7068K rodata, 3712K init, 1034K bss, 51412K reserved, 3=
27680K cma-reserved)
[ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, C=
PUs=3D2, Nodes=3D1
[ =C2=A0 =C2=A00.000000] rcu: Preemptible hierarchical RCU implementation.
[ =C2=A0 =C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU restricting CPUs from NR_CP=
US=3D256 to nr_cpu_ids=3D2.
[ =C2=A0 =C2=A00.000000] =C2=A0Tasks RCU enabled.
[ =C2=A0 =C2=A00.000000] rcu: RCU calculated value of scheduler-enlistment =
delay is 25 jiffies.
[ =C2=A0 =C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, =
nr_cpu_ids=3D2
[ =C2=A0 =C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[ =C2=A0 =C2=A00.000000] GICv3: 128 SPIs implemented
[ =C2=A0 =C2=A00.000000] GICv3: 0 Extended SPIs implemented
[ =C2=A0 =C2=A00.000000] GICv3: Distributor has no Range Selector support
[ =C2=A0 =C2=A00.000000] GICv3: 16 PPIs implemented
[ =C2=A0 =C2=A00.000000] GICv3: no VLPI support, no direct LPI support
[ =C2=A0 =C2=A00.000000] GICv3: CPU0: found redistributor 2 region 0:0x0000=
0000388c0000
[ =C2=A0 =C2=A00.000000] ITS: No ITS available, not enabling LPIs
[ =C2=A0 =C2=A00.000000] random: get_random_bytes called from start_kernel+=
0x318/0x49c with crng_init=3D0
[ =C2=A0 =C2=A00.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt=
).
[ =C2=A0 =C2=A00.000000] clocksource: arch_sys_counter: mask: 0xfffffffffff=
fff max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns
[ =C2=A0 =C2=A00.000004] sched_clock: 56 bits at 8MHz, resolution 120ns, wr=
aps every 2199023255541ns
[ =C2=A0 =C2=A00.008140] Console: colour dummy device 80x25
[ =C2=A0 =C2=A00.012468] Calibrating delay loop (skipped), value calculated=
 using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)
[ =C2=A0 =C2=A00.022663] pid_max: default: 32768 minimum: 301
[ =C2=A0 =C2=A00.027337] LSM: Security Framework initializing
[ =C2=A0 =C2=A00.031912] Smack: =C2=A0Initializing.
[ =C2=A0 =C2=A00.035152] Smack: =C2=A0IPv6 port labeling enabled.
[ =C2=A0 =C2=A00.039717] Mount-cache hash table entries: 2048 (order: 2, 16=
384 bytes, linear)
[ =C2=A0 =C2=A00.047061] Mountpoint-cache hash table entries: 2048 (order: =
2, 16384 bytes, linear)
[ =C2=A0 =C2=A00.056210] ASID allocator initialised with 32768 entries
[ =C2=A0 =C2=A00.060340] rcu: Hierarchical SRCU implementation.
[ =C2=A0 =C2=A00.065289] EFI services will not be available.
[ =C2=A0 =C2=A00.069677] smp: Bringing up secondary CPUs ...
[ =C2=A0 =C2=A00.074490] Detected VIPT I-cache on CPU1
[ =C2=A0 =C2=A00.074525] GICv3: CPU1: found redistributor 3 region 0:0x0000=
0000388e0000
[ =C2=A0 =C2=A00.074566] CPU1: Booted secondary processor 0x0000000003 [0x4=
10fd034]
[ =C2=A0 =C2=A00.074660] smp: Brought up 1 node, 2 CPUs
[ =C2=A0 =C2=A00.095498] SMP: Total of 2 processors activated.
[ =C2=A0 =C2=A00.100182] CPU features: detected: 32-bit EL0 Support
[ =C2=A0 =C2=A00.105318] CPU features: detected: CRC32 instructions
[ =C2=A0 =C2=A00.120795] CPU: All CPU(s) started at EL1
[ =C2=A0 =C2=A00.122044] alternatives: patching kernel code
[ =C2=A0 =C2=A00.127762] devtmpfs: initialized
[ =C2=A0 =C2=A00.131440] clocksource: jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 7645041785100000 ns
[ =C2=A0 =C2=A00.139498] futex hash table entries: 512 (order: 3, 32768 byt=
es, linear)
[ =C2=A0 =C2=A00.155615] pinctrl core: initialized pinctrl subsystem
[ =C2=A0 =C2=A00.158617] DMI not present or invalid.
[ =C2=A0 =C2=A00.162081] NET: Registered protocol family 16
[ =C2=A0 =C2=A00.173481] DMA: preallocated 256 KiB pool for atomic allocati=
ons
[ =C2=A0 =C2=A00.176737] audit: initializing netlink subsys (disabled)
[ =C2=A0 =C2=A00.182242] audit: type=3D2000 audit(0.136:1): state=3Dinitial=
ized audit_enabled=3D0 res=3D1
[ =C2=A0 =C2=A00.189855] cpuidle: using governor menu
[ =C2=A0 =C2=A00.194092] hw-breakpoint: found 6 breakpoint and 4 watchpoint=
 registers.
[ =C2=A0 =C2=A00.200888] Serial: AMBA PL011 UART driver
[ =C2=A0 =C2=A00.204654] imx mu driver is registered.
[ =C2=A0 =C2=A00.208501] imx rpmsg driver is registered.
[ =C2=A0 =C2=A00.231076] HugeTLB registered 1.00 GiB page size, pre-allocat=
ed 0 pages
[ =C2=A0 =C2=A00.234931] HugeTLB registered 32.0 MiB page size, pre-allocat=
ed 0 pages
[ =C2=A0 =C2=A00.241608] HugeTLB registered 2.00 MiB page size, pre-allocat=
ed 0 pages
[ =C2=A0 =C2=A00.248291] HugeTLB registered 64.0 KiB page size, pre-allocat=
ed 0 pages
[ =C2=A0 =C2=A00.256007] cryptd: max_cpu_qlen set to 1000
[ =C2=A0 =C2=A00.261848] ACPI: Interpreter disabled.
[ =C2=A0 =C2=A00.263391] iommu: Default domain type: Translated
[ =C2=A0 =C2=A00.268086] vgaarb: loaded
[ =C2=A0 =C2=A00.270905] SCSI subsystem initialized
[ =C2=A0 =C2=A00.274698] usbcore: registered new interface driver usbfs
[ =C2=A0 =C2=A00.279826] usbcore: registered new interface driver hub
[ =C2=A0 =C2=A00.285127] usbcore: registered new device driver usb
[ =C2=A0 =C2=A00.290446] mc: Linux media interface: v0.10
[ =C2=A0 =C2=A00.294407] videodev: Linux video capture interface: v2.00
[ =C2=A0 =C2=A00.299922] pps_core: LinuxPPS API ver. 1 registered
[ =C2=A0 =C2=A00.304800] pps_core: Software ver. 5.3.6 - Copyright 2005-200=
7 Rodolfo Giometti <giom...@linux.it>
[ =C2=A0 =C2=A00.313927] PTP clock support registered
[ =C2=A0 =C2=A00.317874] EDAC MC: Ver: 3.0.0
[ =C2=A0 =C2=A00.321369] No BMan portals available!
[ =C2=A0 =C2=A00.324882] QMan: Allocated lookup table at (____ptrval____), =
entry count 65537
[ =C2=A0 =C2=A00.332006] No QMan portals available!
[ =C2=A0 =C2=A00.335746] No USDPAA memory, no 'fsl,usdpaa-mem' in device-tr=
ee
[ =C2=A0 =C2=A00.341970] FPGA manager framework
[ =C2=A0 =C2=A00.345172] Advanced Linux Sound Architecture Driver Initializ=
ed.
[ =C2=A0 =C2=A00.351573] NetLabel: Initializing
[ =C2=A0 =C2=A00.354555] NetLabel: =C2=A0domain hash size =3D 128
[ =C2=A0 =C2=A00.358877] NetLabel: =C2=A0protocols =3D UNLABELED CIPSOv4 CA=
LIPSO
[ =C2=A0 =C2=A00.364577] NetLabel: =C2=A0unlabeled traffic allowed by defau=
lt
[ =C2=A0 =C2=A00.370582] clocksource: Switched to clocksource arch_sys_coun=
ter
[ =C2=A0 =C2=A01.126801] VFS: Disk quotas dquot_6.6.0
[ =C2=A0 =C2=A01.127914] VFS: Dquot-cache hash table entries: 512 (order 0,=
 4096 bytes)
[ =C2=A0 =C2=A01.134921] pnp: PnP ACPI: disabled
[ =C2=A0 =C2=A01.145678] thermal_sys: Registered thermal governor 'step_wis=
e'
[ =C2=A0 =C2=A01.145681] thermal_sys: Registered thermal governor 'power_al=
locator'
[ =C2=A0 =C2=A01.149008] NET: Registered protocol family 2
[ =C2=A0 =C2=A01.159787] IP idents hash table entries: 16384 (order: 5, 131=
072 bytes, linear)
[ =C2=A0 =C2=A01.167659] tcp_listen_portaddr_hash hash table entries: 512 (=
order: 1, 8192 bytes, linear)
[ =C2=A0 =C2=A01.175430] TCP established hash table entries: 8192 (order: 4=
, 65536 bytes, linear)
[ =C2=A0 =C2=A01.183185] TCP bind hash table entries: 8192 (order: 5, 13107=
2 bytes, linear)
[ =C2=A0 =C2=A01.190453] TCP: Hash tables configured (established 8192 bind=
 8192)
[ =C2=A0 =C2=A01.196747] UDP hash table entries: 512 (order: 2, 16384 bytes=
, linear)
[ =C2=A0 =C2=A01.203285] UDP-Lite hash table entries: 512 (order: 2, 16384 =
bytes, linear)
[ =C2=A0 =C2=A01.210414] NET: Registered protocol family 1
[ =C2=A0 =C2=A01.215001] RPC: Registered named UNIX socket transport module=
.
[ =C2=A0 =C2=A01.220549] RPC: Registered udp transport module.
[ =C2=A0 =C2=A01.225224] RPC: Registered tcp transport module.
[ =C2=A0 =C2=A01.229907] RPC: Registered tcp NFSv4.1 backchannel transport =
module.
[ =C2=A0 =C2=A01.236334] PCI: CLS 0 bytes, default 64
[ =C2=A0 =C2=A01.240854] kvm [1]: HYP mode not available
[ =C2=A0 =C2=A01.247543] Initialise system trusted keyrings
[ =C2=A0 =C2=A01.249234] workingset: timestamp_bits=3D44 max_order=3D18 buc=
ket_order=3D0
[ =C2=A0 =C2=A01.262658] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[ =C2=A0 =C2=A01.266308] NFS: Registering the id_resolver key type
[ =C2=A0 =C2=A01.270690] Key type id_resolver registered
[ =C2=A0 =C2=A01.274838] Key type id_legacy registered
[ =C2=A0 =C2=A01.278838] nfs4filelayout_init: NFSv4 File Layout Driver Regi=
stering...
[ =C2=A0 =C2=A01.285511] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Dri=
ver Registering...
[ =C2=A0 =C2=A01.292908] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Ha=
t, Inc.
[ =C2=A0 =C2=A01.299464] 9p: Installing v9fs 9p2000 file system support
[ =C2=A0 =C2=A01.321024] Key type asymmetric registered
[ =C2=A0 =C2=A01.322258] Asymmetric key parser 'x509' registered
[ =C2=A0 =C2=A01.327165] Block layer SCSI generic (bsg) driver version 0.4 =
loaded (major 244)
[ =C2=A0 =C2=A01.334506] io scheduler mq-deadline registered
[ =C2=A0 =C2=A01.339020] io scheduler kyber registered
[ =C2=A0 =C2=A01.344069] pci-host-generic bfb00000.pci: host bridge /pci@bf=
b00000 ranges:
[ =C2=A0 =C2=A01.350073] pci-host-generic bfb00000.pci: =C2=A0 MEM 0x100000=
00..0x1000ffff -> 0x10000000
[ =C2=A0 =C2=A01.357904] pci-host-generic bfb00000.pci: ECAM at [mem 0xbfb0=
0000-0xbfbfffff] for [bus 00]
[ =C2=A0 =C2=A01.366299] pci-host-generic bfb00000.pci: PCI host bridge to =
bus 0000:00
[ =C2=A0 =C2=A01.372967] pci_bus 0000:00: root bus resource [bus 00]
[ =C2=A0 =C2=A01.378171] pci_bus 0000:00: root bus resource [mem 0x10000000=
-0x1000ffff]
[ =C2=A0 =C2=A01.385056] pci 0000:00:00.0: [110a:4106] type 00 class 0xff00=
00
[ =C2=A0 =C2=A01.391048] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x0000=
0fff]
[ =C2=A0 =C2=A01.397518] pci 0000:00:01.0: [110a:4106] type 00 class 0xff00=
01
[ =C2=A0 =C2=A01.403282] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x0000=
0fff]
[ =C2=A0 =C2=A01.409905] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-=
0x10000fff]
[ =C2=A0 =C2=A01.416286] pci 0000:00:01.0: BAR 0: assigned [mem 0x10001000-=
0x10001fff]
[ =C2=A0 =C2=A01.423676] EINJ: ACPI disabled.
[ =C2=A0 =C2=A01.427098] Bus freq driver module loaded
[ =C2=A0 =C2=A01.433950] Serial: 8250/16550 driver, 4 ports, IRQ sharing en=
abled
[ =C2=A0 =C2=A01.438875] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =
=3D 5, base_baud =3D 1562500) is a IMX
[ =C2=A0 =C2=A01.454472] brd: module loaded
[ =C2=A0 =C2=A01.460813] loop: module loaded
[ =C2=A0 =C2=A01.504683] imx ahci driver is registered.
[ =C2=A0 =C2=A01.507384] libphy: Fixed MDIO Bus: probed
[ =C2=A0 =C2=A01.510933] tun: Universal TUN/TAP device driver, 1.6
[ =C2=A0 =C2=A01.515357] thunder_xcv, ver 1.0
[ =C2=A0 =C2=A01.518284] thunder_bgx, ver 1.0
[ =C2=A0 =C2=A01.521510] nicpf, ver 1.0
[ =C2=A0 =C2=A01.524328] Freescale FM module, FMD API version 21.1.0
[ =C2=A0 =C2=A01.529414] Freescale FM Ports module
[ =C2=A0 =C2=A01.533013] fsl_mac: fsl_mac: FSL FMan MAC API based driver
[ =C2=A0 =C2=A01.538614] fsl_dpa: FSL DPAA Ethernet driver
[ =C2=A0 =C2=A01.542943] fsl_advanced: FSL DPAA Advanced drivers:
[ =C2=A0 =C2=A01.547856] fsl_proxy: FSL DPAA Proxy initialization driver
[ =C2=A0 =C2=A01.553450] fsl_oh: FSL FMan Offline Parsing port driver
[ =C2=A0 =C2=A01.559103] hclge is initializing
[ =C2=A0 =C2=A01.561998] hns3: Hisilicon Ethernet Network Driver for Hip08 =
Family - version
[ =C2=A0 =C2=A01.569209] hns3: Copyright (c) 2017 Huawei Corporation.
[ =C2=A0 =C2=A01.574555] e1000: Intel(R) PRO/1000 Network Driver - version =
7.3.21-k8-NAPI
[ =C2=A0 =C2=A01.581534] e1000: Copyright (c) 1999-2006 Intel Corporation.
[ =C2=A0 =C2=A01.587303] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[ =C2=A0 =C2=A01.593078] e1000e: Copyright(c) 1999 - 2015 Intel Corporation=
.
[ =C2=A0 =C2=A01.599025] igb: Intel(R) Gigabit Ethernet Network Driver - ve=
rsion 5.6.0-k
[ =C2=A0 =C2=A01.605926] igb: Copyright (c) 2007-2014 Intel Corporation.
[ =C2=A0 =C2=A01.611521] igbvf: Intel(R) Gigabit Virtual Function Network D=
river - version 2.4.0-k
[ =C2=A0 =C2=A01.619298] igbvf: Copyright (c) 2009 - 2012 Intel Corporation=
.
[ =C2=A0 =C2=A01.625275] sky2: driver version 1.30
[ =C2=A0 =C2=A01.629226] ivshmem-net 0000:00:01.0: enabling device (0000 ->=
 0002)
[ =C2=A0 =C2=A01.635261] ivshmem-net 0000:00:01.0: TX memory at 0x00000000b=
fe80000, size 0x000000000007f000
[ =C2=A0 =C2=A01.643779] ivshmem-net 0000:00:01.0: RX memory at 0x00000000b=
fe01000, size 0x000000000007f000
_ivshmem 0000:00:00.0: state_table at 0x00000000bfd00000, size 0x0000000000=
001000o58s ready
[ =C2=A0 =C2=A01.667569] uio_ivshmem 0000:00:00.0: rw_section at 0x00000000=
bfd01000, size 0x0000000000009000
[ =C2=A0 =C2=A01.676244] uio_ivshmem 0000:00:00.0: input_sections at 0x0000=
0000bfd0a000, size 0x0000000000006000
[ =C2=A0 =C2=A01.685268] uio_ivshmem 0000:00:00.0: output_section at 0x0000=
0000bfd0e000, size 0x0000000000002000
[ =C2=A0 =C2=A01.694814] VFIO - User Level meta-driver version: 0.3
[ =C2=A0 =C2=A01.700138] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI=
) Driver
[ =C2=A0 =C2=A01.705933] ehci-pci: EHCI PCI platform driver
[ =C2=A0 =C2=A01.710384] ehci-platform: EHCI generic platform driver
[ =C2=A0 =C2=A01.715598] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Dr=
iver
[ =C2=A0 =C2=A01.721741] ohci-pci: OHCI PCI platform driver
[ =C2=A0 =C2=A01.726175] ohci-platform: OHCI generic platform driver
[ =C2=A0 =C2=A01.731493] usbcore: registered new interface driver usb-stora=
ge
[ =C2=A0 =C2=A01.737402] usbcore: registered new interface driver usbserial=
_generic
[ =C2=A0 =C2=A01.743876] usbserial: USB Serial support registered for gener=
ic
[ =C2=A0 =C2=A01.749866] usbcore: registered new interface driver cp210x
[ =C2=A0 =C2=A01.755414] usbserial: USB Serial support registered for cp210=
x
[ =C2=A0 =C2=A01.761327] usbcore: registered new interface driver usb_seria=
l_simple
[ =C2=A0 =C2=A01.767836] usbserial: USB Serial support registered for carel=
ink
[ =C2=A0 =C2=A01.773904] usbserial: USB Serial support registered for zio
[ =C2=A0 =C2=A01.779547] usbserial: USB Serial support registered for funso=
ft
[ =C2=A0 =C2=A01.785535] usbserial: USB Serial support registered for flash=
loader
[ =C2=A0 =C2=A01.791874] usbserial: USB Serial support registered for googl=
e
[ =C2=A0 =C2=A01.797776] usbserial: USB Serial support registered for libtr=
ansistor
[ =C2=A0 =C2=A01.804286] usbserial: USB Serial support registered for vivop=
ay
[ =C2=A0 =C2=A01.810274] usbserial: USB Serial support registered for moto_=
modem
[ =C2=A0 =C2=A01.816526] usbserial: USB Serial support registered for motor=
ola_tetra
[ =C2=A0 =C2=A01.823127] usbserial: USB Serial support registered for novat=
el_gps
[ =C2=A0 =C2=A01.829469] usbserial: USB Serial support registered for hp4x
[ =C2=A0 =C2=A01.835189] usbserial: USB Serial support registered for suunt=
o
[ =C2=A0 =C2=A01.841092] usbserial: USB Serial support registered for sieme=
ns_mpi
[ =C2=A0 =C2=A01.848500] i2c /dev entries driver
[ =C2=A0 =C2=A01.850968] usbcore: registered new interface driver i2c-tiny-=
usb
[ =C2=A0 =C2=A01.857640] imx-cpufreq-dt: probe of imx-cpufreq-dt failed wit=
h error -2
[ =C2=A0 =C2=A01.863865] sdhci: Secure Digital Host Controller Interface dr=
iver
[ =C2=A0 =C2=A01.869815] sdhci: Copyright(c) Pierre Ossman
[ =C2=A0 =C2=A01.874218] Synopsys Designware Multimedia Card Interface Driv=
er
[ =C2=A0 =C2=A01.880265] sdhci-pltfm: SDHCI platform and OF driver helper
[ =C2=A0 =C2=A01.885988] sdhci-esdhc-imx 30b40000.mmc: could not get pinctr=
l
[ =C2=A0 =C2=A01.922878] mmc2: SDHCI controller on 30b40000.mmc [30b40000.m=
mc] using ADMA
[ =C2=A0 =C2=A01.927813] ledtrig-cpu: registered to indicate activity on CP=
Us
[ =C2=A0 =C2=A01.934117] usbcore: registered new interface driver usbhid
[ =C2=A0 =C2=A01.938650] usbhid: USB HID core driver
[ =C2=A0 =C2=A01.943182] No fsl,qman node
[ =C2=A0 =C2=A01.945348] Freescale USDPAA process driver
[ =C2=A0 =C2=A01.949525] fsl-usdpaa: no region found
[ =C2=A0 =C2=A01.953344] Freescale USDPAA process IRQ driver
[ =C2=A0 =C2=A01.959898] usbcore: registered new interface driver snd-usb-a=
udio
[ =C2=A0 =C2=A01.966247] pktgen: Packet Generator for packet performance te=
sting. Version: 2.75
[ =C2=A0 =C2=A01.971766] drop_monitor: Initializing network drop monitor se=
rvice
[ =C2=A0 =C2=A01.977889] NET: Registered protocol family 26
[ =C2=A0 =C2=A01.982808] NET: Registered protocol family 10
[ =C2=A0 =C2=A01.987363] Segment Routing with IPv6
[ =C2=A0 =C2=A01.990314] NET: Registered protocol family 17
[ =C2=A0 =C2=A01.994752] 8021q: 802.1Q VLAN Support v1.8
[ =C2=A0 =C2=A01.998931] lib80211: common routines for IEEE802.11 drivers
[ =C2=A0 =C2=A02.004686] 9pnet: Installing 9P2000 support
[ =C2=A0 =C2=A02.008803] tsn generic netlink module v1 init...
[ =C2=A0 =C2=A02.013535] Key type dns_resolver registered
[ =C2=A0 =C2=A02.018325] registered taskstats version 1
[ =C2=A0 =C2=A02.021787] Loading compiled-in X.509 certificates
[ =C2=A0 =C2=A02.028774] hctosys: unable to open rtc device (rtc0)
[ =C2=A0 =C2=A02.031735] clk: Not disabling unused clocks
[ =C2=A0 =C2=A02.035868] ALSA device list:
[ =C2=A0 =C2=A02.038808] =C2=A0 No soundcards found.
[ =C2=A0 =C2=A02.042235] Warning: unable to open an initial console.
[ =C2=A0 =C2=A02.047626] Waiting for root device /dev/mmcblk2p2...
[ =C2=A0 =C2=A02.095262] mmc2: new DDR MMC card at address 0001
[ =C2=A0 =C2=A02.097737] mmcblk2: mmc2:0001 DG4016 14.7 GiB
[ =C2=A0 =C2=A02.101934] mmcblk2boot0: mmc2:0001 DG4016 partition 1 4.00 Mi=
B
[ =C2=A0 =C2=A02.107842] mmcblk2boot1: mmc2:0001 DG4016 partition 2 4.00 Mi=
B
[ =C2=A0 =C2=A02.113647] mmcblk2rpmb: mmc2:0001 DG4016 partition 3 4.00 MiB=
, chardev (237:0)
[ =C2=A0 =C2=A02.123465] =C2=A0mmcblk2: p1 p2
[ =C2=A0 =C2=A02.139262] EXT4-fs (mmcblk2p2): mounted filesystem with order=
ed data mode. Opts: (null)
[ =C2=A0 =C2=A02.144558] VFS: Mounted root (ext4 filesystem) on device 179:=
2.
[ =C2=A0 =C2=A02.150930] devtmpfs: error mounting -2
[ =C2=A0 =C2=A02.156025] Freeing unused kernel memory: 3712K
[ =C2=A0 =C2=A02.158906] Run /sbin/init as init process
[ =C2=A0 =C2=A02.162934] Run /etc/init as init process
[ =C2=A0 =C2=A02.166921] Run /bin/init as init process
[ =C2=A0 =C2=A02.170922] Run /bin/sh as init process
[ =C2=A0 =C2=A02.174728] Kernel panic - not syncing: No working init found.=
=C2=A0 Try passing init=3D option to kernel. See Linux Documentation/admin-=
guide/init.rst for guidance.
[ =C2=A0 =C2=A02.188854] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.4.147+=
gbbb2e2b #1
[ =C2=A0 =C2=A02.195620] Hardware name: Freescale i.MX8MQ EVK (DT)
[ =C2=A0 =C2=A02.200655] Call trace:
[ =C2=A0 =C2=A02.203094] =C2=A0dump_backtrace+0x0/0x140
[ =C2=A0 =C2=A02.206734] =C2=A0show_stack+0x14/0x20
[ =C2=A0 =C2=A02.210036] =C2=A0dump_stack+0xb4/0x110
[ =C2=A0 =C2=A02.213419] =C2=A0panic+0x158/0x360
[ =C2=A0 =C2=A02.216455] =C2=A0kernel_init+0xf0/0x108
[ =C2=A0 =C2=A02.219929] =C2=A0ret_from_fork+0x10/0x1c
[ =C2=A0 =C2=A02.223489] SMP: stopping secondary CPUs
[ =C2=A0 =C2=A02.227396] Kernel Offset: disabled
[ =C2=A0 =C2=A02.230865] CPU features: 0x0002,2000200c
[ =C2=A0 =C2=A02.234856] Memory Limit: none
[ =C2=A0 =C2=A02.237901] ---[ end Kernel panic - not syncing: No working in=
it found.=C2=A0 Try passing init=3D option to kernel. See Linux Documentati=
on/admin-guide/init.rst for guidance. ]---


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to mailto:jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://eur01.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fd%2Fmsgid%2Fjailhouse=
-dev%2Fe3d17a73-37b0-4250-9168-e37a134a4af4n%2540googlegroups.com%3Futm_med=
ium%3Demail%26utm_source%3Dfooter&data=3D05%7C01%7Cpeng.fan%40nxp.com%7C876=
fb93d73c1401762b208da4fc7562f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C=
637910014819396602%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&sdata=3DiC2%2FYfITenIFLf=
RbSvhA1jkpc9YVgcsKXTAtmglag3I%3D&reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DU0PR04MB9417128E148DDB41EE4F2D8E88BE9%40DU0PR04MB9417.eurprd=
04.prod.outlook.com.
