Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRBGHR2XTAKGQEECVWQFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6167319DE3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 15:11:54 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id h186sf2250528oia.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1d3yp3boKiZzKgyQkELwKJ9EONsqty5xlJB9W63GIUM=;
        b=thSrWHaxcO0r8oRB90Xlk1cBvM2nbLcT7hQPixRz1g9aiVA4KmUf9KFLVkm5Qk2rHP
         L/sjVpSknhPVPlsb8Mnl000eVC2dyBRanz8qWZ847PXmRO0wtkabUMaTdwdRj9eHs/kL
         yL/Bfj8PXrHcxjWrHstmvtIq8yH4EhZhFfMStM+J9NQ3bapgEGYRZgWyY3RB9MP3Zpd1
         bGhu3gvMcB/TQ/0Hzw80OzYqb/CKV6cYbfML0lDjNSOkEhRmsZvNEt2mbcgriARq0wHV
         3PrLJ2+BAW9Y0PirCBzH04bWVzcBaSyF3bVSjCcSWn5Mh2GlrQwoHzB3F2VO54th0trS
         gznQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1d3yp3boKiZzKgyQkELwKJ9EONsqty5xlJB9W63GIUM=;
        b=K07DT4mBqcxj7BLo9OoijcD38415yG8sb8V7w7686jwOTkWNFLQvzqSjdSJBA4rCmm
         XJKVxOckQzEsMK2UUdvl9JJwda5O6ArpbO7/OW8FI6lnVJncKw+D0wCG/O75baPOPHU1
         8g9SqOUA+cWFb3rNe/4lME6XoQ05nbGaLMAOkzzS6XTCQG+ZIeB+wNBMHDNCU4gc8xcI
         z3hYubAMm+aKQMN7hqWikzm4OBLPpAkvhPLCTE6m8PAAdjpKQhNnGcIT7sLH1B8VwvKV
         TUtSTvcL/7mIHCVb32zh8MYbzXHxVGho0aLG6B8pK1qwxscCjA/6U0eyjj29CrFKKPVG
         AhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1d3yp3boKiZzKgyQkELwKJ9EONsqty5xlJB9W63GIUM=;
        b=WejqOQ8h+tfRsE7sGhw0kJzfGO5Y+XgXNWOah5lhSq16sWw82eYsf/TnJ2w0IJx6lZ
         AO9pjvr6SE/vjvIj0cKlgL70aN2a4spmPMTkuOubhnAAVSEnNVVCVCp7chpqT4bUKVQq
         2YgtVvd9yt7myAUayzVzy29RhiIAd9fStxuU5opWm8xMxXFEnvGMnT1qwM5+q5sPYvuW
         3TiSVZjxde7+PaAoQU/JSCqRDjzZp438doNq01Xv91tuPyG7ZSixSj/Nv4xSzPJNLFOq
         RL58BNnCxmjiGghv32if2OggGq8nkvD1QG4B6hRH6InQ/e+4tY95/XRR5nFD/vE1xKpQ
         etqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWcqsp3gGdhPg0I/YVHqQpDN8FKROQ+48RyL9eN1uKMAXxRZwS+
	B5/ckKIGP4DIGl0VQHP23V4=
X-Google-Smtp-Source: APXvYqySXTbYxHRieF+JHM4ZGtA5Hta1zAgts/kVgje10pu7QFDC4zM10l2lhgHWf32KfhdMRAgQTg==
X-Received: by 2002:a9d:62c7:: with SMTP id z7mr2761756otk.12.1557493913252;
        Fri, 10 May 2019 06:11:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5f03:: with SMTP id t3ls933505oib.8.gmail; Fri, 10 May
 2019 06:11:52 -0700 (PDT)
X-Received: by 2002:aca:49d8:: with SMTP id w207mr394968oia.19.1557493912712;
        Fri, 10 May 2019 06:11:52 -0700 (PDT)
Date: Fri, 10 May 2019 06:11:52 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
In-Reply-To: <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
 <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
 <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
 <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_809_804155075.1557493912202"
X-Original-Sender: jeanne.romefort@gmail.com
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

------=_Part_809_804155075.1557493912202
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,=20

I'm still trying to get my rootCell running. I have for the moment connecte=
d a serial port in order to have the logs in full (in ssh the communication=
 was down before I could have the logs). After solving some minor errors (s=
uch as Invalid MMIO/RAM read or IO-port) I find myself with an error that I=
 can't explain:=20


VT-d fault event reported by IOMMU 1:
 Source Identifier (bus:dev.func): 03:00.0
 Fault Reason: 0x22 Fault Info: 38000000000 Type 0
VT-d fault event reported by IOMMU 1:
 Source Identifier (bus:dev.func): 03:00.0
 Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
VT-d fault event reported by IOMMU 1:
 Source Identifier (bus:dev.func): 03:00.0
 Fault Reason: 0x22 Fault Info: 39000000000 Type 0
VT-d fault event reported by IOMMU 1:
 Source Identifier (bus:dev.func): 03:00.0
 Fault Reason: 0x22 Fault Info: 3b000000000 Type 0


Is the new sysfs-parser.py the cause of my trouble or is there anything I m=
issed in the configuration ?=20

Best regards,=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0f2b55b7-09ea-4158-913b-4ec20c7443d9%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_809_804155075.1557493912202--
