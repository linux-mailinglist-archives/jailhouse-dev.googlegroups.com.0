Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEVJROKQMGQETASI3PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E825545B8F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jun 2022 07:20:19 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id l4-20020a05600c1d0400b0039c60535405sf3181628wms.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jun 2022 22:20:19 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1654838418; cv=pass;
        d=google.com; s=arc-20160816;
        b=zq3JGQ0aJX1cdeOEhA4YqIEP36LrbyfdaCdYLS31ZleykJEU0zoKypXftwPYKLPg4X
         iFK4jnhuYVrKGm4bW7eaP8VV7PaiwDksNmoqyLMbNF7gW/XSmu71j3FnIRuy5j7S0jQY
         V5tC5Lhcv/eO4yWxLoNxhcG5y+Aqzw5UlK9w07NOAo6ph/qJvU6FI0hJT66A12jsu4Cg
         gR6CD8t1jJQm5HXP2ce/sXDqDWfT97NJ10tmMB24MapnyTVz441YyNMQkrQ8282yGcDe
         1Xi0N8RXMtYHh7+Qg34ONMK1KcxCkqSJm5lht/sa7NweqY9BkuFScOlhvQRY71rp0ZyW
         ZiEw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=TOFcIz/1rgA+vhuM0A6gi3M5Cjb8YZ1FaTULg9OeGAM=;
        b=bUcEc3PhEdSLo/ThPQPLbzLzzYIUdzTU7dccdUnz/l29UpC/7ais4coTqHjqj0xe8v
         GETXHMV2yPsDi81qTt8MKHJUzT8qMZEoxCCDW1AXJ/JI1PQmnlb+k4aE9cW0cp+Qtkos
         vX31C8wfP7QOGxCrobY7gYZz3AzE0vGGbKjWHgnjFRCy/9N7vQd1rwAGYJcmpvGc1t70
         e3zqH/IioknxgseNkpDjaTbSg8ns56IErm0Y7QWpCi3lPwfEhzyum/aD9y/DoEMM+gHY
         U2uoy7WXkjm5sCG/HFG5zJrm85LT+C7Ll28l8FlnV6ksBqP7zwpWw+u+0kcSnMMo/LBk
         ppAQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="b/dxjska";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::615 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TOFcIz/1rgA+vhuM0A6gi3M5Cjb8YZ1FaTULg9OeGAM=;
        b=KkkSqq7YIPp7+Qe9a8iBjhWHA2SlFFuORRHY7GWj6d2h1uHOlL+tC10XmPcoqU7pOS
         jr0aEYU/5TiW5liGsAh12kwZwNCYWw+EkhPuH0GtA8oWBvmEthT7TWoj40vIdfYkwB7e
         rOR34I1CZTefltwqcxDajhP6HEdpvQn+2OM38sITjC3ttqhKB+DChK30FRXkuLBhiT5C
         yLCcSsdcCY9ISMvcPoTbY6x9qKnbgcLZ4q33x7L2CYm9xhZ7/WtL2PKKxk05aXs6dGb5
         nTgtbzC4NJo3Eb4wYRieuaTJn72ASFtjvBo8d8xxs33aH3z27Co8GRcirWfpuZhKXGiw
         Z0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TOFcIz/1rgA+vhuM0A6gi3M5Cjb8YZ1FaTULg9OeGAM=;
        b=Od07EaYdgHB5E6Tmf3WBgOJhR4seLBOTegjrb6+kBmrTBk5HQJ3J0owXmasTNUkVhr
         BoR3XN0R9f5hYuNWJNMsqp6/0UthXfCDS0QNPRh8emCwyHWpd0lNXPzoSc4lV+1iJNKQ
         aIJtNfHGQh0sEbgod1Cgsy6g04I5fz5bSQTOW86CjC/HFn8GJY9d1oWxDz590rhNSAaM
         eEYLlxnjRc5Q+fpRatd7mWQcCyZCgQOO86bsfPqTv9QifP5o21lH6u7f7gyRq9qg97C0
         AB6+TOh5LJAX2hPb5C+3VtRxXSVXSorSinOKteqtRjIwtbqV1T05c4fupWJ4xhN6/Rtn
         z25Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531U6Ydl8Sz4G5aNk0wzwy4VqQdXVot1JmmYwiYSi+BpbCMRUsX9
	IWruRLm00/ve6VXaOoh8Wtc=
X-Google-Smtp-Source: ABdhPJwremZu0lvSyLfmRDkGQx3I44ia+xYB0vLIH9s7MISWCuRzXoEQHX13bKMpkqpIF6B9gG9C7g==
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id f13-20020a7bcc0d000000b00381220ea3a0mr6758939wmh.59.1654838418650;
        Thu, 09 Jun 2022 22:20:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c770:0:b0:39c:7e86:7006 with SMTP id x16-20020a7bc770000000b0039c7e867006ls76138wmk.1.gmail;
 Thu, 09 Jun 2022 22:20:17 -0700 (PDT)
X-Received: by 2002:a05:600c:128c:b0:39c:4c58:f37a with SMTP id t12-20020a05600c128c00b0039c4c58f37amr6745369wmd.7.1654838416962;
        Thu, 09 Jun 2022 22:20:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654838416; cv=pass;
        d=google.com; s=arc-20160816;
        b=SHizV1nc4BL2gR3PjAwU3M4fL5SY8WjUHpXaNJvs1/sWEdoaTVoFqubEwnWhhN0rdm
         KQilZle26FKjzoBn9b1qBmgTt1yjrPqvNRrOZTXyPSM0a1F+bWDETEu+dH/3AXcQ549A
         fF+3CPRUrSNXjK3N/GScrdCSKxMBRqaRrmifNhfuLeA//23KO0MWrGuy1iGclhOAkQz3
         m52SyWqaIZMCc2DzP6rB82b5OCaBqRusmWG38UCU6DNZ2MR7ccetwJQBXVKwifeBcNLi
         2IZwdQNOCRLpGz8p17vEa57LopzyxQakm7SLsVhgBm67PcmFnxHpnpHzJVCzmgzZQ/Q6
         p5Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1fbVWwzEYdhsQl9oN6ytfiuENoYQbbk27Jw9hlxGBq4=;
        b=M95fNS6sBA+ThTZtq98Qca2aiZoLSFgVvo0N930nNbTJzXjCrnGxbHJoHUKzQLdM5x
         ls+1FEkh22x+9VDYHlU1M0Sls0M2KPNF5Bw3U9QHfCQkUj4oW+ihVLmUdTC5Yn/yl2q5
         4KgFvnWfb9yWLyrERZDqCYxJXVYbU0i9tImSaCnfI/Lmuj6jrjdM0gkPWUYkLMcetrEr
         rW8KfYRA/rDPQu5rlAcRPqy86Xnx7eWR6tju6B7/Hbaugs8Qt3Ik4yQEkrwwFZHNIRwO
         MIKg52WHuaSy+n/sAK4ruACvKNftfofUHOXGbxspEKVeeXZE8LQgEsyXbFn7G/jKhiN2
         MwMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="b/dxjska";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::615 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-ve1eur02on0615.outbound.protection.outlook.com. [2a01:111:f400:fe06::615])
        by gmr-mx.google.com with ESMTPS id ay5-20020a05600c1e0500b0039c4133ae38si56306wmb.2.2022.06.09.22.20.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2022 22:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::615 as permitted sender) client-ip=2a01:111:f400:fe06::615;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY6IZ2IG5p7Rzium5J0bm/tRbztsiNcLNehHvfuapn2RzpvmxuNVyO1BpX5Rqf86eq0NF95iS5uUSVYl68RPWB/bm7Q3WFhWPVRmCNALfbVAM4p2H3rWYFOhKHfPWhLYkjJU4T3Dijinz4rE5ylf2UuvLnhqcGwKt5XpKtMLVs1FsokuIdK7kOw+JseWB/ZwYafbFipekKQIVwSp1gSW1xEL/q+lz1X28mejFaktJ65zOrinZad31KvDSddBBhxcV/op+NZ7Dl5b48wikH+NNQJXzY88zWbydSd+ioEfOiLYd9uwh2YE+DPjEqLPf977O7B8dN/R4ZkBVcLwUv6HwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fbVWwzEYdhsQl9oN6ytfiuENoYQbbk27Jw9hlxGBq4=;
 b=DUBQtaUDs4M/97IJuSq+31LSdV5OrDZYijca1I6g2SZycoFR3fgs685bTJnq7sD7yf5On/OpN4FQ+Nu2Hcm+MFpWaNmZ+GjEpPJ29Y2wd82VSJz1Ls8n1Js6xQF7YSvcPLr96u35/rw9d7Fe/9jgHglw9xrbbia1B4wLTS+2nltpF7qYRHBVmPWIx1qiJtB0I9w58lj88I7ixNlN9FtKBNbcvnbdefryW4wnvKeTZMLK+Jwo+6d3ZX5GPrtCzadEt+HZclWI3yNP4vs/ErQx37zJ8LMshhmYbYA9oCsKsZpQ5cQP9CBJgns15jPjFCwNaSyFFCZXs/S8UIa93YRY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AM0PR06CA0081.eurprd06.prod.outlook.com (2603:10a6:208:fa::22)
 by AM6PR10MB2088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:36::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.18; Fri, 10 Jun
 2022 05:20:15 +0000
Received: from VE1EUR01FT081.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:208:fa:cafe::e2) by AM0PR06CA0081.outlook.office365.com
 (2603:10a6:208:fa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Fri, 10 Jun 2022 05:20:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT081.mail.protection.outlook.com (10.152.3.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:20:15 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Fri, 10 Jun 2022 07:20:14 +0200
Received: from [139.22.143.62] (139.22.143.62) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Fri, 10 Jun 2022 07:20:14 +0200
Message-ID: <c078ec55-8565-b2a9-581a-32903625c73b@siemens.com>
Date: Fri, 10 Jun 2022 07:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] arm64: check whether HPFAR is valid before getting IPA
Content-Language: en-US
To: Dongjiu Geng <gengdongjiu1@gmail.com>, <jailhouse-dev@googlegroups.com>,
	<gengdongjiu.gdj@alibaba-inc.com>
References: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
 <CABSBigRHEKJLuer6JrvPER2oEZJnaiFb2YsHeHRasoNjVX-f4Q@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CABSBigRHEKJLuer6JrvPER2oEZJnaiFb2YsHeHRasoNjVX-f4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.22.143.62]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--16.386900-8.000000
X-TMASE-MatchedRID: fd9c05JWinAhz+KjBN9OuQi1CMc1kGupoRhq4uL6L1jx5KZMlKYS/a5B
	oXfdPww+P4cXKIArIuZxJ+E0Nvqbr+WKR7RDS9A6tAysh1g+LdZuSBXFwBfl3OdnG4+P1pj7F8l
	NgsbZcW82VZXStfpoXdyVrIZi/5O/Uv5U0tqRHZmm+tMEVnYS8Qx8yLMFzjjQ8pRHzcG+oi1K0Y
	CCYqpa5VbDmwy31ULEcijMZrr2iZ2t2gtuWr1LmqOE7dVxFEbyr99rdLdHEyhtawJSSsDgSZnax
	zJFBx6vqanaW7tMOzost6tMNaxmZgeq8zN4OszM5k1jWE+JXkcdAyevMk7vZzCMW7zNwFaIzqAF
	0wFSjjVHpEd1UrzmFRin/71l9G+wFE/f5XDLCS9ILFvRdPyc60fr6WG4Th9awyfpezjzqJXIEQT
	lh1/QMTEDYvokod/qj+zv30llxpUEI8xNstIHPw6VmDtY5MpvgMviXDtrLjXQyiEb4hDax1rM5a
	0ZRVwj/ML7fSWQfpIiXdKPPMcrqFLAfLTyW70G2vvqwiOCcM2V76rqTtD9zC/MuWzsdN8Zy0MfD
	1GsI1ubKItl61J/ybLn+0Vm71Lcq7rFUcuGp/Hfd+P6wwCt8xoxTJ4LSy1onAOnU4i/fOOGr1+7
	CLXLUdd7JQtZhfQNa0V+8BJ6m6LJpiWsnmVK8UVnp6v5hHbR
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.386900-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: E3B15EFFA10E63FE40A90475D58011540F942ABC7D10E302835414962EE1615E2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e44bb5c-003a-4851-c977-08da4aa0e6b5
X-MS-TrafficTypeDiagnostic: AM6PR10MB2088:EE_
X-Microsoft-Antispam-PRVS: <AM6PR10MB2088A2FB242B71B815801B6595A69@AM6PR10MB2088.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8EeA+w9n5IkaZSNmkY4p8xf48aMRDuEBLPkCyUCG5nhP+jy/5nsY+cqc5Wp3gDqUnl6TZNiAgH1L7nK8FjqytpiNaf1LvJXsss4pjFs8+CGyHblGoQLd9w+X01B9tDbOMWnXDx5Tppq3jrOTZMLL4EF/6vGXHYbpKlOw0FADJjtNKPTvDlULuZ07Ire4l2TG5uFOi+U/7ZRyg4GxmfS4ov63YDLBKcolkOku9otapOwqvbin//P4x/v4xiCjpgXbXezuaajDACOGYBQrh/pR2L7UNLfB5+oPJB44YL2Re1kNnF9mDhpV+zlOhq+kRFxzlhAtRlw/oDXXd2bDR8MheNhVuipl/BeF2EnmUecaw3TzRvZwZFsxvYKUG83SL2av/tyDsfnGvRCNfYo9i7pRfl6y2Po+JH0MOHAw6yJhaQBACpsBZYbUqDpWduvDsAGMP3Hpro91jVCauAu+z/gMInhGSmpW7PiS/rfMfdYDoktuGrp3mhvbKOl/ZYRq32PS4FXJIOybWVID9i0Ac2YOqQi4HZx2fra+TbRQ7c7iZI9DZ/3MSLOW8Hz7iQ/GlWfesSC6PwqInwQD4o8vNVK3e2VHrxTXXMJyHZfKj0vkdPRsdg/ZGIpLZ7BGI82NF379alfyjce3mGiM6JNz4qqPtxe3LMRD+PHHrGwVwQYvT4K0vvBWNNlaP6sXFW3KypEepqnilYzIVWIY6qm8mkY02EG2VCTJLAIlqEeUEqi6IARk2dzZXBwcDfIUSNeUf8XH4WwfBoSz3MlOZDHPD4h5HOPgIGJFxw0qxLhp53CBQjZmxMnXU68CN0xdioAj5Qt5sGPp7Gn0PvPZIJKe6EqdDA==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(81166007)(53546011)(31696002)(86362001)(8936002)(82310400005)(82960400001)(356005)(44832011)(26005)(83380400001)(5660300002)(40460700003)(2906002)(508600001)(336012)(2616005)(47076005)(31686004)(956004)(110136005)(186003)(70586007)(70206006)(16526019)(6706004)(8676002)(36756003)(16576012)(316002)(3940600001)(43740500002)(36900700001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:20:15.1773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e44bb5c-003a-4851-c977-08da4aa0e6b5
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT081.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2088
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="b/dxjska";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe06::615 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 09.06.22 17:27, Dongjiu Geng wrote:
> ping=EF=BC=8Csorry for the noise
>=20

No need to be sorry, I unfortunately didn't find the time to fully
understand this.

>=20
> Dongjiu Geng <gengdongjiu1@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=BA=94 21:11=E5=86=99=E9=81=93=EF=BC=9A
>>
>> The HPFAR can be invalid if the stage 2 fault did not happen during a
>> stage 1 page table walk (the ESR_EL2.S1PTW bit is clear) and one of the
>> two following cases are true:
>>   1). The fault was due to a permission fault
>>   2). The processor carries errata 834220
>>
>> Therefore, for all non S1PTW faults where we either have a permission
>> fault or the errata workaround is enabled, we resolve the IPA using the
>> AT instruction.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>> ---
>>  hypervisor/arch/arm64/include/asm/paging.h  |  8 ++
>>  hypervisor/arch/arm64/include/asm/sysregs.h |  8 ++
>>  hypervisor/arch/arm64/include/asm/traps.h   |  2 +
>>  hypervisor/arch/arm64/mmio.c                |  7 +-
>>  hypervisor/arch/arm64/traps.c               | 89 +++++++++++++++++++--
>>  5 files changed, 105 insertions(+), 9 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arc=
h/arm64/include/asm/paging.h
>> index e600cf58..4f0cb81c 100644
>> --- a/hypervisor/arch/arm64/include/asm/paging.h
>> +++ b/hypervisor/arch/arm64/include/asm/paging.h
>> @@ -198,6 +198,14 @@ unsigned int get_cpu_parange(void);
>>                                 | (cpu_parange_encoded << TCR_PS_SHIFT) =
\
>>                                 | VTCR_RES1)
>>
>> +/* Flags for get fault ipa from gva */
>> +#define GV2M_READ              (0u<<0)
>> +#define GV2M_WRITE             (1u<<0)
>> +
>> +/* Indicates address translation aborted */
>> +#define PAR_F                  (1UL)
>> +#define PADDR_MASK             ((1UL << 48) - 1UL)
>> +
>>  int arm_paging_cell_init(struct cell *cell);
>>  void arm_paging_cell_destroy(struct cell *cell);
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/ar=
ch/arm64/include/asm/sysregs.h
>> index 868ef887..2c683832 100644
>> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
>> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
>> @@ -117,6 +117,14 @@
>>  #define ESR_IL(esr)            GET_FIELD((esr), 25, 25)
>>  /* Instruction specific syndrome */
>>  #define ESR_ISS(esr)           GET_FIELD((esr), 24, 0)
>> +
>> +/* Fault status code of instruction specific syndrome */
>> +#define ESR_ISS_FSC(esr)       GET_FIELD((esr), 5, 0)
>> +
>> +/* Shared ISS fault status code(IFSC/DFSC) for Data/Instruction aborts =
*/
>> +#define ESR_ISS_FSC_TYPE       (0x3C)
>> +#define ESR_ISS_FSC_PERM       (0x0C)
>> +
>>  /* Exception classes values */
>>  #define ESR_EC_UNKNOWN         0x00
>>  #define ESR_EC_WFx             0x01
>> diff --git a/hypervisor/arch/arm64/include/asm/traps.h b/hypervisor/arch=
/arm64/include/asm/traps.h
>> index a7c07624..0efedef1 100644
>> --- a/hypervisor/arch/arm64/include/asm/traps.h
>> +++ b/hypervisor/arch/arm64/include/asm/traps.h
>> @@ -25,6 +25,8 @@ struct trap_context {
>>
>>  void arch_handle_trap(union registers *guest_regs);
>>  void arch_el2_abt(union registers *regs);
>> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa,
>> +                                unsigned int flag);
>>
>>  /* now include from arm-common */
>>  #include_next <asm/traps.h>
>> diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio.c
>> index 7fbfef75..70301ab3 100644
>> --- a/hypervisor/arch/arm64/mmio.c
>> +++ b/hypervisor/arch/arm64/mmio.c
>> @@ -43,7 +43,6 @@ enum trap_return arch_handle_dabt(struct trap_context =
*ctx)
>>  {
>>         enum mmio_result mmio_result;
>>         struct mmio_access mmio;
>> -       unsigned long hpfar;
>>         unsigned long hdfar;
>>         /* Decode the syndrome fields */
>>         u32 iss         =3D ESR_ISS(ctx->esr);
>> @@ -57,10 +56,10 @@ enum trap_return arch_handle_dabt(struct trap_contex=
t *ctx)
>>         u32 is_write    =3D iss >> 6 & 0x1;
>>         u32 size        =3D 1 << sas;
>>
>> -       arm_read_sysreg(HPFAR_EL2, hpfar);
>>         arm_read_sysreg(FAR_EL2, hdfar);
>> -       mmio.address =3D hpfar << 8;
>> -       mmio.address |=3D hdfar & 0xfff;
>> +
>> +       if (!arch_get_fault_ipa(ctx, &mmio.address, GV2M_READ))
>> +               return TRAP_HANDLED; /* Try again */

So, this means we need to make the guest trap again, and then HPFAR is
valid??

>>
>>         this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_MMIO]++;
>>
>> diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps=
.c
>> index 488dd7f8..10441b4b 100644
>> --- a/hypervisor/arch/arm64/traps.c
>> +++ b/hypervisor/arch/arm64/traps.c
>> @@ -33,6 +33,85 @@ void arch_skip_instruction(struct trap_context *ctx)
>>         arm_write_sysreg(ELR_EL2, pc);
>>  }
>>
>> +static bool check_workaround_834220(void)
>> +{
>> +        unsigned long midr;
>> +       unsigned int variant, revision, part;
>> +
>> +       arm_read_sysreg(MIDR_EL1, midr);
>> +
>> +       variant =3D (midr >> 20) & 0xf;
>> +       revision =3D midr & 0xf;
>> +       part =3D (midr >> 4) & 0xfff;
>> +
>> +       /* Cortex-A57 r0p0 - r1p2 */
>> +       if (part =3D=3D 0xD07 && variant <=3D 1 && revision <=3D 2)
>> +               return true;
>> +
>> +       return false;
>> +}
>> +
>> +static bool hpfar_is_not_valid(bool s1ptw, u8 fsc)
>> +{
>> +       /*
>> +        * The HPFAR can be invalid if the stage 2 fault did not
>> +        * happen during a stage 1 page table walk (the ESR_EL2.S1PTW
>> +        * bit is clear) and one of the two following cases are true:
>> +        *   1. The fault was due to a permission fault
>> +        *   2. The processor carries errata 834220
>> +        *
>> +        */
>> +       return (s1ptw =3D=3D 0U) && (((fsc & ESR_ISS_FSC_TYPE) =3D=3D ES=
R_ISS_FSC_PERM) || check_workaround_834220());
>> +}
>> +
>> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa, u=
nsigned int flags)
>> +{
>> +       unsigned long hpfar, hdfar, par, tmp;
>> +
>> +       u32 s1ptw =3D ESR_ISS(ctx->esr) >> 7 & 0x1;
>> +       u8 fsc =3D ESR_ISS_FSC(ctx->esr);
>> +
>> +       arm_read_sysreg(FAR_EL2, hdfar);
>> +
>> +       if (hpfar_is_not_valid(s1ptw, fsc)) {
>> +
>> +               /* Save current PAR_EL1 */
>> +               arm_read_sysreg(PAR_EL1, tmp);
>> +
>> +               /*
>> +                *  Performs stage 1 address translation, with permissio=
ns as if
>> +                *  writing to or reading from the given virtual address=
 from EL1
>> +                */
>> +                if ( (flags & GV2M_WRITE) =3D=3D GV2M_WRITE ) {
>> +                        asm volatile ("at s1e1w, %0;" : : "r" (hdfar));
>> +                } else {
>> +                        asm volatile ("at s1e1r, %0;" : : "r" (hdfar));
>> +                }
>> +
>> +               isb();
>> +
>> +               /* The resulting address can be read from the PAR_EL1 */
>> +               arm_read_sysreg(PAR_EL1, par);
>> +
>> +               /* Recover current PAR_EL1 */
>> +               arm_write_sysreg(PAR_EL1, tmp);
>> +
>> +               /* If PAR_EL1.F =3D 1, address translation aborted */
>> +               if ((par & PAR_F) =3D=3D PAR_F) {
>> +                       printk("Failed to ipa!\n");
>> +                       return false;
>> +               } else {
>> +                       *ipa =3D (par & PADDR_MASK & PAGE_MASK) | (hdfar=
 & (~PAGE_MASK));
>> +               }
>> +       } else {
>> +               arm_read_sysreg(HPFAR_EL2, hpfar);
>> +               *ipa =3D hpfar << 8;
>> +               *ipa |=3D hdfar & 0xfff;
>> +       }
>> +
>> +       return true;
>> +}
>> +
>>  static enum trap_return handle_hvc(struct trap_context *ctx)
>>  {
>>         unsigned long *regs =3D ctx->regs;
>> @@ -71,7 +150,7 @@ static enum trap_return handle_sysreg(struct trap_con=
text *ctx)
>>
>>  static enum trap_return handle_iabt(struct trap_context *ctx)
>>  {
>> -       unsigned long hpfar, hdfar;
>> +       unsigned long hpfar;
>>
>>         if (this_cpu_data()->sdei_event) {
>>                 this_cpu_data()->sdei_event =3D false;
>> @@ -83,11 +162,11 @@ static enum trap_return handle_iabt(struct trap_con=
text *ctx)
>>                 return TRAP_HANDLED;
>>         }
>>
>> -       arm_read_sysreg(HPFAR_EL2, hpfar);
>> -       arm_read_sysreg(FAR_EL2, hdfar);
>> +       if (arch_get_fault_ipa(ctx, &hpfar, GV2M_READ))
>> +               panic_printk("FATAL: instruction abort at 0x%lx\n", hpfa=
r);
>> +       else
>> +               panic_printk("FATAL: instruction abort and can not get i=
pa\n");
>>
>> -       panic_printk("FATAL: instruction abort at 0x%lx\n",
>> -                    (hpfar << 8) | (hdfar & 0xfff));
>>         return TRAP_FORBIDDEN;
>>  }
>>
>> --
>> 2.25.1
>>

How common is this erratum? Is it already affecting real boards? Just to
get a feeling for the urgency.

Thanks,
Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c078ec55-8565-b2a9-581a-32903625c73b%40siemens.com.
