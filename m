Return-Path: <jailhouse-dev+bncBC44VTVY2UERBCUNUODAMGQEHZDUQKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 0572A3A83EA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 17:26:03 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id m11-20020a2e580b0000b0290152246e1297sf5908155ljb.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 08:26:03 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623770762; cv=pass;
        d=google.com; s=arc-20160816;
        b=P6C/hPLnx1radMVTjLcgwOic0kHXLE9xbZ7VqmJAoHheglda7GJ5AMyQe1cMYdQHl+
         QdIJhtWQZl0ya3tn+FTuWeXYG6yUNJ7vBITzYP/cIXl7a/V/i7sQzRBfl9bJql/esgu6
         ZU5m0banA48nGeVr3E+FNV64P6mgevSNdLKaAOVuIGcAlySqPPiPs1Vfes569oMTUvcl
         s/BPO7VFZjNGUaL/yQ/F7RmquPWcy0ZrKj2CtQUZ+6GnlnUF7dX6Sk8/9DVrWcWwK0kO
         5YYHJZhYSgwGaodoZSNDssTYnxB8gMN99uHw5mXt3Q18UEAU016GzUCMsUMbs7D18DyX
         Nq9g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=f+cpBBXh4vY3Zj3g77wBt3EbPiuna7yt4ImV73W5r9c=;
        b=w7u6NLSqNwmA2/a/i7QNeT2rN6wXRKAcHAuSdZjdsBllLEjWgCXA7jnF3SzbIOdlgJ
         piq4GJxASBf/wDl8a4Xst/4bX3QMlrzE+ATG7Xu0bTZ0Ajj2diyf0NcYRAptzk0ncgD7
         xYjr9U3WaJg6bQhPbUlLx7iJDNCtxTU4AdQ+m8MJ7bMRjDljvh1/FYHJnB/XHyaH6P7l
         R4dFRXDmukUSUrXU4Yc7AH+VqKoUN15psSxHH1k+ocSCfHf0RclnuQV4PM1xCOtCvdxH
         wZ2FL/siX03RhK23zn4OdGgTPIeExfwGRk0viEsTMCwMVIevJzgEZvAMJ49xn8FXM2iq
         1zLw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="O4FL/F3J";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.57 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f+cpBBXh4vY3Zj3g77wBt3EbPiuna7yt4ImV73W5r9c=;
        b=CrKngI/vYHmRvIsghFDh1JvWCsaWUz/sKvMRxg+xBUQffiCUT3R1nsZ6nBGvef8F+b
         KwTW1Blch/aCxhE6nS63vAZlx1Aj81HiG7lSFe+1AbAdnxCxMROn4iwWA3dO6f5NPuIP
         yHmmhjIbuxF+ak14X2iyvXFZOiho94PEzBNLNr+72e9cUxGrOiV2ornB3Pj+a21c9jVC
         yvPRU7ptjzdg7kDKzMqTiSTEtpMiKkMOSb7pa/d2tc0TMOs/Nb9ajbTJo99wGvZfT7pt
         QAnGe4FWQOK2dRigyQx8H2lfmD81nhQd9RiuKd0nou9sySPEiP5GD0LZLUV6kCEjw5ZH
         6fYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f+cpBBXh4vY3Zj3g77wBt3EbPiuna7yt4ImV73W5r9c=;
        b=oNI1LgxzI8eRUsY1/ESdu3cBxG8KRtAEAwVo4esVemzY+pGKXGSIQvIKrDlQsi8meD
         ifjOVnm0sj2PlTFEjKPWrYd8AZMhWt1Vl5CBlMbjWnt6xFuKO/09UJkEBpuksVOOHYAz
         OQ13IoFobqIXWejXoYDhjnjueLKxOE8GipE0rX8cQERpoDqw7KEWhRS/mvkN4bnyYgJa
         Ba5Q2vyYCkvjrYiSeh3xcfHjL6gzUoGqL8slZl0G1PC7p/L9dF0jqaekFQdsoiLr8lvJ
         IBwIaf2XIT4p+DNW2aZL/5Pt8SVNWsu9rUXTH0bhBoH6i5bi0Bz3w6Ghna11lrrF9Mfz
         q/SQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nGIBNZQh5ME7MdLwxFXFqBuuKWG9Wd9ziJ8Ezf8DuiGUHhBBw
	j5P1rrGPnOhqw57biEJmip0=
X-Google-Smtp-Source: ABdhPJyvnUVPwSlgJXy5gnnhJHcX35PB7ewXSDqt/n4978aAvoKUZ1J+Eq/q12Gp+NRQpXul4fEB8Q==
X-Received: by 2002:a2e:8198:: with SMTP id e24mr133184ljg.53.1623770762507;
        Tue, 15 Jun 2021 08:26:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9617:: with SMTP id v23ls4596039ljh.7.gmail; Tue, 15 Jun
 2021 08:26:01 -0700 (PDT)
X-Received: by 2002:a2e:9715:: with SMTP id r21mr165603lji.46.1623770761405;
        Tue, 15 Jun 2021 08:26:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623770761; cv=pass;
        d=google.com; s=arc-20160816;
        b=KvBX/tukCzzzRaHL7j5x7otCHQ3BweJTuINH4kBQa6pSonrAuu3jTjnveqKNBxwD/X
         RSJAIYsUx9XakDDil9dyKhZ8cA3pSSw2fWkF2zvMn9wkox0kKi3lQTZeHGRIhYRSal4J
         qaOnCY43iIa7k+N5ceode1dPl4QVJgjEhQg9V525xD5wfqG9xK51RAew+GUi1rmiQJID
         E+zMWW2X6SDa18+NF4AcIIt3CtA4wiILoJAXF8DhsQLwzOaLRarVkXn20omn5Xgtx7Sb
         GIhqQHPh9wt8AXbuP03jYzta8PBtiG9jtMWs/HeRcfJpMHQqoYDklTxedc2+/BB8sovt
         t3xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uVt4wCK8qHK5lZM8nY1yF8Mvm54LS6Z/qMmClRIw7Wk=;
        b=evuhahLVY43s1RxZjyDoFOqYzS3mrta2yPUZaqLaLVHZE1T58yr3yyzWdewp05cMIc
         qDZZs7UajSG1wEC8C9zwNkPpNUMtc/MfETXX/U8kkapOWT1EhbIhd21i+t8r52x+BQWv
         soPoK0KnjWBlaX4kwFqG51KxUUemlV7C/Cpp15FQVW8Cejo/5J2K7XhnugccEsQOnYAY
         M/8MELae7xaCsnvNfHjpgTedqQaaRsCxMsh1qnHK7VvRr2STGmPkKEW/OazghHYVxHJH
         +DmQWHdHWHqtlycbM5TORwtPshOKthybIQ6z6K5y/ne2kYaqQ7+1Q/Vm5OwN82sC+Cat
         +0Lg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="O4FL/F3J";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.57 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80057.outbound.protection.outlook.com. [40.107.8.57])
        by gmr-mx.google.com with ESMTPS id w3si119900ljg.8.2021.06.15.08.26.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 08:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.57 as permitted sender) client-ip=40.107.8.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZY9zHqWtVtqRwztXcdX/HmguV6uFR+Zq+MTuA/rZiUDXGV0O/FDO27Zn2NZhT+z4JwZG1RDwqxCK9iP6dixZ6GYZ3uoYAMUOo5ZodKxpAOwLDCnDdN29BJRGnhhuN6SkS72aaMV7C1DO03+g/CQMr/ojI+ZMCJ0EMxk0cvErW1fO807ByFzPCJSC+/5aAFYEUfGOHrpQKO3wVSLJwo4uubTDdwz1/HS/v4KMWieXr5ttNYaZcDzrsV1m2JLrvMTLHDpk/03f+HWsuZtdJ3okuUv/u2qW9F9cCiA8wYiBjKGSic4OvKnlHGLS2gj01Gs++jKLKijBtFlYKeklzeB0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVt4wCK8qHK5lZM8nY1yF8Mvm54LS6Z/qMmClRIw7Wk=;
 b=NwZsIZa14uyy7XZCvBOUpenFJYIMHlvEafwrlfup8nGwN7NJmNOuXpfzalkoQt6P4SHPrtmuaYNOoqtpoAiWtweS0AtCk9pexmxFeXwtavn3wAvl1e0Aqe4jgJ/zhhQl3kc1YJX8UXwtEQ3rituAZnpRHI7rNEOzIDP//OW4JylJz5q5EwCvt/ICITi97XYYFNZyQQPAqConqzTzqoCLTv1Xmo6F6DFXrskZGL10i8gR9hH8Fp6f59NfWuwA55sTWL1MhrF/nKd09UdYE6w8N80r17o4YrX1XqSIKM2agEuVt6Kap3fIRCZf67Q9V3HdmxOY5/a8OMMfH8cU8r8weQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:26:00 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 15:26:00 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v3 4/4] doc: Migrate docs from python 2 to python 3
Date: Tue, 15 Jun 2021 17:25:50 +0200
Message-Id: <20210615152550.356561-5-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615152550.356561-1-florian.bezdeka@siemens.com>
References: <20210615152550.356561-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
X-ClientProxiedBy: VI1PR0901CA0098.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::24) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5) by VI1PR0901CA0098.eurprd09.prod.outlook.com (2603:10a6:800:7e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:25:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47407e6b-5d8a-47fe-9448-08d93011e13d
X-MS-TrafficTypeDiagnostic: AM0PR10MB3699:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB3699365FB16897831F19700EF6309@AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8WS//m6cGN8y0LXnZz0kUKSbgj7vjg7EZXZ7Swbgee/Mbo9dHSEX9lKT0d5t7Gz8kLv9sSgyucDlGlLvC6HBU767GzsJ34M+zxYAriSdPNkh7wQihBSamyWdnmCWEtJp9mi8lj0MF4XgMcV+ee25w1sysNHCBrzcdbI3j8gIaQ5cnjoF50pSbHRBXI+cAKfSUHZrrTvebbzu0huIrDvp9gbS3q1czU6f+EJHJMThKZsOh0aWqhRkXJZ23ng6MXmyuGmd71Mv60//WIZN6LieXY420E5cMaIDERH8TGa7+YBILFyTx0RVOcoZAtERXdvIY+773Djmdiag6pw/npFX/+MLTz/ELnj1Lv6WeBy54M+gvRmmBWJjD2yfQJyvPzgO9ue4cEV+3AwNH6pyrgtyBEeYtO7VEouWupReMcQ6F3uooHRoJ9ZTeumxffdrxmU418ENLvgzMJokjVfaW3l2XVfesfgQMuT7CtQJXzgewVaQJyLpawDsV58yERKiFa2Y8402+QVGnHEivv8FVSKy+18C/A63BJsUYeDp/He9CymosjU2cZKSLxa10DRX/R97kJuOZ+8AdGxwqhmYZew945hjKTeBfjkmtKeZYYtY/s7sGPl8yX6pA44Y1HKSSR30T1gN0jEa9zR/zo/yKBKALmPHsOj/8qa7Wanpz6xq9cYLeSusya2h+in0KGByXpfSLlG9kYJ7OZUap2ArA7n5YPKbGso/aExYIXlkX3UQH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(6486002)(6496006)(83380400001)(54906003)(107886003)(6666004)(966005)(186003)(5660300002)(8676002)(316002)(44832011)(16526019)(36756003)(66946007)(66556008)(66476007)(2616005)(4326008)(38100700002)(2906002)(478600001)(8936002)(6916009)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8YtCncCl21kJagxr0U2SnLOQ9s6zMX1Z16yR2U5lVKqp+LEfV3P6tZqwJdbO?=
 =?us-ascii?Q?NignuvYj9XSZmHM3ooXThcVcSjDmYUlSijKHaTJ4zqwyoUwzWvJwKx5pJ6aQ?=
 =?us-ascii?Q?Fh13OXn87rX7pTqFO+atObjHbG6Nlw+Fkd+Xj46nsL9uijfbwdETly9YEC+N?=
 =?us-ascii?Q?1skVAQ1YOaA57ppx9kqjhHLF+od6RsdqxbRA66knfgIQ9+T7AYLtzzAnjRDk?=
 =?us-ascii?Q?IF8hakMZjT3oxzKmULn8kgpmtIm/wPMPhn5kSlww8Yb+nwCxoAWHBhehrFmU?=
 =?us-ascii?Q?Ffw1IALL5KOhCsHNPnmw+s1YzvvuIGY+bCw82ysL8YDKcAyWH9NQkAbS3joM?=
 =?us-ascii?Q?r4dFJqW8Rze5uEk+Ey/P/sIq4PoA0Av5Ku26h65VujOPZ36vUXUfR7sCG9PD?=
 =?us-ascii?Q?89czHNYWeCODqQawcqHb4oAbGgYzEB4fTy9WdeTqpOC4UpkH43WfGkF5ybdy?=
 =?us-ascii?Q?l2xTfwrpUrSrphC5unuraCbum1B00N42lQod+rGnGO1GnbJwFHrfjLykVQIU?=
 =?us-ascii?Q?ulXgSfo+r+iDdjC+vpn4A0lpja8qBQX7nuy9VokP9Is6hQd7RG661/VSxJAz?=
 =?us-ascii?Q?NNmysJokAZV+3UxCkr9xVNddj6sV3lsabaNYntC61rl0kroLCXTd4ss1BkQ/?=
 =?us-ascii?Q?rSAMwnuOHtDclKlaEA/xSe8DLBWSeDGn1Ad+4jvK1I/lpfMDPQYhN3AkKnpb?=
 =?us-ascii?Q?9eMUiunJtwkpXQCSaFDbwjvoQyNGCgoJwQ1RSX1Tow3CFLdvDi8WoK80PBrH?=
 =?us-ascii?Q?AfJdjqfGuPQ0b8YKUT5lOTmdrit7uh6pnvsuC0Pkh9r9I9gNdI0DRBcDPeoY?=
 =?us-ascii?Q?CMWT8AV7tGl/8aJBMPzg5HJSRjwSfOGxZe4yN0V3+9ulp7w7Y+P2mhxkb4/q?=
 =?us-ascii?Q?cd2VzJKg0PHEqrifG+E5zzNLuSxF/Wwp1t5ihl/tJiyivAN1BC9KHllsUNGh?=
 =?us-ascii?Q?+JQ/XjcvdaMgSA8CHLo9qtA6aRXdBN9s7nqpFbxdDCW9hXs9682bl+sLOmz6?=
 =?us-ascii?Q?NA6eMQ/RCeI3Fmf77sK6ULQenTyC9kk43h0bcRLRKWqtsuFA4toJFd2g8Spi?=
 =?us-ascii?Q?2LS7DwRTSl055mbe/uv/8bGKDWZ08kfvsBvqUiWeyx82LFgeZDmc26Mj/SBm?=
 =?us-ascii?Q?gxcyrwQBpXsCasE6rC3u/tAvm2voMMwhwt3894nZbgTIVcpVvZe7fO1vAOqM?=
 =?us-ascii?Q?AIXsjeFUfVdJ6Dw4Euofx2e96N33OVBoNuMAkirwhHGTJtC/qDkL7URW17z8?=
 =?us-ascii?Q?Fktt3A2aA4Em78dylynGY50/Hk3LEbEcmjHp9t5BY6pDh0SE8VN8ooUDPTyq?=
 =?us-ascii?Q?MHZNW6nXzqSuzNEQSSvkbu99eT/3BVA5ZnZznR/47vcsXub4fadeoKpa1jpY?=
 =?us-ascii?Q?gfONd8zeUGwsxvbwS3cHJlqENk8R?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47407e6b-5d8a-47fe-9448-08d93011e13d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:26:00.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0q0jVqw83U33Y8aCqYCWtLho2fmxsLLs8e8W0iR0LJF1urCB61iqDjsxb1RRhs3PDEZObVWK26C81DWBr7kILLu1XZcGF9YRR6zb/Cs3t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3699
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b="O4FL/F3J";       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.57 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 CONTRIBUTING.md                               | 2 +-
 Documentation/setup-on-banana-pi-arm-board.md | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 249618df..dc4d9785 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -34,7 +34,7 @@ Contribution Checklist
     - seemingly unaffected architectures still build (use Travis CI e.g.)
     - static code analyzer finds no new defects (register a github fork with
       Travis CI and Coverity for free scanning) [*recommended*]
-    - python code shall be tested with python 2 and 3 [**required**]
+    - python code shall be tested with python 3 [**required**]
     - the world is still spinning
 
 - add signed-off to all patches [**required**]
diff --git a/Documentation/setup-on-banana-pi-arm-board.md b/Documentation/setup-on-banana-pi-arm-board.md
index 115ff66d..32f6c949 100644
--- a/Documentation/setup-on-banana-pi-arm-board.md
+++ b/Documentation/setup-on-banana-pi-arm-board.md
@@ -228,7 +228,7 @@ $ sudo checkinstall make install
 * Building Jailhouse (mainly for FreeRTOR as a cell)
 ```bash
 #On Compiling Machine,
-$ sudo apt-get update && sudo apt-get install -y python-mako device-tree-compiler
+$ sudo apt-get update && sudo apt-get install -y python3-mako device-tree-compiler
 $ cd ~
 $ git clone https://github.com/siemens/freertos-cell
 $ cp -av ~/freertos-cell/jailhouse-configs/bananapi.c ~/jailhouse/configs/arm/bananapi.c
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615152550.356561-5-florian.bezdeka%40siemens.com.
