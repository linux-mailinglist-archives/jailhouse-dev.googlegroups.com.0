Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXHX5TUQKGQE4FEMAEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BAD77079
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:43:57 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id g8sf26004089wrw.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:43:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564163037; cv=pass;
        d=google.com; s=arc-20160816;
        b=ew+R8erqbD1VTJEVjWONDSoXhC+Qz6INVnq3mt2bwx9BDKOCmFfn+7IfWlBLCVQL6r
         Zg6HepubaZSfBP1zl+XqWTRR2MuXgL4x0TTguv2lnVmfESiDIiRBEc/VmHU5NsmU42bZ
         H81voJdrKmn+Hfq0VH1YnE+tmq05QXvwch2JcC/S8Tqba9tthySNs35wCOBSr5tW4i05
         Py1m+WwJOb5Rz+77XskoGc0ZKoyL7RB83ql0AA65sprBWRGaB6aeJ/17iShqXNqK77sv
         jBJ2Y2onkftRP+l9iAy1Z0q9mzAucGQ0iSBifk6R0lvsHtZEN4QLNeaR3VEFRSRhsM19
         Awpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=7qBqlbxYjlyQC5WFtPpqYfI1S2E5GlH1jA4UCN8HjxE=;
        b=YOrjXM8D2ngtPziruVlyu4aFC7Q1o9ktT4PxtYlqGIZqWWGRmP2z0GzaL677NnFcXT
         fBNQ4aQTlx2Gv9CNDOPVuvGdL23LFn7dBe6nHBHpEStOGUwOTjWtwaGp/Qxg/xIY6LHE
         MCN9VoqVPfV37sOLEWVrQqplF9JYUiIZiTtYo0WKGyMSkwynTB98ma+d8tnmA7hn1KkH
         T4gU3UagsOe0zZ54xv7zpYHY/sgrTxuVLoXWcdGVR6tWAH7FQZLK/TOVQXn9DGMAcF1d
         k9h7aBKUwNTotKtobNeRni7F+B72q7xnRMQYG0AMwELthNEuiNaalbZGH3VpTmy0ErBu
         m8sg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7qBqlbxYjlyQC5WFtPpqYfI1S2E5GlH1jA4UCN8HjxE=;
        b=FJEmEHaqtGFiWkjhvLMH5RcKbVlvUKRqtkwo/cREB4ed2fOv3CBMlkYHPaU2fRDLUO
         hmbHguxnWEslqOSQPXF9cQHo7kC8zIGftNfGI7cqJLVXUm/oth/MYqLuhFODC6zvlSmN
         Hz1uaPYgkoKlLtuCMolPxD/2Kt4H+F+BZPtQ+X6KaltKiMobXiy698Dr9b4KZOTJQtuu
         79w6BM+5EMeXY4Yt11RZV55kwcPh+cEf3xdfgRMn/tBSWBWRaYO+y/kXc+UYZkaSrlbB
         RuVMDQ7hRGn3Ii4vDRlC2l8NUQCzbM7yfFwBm/6J530J4xyJmotqsLtj+RNdBoiK2gM8
         5syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7qBqlbxYjlyQC5WFtPpqYfI1S2E5GlH1jA4UCN8HjxE=;
        b=cQ2pKsT36v3D5wOJDzwjrjV9HtAVrHIUI9nqScnaySdYsiwCUXDuFs1nuY1w9DLbMB
         zVAaVUhLwqVyxQFM1Pq7TW+CA7pkuRXz5PVfaysSSpsQEQgwcJdKADGf0ogN2a8UXj4z
         kYkANJSrY4sGYY98M5TL22qZMPHUluXflltj1Pc4PD1JF3lSYxQDnopgkObKXmiygi75
         3m8fb5UI+yMr2mPxs4roVCBQZBM1Zq+3n26KKgVIoFPzSVwUck/zOMuxHhRCQlJGLMCj
         A2Rz40oHplQheTpJn6o1BArFZdfcip1hpyba3wuKQRu2wjHn+yAZbdmMiP7y8GbyGOPF
         Ii8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVXReoCYcT1TlTxxa9umK4G/RCMaRZWQpB1CkJY3wXqP6YPiI23
	/0F9clqaeBVyqLZduX6Gdqs=
X-Google-Smtp-Source: APXvYqzZATrdsni5+K5DPWleC2a/HCdMO3WIJE4hrVzabmnXU9a9DqzZVPlNrmtiqb2ccE1tSytGtA==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr84780453wmg.5.1564163037089;
        Fri, 26 Jul 2019 10:43:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5411:: with SMTP id i17ls19083744wmb.2.canary-gmail;
 Fri, 26 Jul 2019 10:43:56 -0700 (PDT)
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr84525358wme.172.1564163036390;
        Fri, 26 Jul 2019 10:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163036; cv=none;
        d=google.com; s=arc-20160816;
        b=Vs/A9eD9JFmWGlSiJmM/VF4vMhwYgJfWE3SUAdwfb1UI/a27U69Rvi0vETzgSOnK0o
         ncW5fJvIJ+9PglkFGNysPVIFtsbcgyAaVzUwgMxp2MMLMI27dLeSqufWoB873eCX6vRq
         ECH8vxeEC3YarGi6+FFNjzPUOndi2bkjDsU+rQL9Nf35XyrBKtKHgIQfmeSR4YjPeyZ9
         7HzTAIXFScbn/8S16JMFVqdCBjXLGoHKhryv8BhEs+DJA8CBvVK7f6Z/K7vbrLMUG16M
         ZbtgEEy5B+9TJWUqLUP2vMSmnmdHQfTttQ1of/gO1mMNmm+/TID7IcLu4D2EmN9vK0N/
         +XAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=oJGV3hwvZ83bomwS67YP037uUhhCLhKJGXixiF3HyNU=;
        b=EBVTvYJ/5XnME1dx1oNvpp1M3RmzcnRwyNQ/OlxxA/vCELA5Q32XTAGa3TpQSnsO3o
         ANf1pqEGTvAHPTRxHiDn/wi8jofQDwaFtKf6ywTCiGn0Oz4J4beoDXHv48GBHtzotB/5
         wzJaeXfkf7D4oLuNTonnkBopcFrC1VkaqAVd7YciqqxTQdAbqNTCdZKl7haC8WIDGJAq
         pWUPnq48faLTa5rNMPlkgmZAGbvfUT+nuLCcn5cvbk0Hd8XaxBnUjmAiALfSuTh0j1IV
         Pa303jTc8ulanZH0q1mU0pTDPXB0NuVuvASw58HtuSmP9N7TVAgC9Ioi0l9eXjmh8dz6
         MW0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q14si2627211wmc.1.2019.07.26.10.43.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 10:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6QHht5H002953
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 19:43:55 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QHhtBp032196;
	Fri, 26 Jul 2019 19:43:55 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
 <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
 <907a0d23-c664-432b-849f-8d536d14488f@googlegroups.com>
 <421d16ea-f517-a1f0-750d-65b9f856d1e6@siemens.com>
 <942a4151-1921-4bd2-ad02-c9a98411ac36@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d3462382-811e-62dd-bd1f-cd39a1b41948@siemens.com>
Date: Fri, 26 Jul 2019 19:43:55 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <942a4151-1921-4bd2-ad02-c9a98411ac36@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 26.07.19 19:35, Jo=C3=A3o Reis wrote:
> pyjailhouse was installed on=C2=A0/usr/local/lib/python2.7/dist-packages,=
 and that is
> the directory i have to add to the script in order for it to find pyjailh=
ouse.
>=20

Hmm, must be some distro thing: When I call "pip install ...", my distro di=
rects
the result to /usr/lib/python2.7/site-packages, and that is already in the
search path of the python installation.

Which distro are you on?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d3462382-811e-62dd-bd1f-cd39a1b41948%40siemens.com.
