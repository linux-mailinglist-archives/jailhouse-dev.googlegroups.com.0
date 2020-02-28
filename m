Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXWF4XZAKGQE5YTBC4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 65247173FFF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Feb 2020 19:58:39 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id p8sf1728100wrw.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Feb 2020 10:58:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582916319; cv=pass;
        d=google.com; s=arc-20160816;
        b=XxWZaqNLNNjqOlIu/aFvFr4gDmepkFYKaWGwVjYFxN0ogLrfADrMXWpH4ojKX/WH+Z
         7okvCAw5bwtTF29ybrOXysVh9un5XVsTnqoOlcPKIodaNcjwNjPyxHwf+f6uLtum+WnP
         GaxdwglDy1aywfzgnOsyC6SRobssUdCMgEMWz7L3CEOi6DNpbd+RjFb94vrDqeEdWs1v
         OSGjRL4VUWFNlsokR5aJ9MtGPbCAT4jIALn+Bfr2/+8d6HSPl8+y7s9uGNo8358CqH7w
         kJ4lvos8YSQW4uUX/bzAOVVw3XzfpAYpzdzuP2Fsl/M6+l0L+Vg9Ob8dfs230TK9UNOd
         T5CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=huLdS3ElinowCR+MVmmLFzQeCtK+ESvRTelQTEQLVd8=;
        b=FTFxXtFs6H0q5YTCGBeODe5P+Ilm1QAbMul2gUpc9iUSuQ08B3nZuINZTA3DJOgkRY
         mZzz1SNtt0cA3bcsKWdX8UcciA2B2CNgd6HDISASfrOJaI++1wgpcnah+KBg9/sGvw/I
         J331BfjfyLe3y6PVpGBVwrxhU4IF8nXmVXrs8ejoInm/Myv1xaDdq4KfN95aVXmv5dHl
         ahhGp73Ghls0d7eL/JAjGgW/guMoZSDBiWFXf44+W0LmKzaazebXxwRRAy7f9rJG/+4i
         qdSGhMB+9ixNaIo0ngW/G0xsLGTfRG40lsejoujhzQCSR5VOfVPU1BCkSANc1ZXTxeXC
         H0PA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=huLdS3ElinowCR+MVmmLFzQeCtK+ESvRTelQTEQLVd8=;
        b=QdQepmWwJI8KTOEl2eHXjXOF2mPsJjIe2A/gMe1Hrxq++WkZrCzihc24czeplZpr3C
         HRg8YFWA6hbJe+rPlRjiYN51WNCB496sEs5KibwXDK3y/t4LdTYSV0ukZgtaHmq1Vm4o
         OlpvCF+mwO65qNSBeDlNQ62H3HguDnSyUmecyo6w9cTSf2pnPzT9zAMscls9nhAvSgz9
         NWCgrMlMhAuBwQyiBroZp9OBCa6+BkYrmUr0KSu18Mnk8mwFWJMvpS+bjFdzObsWlBHy
         D35sO64ex9FFRw+I7b2i4WqSZgLS2+HdTu6OmCD6X6svsqMfyk8zQpYeB/mC+X2U79BZ
         kPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=huLdS3ElinowCR+MVmmLFzQeCtK+ESvRTelQTEQLVd8=;
        b=QwAIKaNeDkR/TEv0s90dOvg2bStdZ4s2MKJUekx8nONeBnKqvFyZbbuXsNzzPZDAun
         3+h06+VVlrxpd6r5sqzDpMA3uAgrFiOobotrEF2nWSjDTYI8LF82XV6hA40ubPm5/c5f
         D4PJ88qhOkoBwxpel/1RK6raYxzInC5TkKfytJ7na+WdjGcU2kiEI9/nSNYknTIm8NRB
         oZLECEaQU3nTowR4sg1MLct0xciynfsWEWRm/VbFk5q+4NisGX7pNB1untkJmkqojGgg
         Msa4vn2TQ35DOaIXGIGEHOmvLg0gi4/ybeEPGck5KamgfXqRBzzz0rRBc9ZmQdDqyaO7
         mn3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0tXpYDZszsmK1wUzSB38PkHxJDlaZszPkcsk+CBVPmphwWAXe
	U5H/beEgLrRMzyqw2whfOTU=
X-Google-Smtp-Source: APXvYqz68LAP80O/wqj4LNTBssapciTa1bT2BbJWwnWG8JMXsalDN/euI4KjyIby6mLYkXNzyqGOUQ==
X-Received: by 2002:a7b:ce92:: with SMTP id q18mr6097297wmj.70.1582916319158;
        Fri, 28 Feb 2020 10:58:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4141:: with SMTP id c1ls1738851wrq.8.gmail; Fri, 28 Feb
 2020 10:58:38 -0800 (PST)
X-Received: by 2002:adf:b60f:: with SMTP id f15mr6376706wre.372.1582916318394;
        Fri, 28 Feb 2020 10:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582916318; cv=none;
        d=google.com; s=arc-20160816;
        b=CkhrZZU2SETRMJIyHodlUOYgNZvacmaINyom2cuS13z5bYhnz7SU9ea4716gsjCzIp
         9u0NEB6r73dlgIRyY3B+LiVO9GKaROFOP9FcEzzCjO83TkpW7cTqkzVp5W48Zrs7nv7y
         rtC3UoMGi8uSYOJQ3ubEfSC6YYEMDdXThKbEZ6wci9yQp5Ufm/XWYskIE5/BvjXpTmN+
         nWU0ymEfkY4Cm7J6cnHOZMGyZWnxLlnFUBMefB1EbopBWKmt3EyfbdZGtQT48t4yEog9
         QTQlRLOYo4XCKLAh3oD92RCLL+nKWLdPBLUL54yKyIWYCQdxbYM6riiaZM9XabLt25wZ
         m/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=aPaWXZ6bhckzHkNOSha5pMt+ZBreruNFs1HKBg6iUco=;
        b=lEznrUws2Gd+5fJyHSGjamXqBuws87kKIfx6PxI1NB7BgqG2IbMX5ZRrVy6DGb0ibo
         Sqf2dw+TFW3RUx00ZdI6RUPmQhUiSbRMXwCu2BA2+6TG17GM4jZXAGaK0r1QzS4VE49W
         mGy3bUsCLHqpOKMdTL3I5gO+sEtCSIdr8k/5RK4hFUSkC3K7mA9/YXf3FikLhq05XG9A
         rKkphSJf58Lz+oxNMExBnGbMgCCPKZDfYS8KKDHnkmo4qi3wCeK7RvPiQIwbD6TAvb+d
         7kSnYTB9i2LrqGAklbeq+Vrfy+2kC6J6saLDHS7CSI0sHEIRJ5XNpYf8MN1xCyE9f2WF
         b6OQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id d191si1021812wmd.2.2020.02.28.10.58.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Feb 2020 10:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01SIwZDf031903
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2020 19:58:35 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01SIwZvf028775;
	Fri, 28 Feb 2020 19:58:35 +0100
Subject: Re: Jailhouse TX2 and GPU?
To: Alvaro Jover Alvarez <alvaro.jover@bsc.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Claudio Scordino <claudio@evidence.eu.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <202002281443.01SEh8Ta028765@opswc01.bsc.es>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6a16a1eb-a0d7-da01-848c-107b56c6f114@siemens.com>
Date: Fri, 28 Feb 2020 19:58:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <202002281443.01SEh8Ta028765@opswc01.bsc.es>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 28.02.20 15:43, Alvaro Jover Alvarez wrote:
> Hello,
>=20
> I am Alvaro Jover, former master student from BSC (Barcelona=20
> Supercomputing Center).
>=20
> I found very interesting your work in the jailhouse software. I'm=20
>  =C2=A0replicating every single step for its integration on the Tegra TX2=
 and=20
> so far I got jailhouse running bare metal.
>=20
> Now, I was wondering - what is the status of the project?. Did you ever=
=20
> manage to run anything inside jailhouse inmate using the GPU?

If you completely assign the resources of the GPU to a cell, this should=20
work. But I don't have a TX2 to try that out. Adding some folks who have=20
some in their labs and maybe tried that already.

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
jailhouse-dev/6a16a1eb-a0d7-da01-848c-107b56c6f114%40siemens.com.
