Return-Path: <jailhouse-dev+bncBAABBDHYQGMQMGQEEOULZHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6435B6D8D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Sep 2022 14:48:13 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id m3-20020a056402430300b004512f6268dbsf7409758edc.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Sep 2022 05:48:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1663073293; cv=pass;
        d=google.com; s=arc-20160816;
        b=OcHzguEybsgs6nP23/qFITVJ6jr5oC3KGfx/IBzeFaVZrzo0rVCZYEyqMuUvXDFjmb
         x+lCv0q7wlQEKaW764YNOsAzFwUenUAy0IHW7RiwQjdjhLwUaUfKJbESIB+08nWzTNzf
         AfmBKrfHkwrkP1ahw+zx3gVMnDJ+fXgtTrTZvi2W9HV2j9Bf1eHCEpJtmEYog6q0Tfbr
         zQiwOkIGH2L/iezNtUgXvzy0OeoPDzPNLZo/GAPRM7Jqd5itp+1C5jjStCDdjehn7AlQ
         NC5AMjI2NT2nurUXlTPh/jgVl81+/YW1e39bRx8KhNkJZqfdoQFcH6yCU07rxndfW4Kg
         VF5A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=oQWUY9mOmR4H2xFIHWzDpN2UbuvVYYJSl0/GUfToIwo=;
        b=ACJARBIeMCbzlfg3RXTrnFJUxyTPOQ0wnOpcYtW91gsz5ZE4/nW4NsvCEznfFOn/gV
         9NAadskP7fKAD00Dy0Kzk0oDV1bFHrOvdHoW1ao6NksR5UBzM7wYFj5mywnVX9MqTu9X
         275onoUkqQQlpDzx3RPRz5SFEQgZ/Z0gDWsBuVRRkQo3C8B/eLv4uWzC2poe7sJXCL7H
         NShUoY+1G6p427e5u0nF+LjcXkglGU/79mmGApq741tkmFQG5dl4DuzupymYYe+g5RBQ
         BB2Ka9Q2Csmv2gHUELopDa/qqz1A6O9SLvelS2wza3+GmLstzyC2SuhF0tUBkO+V/PdH
         8TNA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=0wkubBF3;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender) smtp.mailfrom=akaher@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:from:to:cc:subject:date;
        bh=oQWUY9mOmR4H2xFIHWzDpN2UbuvVYYJSl0/GUfToIwo=;
        b=d6PQSLJbv1Okr/atUSSI+nFsvxc+BxTVeuCJzS3vZZY2GsfjWP/k6p1GZg+flbDP2L
         5hCtFPb3nIX0An0Mtrhgjb3gia+yZLGTH7w/Lg93yskMWqDS7ojFONDMo//FXCqwybPE
         lvUGb7iCqJqUJXf7n612ZBaA6rUbxD/YFX5eP+pmm4wfi+HYyuwgqHDoT//JuH1SowxM
         N8vQ/inQ9IYhmmjU5AiYe20VbxvF4wknjaG//J4JcvqYyKRQ+8p6LQqR5mB1KQJgZQl9
         MWHDtkFJYJPWBET18QCI6S8TiRQxE82XsemZCzpOMiKX3jGYB0HYWgmdmoURUdLcBD1q
         zdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=oQWUY9mOmR4H2xFIHWzDpN2UbuvVYYJSl0/GUfToIwo=;
        b=zl1gWlVnYN3BBKZLbDWa9XtTU+fcMyUrS8cVO2CAzc5uaZo1pD87c2yDLi2CZ/8LXI
         ZhebCAm3+eddlvoR0LEcSsOn9bLqhVd7sIjkC2EtzNyMmoFUDSVnhnpgIHOows13Ml3l
         uFJG7N4vnbVSlpscGx9SOdSJrjoFFtMPry+CjMAWA2Mfli/QlQFlZCu18gI/Maabdqln
         fztVF2o5G05qb6dclE32Gdi9I6h8RorXYSpVATxvedXBXFRTajwYkJ/Z9KWI3iQ6bsSa
         mg9emCe/43rEDlO4Hl+inVFao4D14UmIO5yZs5r7zw5jnfiCpUpHrLFddzC5TlzLvVns
         vIBg==
X-Gm-Message-State: ACgBeo1IKywuYrZu5+oz9AyiKnKtu5aGccs6H/ckdvaytnOZs4xCkLFl
	iAFoUKqyeNW6ULNWRygZuj8=
X-Google-Smtp-Source: AA6agR7mYA2i9AMg2clJZDFm2Zc4OISKaxCcIEBuQFKSXdwrPuUH8sRI4b1lHw8oGiQb4Rio5i/4xg==
X-Received: by 2002:a17:907:6091:b0:731:37fb:bd9 with SMTP id ht17-20020a170907609100b0073137fb0bd9mr21504924ejc.219.1663073293200;
        Tue, 13 Sep 2022 05:48:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:520f:b0:447:ec6e:2ee with SMTP id
 s15-20020a056402520f00b00447ec6e02eels1125313edd.0.-pod-prod-gmail; Tue, 13
 Sep 2022 05:48:12 -0700 (PDT)
X-Received: by 2002:a05:6402:241e:b0:443:be9:83c0 with SMTP id t30-20020a056402241e00b004430be983c0mr26617747eda.24.1663073291953;
        Tue, 13 Sep 2022 05:48:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663073291; cv=pass;
        d=google.com; s=arc-20160816;
        b=mdUp4AakcYOGagHGNLXHi5Q0GCF1BXXB/YoTc9oGmRTi95YibJBduB7GVvvNH9PjgN
         4UtsQG6x8/lRBRm1I5K592v06RoOFuLQYz6DsAxcUU3kprfx8fD6zQKb+ZLIqRXyb/sd
         qjfyKrGUDXjyT9eH69K+LxS1EXKtagCjAjQIM+cTuMOLeJ4OHQmDyciuRODt7eZG66PA
         GOWzF43ZtoYkO4ZQ4TzNwpFhgdxWn35jANOYKnMgjACq8tBOBcaN8NHj1GaSc+d+SpNs
         KUzsoBn6HFMH3WPMpz1yjjgFTG3cwIh4R+Ug/XmjlZ/BpW9XfLK+IVlB45AbJDxTVnT7
         Y2kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=+1kM91Agf12XoqrQQtWbE4p8Mh3i7XKkWF6wocbZT10=;
        b=JlZxVtxGOeGr+ZRcEWx4Lw67hv4mTrH9fTZdkP+yIVTR/vZv3MrjGjw3wS31lyiO9/
         7e5ppb1nt6wLW/HwpO2mLEX7fICkdE/l+EK/5W4q9Yi/SZLuIh/dLb/TM7XXm7DiddaZ
         FUDVJA8UgWXXUBzW7TWulByutb8y8GiIkF8120oSqej+lUyhlfiPKrWqYNTCINrIJNp9
         mXnLzJlgFU6CZypnrAkDYiVCTIxXzaxK5DFo2f5KH2nc2WkiR5ibTtCDvpSLf/MkGgNW
         RUJ0reY7+E423MSHmqwi2z5hTvWGnvaNEJW0tjLXRLWKcdYRHXMHG8qsmvwUVWuTti11
         bryg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=0wkubBF3;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender) smtp.mailfrom=akaher@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
Received: from na01-obe.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com. [2a01:111:f403:c112::])
        by gmr-mx.google.com with ESMTPS id c12-20020a056402158c00b0044608a57fbesi327684edv.4.2022.09.13.05.48.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Sep 2022 05:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender) client-ip=2a01:111:f403:c112::;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtJpkbfq49CR2jtKrSjJ/4RMcsn+F8k2+MFY5KM6Wm0timcEqozRLg8BfpTtl8W+PkMYcqSoAE+hIVToQEycYt3ajw5aS/xzKn18Y5ySX2RBL6LnvuzubfBJRDdoio7LGn/1GMDwVIvnhxr5f2umJVyirZ6G/zZUR9b3gzWUZWos6V79HdPrf2BlT2mb7nOeNgb0KvHw5zkC1/e6SzMZiq7exopADAYb7ckrOf5MHx+AypAvGBefvKntMLjrGTy4DDmR0auy63slDvbGUQM/3HQ+bXOCzSrX3TtmxeST5qgqcN4YqTciCuzhDdKD3pGLmgDAQEO6fFoLkGju+UmjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1kM91Agf12XoqrQQtWbE4p8Mh3i7XKkWF6wocbZT10=;
 b=AhfBu1t1gCQfhnwpkv5AWFm1CCwEindEAB+3yav0C2Ic7Cm4xM0V5jjkPKdV/bLus2PPqnbZo7yDxrnsO6TRbIzGdzWpDuhVLxmIz7Pyl53v2Nb8p/Yo/nUaJULKSaX1S82HaE6iUMJejT1C2v/CkmskwZZOAWVPOLi0pzf3vf4AvVS0PukuYlS+DJKPNi6iA2unz41thbmC3Gw0AVYhSWgKaHVCT5+ejQMmyxxOGREGzSUTuROBcyoPNXj3YGpMUJAVyCRYOS+k1et+Iz7e/9awHxdp99PTBj5Ooepg/ZndWFB+93kpjvulDTQX+ynKsAsir9M63NRwQ0BbUeszDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from PH0PR05MB8703.namprd05.prod.outlook.com (2603:10b6:510:bd::5)
 by BN6PR05MB3571.namprd05.prod.outlook.com (2603:10b6:405:3d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 12:47:47 +0000
Received: from PH0PR05MB8703.namprd05.prod.outlook.com
 ([fe80::ae59:5c22:5ddd:bec8]) by PH0PR05MB8703.namprd05.prod.outlook.com
 ([fe80::ae59:5c22:5ddd:bec8%7]) with mapi id 15.20.5632.012; Tue, 13 Sep 2022
 12:47:47 +0000
From: "'Ajay Kaher' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
	<srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
	<vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
	<er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>, Nadav
 Amit <namit@vmware.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Alexander Graf
	<graf@amazon.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Topic: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Index: AQHYx28G+J2WSwxm3kmFzqoOhSDYUA==
Date: Tue, 13 Sep 2022 12:47:47 +0000
Message-ID: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.61.22050700
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR05MB8703:EE_|BN6PR05MB3571:EE_
x-ms-office365-filtering-correlation-id: 83ae9ce5-2764-4abe-962c-08da95862952
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S6okgQKDNU7YC6DCZz5r6q/JLVAi66A29Certi1a09DKAj2U3ScSe2Wqij6E4e5JZKVxIpBVgRWP372d2SOH23IWP+PfLx8NbboCkx7XRJIMZK2WOcHHkEu5acp3GMBkoRHzvwwoLj3h0neERprKGcRT70J3BzEC2KCxnTySsn5WymAl4TFbDwVW0FAdncvJNMEh75iBO32pFAlx342ZZF2cer8V9ZSrLC8jTKDS8rK0A/KZZVO333EVrrykBqMrnfMwPteQFiI4jxOZQx+fH/WXDq3XDq/+j/ATqtDzG6uK/33Iz9kvtEonWN9xV3USsFW9qfzuiRATZqO03QxE40CteHP4ef8EdciZ5v836sf/Ku9WBftBrvcbjX8MLFsblowncAMPFZBbgs2QMXzXTcpV22ZCy2MFLNfPdDfFmVaL2k8i+efjoLqc3DzNqOscEkOKQC8S4U4u7hlr1Uyp6M0AUoUZLusdEtwfUIyCZsWNdZplRLOSH+EgWCEYWkFpNKlMzoOcGsek9cVXCOw6ZmMgyYHnKvbmMM5pnwwveGAl5BoLI0epv6GSQf77+2OXYbCOmVBulRy2QbpvwZuZXI6NoLgUuucAh31a9XhZu018PfgMLC35ntX+frT5AG2e7Z5fusDx96LvWjldRv5XX0KdV1ruzSMSOt1Mwe/J4DH9C3XKt+EohDBHbTqe+pzm9Dyq17deniBTyQv590MjEs/dDqK9Ou4mj0UAAvBOLUkyssc0WSYKk9R9P2JX+Nn6f/lOxSoxiTrdyD50qFHwjanm1pMronbvUHrjKILE9ibRgGS/9XA3u4NzXi/kPThNsQm6emcAHnqosETKogacvWPec//5mcTCyYr/bTcGYnY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR05MB8703.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199015)(6916009)(71200400001)(6506007)(478600001)(186003)(66946007)(6512007)(41300700001)(86362001)(38070700005)(8676002)(26005)(2616005)(33656002)(6486002)(91956017)(36756003)(2906002)(66446008)(7416002)(8936002)(122000001)(54906003)(66476007)(64756008)(66556008)(76116006)(38100700002)(316002)(5660300002)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1JWM2JXVDFVaGl1SDlUand5UXZJNG9ZczIwWmdyVjQ2a21PZjBtdDhudkI4?=
 =?utf-8?B?RlN1SmpzallyOTg4SGdkb1A0cGdRRUhPS0R1eDBoZlhHTTFqVExsckE2OWFi?=
 =?utf-8?B?N004dC9tT001VVd1M3Btc2RPT3I5Z1NBN0hZZUJYMHdGWG1mZjhwSHFDUnRa?=
 =?utf-8?B?ZXJFdis5WGJqQXM0d2xBR0FEdmx0YnlOS3RyRk5mbnFjVVJoNXlaTmIxMERt?=
 =?utf-8?B?eHl3SDhTVFdJK1RVd1cwb21aSEN4VWdVeDJQaVVJeVpLbkFVdDkxcng2RXBD?=
 =?utf-8?B?eXZISnhkakhXRUFkWnJlWW1POHNaZ2hOSWdocGJWV3R4dTV0b285ZjVXM3lN?=
 =?utf-8?B?ZWZPbjAxeEVqSFlHaUNza1JzcUhXR3lTbWlYaXNsVmk4MzVRMytjaTQzU0Fn?=
 =?utf-8?B?eWt4MTJEZXlBV1pzaEFMOHhFQ3dKZUVpdHNOdVBVeTdMcEZFOXBSM0Z5cnU0?=
 =?utf-8?B?Y2lxdkRUUkM3RVN5NlhHL045SEV5eUw1U3kzK0FVNkp2NjhDNFFMcXU2RzNR?=
 =?utf-8?B?dGNlS0xIU1IzUEIzbFVjTm5OQ0lJeW1UR081NWRVWkZNbWhJMVFTZ1kvdkJQ?=
 =?utf-8?B?eUhWak5MeVJ6ZFpMMGI2Q2o1MDNydFhKQTNZQ0ZkVnhHS2JHUVJNR2lTM0Zs?=
 =?utf-8?B?aG1JWnNIcStZNnIwVkZ5anVHWFczaTVJaHBuODlJTGdETkFkczM3cWJtc3dh?=
 =?utf-8?B?cHVSa3A4bjBVeFI5aFBGQytNb1lLZ29RVnhlOC9CYjRjYkRIa3VKbUJ1Mmp1?=
 =?utf-8?B?WkN6NEt1Z1QyajJLOUJYTjg1NlpkZm0zVWFHcGxLanE1ZHB2dnJVcnZGM3pk?=
 =?utf-8?B?ZTE4ZzdyeWRvazRUSGVZWmE5amJKVkgzUjZKOFpDenVmRi8waisyQ0FtRE04?=
 =?utf-8?B?aFBvR3Eway9vZEMvekJRYndFVUNyR0hkWTFndVdBNUg3cHpMUXRRN01ybTB3?=
 =?utf-8?B?b2ZOdGtSaXZoNlhGVWJzOUcrbTVZN2hvVjZpRlJoT2ptSWNhdEdxdWxsN3d3?=
 =?utf-8?B?UkptQ3NHSWlIcVdVS3J5emNLT1NtTHF5bFdMNmlKSDhPNk4wUmFhMEUwazQz?=
 =?utf-8?B?TUtrek5CUDVFZi9VRG5PQzVPaUtNREZJcGpjL3VTSjZNVnRLS2N2bWl3MThR?=
 =?utf-8?B?Q3ZBUHJ2a0I1U2pRVUxZM0ZaZ1lrNmJKUnRxZ2lyTUdaL2NiVUpzYjNFait2?=
 =?utf-8?B?Z2V0YkZuUEVqTXRoMTNLT2F3S3JhQmhoMGdyUlVQT2RaM1VndGtVZ3dyd0ow?=
 =?utf-8?B?bVNPWlRLSlJGV1dJdE5tTUpMNWxJaDcvajNSMHU1NFdSMzNIeWhTQnY5eDN2?=
 =?utf-8?B?RDBqbWdMSHFNYy9sZHZsYktVVE9kc0hYY1MwVSs4KzUrcjJ0em9EeE0wNXpj?=
 =?utf-8?B?TW80V3RZMkVmUGRKTUkwVVRkaW0vcHY1VXRQY0hpQWVsUzRKbTJIektwNnJ2?=
 =?utf-8?B?MnR5MkNtdFVSVVhYS2ZvRUUyY01SM05kUytvZXpkOGVXZU1YTnRldDZQbE9T?=
 =?utf-8?B?ODBZZXEybzJGVjNGcVdaamVITFNVOGZpRmlId08xNXNPTURJOURVM0Q4QmJh?=
 =?utf-8?B?NEdwTVBtamhZbkVLYjhuWHlwY0lybldSSm9aUkI1UXdWOUxoczAyaW56am9s?=
 =?utf-8?B?RnowNERhZzNHeStCb3R6UjFUdGpHSlQ5aDZ6TDc0MWZNSXdHOC84RlNZa2NV?=
 =?utf-8?B?NVhtbzJkcjBySXdoN2lxMzMwNnlmM1RuN3RhdFVTOWFOTFA2R1pubElmN1pF?=
 =?utf-8?B?UGFSaEtZSXRSTG5YOGI3SkFHVlRhS1oyQndZT1RDbXhpVllMTDNBZERIYU5Y?=
 =?utf-8?B?cjZOY0JMbzVuL09TL045a01rbWF5SGtDa1AyL1dZTDBTM2xmQmFvQi9MN1Iw?=
 =?utf-8?B?eTZqRmduM0tyZHhnT3pBL016M1A2MWptRnUzZW5EU3FJRXFJaU50dTd2KzJ4?=
 =?utf-8?B?K0dFcEJoYnY0QzcvRGJSUU9jNmI2V2JnbFplbFdsS25RUlIvVXVLQkNXOHJG?=
 =?utf-8?B?cjFleXdQUXZvZnUrS0s2MlVjcENCTDJUU2Z1VGU1VW1vaU1LWGx2Q2tqWWxv?=
 =?utf-8?B?NGZlL3RSMTJFWFJmZGwwY3QwWk9NS3VmL1RXc0xKNVJzdVJWSnRMNldSSFBi?=
 =?utf-8?Q?Ou47ZUQSWaVMRp/nDBS9keO0v?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <A385F7222B4BAC40BABEE0DFB865A604@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB3571
X-Original-Sender: akaher@vmware.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmware.com header.s=selector2 header.b=0wkubBF3;       arc=pass
 (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass
 fromdomain=vmware.com);       spf=pass (google.com: domain of
 akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender)
 smtp.mailfrom=akaher@vmware.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=vmware.com
X-Original-From: Ajay Kaher <akaher@vmware.com>
Reply-To: Ajay Kaher <akaher@vmware.com>
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


Note: Corrected the Subject.

> =EF=BB=BFOn 07/09/22, 8:50 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com> w=
rote:
>
>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>> index ddb7986..1e5a8f7 100644
>> --- a/arch/x86/pci/common.c
>> +++ b/arch/x86/pci/common.c
>> @@ -20,6 +20,7 @@
>>  #include <asm/pci_x86.h>
>>  #include <asm/setup.h>
>>  #include <asm/irqdomain.h>
>> +#include <asm/hypervisor.h>
>>
>>  unsigned int pci_probe =3D PCI_PROBE_BIOS | PCI_PROBE_CONF1 | PCI_PROBE=
_CONF2 |
>>                               PCI_PROBE_MMCONF;
>> @@ -57,14 +58,58 @@ int raw_pci_write(unsigned int domain, unsigned int =
bus, unsigned int devfn,
>>       return -EINVAL;
>>  }
>>
>> +#ifdef CONFIG_HYPERVISOR_GUEST
>> +static int vm_raw_pci_read(unsigned int domain, unsigned int bus, unsig=
ned int devfn,
>> +                                             int reg, int len, u32 *val=
)
>> +{
>> +     if (raw_pci_ext_ops)
>> +             return raw_pci_ext_ops->read(domain, bus, devfn, reg, len,=
 val);
>> +     if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +             return raw_pci_ops->read(domain, bus, devfn, reg, len, val=
);
>> +     return -EINVAL;
>> +}
>> +
>> +static int vm_raw_pci_write(unsigned int domain, unsigned int bus, unsi=
gned int devfn,
>> +                                             int reg, int len, u32 val)
>> +{
>> +     if (raw_pci_ext_ops)
>> +             return raw_pci_ext_ops->write(domain, bus, devfn, reg, len=
, val);
>> +     if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +             return raw_pci_ops->write(domain, bus, devfn, reg, len, va=
l);
>> +     return -EINVAL;
>> +}
>
> These look exactly like raw_pci_read()/raw_pci_write() but with inverted
> priority. We could've added a parameter but to be more flexible, I'd
> suggest we add a 'priority' field to 'struct pci_raw_ops' and make
> raw_pci_read()/raw_pci_write() check it before deciding what to use
> first. To be on the safe side, you can leave raw_pci_ops's priority
> higher than raw_pci_ext_ops's by default and only tweak it in
> arch/x86/kernel/cpu/vmware.c

Thanks Vitaly for your response.

1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority' fie=
ld to struct pci_raw_ops
doesn't seems to be appropriate as need to take decision which object of st=
ruct pci_raw_ops has
to be used, not something with-in struct pci_raw_ops.

It's a generic solution for all hypervisor (sorry for earlier wrong Subject=
), not specific to VMware.

Further looking for feedback if it's impacting to any hypervisor.

-Ajay=20



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9FEC6622-780D-41E6-B7CA-8D39EDB2C093%40vmware.com.
