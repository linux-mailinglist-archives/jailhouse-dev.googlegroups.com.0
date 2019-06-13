Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOVYRLUAKGQEBVJP73A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B144B5E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 20:55:54 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id t62sf2859425wmt.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 11:55:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560452154; cv=pass;
        d=google.com; s=arc-20160816;
        b=IU6edC/ZVGwjIGDGLJ93MtxgnJlpJt/xUnNZUNPT8D8b9GIRQI+yfdHIYQ7JXiSA2O
         Kc1yQrYHWGr2lJAIeKrzX3BxumyfC5o4h/HzqTNRcatrjqExHwaoKr/ZlbBjFAeusLff
         N3Wndop1Un/HZDX9VWZXv0qpkJ7LGWiL5LzWnmv0a2oMiAGsFeSAxxiHSI8AYHbhBmRG
         se5yf+IWp5cEsH/qfWoxhflAKq0I+YVGHQhVnk+6JdrAjl65jKItY8GIseULRTfz22A+
         lTT4WnrMv5u2yIcfkUHo99LeAVFIrmwAWdCGOzshnxAHw3Ejpdq0l5F/lcNODz22O4EZ
         dwPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=44SAS7GLDjpoKCzCnPM+FKqqVeUAGZEEEr1GYsbxFT0=;
        b=IpUs4taYGqB3VEa751gJrN/itEiqERY9gyjEHio5VFGng511vv7FKemwypl/CuZR47
         EooI//hW8kFGpw01tpxWyTjivipDFaokOY1ZMg4AYTTZC4XJ93NFllHRKDvpsQHhZNgR
         o0+LY3/u9q2ymLNDTsv+SdJFFEBDw0kqjU2xb7huuarx+q2q7GVAd9btUA6gaNaAkV0L
         Tm1IDCkIem9GQfqH6H7K9w6/k3DXLj/M7pLvOYd1L5SXxwETwj72RViuVWFZ+t+QfhJ2
         HJDTc7PIR6mI2B2ffEzqkFXH5YbgagyWFiLkuNv2heOHVgBG4G81WuR54nyyeO2JzW/T
         jSRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=44SAS7GLDjpoKCzCnPM+FKqqVeUAGZEEEr1GYsbxFT0=;
        b=VSAd4N2z9HsdUzngf7mJf+EC6W4Ng/6QvCe9m+noXhceFDYZhAOxRMk4NrZ07PugJq
         Nky81ZUfKmp4kpoGegK8+P4ffAGjgWFp11/rKgmFwfgLCVu983aSnuIkX8SSADd7UQ7P
         WlTpAfiQal8plEcxT6tFOeHa9Vpr1aQohEEYJo/pBt0ZsOELhUC+71FdhEBQVWm9MIvY
         wLc4MS0EpfGm5E62yvWwWqBANgkxutQsS10SNhxLCwxmBECPRdfeFooX5xjKIQlN6olj
         W0qnQsD+hEPTswTU/Wpj7OMNzvrLpMttUaKvfgPBfN+zK9hSr+Dryc73Nk09T/5fReNh
         4qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=44SAS7GLDjpoKCzCnPM+FKqqVeUAGZEEEr1GYsbxFT0=;
        b=pIRhuJEyX84aAx5eIUqsSeY4Alnsvd+8fauxRSNIBFePZmJGbkBE0f0hNiewZ7xs6L
         h8hFE4blWrDu8NdQ3Ii/dDtLwyJ1I6iTO0VlGo0JnKaBjPhc4vlMJPLNI6zzWA+UozE2
         3FXYyjn3oYL+RnbeaugupgP0vaw4ZT1F/GW3reuNhCIY5ZvYOKlLE13FmMi+GBY3Pys7
         AK65xGYOKVoZetGWk9zkZWoqNXX87t2h3lVhalUx6N8Aziu8dkXopvLLO2H1q+zK/kyK
         HUssdxG5zJ2NrA7apg6rYCxkNJkR1GHgtHfk+6R1izoDc5UtG/7QxTOUij394b+GdPOu
         jp5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXA9aHnn6q8DobCOtkI2Fds8xMBSZfuMBqnJwatvK5g0Z6Vr8SR
	iEYjZCIu35ip/5stvD7GH2s=
X-Google-Smtp-Source: APXvYqxHnbNUVb9dgzvcwxHPJH8q++qyvfP7YrLsJomTeG2sjc+8FLsY8IIUsJpLKumrNWmFwWwPRA==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr4774047wmc.1.1560452154583;
        Thu, 13 Jun 2019 11:55:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f94b:: with SMTP id q11ls1616040wrr.10.gmail; Thu, 13
 Jun 2019 11:55:54 -0700 (PDT)
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr12496485wrr.56.1560452154024;
        Thu, 13 Jun 2019 11:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560452154; cv=none;
        d=google.com; s=arc-20160816;
        b=pzlI8XDaISqE1Dw3cwkEU9f1qTjMCHHKGobMAAOZnxJ/6+2u28o5KmtpcNJbuhOQR7
         B1a744jTdVU43pzGU8Kj0Tpy6pMmSQ+vrhaNF0iztpVXuK6bNtZ/YHHoUSFRbMFBYfX2
         VCIzz/RWFuRPswHA4sZCVCX6zczbhF6KkQNjzvKiwyTz35kvYkaVRWpAeJjkqPVbhEQS
         H6C3QvVXbpJ8nXABQdeLPLJ7uIJ3Gr03iBBE5mPeMFk9V+/nrGCIcjWfVQgIFxVKxEoI
         SFOtgW9gkURpjPUSs6e5pKUHHD3xNOAS4DZSGAELMjUbKKisOws6/W0Uh/H5juTWnONG
         Vcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=N6bZ1p3YavP46cd9X56RjxXq1qiL+r3ym7qrFRpZt1c=;
        b=RZ07+Xm1+XpBunMm0vbhodrUprADSO+lNyVhfMBlirEAJpqbx5G4q9XAkAxK9yGkaA
         nE1W3B8XNTkR6jmxQjawfo+ADJz+V/fSJ3izkGDMMx91Yehj9/2G3GaRiynrq2tqdUEP
         vMbsssxUGu7b4QMGeH61hYAuJGW8TPmMLRTzhMrPvcgsMknN3e4JyVm61pZFMHltJ6EE
         yDyM1pSRL+vajjbQt3Ac/Rh+/WdnHWaezAyPN+cORcb9INUKxaBCg1aiwt/7L6H6dzZT
         rKzFp1fJaQ2lc/nNZI0YzPQ9L31GVlDw7Rb0R2qKlI+XxPEmFDVdgXVkr1SoJaF5Mh6P
         3GQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v21si340024wmc.1.2019.06.13.11.55.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 11:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5DItq2U017048
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 20:55:52 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5DItpIu021538;
	Thu, 13 Jun 2019 20:55:52 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de>
 <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de>
 <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de>
 <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com>
 <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com>
 <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com>
 <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com>
Date: Thu, 13 Jun 2019 20:55:51 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 13.06.19 20:49, Wayne wrote:
> I added the "-k 10" to the command and unfortunately it did not make a=20
> difference with the unpacking.=C2=A0 If I add=C2=A0 "root=3D/dev/ram0" it=
 does get past the=20
> unpacking, but throws the panic for "System is deadlocked on memory".
>=20
> I have attached my current non-root kernel config.=C2=A0 Should I expect =
to be able=20
> to log in to the non-root if I use the same initramfs as the root linux?
>=20

You should at least expect to see no error messages of the kernel, possibly=
 some=20
futile probing of devices and then likely a console prompt.

Let's try my kernel config from jailhouse-images first. If that works, you =
can=20
tune from there towards your needs. I still think there is some sizing issu=
e or=20
so, but I'm not seeing the key difference immediately.

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
jailhouse-dev/0da95034-9bd0-4415-4d3b-5f6687a84563%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
