Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBC5PY6YAMGQE62BU5SI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113d.google.com (mail-yw1-x113d.google.com [IPv6:2607:f8b0:4864:20::113d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7889ADA2
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:15:25 +0200 (CEST)
Received: by mail-yw1-x113d.google.com with SMTP id 00721157ae682-617fffab703sf164407b3.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712445324; x=1713050124; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OdKaDj0tTpL78el2yJwDsK6EZZ6kaAHKPBSkw+r4VPU=;
        b=UY1WU0seOnj/hJX7ih1iJQJBb9w3On9VibuJUkpjwzU7RgSMm+LvkrE0aFL04F+omR
         5s/Aswo2iTYUo+uQ59EATJdQUUodgiudFwNXq6l4p01teE5pu1mg/lrRZ/aKdSMmEisG
         9sZPbhovpQC7PyPp1WLqJf2E+Vm9ksOLYr8YjS/oGw6GRq41uF6MAmDyTkc+iDiJzAWQ
         GOcZHjJPAirf7yooI8YUMMDtoCp94DDbF7iY6ZAwMdn28y+kx7nbuktlh2WFlHlWDFS5
         YT0X44GiIhVV9n/ORK/He+OoJX7B5Ha6IR2DkVcahIL9B5bFeWC+AN1DMP6kO2l947XG
         +b9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712445324; x=1713050124; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdKaDj0tTpL78el2yJwDsK6EZZ6kaAHKPBSkw+r4VPU=;
        b=Xx93A9hVBdMmDrLDerjGxy7v3SwYI6IAD2jWgqTW3985A36gkjPTs2DVXORdN+kGEk
         HXW/Aow3mjl5+xWM18Y6g95fAjebkRu8Xl8Cur6CvGa5M1IHQcKU1ZH/CUK1h/aEjzQf
         niHdjmOBLC2S4JMF6rW0yOzeiUwCJH114gb0pNA2Z9yk5vP38Fni+CmYq+AVYHdbH2pm
         JnOS7wsesf1rEmvSUyPseKzutHl1k6Q/etPaXY7lpPJfWMDdVfakJfG21+1cLHhzWyo/
         Tv9g/qrGJz6Y9H9Q3HBX8m0NibGnlYDTwjv3QSGLofFASNM5HKQ4dNp2JLZL+izttn+P
         Q6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712445324; x=1713050124;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OdKaDj0tTpL78el2yJwDsK6EZZ6kaAHKPBSkw+r4VPU=;
        b=A95cueUjH29ZO8pujEcnqmA64J0fh/ZtCXUpwVpgH/GeUteHChD8L9Uc7fXgvROIUN
         RnZCo/iY1STojOICNxN96CNsfLHed0I2Yl/uPjylCQqqf5VVYGmv5SfC/+dQ1t4/sJM4
         VSRye5Jl7ioRpoHVhpMtoP7s8eDV3DxwgHpzZPWXtrB+FbFuaAHpdeJ1FumVdHXnFYjp
         lTWD5AcY7epXtQQrmBaqJLxgaZp3i+pU8KFH6qYUUeZcLGrGFkCJo6R0Gjw5dl/VnRtm
         7SumVJ6kNHNFNlrmgnkw96L1gFfzCG+bEXQekpquK9otqgVDHPSfpR2K8ApCxTfsr6Mc
         CS+w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUR556x9TxhaLVh7T6rGT47ZCmgFwuahkUcL1zVdvOEvLj9ZF0eTnbc+sJAjdFfOcBP8IJuoRpfGDFaePBbzZyeVMZzQba6niWSKwM=
X-Gm-Message-State: AOJu0YzFtBjteXDLH5kJPfOnv3jV9HAkd7oLfq/+gkl500vTjIflbfDJ
	P2khe62Dl8kWDR9fR6ZlfTAkBRiK7ZvSHmCDoGoxKEjt3+eCRfcc
X-Google-Smtp-Source: AGHT+IHgbneOAZ3ZVsQKI6s9swKlyKHq+uPQvl9H850Z4Pzi5t5MXdK+ncDhtsMBx/L3GhBacaX5og==
X-Received: by 2002:a25:d384:0:b0:dcd:1436:a4ce with SMTP id e126-20020a25d384000000b00dcd1436a4cemr4321178ybf.23.1712445324252;
        Sat, 06 Apr 2024 16:15:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7507:0:b0:dcb:bfe0:81b8 with SMTP id q7-20020a257507000000b00dcbbfe081b8ls1693601ybc.0.-pod-prod-09-us;
 Sat, 06 Apr 2024 16:15:22 -0700 (PDT)
X-Received: by 2002:a05:690c:6ac1:b0:617:d650:11e2 with SMTP id ij1-20020a05690c6ac100b00617d65011e2mr1442666ywb.3.1712445322027;
        Sat, 06 Apr 2024 16:15:22 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:15:21 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <023178c1-08db-448c-a0df-eff47f1fb2d5n@googlegroups.com>
In-Reply-To: <HnPfpTHvRTGZ5O1G_SIDZg@geopod-ismtpd-13>
References: <HnPfpTHvRTGZ5O1G_SIDZg@geopod-ismtpd-13>
Subject: Re: Registration is open - SEED '24 Valencia
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_134792_1311025711.1712445321363"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_134792_1311025711.1712445321363
Content-Type: multipart/alternative; 
	boundary="----=_Part_134793_1205237941.1712445321363"

------=_Part_134793_1205237941.1712445321363
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Tuesday, January 9, 2024 at 1:05:21=E2=80=AFPM UTC+1 SEED Conference wro=
te:

> International Conference on Sustainable Energy Education=20
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C=20
>
>
> January 09, 2024   |   Read Online=20
> <https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqC=
n-b19AhOZMy-FPVkE1ycemZtXW-dgfz7LEB-Q9pyQHbb20KbLdZ2d-vknHeMyQWnFqK64Alr6gC=
TgRQCTSL7QYhh0LxRDKuqtSJA_A4FS5xlKOkaEAcmmYNK4YJN2o2bbk0nXDf5DUgDGthLQjKAjf=
o3J5LcsNMFVB0jO4gA3TAHkOZOFt-k4WyvMxcm9QHqm7tCYowarbddgJnIfZVqMeNoDp0DQNJtF=
Sc3oRpMYQV-G2i9BmAObgwaYG_AQdNPOB3UV11fkHetPQKJ_4IN9r6Fzck5ngXRpLab-pvqnstP=
0dorD7nGDF9XsuCaXbNSqqkUi6YdHYcfX5kn2iax68eq_mL4pBl3TKIUe64OcjGjR4ROP20LoxQ=
NpwtuKa6nSaLoWMM7Sozx7MpNBOEgJa15rAo7T_-_oNLEqDuz_FiucPQkWeB1irZk_fvxoObZ9w=
rgbSLxA1SukIC-DfR4SJHfxVhQQuUceWEPlAGcCEseIs81GbJeuy5A9wDFcqSzqYfBE7OwWv6Jw=
x_rNhD38fwCkWKp6BYQgnPZGdv-_ADAoOXP0Aesg8VPO-az1GkZKk36GkuhXTsvBMObtTjhCs9s=
jihyHe2pyH4IpJUwUrps_15rdA6h8uaJwWdMpVT3AQC9q4/42u/ibow9buJQAmGcG5wL9pMmw/h=
0/gZ0rMKOvvU5LiMtQ0DW4HKY4z7ZBkrtEXgE0TN_ia-A>
>
>
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9m5MmJ5O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrO=
LnvxKY8J9vW8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0HxdYRQ0szHM8Mpw9=
6fdy5rJdtf9I6P3cI8YuDuzwCLA/42u/ibow9buJQAmGcG5wL9pMmw/h1/NRFlJNhEvKVZISpUB=
YCIskquqFS25HjHhv78nku7gy0>
> International Conference on Sustainable Energy Education
> July 3 - 5, 2024. Valencia, Spain
> Visit seedconference.eu=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9m5MmJ5O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrO=
LnvxKY8J9vW8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0HxdYRQ0szHM8Mpw9=
6fdy5rJdtf9I6P3cI8YuDuzwCLA/42u/ibow9buJQAmGcG5wL9pMmw/h2/VJn0zEL0pDNUz4AGT=
gbi4dd-aQGDR3RKJxMxmRwrJ-c>
>
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9koN2XpmVENK4uKEKAKwZBSipGt4Rp3uhCJ84A0kbO5bLub9USqpFMOCs2C1JVetpG8y-Pd=
pbIgnAb_cWMkk_iPCn5kXSkrKgTF3qNWmODWsfg3Pm3weyh7TgLMj1uTy_mSBi8eQM_MyPpQ3PZ=
eNs_lm723ZZ2mBz35t25j6GVhQQ/42u/ibow9buJQAmGcG5wL9pMmw/h3/07pDiwQEKcfTIyNb6=
Svrdeeqq16ZoUNESVnt7Z98Kq8>
> In this newsletter:
>
> Click on the section below to read more:
>
> *Call for Papers*
> Scope <#m_-8939101300273007254_scope>
> Topics of interest <#m_-8939101300273007254_topicsofinterest>
> Important dates <#m_-8939101300273007254_importantdates>
> Publications and Awards <#m_-8939101300273007254_publicationsaward>
> Submission guidelines <#m_-8939101300273007254_submissionguidelines>
>
> *Call for Workshops*
> Review criteria <#m_-8939101300273007254_reviewcriteria>
> Proposals guidelines <#m_-8939101300273007254_proposalguidelines>
> Important dates <#m_-8939101300273007254_importantdates-2>
> SEED 2024: Call for Papers
> Scope
>
> The* First International Conference on Sustainable Energy Education=20
> (SEED)* aims to become a forum for researchers, academics, and=20
> practitioners to exchange ideas, experiences, opinions, and research=20
> results relating to the preparation of students, teaching/learning=20
> methodologies, the organization of educational systems, partnerships and=
=20
> funding and governance related to Sustainable Energy Education.=20
>
> The *SEED* conference will be held on *July 3-5, 2024*, at the *Faculty=
=20
> of Business Administration and Management of the Universitat Polit=C3=A8c=
nica de=20
> Val=C3=A8ncia (UPV)*, which has been ranked as the best technical univers=
ity=20
> in Spain by the Academic Ranking of World Universities since 2014.=20
> Topics of interest
>
> The Program Committee encourages the submission of extended abstracts tha=
t=20
> communicate applied and empirical findings of interest to higher educatio=
n=20
> and vocational education & training professionals, researchers, and=20
> practitioners.
> Key topics include, but are not limited to, the following subjects:
>
> *Track 1: Teaching and Learning on Sustainable Energy Education.*
> *Good practices related to:*
>
>    -=20
>   =20
>    Renewable energy sources and their development, use, and impact
>    -=20
>   =20
>    Development and use of electric vehicles and the connection to the=20
>    economy and the environment
>    -=20
>   =20
>    Efficient use of energy technologies for conservation and reduction of=
=20
>    waste
>    -=20
>   =20
>    Nature-Based Solutions (NBS)
>    -=20
>   =20
>    Circular Economy models
>   =20
> *Track 2: Partnerships, Collaboration on Sustainable Energy Education *
> *Good practices related to:*
>
>    -=20
>   =20
>    Traineeships & apprenticeships
>    -=20
>   =20
>    Energy career and workforce development in the energy industry
>    -=20
>   =20
>    Synthesis of energy information
>    -=20
>   =20
>    HUBS in sustainable energy
>    -=20
>   =20
>    Skill needs of the labor market
>   =20
> *Track 3: Governance & Funding for Sustainable Energy Education*
> *Good practices related to:*
>
>    -=20
>   =20
>    Financing models
>    -=20
>   =20
>    Financial tools=20
>    -=20
>   =20
>    Financing partnerships in energy
>    -=20
>   =20
>    Business models for energy education
>    -=20
>   =20
>    University spin-offs
>   =20
> *Track 4: Sustainable Education *
> *Good practices related to:*
>
>    -=20
>   =20
>    Competency-based learning and skill assessment
>    -=20
>   =20
>    Education accreditation, quality, and assessment
>    -=20
>   =20
>    Innovative materials and new tools for teaching
>    -=20
>   =20
>    Teaching and learning experiences
>    -=20
>   =20
>    Educational technology (e.g., virtual labs, e-learning)=20
>   =20
> Read More=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9mszuoN1yA3Jgho2bXfGfrQUhLLKabviJfrip-rYP96kA-VBSI8kiBGDdpfbj01i8em0e2H=
Yj3ycF7PU6trmWjBhVAnpTTJZHHNA3NPQ-qBaTCE8AYU-3UNsujR0_ju2grTEiENyJE5OihvGbI=
wMq89UOJjUkOCQ1ExY2TEVowViic3_l3x6I2gon6YGT89xZg/42u/ibow9buJQAmGcG5wL9pMmw=
/h4/55KW-Kotn-rCifk8pQ0xH1siF4Aims8KVAGQKO4KT4k>
> Important dates
> Publications
>
> *All accepted extended abstracts will appear in the conference proceeding=
s=20
> book, which will be assigned a DOI and ISBN.* They will be published in=
=20
> open access by UPV Press and submitted to be indexed in major internation=
al=20
> bibliographic databases. In previous conferences we organized, proceeding=
s=20
> were indexed in Scopus and the Thomson-Reuters Conference Proceedings=20
> Citation Index =E2=80=93 Web of Science Core Collection (former ISI Proce=
edings).=20
> Award
>
> To the Best Paper and Best Practice.=20
> Submission guidelines
>
> Authors worldwide are invited to submit original and unpublished extended=
=20
> abstracts not under review in any other conference or journal.=20
> All extended abstracts will be peer-reviewed by the Program Committee=20
> based on their significance, methodological soundness, originality, and=
=20
> clarity of exposition.
> See the template=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9kQlP9QpGOx82cyawC83eMelUai2WiV9CTT5coYb3lilWY9eU5I1x3zefT5HCTwZyGOdkLS=
OsOSboTqBGItstKpD2DC0pWdQZPwbLSM85I148wNn5htnpgMDfzxnC2gOHs_JbNRGznfG1NEfS_=
K8XN5Xj77Ud-QW0HcndzQcbIt6XNlg-J644kUZiGKSPGxIDhFhX3yuNuuYljrYznKZy4Z8vbrnq=
cazA6CbHEsKYc1NA/42u/ibow9buJQAmGcG5wL9pMmw/h5/L1b7aHIt4DwxelCPKh_Pni6RiFcZ=
rt3xQWjU6_9w1EU>
>
> Submissions must be between 4 and 9 pages (A4 size), including 1 title=20
> page + 8 pages with the main text, figures, tables, and references.=20
> Submissions imply the willingness of at least one author to register,=20
> attend the conference, and present their contribution.
> Read more=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9kRwuR9B71gtRmZkiE5Fb7FmfI9tMAhBptscSO1xOBx4y-tDRBQCzrpIL5Cxo7XQaDKGwnF=
Yn_ofnW7CPeLYoUtKxTOptnEJrObdN-4rO8hr8fyyWTpeOhfWoPjUs7pF1SMPhUt6aNZv3t7fD_=
Hlj_DIjOVkYrLzeuQ8LuyKQVn8A/42u/ibow9buJQAmGcG5wL9pMmw/h6/zltjZw8uGaaG-oIOY=
ptMnAyM88IyTY5-Jg6yEmaaH_s>
>
> SEED is using the EasyChair platform to manage the submissions. The=20
> submission website is *EASY CHAIR SEED 2024*
> Submit on Easy Chair Platform=20
> <https://link.mail.beehiiv.com/ss/c/mI7BQRoctVTIGHO43x85D0IyYHUvJ7fPUgDzn=
ev73L38PDgyfgzkQmM_MHGbRoyseYIC3OXxrejG_W2du5Evlp7IQT5bKjw35eZASG0VFoLYeuXe=
KuFnOQHdf48fth9QuRCLMi0p53qHr4-hjAQjhaOQe_fhCke2xMUDDU3msmn7P95v3YnXJr8H7Dq=
CFNW0x2UVgjRgwUsxG6b1riWoXSsxh7RiW9njdYh_3cO0lCs/42u/ibow9buJQAmGcG5wL9pMmw=
/h7/OnV3Cf0AIxU4QPBNnBq7_LWKIaewYyTwY9rw0Q67x4w>
>
> If you have not previously used the platform, you must register first.
> SEED 2024: Call for Workshops
>
> Researchers, academics, and practitioners are invited to submit proposals=
=20
> for workshops at the *SEED conference*. The purpose of workshops is to=20
> give room for presenting ideas and discussing preliminary results in an=
=20
> interactive atmosphere while focusing on a specific topic. Workshops may =
be=20
> proposed for *a minimum of 1.5 hours and a maximum of 3 hours in length*.=
=20
> It should encourage lively debates and stimulate the production of new=20
> ideas and the discussion of controversial issues.
> Review criteria
>
> The decision on acceptance or rejection of a workshop proposal will be ma=
de*=20
> based on the overall quality* of the proposal and its potential to=20
> attract a sufficiently broad community.=20
> Proposal guidelines
>
> *All workshop proposals should be sent to **seed...@upv.es* *in English*=
=20
> as a single PDF file (2-6 pages) containing the following sections:
>
>    -=20
>   =20
>    Title and acronym.
>    -=20
>   =20
>    Abstract: 150-200 word abstract describing the workshop purpose.
>    -=20
>      =20
>       Objectives: a clear description of the workshop objectives.=20
>       -=20
>      =20
>       Description of the topics and scope of the workshop.
>       -=20
>   =20
>    Organizer: a short biographical sketch of the workshop organizer,=20
>    describing relevant experience and qualifications.
>    -=20
>   =20
>    Intended audience: description of the anticipated audience, including=
=20
>    experience level and prerequisites, the expected number of participant=
s to=20
>    the workshop and how the workshop organizer will call for participatio=
n.
>    -=20
>   =20
>    Rough agenda: 1-page outline of the workshop content describing the=20
>    workshop dynamics, including tentative speakers, format (panels, call =
for=20
>    extended abstracts, etc).
>    -=20
>      =20
>       If the workshops consist of the selection & publication of=20
>       =E2=80=9Cextended abstracts=E2=80=9D (this is only a possibility):
>       -=20
>         =20
>          Tentative dates
>          -=20
>         =20
>          Review process=20
>          -=20
>         =20
>          Publication opportunities=20
>          -=20
>   =20
>    Infrastructure: Description of the infrastructure needed to carry out=
=20
>    the workshop.
>    -=20
>   =20
>    Statement from the organizers willing to publish an extended abstract=
=20
>    of the findings of the workshop (Final version submission deadline Jul=
y 28,=20
>    2024)
>    -=20
>   =20
>    Maximum capacity of attendees=20
>    -=20
>   =20
>    Other information: For instance, information that will let attendees=
=20
>    know more about your workshop.
>   =20
> Read more=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMs=
dzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXO=
XhPaMLi2dVHQPRWDgwgYYYXwbG2VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQAmGcG5wL9pMmw=
/h8/ujE_vns4kD--ivO2skQAUTkyprVHX5VwFc82BQqWwkU>
>
> *Resources provided by the SEED organizing committee:*
>
>    -=20
>   =20
>    A link on the SEED website.
>    -=20
>   =20
>    Management of registration for participants.
>    -=20
>   =20
>    Setup of meeting space and related equipment.
>   =20
> *The workshop organizer must take care of the following:*
>
>    -=20
>   =20
>    Coordinating schedules and deadlines with the SEED organizing=20
>    committee.
>    -=20
>   =20
>    Provide a brief description of the workshop for inclusion in the SEED=
=20
>    website and the workshop program when it is final.=20
>   =20
> Read more=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMs=
dzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXO=
XhPaMLi2dVHQPRWDgwgYYYXwbG2VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQAmGcG5wL9pMmw=
/h9/w85Yyg-ZYHLr0skwI3rSv85s8j15PJUeQWCZbz2OWF8>
> Important dates
>
> *Remember, your workshop proposal should be sent by e-mail *
> *by February 2, 2024 to  **seed...@upv.es**.*
>
> [image: fb]=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19n_meO0wke5FKBzf=
lRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDPCB6z8vhEMnt0zgr_0xSB8mCA7I4_IzXxUL0Bxv=
wowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0VoOTWsxhjeXzv6N0rcNwQKxEIDje94i_A07SYhbJ=
8C0ZFIF9dinskejayF9qkVBe1yw/42u/ibow9buJQAmGcG5wL9pMmw/h10/Y7I64xGolG3fLVzr=
dBtmE4yHXZFBYZd9OBg7IndOLBU> [image:=20
> tw]=20
> <https://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04BJ7-U5njEzF7ylz2nMaTnkJ55=
jYEaSNckuOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7GsnrP-q47S7c_m5j7f7sIGH2=
rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTYe6_7kov3y2eSnWSpWd3zEBVT=
FR08EilFukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw1otlOjhtHH0BwXrfyhuOuT/42u/i=
bow9buJQAmGcG5wL9pMmw/h11/uJ3CvcUgm7C_BhFh4FglXAdT1zdoBnfgVeqFJbBvlU0> [ima=
ge:=20
> ig]=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19-oP22J3WocJyEIq=
lEBs30mdFwj7rvgg8GJtdPH65-M9mwqiG-vvmwaV9DVnHpUEAKtXByiNzks-sZep-mXhtzqiiDF=
Vl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZNcfrRDKc7G3t7Nqn0zn2al0tT8c5m5gwuznVQ3mwgGh=
RQyVl12AMLtNmy7K2GmITIAVvMQ/42u/ibow9buJQAmGcG5wL9pMmw/h12/fACMZps9rIC-pT5O=
2xwsChu8OOlCCy98bLtmnDSmTKI> [image:=20
> in]=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrP=
SmgGRK74cEOs7Myre-gzzHjUdIlLDmhYyvXDVW6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_X=
H4o1UZo-t6INhxP3gdAhU4tjDhIlBnadN3kC8Awlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiD=
daEEgsOwVa1zg_SE0Bn8HtKsKxIKceN_E4nFm3CoWu43hj4c/42u/ibow9buJQAmGcG5wL9pMmw=
/h13/MXrSLskRUYZvCMFoMCl3Jrg2Heu7KNQkjdyqED-EZNI>=20
>  =20
>
> Update your email preferences or unsubscribe here=20
> <https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqC=
n-b19AhOZMy-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW-E=
9LTlRWORMLctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaBfLnYqeodhnbcd4VV=
76uSihRdPCouOfCc_FthWzKIZ0rTHCd3dHlAlWxuv2Ovn8U9ikEb1843pZUyDX9qFYkhg-7OmYz=
WeBEoZO2T08Io6NCrr6jaUZ2irAM53qa6Nj3vVVz4xT7Fbmas44KhqqG10p-m5schHT5ba55Uvf=
W-bJUX6rpypjFYp2Qi5abbnRa49WdGiib1EV7x8pl82y-YyZux1DvgBeVtDIwvssavHCQJ1eQiC=
BlwwmYTtu3kDfXJeEU8MHKdeAoTxoW1tK3RjqJaPpzTQGmCJ4u_w1jSv25CgRX57jUk8mVNuC5f=
IgDETTun3MzXByT7x3dyYU04ppxpTwQMsELemxjF7w8QMwXU0oN-Kmf2EA2CMQiUilpUtRcQfw5=
9SBqC_-CIIlRYbLR0h3aKTlCAEKWKfi3U2G3eYXWebPoximTUhmgHWKpR5-6wdrAVojVpZ3GTtX=
zS0thChANM_LiFwB2s5I_47oeDlWp2fRhEWyNxNJP3sVmW0YDzEhVH8YLfmXnmMQcj0S8I-ZnVh=
p9Ja0xNb7I5C6w/42u/ibow9buJQAmGcG5wL9pMmw/h14/33SAIN5fiWmKrix4fPsGqnmGOQinT=
AymCBWHPyw0Pbw>
>
> =C2=A9 2024 SEED Conference 2024 - Valencia=20
>
> Universitat Polit=C3=A8cnica de Val=C3=A8ncia Camino de Vera
> Valencia, Comunidad Valenciana 46022 , Spain=20
> [image: beehiiv logo]Powered by beehiiv=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W13i1JVnHfTV-osXza=
RbZV7_Rl1FzZwiJSW4hY_gEewf3rHZ8vMB9N1-EDL0J1hWTJlRr3ZPAcJEE1ZqFrnAbXEEpPPjA=
t6cG2zwjJfWuXKD5FBYaluY5OnLqrQEL2k5h3TIeMukXbdNoR9iQyQGDCzGSRAfAnwcdKQilI4J=
-0y3SnDLGNfRdlTxBxBl0r8iq5w/42u/ibow9buJQAmGcG5wL9pMmw/h15/l-GF9tbvH2q4QM6K=
cn8fznzZSPcwyP3DM59HCQRso6Y>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/023178c1-08db-448c-a0df-eff47f1fb2d5n%40googlegroups.com.

------=_Part_134793_1205237941.1712445321363
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Tuesday, January 9, 2024 at 1:05:21=E2=80=AFPM UTC+1 SEED Conference wrote=
:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><u></u><div=
 style=3D"margin:0px auto;padding:0px;word-wrap:normal;word-spacing:normal;=
background-color:#f5f5f5"><div role=3D"article" aria-label=3D"email_name" l=
ang=3D"en" style=3D"font-size:1rem"><div style=3D"display:none;max-height:0=
px;overflow:hidden"> International Conference on Sustainable Energy Educati=
on =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C </div><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0=
" align=3D"center" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top=
"><table role=3D"none" width=3D"670" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" style=3D"width:670px;table-layout:fixed"><tr><td align=3D"center=
" valign=3D"top" style=3D"padding:10px 5px 10px 5px"><table role=3D"none" w=
idth=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"cen=
ter"><tr><td align=3D"center" valign=3D"top" style=3D"border:0px solid #fff=
fff;border-radius:10px;background-color:#ffffff"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"=
><tr><td align=3D"right" valign=3D"top" style=3D"padding:20px 15px"><p> Jan=
uary 09, 2024 =C2=A0 | =C2=A0 <a href=3D"https://link.mail.beehiiv.com/ss/c=
/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-dgfz7LEB-Q=
9pyQHbb20KbLdZ2d-vknHeMyQWnFqK64Alr6gCTgRQCTSL7QYhh0LxRDKuqtSJA_A4FS5xlKOka=
EAcmmYNK4YJN2o2bbk0nXDf5DUgDGthLQjKAjfo3J5LcsNMFVB0jO4gA3TAHkOZOFt-k4WyvMxc=
m9QHqm7tCYowarbddgJnIfZVqMeNoDp0DQNJtFSc3oRpMYQV-G2i9BmAObgwaYG_AQdNPOB3UV1=
1fkHetPQKJ_4IN9r6Fzck5ngXRpLab-pvqnstP0dorD7nGDF9XsuCaXbNSqqkUi6YdHYcfX5kn2=
iax68eq_mL4pBl3TKIUe64OcjGjR4ROP20LoxQNpwtuKa6nSaLoWMM7Sozx7MpNBOEgJa15rAo7=
T_-_oNLEqDuz_FiucPQkWeB1irZk_fvxoObZ9wrgbSLxA1SukIC-DfR4SJHfxVhQQuUceWEPlAG=
cCEseIs81GbJeuy5A9wDFcqSzqYfBE7OwWv6Jwx_rNhD38fwCkWKp6BYQgnPZGdv-_ADAoOXP0A=
esg8VPO-az1GkZKk36GkuhXTsvBMObtTjhCs9sjihyHe2pyH4IpJUwUrps_15rdA6h8uaJwWdMp=
VT3AQC9q4/42u/ibow9buJQAmGcG5wL9pMmw/h0/gZ0rMKOvvU5LiMtQ0DW4HKY4z7ZBkrtEXgE=
0TN_ia-A" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/ZwW=
m8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-dgfz7LEB-Q9pyQ=
Hbb20KbLdZ2d-vknHeMyQWnFqK64Alr6gCTgRQCTSL7QYhh0LxRDKuqtSJA_A4FS5xlKOkaEAcm=
mYNK4YJN2o2bbk0nXDf5DUgDGthLQjKAjfo3J5LcsNMFVB0jO4gA3TAHkOZOFt-k4WyvMxcm9QH=
qm7tCYowarbddgJnIfZVqMeNoDp0DQNJtFSc3oRpMYQV-G2i9BmAObgwaYG_AQdNPOB3UV11fkH=
etPQKJ_4IN9r6Fzck5ngXRpLab-pvqnstP0dorD7nGDF9XsuCaXbNSqqkUi6YdHYcfX5kn2iax6=
8eq_mL4pBl3TKIUe64OcjGjR4ROP20LoxQNpwtuKa6nSaLoWMM7Sozx7MpNBOEgJa15rAo7T_-_=
oNLEqDuz_FiucPQkWeB1irZk_fvxoObZ9wrgbSLxA1SukIC-DfR4SJHfxVhQQuUceWEPlAGcCEs=
eIs81GbJeuy5A9wDFcqSzqYfBE7OwWv6Jwx_rNhD38fwCkWKp6BYQgnPZGdv-_ADAoOXP0Aesg8=
VPO-az1GkZKk36GkuhXTsvBMObtTjhCs9sjihyHe2pyH4IpJUwUrps_15rdA6h8uaJwWdMpVT3A=
QC9q4/42u/ibow9buJQAmGcG5wL9pMmw/h0/gZ0rMKOvvU5LiMtQ0DW4HKY4z7ZBkrtEXgE0TN_=
ia-A&amp;source=3Dgmail&amp;ust=3D1712531692340000&amp;usg=3DAOvVaw1LXVT3YO=
WcVoW560vUNYHO">Read Online</a></p></td></tr><tr><td style=3D"height:0px;wi=
dth:0px"><div style=3D"min-height:1px"> <img src=3D"https://ci4.googleuserc=
ontent.com/proxy/NtdHWq4sg61tELhnw6bFJEmFU3tC-Yl5vLi09AIcjkAa0ox_y06vsOsX6S=
p_DpS-_kFkPlo06DRd8JvtD31aMbo9KR7j8p6NuPHAL_FmzD6f-GtNUgY3KXqIE4ZH0cnIAfeH6=
32A06nFZYhq3aY=3Ds0-d-e1-ft#https://link.mail.beehiiv.com/ss/o/hZ_JlIqIIa_w=
oP0TRrumGA/42u/ibow9buJQAmGcG5wL9pMmw/ho.gif" alt=3D"" width=3D"1" height=
=3D"1" border=3D"0" style=3D"min-height:1px!important;width:1px!important;b=
order-width:0!important;margin-top:0!important;margin-bottom:0!important;ma=
rgin-right:0!important;margin-left:0!important;padding-top:0!important;padd=
ing-bottom:0!important;padding-right:0!important;padding-left:0!important">=
 </div></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-b=
ottom:15px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" style=3D"pa=
dding:0px 15px;text-align:center;word-break:break-word"><p></p></td></tr><t=
r><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px 0px"><table=
 role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"ma=
rgin:0 auto 0 auto"><tr><td align=3D"center" valign=3D"top" style=3D"width:=
252px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17=
ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-=
NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0H=
xdYRQ0szHM8Mpw96fdy5rJdtf9I6P3cI8YuDuzwCLA/42u/ibow9buJQAmGcG5wL9pMmw/h1/NR=
FlJNhEvKVZISpUBYCIskquqFS25HjHhv78nku7gy0" rel=3D"noopener noreferrer nofol=
low" style=3D"text-decoration:none" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.co=
m/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9RKu4epSYGkY=
a9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alofQGTlZ6nL6_=
pzi1m2retIuYI2iqY4pqcTb3SIY0HxdYRQ0szHM8Mpw96fdy5rJdtf9I6P3cI8YuDuzwCLA/42u=
/ibow9buJQAmGcG5wL9pMmw/h1/NRFlJNhEvKVZISpUBYCIskquqFS25HjHhv78nku7gy0&amp;=
source=3Dgmail&amp;ust=3D1712531692340000&amp;usg=3DAOvVaw2_-6Bbj7DFci59Tsh=
Ku0as"><img src=3D"https://ci6.googleusercontent.com/proxy/oqBcKxvBpwLSmPKP=
x7LNcmISabh-7JXELRcovHv3NAUP9Orn2z4deJZB95fkATisG2EnQLmbDSGmMUYd-xf4ZBi1-1c=
6enqth8JarLYm0noONqy3-RSElVO6bbjhn2Wac1bsxrG-bptDT6Ak_-JHoFzsqkX3I_1026Vmad=
DoGncH-KJHkkvVobUP0YwvkcHHEVuel1wDP15biBRKOXK96hmPeZKAnZCwQXa0AyvARd08ul3FF=
0P-Jhcr-wqCvz4iRebkTIg4TWol3vqkg27DOAe95ds=3Ds0-d-e1-ft#https://media.beehi=
iv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,qual=
ity=3D80/uploads/asset/file/dcbc0422-e91e-4be2-9044-0744bbc94e07/6543f3704b=
cc1407f3339baf.png?t=3D1702884418" alt=3D"" height=3D"auto" width=3D"252" s=
tyle=3D"display:block;width:100%" border=3D"0"></a></td></tr></table></td><=
/tr><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-=
align:center"><h1><span style=3D"color:rgb(232,25,90);font-family:Arial;fon=
t-size:36px">International Conference on Sustainable Energy Education</span=
></h1></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding:0p=
x 15px;text-align:center"><h3><span style=3D"color:rgb(67,138,201);font-fam=
ily:Arial;font-size:24px">July 3 - 5, 2024. Valencia, Spain</span></h3></td=
></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;=
padding-left:15px;padding-right:15px;padding-top:14px;text-align:center;wid=
th:100%;word-break:break-word"><table role=3D"none" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=
=3D"middle" height=3D"52" style=3D"height:52px"><a href=3D"https://link.mai=
l.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR=
9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9al=
ofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0HxdYRQ0szHM8Mpw96fdy5rJdtf9I6P3cI8Y=
uDuzwCLA/42u/ibow9buJQAmGcG5wL9pMmw/h2/VJn0zEL0pDNUz4AGTgbi4dd-aQGDR3RKJxMx=
mRwrJ-c" rel=3D"noopener noreferrer nofollow" style=3D"color:#ffffff;font-s=
ize:18px;padding:0px 22px;text-decoration:none" target=3D"_blank" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail=
.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9=
RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alo=
fQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0HxdYRQ0szHM8Mpw96fdy5rJdtf9I6P3cI8Yu=
DuzwCLA/42u/ibow9buJQAmGcG5wL9pMmw/h2/VJn0zEL0pDNUz4AGTgbi4dd-aQGDR3RKJxMxm=
RwrJ-c&amp;source=3Dgmail&amp;ust=3D1712531692340000&amp;usg=3DAOvVaw1KfPhi=
BXNOU7pZu5wcJLKj"> Visit seedconference.eu </a></td></tr></table></td></tr>=
<tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px 0px"><tab=
le role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"=
margin:0 auto 0 auto"><tr><td align=3D"center" valign=3D"top" style=3D"widt=
h:630px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W=
17ooVUgQpQHcjoAkkAh3L9koN2XpmVENK4uKEKAKwZBSipGt4Rp3uhCJ84A0kbO5bLub9USqpFM=
OCs2C1JVetpG8y-PdpbIgnAb_cWMkk_iPCn5kXSkrKgTF3qNWmODWsfg3Pm3weyh7TgLMj1uTy_=
mSBi8eQM_MyPpQ3PZeNs_lm723ZZ2mBz35t25j6GVhQQ/42u/ibow9buJQAmGcG5wL9pMmw/h3/=
07pDiwQEKcfTIyNb6Svrdeeqq16ZoUNESVnt7Z98Kq8" rel=3D"noopener noreferrer nof=
ollow" style=3D"text-decoration:none" target=3D"_blank" data-saferedirectur=
l=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.c=
om/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9koN2XpmVENK4uKEKAKwZBSipG=
t4Rp3uhCJ84A0kbO5bLub9USqpFMOCs2C1JVetpG8y-PdpbIgnAb_cWMkk_iPCn5kXSkrKgTF3q=
NWmODWsfg3Pm3weyh7TgLMj1uTy_mSBi8eQM_MyPpQ3PZeNs_lm723ZZ2mBz35t25j6GVhQQ/42=
u/ibow9buJQAmGcG5wL9pMmw/h3/07pDiwQEKcfTIyNb6Svrdeeqq16ZoUNESVnt7Z98Kq8&amp=
;source=3Dgmail&amp;ust=3D1712531692340000&amp;usg=3DAOvVaw2GT2qozp363eMy0C=
nTmwPW"><img src=3D"https://ci4.googleusercontent.com/proxy/sv62enVQLEuHHnC=
MrMO2pII8rHAJjvHgZbuq07ooDW6MARghvgvO-9jaifLu4lvosvYfbhFqNyNmqMeDZ76IX4mzjd=
cYkrwjscf0snvzYl5JcnlS07d-2TQ9ozbPixseSIU9fZEXZkAqCFeKCgThpYl-3hx-6amqLEn5_=
U-t8UMyPOvQhFMBMNpc8t0AeNtFzZIR6hAJ7xy4_1btB-28M949x7e14AIKlJAUZkTKNJteuHXR=
m0BGpqBMvhaES_PnlZP5ecc=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/imag=
e/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/as=
set/file/0f5d962c-9f40-4340-99e7-eee934672118/hero-new3.jpg?t=3D1704789373"=
 alt=3D"" height=3D"auto" width=3D"630" style=3D"display:block;width:100%" =
border=3D"0"></a></td></tr></table></td></tr><tr><td><table role=3D"none" w=
idth=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgco=
lor=3D"#E8BEC7" style=3D"background-color:#e8bec7;padding:0px 0px 0px 0px">=
<table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadd=
ing=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px=
;text-align:center"><h1><span style=3D"color:#e8195a">In this newsletter:</=
span></h1></td></tr></table></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#e8bec7;padding:0px 0p=
x 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0"><tr><td align=3D"center" style=3D"padding:0px 15px;tex=
t-align:center;word-break:break-word"><p><span style=3D"color:#e8195a">Clic=
k on the section below to read more:</span></p></td></tr></table></td></tr>=
</table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"ba=
ckground-color:#e8bec7;padding:0px 0px 0px 0px"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D=
"100%"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0"><tr><td width=3D"50%" style=3D"vertical-align:top"><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tbody><tr><td align=3D"center" style=3D"padding:0px 15px;text-align:cen=
ter;word-break:break-word"><p><span style=3D"color:#e8195a"><b>Call for Pap=
ers</b></span><br><span style=3D"color:#e8195a"><a href=3D"#m_-893910130027=
3007254_scope" rel=3D"noopener noreferrer nofollow">Scope</a></span><br><sp=
an style=3D"color:#e8195a"><a href=3D"#m_-8939101300273007254_topicsofinter=
est" rel=3D"noopener noreferrer nofollow">Topics of interest</a></span><br>=
<span style=3D"color:#e8195a"><a href=3D"#m_-8939101300273007254_importantd=
ates" rel=3D"noopener noreferrer nofollow">Important dates</a></span><br><s=
pan style=3D"color:#e8195a"><a href=3D"#m_-8939101300273007254_publications=
award" rel=3D"noopener noreferrer nofollow">Publications and Awards</a></sp=
an><br><span style=3D"color:#e8195a"><a href=3D"#m_-8939101300273007254_sub=
missionguidelines" rel=3D"noopener noreferrer nofollow">Submission guidelin=
es</a></span></p></td></tr></tbody></table></td><td width=3D"50%" style=3D"=
vertical-align:top"><table role=3D"none" width=3D"100%" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0"><tbody><tr><td align=3D"center" style=3D"padd=
ing:0px 15px;text-align:center;word-break:break-word"><p><span style=3D"col=
or:#e8195a"><b>Call for Workshops</b></span><br><span style=3D"color:#e8195=
a"><a href=3D"#m_-8939101300273007254_reviewcriteria" rel=3D"noopener noref=
errer nofollow">Review criteria</a></span><br><span style=3D"color:#e8195a"=
><a href=3D"#m_-8939101300273007254_proposalguidelines" rel=3D"noopener nor=
eferrer nofollow">Proposals guidelines</a></span><br><span style=3D"color:#=
e8195a"><a href=3D"#m_-8939101300273007254_importantdates-2" rel=3D"noopene=
r noreferrer nofollow">Important dates</a></span></p></td></tr></tbody></ta=
ble></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0"><tr><td bgcolor=3D"transparent" style=3D"background-color:transp=
arent;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=
=3D"top" style=3D"padding:0px 15px;text-align:center"><h1><span style=3D"co=
lor:#438ac9">SEED 2024: Call for Papers</span></h1></td></tr></table></td><=
/tr></table></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padd=
ing:0px 15px;text-align:center"><h2>Scope</h2></td></tr><tr><td align=3D"le=
ft" style=3D"padding:0px 15px;text-align:left;word-break:break-word"><p> Th=
e<b> First International Conference on Sustainable Energy Education (SEED)<=
/b> aims to become a forum for researchers, academics, and practitioners to=
 exchange ideas, experiences, opinions, and research results relating to th=
e preparation of students, teaching/learning methodologies, the organizatio=
n of educational systems, partnerships and funding and governance related t=
o Sustainable Energy Education. </p></td></tr><tr><td align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word"><p> The <b>SEED=
</b> conference will be held on <b>July 3-5, 2024</b>, at the <b>Faculty of=
 Business Administration and Management of the Universitat Polit=C3=A8cnica=
 de Val=C3=A8ncia (UPV)</b>, which has been ranked as the best technical un=
iversity in Spain by the Academic Ranking of World Universities since 2014.=
 </p></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"backg=
round-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"=
100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"cen=
ter" valign=3D"top" style=3D"padding:0px 15px;text-align:center"><h2><span>=
Topics of interest</span></h2></td></tr></table></td></tr></table></td></tr=
><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0"=
 cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#e=
ff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"left" style=3D"=
padding:0px 15px;text-align:left;word-break:break-word"><p><span>The Progra=
m Committee encourages the submission of extended abstracts that communicat=
e applied and empirical findings of interest to higher education and vocati=
onal education &amp; training professionals, researchers, and practitioners=
.</span><br><span>Key topics include, but are not limited to, the following=
 subjects:</span></p></td></tr></table></td></tr></table></td></tr><tr><td>=
<table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadd=
ing=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;pad=
ding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0"><tr><td width=3D"100%"><table role=3D"none"=
 width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td wi=
dth=3D"50%" style=3D"vertical-align:top"><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td align=3D"=
left" style=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><=
span><b>Track 1: Teaching and Learning on Sustainable Energy Education.</b>=
</span><br><span><i>Good practices related to:</i></span></p></td></tr><tr>=
<td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27px;paddi=
ng-top:12px"><div style=3D"margin-left:0px"><ul style=3D"list-style-type:di=
sc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=3D"padding:0px;text=
-align:left;word-break:break-word"><span>Renewable energy sources and their=
 development, use, and impact</span></p></li><li><p style=3D"padding:0px;te=
xt-align:left;word-break:break-word"><span>Development and use of electric =
vehicles and the connection to the economy and the environment</span></p></=
li><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><span=
>Efficient use of energy technologies for conservation and reduction of was=
te</span></p></li><li><p style=3D"padding:0px;text-align:left;word-break:br=
eak-word"><span>Nature-Based Solutions (NBS)</span></p></li><li><p style=3D=
"padding:0px;text-align:left;word-break:break-word"><span>Circular Economy =
models</span></p></li></ul></div></td></tr></tbody></table></td><td width=
=3D"50%" style=3D"vertical-align:top"><table role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td align=3D"lef=
t" style=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><spa=
n><b>Track 2: Partnerships, Collaboration on Sustainable Energy Education <=
/b></span><br><span><i>Good practices related to:</i></span></p></td></tr><=
tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27px;pa=
dding-top:12px"><div style=3D"margin-left:0px"><ul style=3D"list-style-type=
:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=3D"padding:0px;t=
ext-align:left;word-break:break-word"><span>Traineeships &amp; apprenticesh=
ips</span></p></li><li><p style=3D"padding:0px;text-align:left;word-break:b=
reak-word"><span>Energy career and workforce development in the energy indu=
stry</span></p></li><li><p style=3D"padding:0px;text-align:left;word-break:=
break-word"><span>Synthesis of energy information</span></p></li><li><p sty=
le=3D"padding:0px;text-align:left;word-break:break-word"><span>HUBS in sust=
ainable energy</span></p></li><li><p style=3D"padding:0px;text-align:left;w=
ord-break:break-word"><span>Skill needs of the labor market</span></p></li>=
</ul></div></td></tr></tbody></table></td></tr></table></td></tr></table></=
td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" sty=
le=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td w=
idth=3D"100%"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" style=3D"vertical-align:top"=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0"><tbody><tr><td align=3D"left" style=3D"padding:0px 15px;text-ali=
gn:left;word-break:break-word"><p><span><b>Track 3: Governance &amp; Fundin=
g for Sustainable Energy Education</b></span><br><span><i>Good practices re=
lated to:</i></span></p></td></tr><tr><td style=3D"padding-bottom:12px;padd=
ing-left:37px;padding-right:27px;padding-top:12px"><div style=3D"margin-lef=
t:0px"><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px=
 0px"><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><s=
pan>Financing models</span></p></li><li><p style=3D"padding:0px;text-align:=
left;word-break:break-word"><span>Financial tools </span></p></li><li><p st=
yle=3D"padding:0px;text-align:left;word-break:break-word"><span>Financing p=
artnerships in energy</span></p></li><li><p style=3D"padding:0px;text-align=
:left;word-break:break-word"><span>Business models for energy education</sp=
an></p></li><li><p style=3D"padding:0px;text-align:left;word-break:break-wo=
rd"><span>University spin-offs</span></p></li></ul></div></td></tr></tbody>=
</table></td><td width=3D"50%" style=3D"vertical-align:top"><table role=3D"=
none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbod=
y><tr><td align=3D"left" style=3D"padding:0px 15px;text-align:left;word-bre=
ak:break-word"><p><span><b>Track 4: Sustainable Education </b></span><br><s=
pan><i>Good practices related to:</i></span></p></td></tr><tr><td style=3D"=
padding-bottom:12px;padding-left:37px;padding-right:27px;padding-top:12px">=
<div style=3D"margin-left:0px"><ul style=3D"list-style-type:disc;margin:0px=
 0px;padding:0px 0px 0px 0px"><li><p style=3D"padding:0px;text-align:left;w=
ord-break:break-word"><span>Competency-based learning and skill assessment<=
/span></p></li><li><p style=3D"padding:0px;text-align:left;word-break:break=
-word"><span>Education accreditation, quality, and assessment</span></p></l=
i><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><span>=
Innovative materials and new tools for teaching</span></p></li><li><p style=
=3D"padding:0px;text-align:left;word-break:break-word"><span>Teaching and l=
earning experiences</span></p></li><li><p style=3D"padding:0px;text-align:l=
eft;word-break:break-word"><span>Educational technology (e.g., virtual labs=
, e-learning) </span></p></li></ul></div></td></tr></tbody></table></td></t=
r></table></td></tr></table></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0p=
x 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"paddi=
ng-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-a=
lign:center;width:100%;word-break:break-word"><table role=3D"none" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=
=3D"center" valign=3D"middle" height=3D"52" style=3D"height:52px"><a href=
=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAk=
kAh3L9mszuoN1yA3Jgho2bXfGfrQUhLLKabviJfrip-rYP96kA-VBSI8kiBGDdpfbj01i8em0e2=
HYj3ycF7PU6trmWjBhVAnpTTJZHHNA3NPQ-qBaTCE8AYU-3UNsujR0_ju2grTEiENyJE5OihvGb=
IwMq89UOJjUkOCQ1ExY2TEVowViic3_l3x6I2gon6YGT89xZg/42u/ibow9buJQAmGcG5wL9pMm=
w/h4/55KW-Kotn-rCifk8pQ0xH1siF4Aims8KVAGQKO4KT4k" rel=3D"noopener noreferre=
r nofollow" style=3D"color:#ffffff;font-size:18px;padding:0px 22px;text-dec=
oration:none" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0D=
uh6W17ooVUgQpQHcjoAkkAh3L9mszuoN1yA3Jgho2bXfGfrQUhLLKabviJfrip-rYP96kA-VBSI=
8kiBGDdpfbj01i8em0e2HYj3ycF7PU6trmWjBhVAnpTTJZHHNA3NPQ-qBaTCE8AYU-3UNsujR0_=
ju2grTEiENyJE5OihvGbIwMq89UOJjUkOCQ1ExY2TEVowViic3_l3x6I2gon6YGT89xZg/42u/i=
bow9buJQAmGcG5wL9pMmw/h4/55KW-Kotn-rCifk8pQ0xH1siF4Aims8KVAGQKO4KT4k&amp;so=
urce=3Dgmail&amp;ust=3D1712531692341000&amp;usg=3DAOvVaw0MMZGdjcmnVT-3vm2wS=
xg3"> Read More </a></td></tr></table></td></tr></table></td></tr></table><=
/td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-=
color:#e8bec7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" v=
align=3D"top" style=3D"padding:0px 15px;text-align:center"><h2><span style=
=3D"color:#e8195a">Important dates</span></h2></td></tr></table></td></tr><=
/table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"bac=
kground-color:#e8bec7;padding:0px 0px 0px 0px"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D=
"center" valign=3D"top" style=3D"padding:0px 15px 0px"><table role=3D"none"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 =
auto"><tr><td align=3D"center" valign=3D"top" style=3D"width:567px"><img sr=
c=3D"https://ci4.googleusercontent.com/proxy/sYvwDprXj57bXMqK0k2i2CjkBuSKKf=
3OdjgKBHlctZx59MOPO3KcbL5B60P6IpQEuHLy4-967G-R3djItnQHIz5ZVLkuwVTWpYP1pApc7=
Y0iO80c6RvtWMNf7ol4ANY8IKqMX7Xs7HhhjXki0T59_jZCVUhL-AZRF-ndgaWDA5sc6bblfvCZ=
BFsKQDflLnpX5RvALaAr34lGzVew4k14E-9-0FUTx1aB6sixjFmw__9TvD5IsoFNCrIpcIlxwVZ=
CRRsaSVQNtnjotGlc6wY40n_-5GT9-hC-Fqaz-Jcm=3Ds0-d-e1-ft#https://media.beehii=
v.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quali=
ty=3D80/uploads/asset/file/78a793ec-823a-4cfa-a827-6da26cf59def/Schermata_2=
023-12-21_alle_00.07.10.png?t=3D1703113645" alt=3D"" height=3D"auto" width=
=3D"567" style=3D"display:block;width:100%" border=3D"0"></td></tr></table>=
</td></tr></table></td></tr></table></td></tr><tr><td align=3D"center" vali=
gn=3D"top" style=3D"padding:0px 15px;text-align:center"><h2>Publications</h=
2></td></tr><tr><td align=3D"left" style=3D"padding:0px 15px;text-align:lef=
t;word-break:break-word"><p><b>All accepted extended abstracts will appear =
in the conference proceedings book, which will be assigned a=C2=A0DOI=C2=A0=
and=C2=A0ISBN.</b> They will be published in open access by=C2=A0UPV Press =
and submitted to be indexed in major international bibliographic databases.=
 In previous conferences we organized, proceedings were indexed in Scopus a=
nd the=C2=A0Thomson-Reuters Conference Proceedings Citation Index =E2=80=93=
 Web of Science Core Collection=C2=A0(former ISI Proceedings). </p></td></t=
r><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-al=
ign:center"><h2>Award</h2></td></tr><tr><td align=3D"left" style=3D"padding=
:0px 15px;text-align:left;word-break:break-word"><p> To the=C2=A0Best Paper=
=C2=A0and=C2=A0Best Practice. </p></td></tr><tr><td><table role=3D"none" wi=
dth=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcol=
or=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px;=
text-align:center"><h2><span>Submission guidelines</span></h2></td></tr></t=
able></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2=
F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:=
break-word"><p><span>Authors worldwide are invited to submit original and u=
npublished extended abstracts not under review in any other conference or j=
ournal.=C2=A0</span><br><span>All extended abstracts will be peer-reviewed =
by the Program Committee based on their significance, methodological soundn=
ess, originality, and clarity of exposition.</span></p></td></tr></table></=
td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" sty=
le=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td a=
lign=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15=
px;padding-right:15px;padding-top:14px;text-align:center;width:100%;word-br=
eak:break-word"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" align=3D"center"><tr><td align=3D"center" valign=3D"middle" heig=
ht=3D"52" style=3D"height:52px"><a href=3D"https://link.mail.beehiiv.com/ss=
/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kQlP9QpGOx82cyawC83eMelUai2WiV=
9CTT5coYb3lilWY9eU5I1x3zefT5HCTwZyGOdkLSOsOSboTqBGItstKpD2DC0pWdQZPwbLSM85I=
148wNn5htnpgMDfzxnC2gOHs_JbNRGznfG1NEfS_K8XN5Xj77Ud-QW0HcndzQcbIt6XNlg-J644=
kUZiGKSPGxIDhFhX3yuNuuYljrYznKZy4Z8vbrnqcazA6CbHEsKYc1NA/42u/ibow9buJQAmGcG=
5wL9pMmw/h5/L1b7aHIt4DwxelCPKh_Pni6RiFcZrt3xQWjU6_9w1EU" rel=3D"noopener no=
referrer nofollow" style=3D"color:#ffffff;font-size:18px;padding:0px 22px;t=
ext-decoration:none" target=3D"_blank" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZ=
vovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kQlP9QpGOx82cyawC83eMelUai2WiV9CTT5coYb3li=
lWY9eU5I1x3zefT5HCTwZyGOdkLSOsOSboTqBGItstKpD2DC0pWdQZPwbLSM85I148wNn5htnpg=
MDfzxnC2gOHs_JbNRGznfG1NEfS_K8XN5Xj77Ud-QW0HcndzQcbIt6XNlg-J644kUZiGKSPGxID=
hFhX3yuNuuYljrYznKZy4Z8vbrnqcazA6CbHEsKYc1NA/42u/ibow9buJQAmGcG5wL9pMmw/h5/=
L1b7aHIt4DwxelCPKh_Pni6RiFcZrt3xQWjU6_9w1EU&amp;source=3Dgmail&amp;ust=3D17=
12531692341000&amp;usg=3DAOvVaw2PihEi82DORpU_DWrQHD9i"> See the template </=
a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padd=
ing:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cells=
pacing=3D"0" cellpadding=3D"0"><tr><td align=3D"left" style=3D"padding:0px =
15px;text-align:left;word-break:break-word"><p><span>Submissions must be be=
tween 4 and 9 pages (A4 size), including 1 title page + 8 pages with the ma=
in text, figures, tables, and references. Submissions imply the willingness=
 of at least one author to register, attend the conference, and present the=
ir contribution.</span></p></td></tr></table></td></tr></table></td></tr><t=
r><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2=
f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"to=
p" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;paddin=
g-top:14px;text-align:center;width:100%;word-break:break-word"><table role=
=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"=
><tr><td align=3D"center" valign=3D"middle" height=3D"52" style=3D"height:5=
2px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17oo=
VUgQpQHcjoAkkAh3L9kRwuR9B71gtRmZkiE5Fb7FmfI9tMAhBptscSO1xOBx4y-tDRBQCzrpIL5=
Cxo7XQaDKGwnFYn_ofnW7CPeLYoUtKxTOptnEJrObdN-4rO8hr8fyyWTpeOhfWoPjUs7pF1SMPh=
Ut6aNZv3t7fD_Hlj_DIjOVkYrLzeuQ8LuyKQVn8A/42u/ibow9buJQAmGcG5wL9pMmw/h6/zltj=
Zw8uGaaG-oIOYptMnAyM88IyTY5-Jg6yEmaaH_s" rel=3D"noopener noreferrer nofollo=
w" style=3D"color:#ffffff;font-size:18px;padding:0px 22px;text-decoration:n=
one" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?h=
l=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooV=
UgQpQHcjoAkkAh3L9kRwuR9B71gtRmZkiE5Fb7FmfI9tMAhBptscSO1xOBx4y-tDRBQCzrpIL5C=
xo7XQaDKGwnFYn_ofnW7CPeLYoUtKxTOptnEJrObdN-4rO8hr8fyyWTpeOhfWoPjUs7pF1SMPhU=
t6aNZv3t7fD_Hlj_DIjOVkYrLzeuQ8LuyKQVn8A/42u/ibow9buJQAmGcG5wL9pMmw/h6/zltjZ=
w8uGaaG-oIOYptMnAyM88IyTY5-Jg6yEmaaH_s&amp;source=3Dgmail&amp;ust=3D1712531=
692341000&amp;usg=3DAOvVaw3EWGX7YkppPj2XOOP2c3g7"> Read more </a></td></tr>=
</table></td></tr></table></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0p=
x 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0"><tr><td align=3D"left" style=3D"padding:0px 15px;text-=
align:left;word-break:break-word"><p><span>SEED is using the EasyChair plat=
form to manage the submissions. The submission website is </span><span><b>E=
ASY CHAIR SEED 2024</b></span></p></td></tr></table></td></tr></table></td>=
</tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-co=
lor:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" val=
ign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15=
px;padding-top:14px;text-align:center;width:100%;word-break:break-word"><ta=
ble role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D=
"center"><tr><td align=3D"center" valign=3D"middle" height=3D"52" style=3D"=
height:52px"><a href=3D"https://link.mail.beehiiv.com/ss/c/mI7BQRoctVTIGHO4=
3x85D0IyYHUvJ7fPUgDznev73L38PDgyfgzkQmM_MHGbRoyseYIC3OXxrejG_W2du5Evlp7IQT5=
bKjw35eZASG0VFoLYeuXeKuFnOQHdf48fth9QuRCLMi0p53qHr4-hjAQjhaOQe_fhCke2xMUDDU=
3msmn7P95v3YnXJr8H7DqCFNW0x2UVgjRgwUsxG6b1riWoXSsxh7RiW9njdYh_3cO0lCs/42u/i=
bow9buJQAmGcG5wL9pMmw/h7/OnV3Cf0AIxU4QPBNnBq7_LWKIaewYyTwY9rw0Q67x4w" rel=
=3D"noopener noreferrer nofollow" style=3D"color:#ffffff;font-size:18px;pad=
ding:0px 22px;text-decoration:none" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.co=
m/ss/c/mI7BQRoctVTIGHO43x85D0IyYHUvJ7fPUgDznev73L38PDgyfgzkQmM_MHGbRoyseYIC=
3OXxrejG_W2du5Evlp7IQT5bKjw35eZASG0VFoLYeuXeKuFnOQHdf48fth9QuRCLMi0p53qHr4-=
hjAQjhaOQe_fhCke2xMUDDU3msmn7P95v3YnXJr8H7DqCFNW0x2UVgjRgwUsxG6b1riWoXSsxh7=
RiW9njdYh_3cO0lCs/42u/ibow9buJQAmGcG5wL9pMmw/h7/OnV3Cf0AIxU4QPBNnBq7_LWKIae=
wYyTwY9rw0Q67x4w&amp;source=3Dgmail&amp;ust=3D1712531692341000&amp;usg=3DAO=
vVaw01pyo7BOysa31C09gNAcXP"> Submit on Easy Chair Platform </a></td></tr></=
table></td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"=
none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><=
td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0p=
x 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0"><tr><td align=3D"left" style=3D"padding:0px 15px;text-alig=
n:left;word-break:break-word"><p><span>If you have not previously used the =
platform, you must register first.</span></p></td></tr></table></td></tr></=
table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"transparent" style=3D"=
background-color:transparent;padding:0px 0px 0px 0px"><table role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td ali=
gn=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center"><=
h1><span style=3D"color:#438ac9">SEED 2024: Call for Workshops</span></h1><=
/td></tr></table></td></tr></table></td></tr><tr><td align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><span style=
=3D"font-size:16px">Researchers, academics, and practitioners are invited t=
o submit proposals for workshops at the=C2=A0</span><span style=3D"font-siz=
e:16px"><b>SEED conference</b></span><span style=3D"font-size:16px">. The p=
urpose of workshops is to give room for presenting ideas and discussing pre=
liminary results in an interactive atmosphere while focusing on a specific =
topic. Workshops may be proposed for=C2=A0</span><span style=3D"font-size:1=
6px"><b>a minimum of 1.5 hours and a maximum of 3 hours in length</b></span=
><span style=3D"font-size:16px">. It should encourage lively debates and st=
imulate the production of new ideas and the discussion of controversial iss=
ues.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"p=
adding:0px 15px;text-align:center"><h2>Review criteria</h2></td></tr><tr><t=
d align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break=
-word"><p><span style=3D"font-size:16px">The decision on acceptance or reje=
ction of a workshop proposal will be made</span><span style=3D"font-size:16=
px"><b> based on the overall quality</b></span><span style=3D"font-size:16p=
x">=C2=A0of the proposal and its potential to attract a sufficiently broad =
community.=C2=A0</span></p></td></tr><tr><td><table role=3D"none" width=3D"=
100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#=
EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
"><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-al=
ign:center"><h2><span>Proposal guidelines</span></h2></td></tr></table></td=
></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" styl=
e=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none"=
 width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td al=
ign=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-wor=
d"><p><span><b>All workshop proposals should be sent to=C2=A0</b></span><sp=
an><b><a href rel=3D"noopener noreferrer nofollow" data-email-masked>seed..=
.@upv.es</a></b></span><span>=C2=A0</span><span><b>in English</b></span><sp=
an> as a single PDF file (2-6 pages) containing the following sections:</sp=
an></p></td></tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;pad=
ding-right:27px;padding-top:12px"><div style=3D"margin-left:0px"><ul style=
=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p sty=
le=3D"padding:0px;text-align:left;word-break:break-word"><span style=3D"fon=
t-size:12px">Title and acronym.</span></p></li><li><p style=3D"padding:0px;=
text-align:left;word-break:break-word"><span style=3D"font-size:12px">Abstr=
act: 150-200 word abstract describing the workshop purpose.</span></p><ul s=
tyle=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p=
 style=3D"padding:0px;text-align:left;word-break:break-word"><span style=3D=
"font-size:12px">Objectives: a clear description of the workshop objectives=
.=C2=A0</span></p></li><li><p style=3D"padding:0px;text-align:left;word-bre=
ak:break-word"><span style=3D"font-size:12px">Description of the topics and=
 scope of the workshop.</span></p></li></ul></li><li><p style=3D"padding:0p=
x;text-align:left;word-break:break-word"><span style=3D"font-size:12px">Org=
anizer: a short biographical sketch of the workshop organizer, describing r=
elevant experience and qualifications.</span></p></li><li><p style=3D"paddi=
ng:0px;text-align:left;word-break:break-word"><span style=3D"font-size:12px=
">Intended audience: description of the anticipated audience, including exp=
erience level and prerequisites, the expected number of participants to the=
 workshop and how the workshop organizer will call for participation.</span=
></p></li><li><p style=3D"padding:0px;text-align:left;word-break:break-word=
"><span style=3D"font-size:12px">Rough agenda: 1-page outline of the worksh=
op content describing the workshop dynamics, including tentative speakers, =
format (panels, call for extended abstracts, etc).</span></p><ul style=3D"l=
ist-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=3D=
"padding:0px;text-align:left;word-break:break-word"><span style=3D"font-siz=
e:12px">If the workshops consist of the selection &amp; publication of =E2=
=80=9Cextended abstracts=E2=80=9D (this is only a possibility):</span></p><=
ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><l=
i><p style=3D"padding:0px;text-align:left;word-break:break-word"><span styl=
e=3D"font-size:12px">Tentative dates</span></p></li><li><p style=3D"padding=
:0px;text-align:left;word-break:break-word"><span style=3D"font-size:12px">=
Review process=C2=A0</span></p></li><li><p style=3D"padding:0px;text-align:=
left;word-break:break-word"><span style=3D"font-size:12px">Publication oppo=
rtunities=C2=A0</span></p></li></ul></li></ul></li><li><p style=3D"padding:=
0px;text-align:left;word-break:break-word"><span style=3D"font-size:12px">I=
nfrastructure: Description of the infrastructure needed to carry out the wo=
rkshop.</span></p></li><li><p style=3D"padding:0px;text-align:left;word-bre=
ak:break-word"><span style=3D"font-size:12px">Statement from the organizers=
 willing to publish an extended abstract of the findings of the workshop (F=
inal version submission deadline July 28, 2024)</span></p></li><li><p style=
=3D"padding:0px;text-align:left;word-break:break-word"><span style=3D"font-=
size:12px">Maximum capacity of attendees=C2=A0</span></p></li><li><p style=
=3D"padding:0px;text-align:left;word-break:break-word"><span style=3D"font-=
size:12px">Other information: For instance, information that will let atten=
dees know more about your workshop.</span></p></li></ul></div></td></tr></t=
able></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2=
F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding=
-left:15px;padding-right:15px;padding-top:14px;text-align:center;width:100%=
;word-break:break-word"><table role=3D"none" border=3D"0" cellspacing=3D"0"=
 cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=3D"midd=
le" height=3D"52" style=3D"height:52px"><a href=3D"https://link.mail.beehii=
v.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mu_b5nHr6UwtK1UoRgJPAd=
wajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMsdzpOMwenjWNNfNBoPwLn738WYMq=
vKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXOXhPaMLi2dVHQPRWDgwgYYYXwbG2=
VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQAmGcG5wL9pMmw/h8/ujE_vns4kD--ivO2skQAUTk=
yprVHX5VwFc82BQqWwkU" rel=3D"noopener noreferrer nofollow" style=3D"color:#=
ffffff;font-size:18px;padding:0px 22px;text-decoration:none" target=3D"_bla=
nk" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp=
s://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mu=
_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMsdzpOMwe=
njWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXOXhPaMLi=
2dVHQPRWDgwgYYYXwbG2VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQAmGcG5wL9pMmw/h8/ujE=
_vns4kD--ivO2skQAUTkyprVHX5VwFc82BQqWwkU&amp;source=3Dgmail&amp;ust=3D17125=
31692341000&amp;usg=3DAOvVaw3EYh9i5RyCjxfA1UCm_c2c"> Read more </a></td></t=
r></table></td></tr></table></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0p=
x 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0"><tr><td width=3D"100%"><table role=3D"none" width=3D"1=
00%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"50%"=
 style=3D"vertical-align:top"><table role=3D"none" width=3D"100%" border=3D=
"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><span><b>Res=
ources provided by the SEED organizing committee:</b></span></p></td></tr><=
tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27px;pa=
dding-top:12px"><div style=3D"margin-left:0px"><ul style=3D"list-style-type=
:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=3D"padding:0px;t=
ext-align:left;word-break:break-word"><span>A link on the SEED website.</sp=
an></p></li><li><p style=3D"padding:0px;text-align:left;word-break:break-wo=
rd"><span>Management of registration for participants.</span></p></li><li><=
p style=3D"padding:0px;text-align:left;word-break:break-word"><span>Setup o=
f meeting space and related equipment.</span></p></li></ul></div></td></tr>=
</tbody></table></td><td width=3D"50%" style=3D"vertical-align:top"><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tbody><tr><td align=3D"left" style=3D"padding:0px 15px;text-align:left;=
word-break:break-word"><p><span><b>The workshop organizer must take care of=
 the following:</b></span></p></td></tr><tr><td style=3D"padding-bottom:12p=
x;padding-left:37px;padding-right:27px;padding-top:12px"><div style=3D"marg=
in-left:0px"><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0=
px 0px 0px"><li><p style=3D"padding:0px;text-align:left;word-break:break-wo=
rd"><span>Coordinating schedules and deadlines with the SEED organizing com=
mittee.</span></p></li><li><p style=3D"padding:0px;text-align:left;word-bre=
ak:break-word"><span>Provide a brief description of the workshop for inclus=
ion in the SEED website and the workshop program when it is final.=C2=A0</s=
pan></p></li></ul></div></td></tr></tbody></table></td></tr></table></td></=
tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=
=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><ta=
ble role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px=
;padding-left:15px;padding-right:15px;padding-top:14px;text-align:center;wi=
dth:100%;word-break:break-word"><table role=3D"none" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=
=3D"middle" height=3D"52" style=3D"height:52px"><a href=3D"https://link.mai=
l.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mu_b5nHr6UwtK1=
UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMsdzpOMwenjWNNfNBoPwL=
n738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXOXhPaMLi2dVHQPRWDgwg=
YYYXwbG2VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQAmGcG5wL9pMmw/h9/w85Yyg-ZYHLr0sk=
wI3rSv85s8j15PJUeQWCZbz2OWF8" rel=3D"noopener noreferrer nofollow" style=3D=
"color:#ffffff;font-size:18px;padding:0px 22px;text-decoration:none" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAk=
kAh3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjM=
sdzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zX=
OXhPaMLi2dVHQPRWDgwgYYYXwbG2VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQAmGcG5wL9pMm=
w/h9/w85Yyg-ZYHLr0skwI3rSv85s8j15PJUeQWCZbz2OWF8&amp;source=3Dgmail&amp;ust=
=3D1712531692341000&amp;usg=3DAOvVaw3kjHAQtvCn-lfzaCGqqsld"> Read more </a>=
</td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><ta=
ble role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#e8bec7;paddin=
g:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=
=3D"padding:0px 15px;text-align:center"><h2><span style=3D"color:#e8195a">I=
mportant dates</span></h2></td></tr></table></td></tr></table></td></tr><tr=
><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cel=
lpadding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#e8bec=
7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0"=
 cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top=
" style=3D"padding:0px 15px 0px"><table role=3D"none" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto"><tr><td align=3D=
"center" valign=3D"top" style=3D"width:567px"><img src=3D"https://ci6.googl=
eusercontent.com/proxy/APLZClwC8LImwPed5zVJQO0g54OysowGw-MquQNV99Lvj9Nru61d=
TirVQ-T5HI_K8NPu6HBXVGALzZPYH9gKXkXGJVyANAynkr18Ga5vanI-8EKdgldiULSo8Wmg-Vh=
I9569wZQQpvS4susJyYY6R-WRsCCoSPTNXCzj6F-gVmKbXVgluwh6M3i5wdOXJqTM76yATABdrc=
V68oJEgut5RjA_QY5tkFkttXVb1lG3phftnSZWAw_3M82S6-noq1YFx-N9MNNFRQZMmfB4xLQbX=
lOayHa_GRtnigNuZqoW=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/fi=
t=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/=
file/e0cd1559-3afa-4178-95fa-cf6bae4f034b/Schermata_2023-12-21_alle_00.06.1=
4.png?t=3D1703113598" alt=3D"" height=3D"auto" width=3D"567" style=3D"displ=
ay:block;width:100%" border=3D"0"></td></tr></table></td></tr></table></td>=
</tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#2466A1" styl=
e=3D"background-color:#2466a1;padding:20px 0px 30px 0px"><table role=3D"non=
e" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td =
align=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:bre=
ak-word"><p><span style=3D"color:rgb(255,255,255);font-size:14px"><b>Rememb=
er, your workshop proposal should be sent by e-mail=C2=A0</b></span><br><sp=
an style=3D"color:rgb(255,255,255);font-size:14px"><b>by February 2, 2024 t=
o =C2=A0</b></span><span style=3D"color:rgb(255,255,255);font-size:14px"><b=
><a href rel=3D"noopener noreferrer nofollow" data-email-masked>seed...@upv=
.es</a></b></span><span style=3D"color:rgb(255,255,255);font-size:14px"><b>=
.</b></span></p></td></tr></table></td></tr></table></td></tr><tr><td align=
=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word">=
<p></p></td></tr></table></td></tr><tr><td align=3D"center" valign=3D"top" =
bgcolor=3D"#438ac9" style=3D"padding:0px;border-bottom-left-radius:10px;bor=
der-bottom-right-radius:10px"><table role=3D"none" width=3D"100%" border=3D=
"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"c=
enter" valign=3D"top" bgcolor=3D"#fbbb16" style=3D"padding:12px"><table rol=
e=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" =
align=3D"center"><tr><td><span style=3D"padding-left:1px"></span></td><td a=
lign=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px"><a href=
=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19n_meO0wke5FKBz=
flRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDPCB6z8vhEMnt0zgr_0xSB8mCA7I4_IzXxUL0Bx=
vwowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0VoOTWsxhjeXzv6N0rcNwQKxEIDje94i_A07SYhb=
J8C0ZFIF9dinskejayF9qkVBe1yw/42u/ibow9buJQAmGcG5wL9pMmw/h10/Y7I64xGolG3fLVz=
rdBtmE4yHXZFBYZd9OBg7IndOLBU" style=3D"text-decoration:none" target=3D"_bla=
nk" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19n_me=
O0wke5FKBzflRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDPCB6z8vhEMnt0zgr_0xSB8mCA7I4=
_IzXxUL0BxvwowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0VoOTWsxhjeXzv6N0rcNwQKxEIDje9=
4i_A07SYhbJ8C0ZFIF9dinskejayF9qkVBe1yw/42u/ibow9buJQAmGcG5wL9pMmw/h10/Y7I64=
xGolG3fLVzrdBtmE4yHXZFBYZd9OBg7IndOLBU&amp;source=3Dgmail&amp;ust=3D1712531=
692341000&amp;usg=3DAOvVaw1_NkVmjJy-j20F_uTsML5X"><img width=3D"22" alt=3D"=
fb" border=3D"0" style=3D"display:block;max-width:22px" src=3D"https://ci3.=
googleusercontent.com/proxy/looCG2drRUo6hmiov-I-swidRfN8A8FNq5qLriBTnbGcqTP=
OJkvyT6TZ_Jzs0d-TRtx2fHbZRSKedgehIJVkoEvjI3MeY2cb-3cTlGt0LLSJbPY20xY7-cX3q9=
ILbl8rNP4vGlSP5rObzI8R60mXon0J3kXYXHQT1uo6yCBD2kyolYriDWf0pqKgC5l0v6zcqmQ=
=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,form=
at=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/facebook_light.png"=
></a></td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"widt=
h:75px"><a href=3D"https://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04BJ7-U5njE=
zF7ylz2nMaTnkJ55jYEaSNckuOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7GsnrP-q4=
7S7c_m5j7f7sIGH2rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTYe6_7kov3=
y2eSnWSpWd3zEBVTFR08EilFukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw1otlOjhtHH0B=
wXrfyhuOuT/42u/ibow9buJQAmGcG5wL9pMmw/h11/uJ3CvcUgm7C_BhFh4FglXAdT1zdoBnfgV=
eqFJbBvlU0" style=3D"text-decoration:none" target=3D"_blank" rel=3D"nofollo=
w" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps=
://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04BJ7-U5njEzF7ylz2nMaTnkJ55jYEaSNck=
uOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7GsnrP-q47S7c_m5j7f7sIGH2rNjuyYfA=
Vxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTYe6_7kov3y2eSnWSpWd3zEBVTFR08EilF=
ukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw1otlOjhtHH0BwXrfyhuOuT/42u/ibow9buJQ=
AmGcG5wL9pMmw/h11/uJ3CvcUgm7C_BhFh4FglXAdT1zdoBnfgVeqFJbBvlU0&amp;source=3D=
gmail&amp;ust=3D1712531692341000&amp;usg=3DAOvVaw3D36zRgs3tTmp9JFZi23NW"><i=
mg width=3D"22" alt=3D"tw" border=3D"0" style=3D"display:block;max-width:22=
px" src=3D"https://ci5.googleusercontent.com/proxy/d2OxJiy6rkjHXTyuWaYbViAg=
KeIRqCZNRYSTFZL-rRVYvWnjr8qblCw6Qlt6uWF5q3iV9RfDHavjQaJ84HMjsJOdfo61Vp3eWhE=
OLQGZ-TVpQlLEi2879-HsbEdqNTHOL9fYCQHtFgyRzQ0QvUNzt8D8w2LZEwDFmjgi8v_Yk8PdqG=
1dA09DGjfl9Q=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/fit=3Dsca=
le-down,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/x_light=
.png"></a></td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D=
"width:75px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0D=
uh6W19-oP22J3WocJyEIqlEBs30mdFwj7rvgg8GJtdPH65-M9mwqiG-vvmwaV9DVnHpUEAKtXBy=
iNzks-sZep-mXhtzqiiDFVl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZNcfrRDKc7G3t7Nqn0zn2al=
0tT8c5m5gwuznVQ3mwgGhRQyVl12AMLtNmy7K2GmITIAVvMQ/42u/ibow9buJQAmGcG5wL9pMmw=
/h12/fACMZps9rIC-pT5O2xwsChu8OOlCCy98bLtmnDSmTKI" style=3D"text-decoration:=
none" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://ww=
w.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7=
aZvovpc0Duh6W19-oP22J3WocJyEIqlEBs30mdFwj7rvgg8GJtdPH65-M9mwqiG-vvmwaV9DVnH=
pUEAKtXByiNzks-sZep-mXhtzqiiDFVl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZNcfrRDKc7G3t7=
Nqn0zn2al0tT8c5m5gwuznVQ3mwgGhRQyVl12AMLtNmy7K2GmITIAVvMQ/42u/ibow9buJQAmGc=
G5wL9pMmw/h12/fACMZps9rIC-pT5O2xwsChu8OOlCCy98bLtmnDSmTKI&amp;source=3Dgmai=
l&amp;ust=3D1712531692341000&amp;usg=3DAOvVaw3sLVxc8d7k5dL3j9DPXx5k"><img w=
idth=3D"22" alt=3D"ig" border=3D"0" style=3D"display:block;max-width:22px" =
src=3D"https://ci6.googleusercontent.com/proxy/ncVljHE2MlvyX3_06exSOuyJ7dqS=
xK4uq6haZsxOq4P0sIsV6DYpFHgU_V9j2icThb-t590R4GzlWHM47Pob7YA5-mkVyCeQh6TM7AY=
OJ8NFc2gXlBonIv_rahJwz2uWSyHnmq4ZBZx1XRoY3O9fe9ixPwdYpXC51EoZeG3jIpc6XzDOtM=
dRLOXf6PXEf9GFCcAWCw=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/f=
it=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets=
/instagram_light.png"></a></td><td align=3D"center" valign=3D"middle" width=
=3D"75" style=3D"width:75px"><a href=3D"https://link.mail.beehiiv.com/ss/c/=
9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrPSmgGRK74cEOs7Myre-gzzHjUdIlLDmhYyvXDVW=
6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_XH4o1UZo-t6INhxP3gdAhU4tjDhIlBnadN3kC8A=
wlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiDdaEEgsOwVa1zg_SE0Bn8HtKsKxIKceN_E4nFm3=
CoWu43hj4c/42u/ibow9buJQAmGcG5wL9pMmw/h13/MXrSLskRUYZvCMFoMCl3Jrg2Heu7KNQkj=
dyqED-EZNI" style=3D"text-decoration:none" target=3D"_blank" rel=3D"nofollo=
w" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps=
://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrPSmgGRK74=
cEOs7Myre-gzzHjUdIlLDmhYyvXDVW6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_XH4o1UZo-=
t6INhxP3gdAhU4tjDhIlBnadN3kC8Awlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiDdaEEgsOw=
Va1zg_SE0Bn8HtKsKxIKceN_E4nFm3CoWu43hj4c/42u/ibow9buJQAmGcG5wL9pMmw/h13/MXr=
SLskRUYZvCMFoMCl3Jrg2Heu7KNQkjdyqED-EZNI&amp;source=3Dgmail&amp;ust=3D17125=
31692341000&amp;usg=3DAOvVaw2zIE2uY8UJ4RfUsPHjpbLD"><img width=3D"22" alt=
=3D"in" border=3D"0" style=3D"display:block;max-width:22px" src=3D"https://=
ci3.googleusercontent.com/proxy/OzNCKx3Bazr_ZUuv0pJsGRqeBCVFV60eWZIONRUC8MM=
E5_H-4NZRImT5qKJGKnPG1K2lt_SwA5QCA38e9Ih_TAl3XWriojILMgo9NhZiAR24U7Vimj9_oE=
Fi8ycCfbNoGOVIT41krJ1vroIMk1mQagCK6wK8IOtReGERi-gOhaIlNDJp0AhVRyZk1oHH9BsW6=
3Q=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,fo=
rmat=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/linkedin_light.pn=
g"></a></td><td><span style=3D"padding-left:1px"></span></td></tr></table><=
/td></tr><tr><td height=3D"10" style=3D"line-height:1px;font-size:1px;heigh=
t:10px"> =C2=A0 </td></tr><tr><td align=3D"center" valign=3D"top" style=3D"=
padding:15px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=
=3D"top"><p style=3D"font-family:&#39;Arial&#39;,Helvetica,sans-serif;color=
:#ffffff!important"> Update your email preferences or unsubscribe <a href=
=3D"https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24Qq=
Cn-b19AhOZMy-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW-=
E9LTlRWORMLctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaBfLnYqeodhnbcd4V=
V76uSihRdPCouOfCc_FthWzKIZ0rTHCd3dHlAlWxuv2Ovn8U9ikEb1843pZUyDX9qFYkhg-7OmY=
zWeBEoZO2T08Io6NCrr6jaUZ2irAM53qa6Nj3vVVz4xT7Fbmas44KhqqG10p-m5schHT5ba55Uv=
fW-bJUX6rpypjFYp2Qi5abbnRa49WdGiib1EV7x8pl82y-YyZux1DvgBeVtDIwvssavHCQJ1eQi=
CBlwwmYTtu3kDfXJeEU8MHKdeAoTxoW1tK3RjqJaPpzTQGmCJ4u_w1jSv25CgRX57jUk8mVNuC5=
fIgDETTun3MzXByT7x3dyYU04ppxpTwQMsELemxjF7w8QMwXU0oN-Kmf2EA2CMQiUilpUtRcQfw=
59SBqC_-CIIlRYbLR0h3aKTlCAEKWKfi3U2G3eYXWebPoximTUhmgHWKpR5-6wdrAVojVpZ3GTt=
XzS0thChANM_LiFwB2s5I_47oeDlWp2fRhEWyNxNJP3sVmW0YDzEhVH8YLfmXnmMQcj0S8I-ZnV=
hp9Ja0xNb7I5C6w/42u/ibow9buJQAmGcG5wL9pMmw/h14/33SAIN5fiWmKrix4fPsGqnmGOQin=
TAymCBWHPyw0Pbw" style=3D"text-decoration:underline;text-decoration-color:#=
ffffff!important;color:#ffffff!important" target=3D"_blank" rel=3D"nofollow=
" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:=
//link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b19AhOZ=
My-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW-E9LTlRWORM=
LctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaBfLnYqeodhnbcd4VV76uSihRdP=
CouOfCc_FthWzKIZ0rTHCd3dHlAlWxuv2Ovn8U9ikEb1843pZUyDX9qFYkhg-7OmYzWeBEoZO2T=
08Io6NCrr6jaUZ2irAM53qa6Nj3vVVz4xT7Fbmas44KhqqG10p-m5schHT5ba55UvfW-bJUX6rp=
ypjFYp2Qi5abbnRa49WdGiib1EV7x8pl82y-YyZux1DvgBeVtDIwvssavHCQJ1eQiCBlwwmYTtu=
3kDfXJeEU8MHKdeAoTxoW1tK3RjqJaPpzTQGmCJ4u_w1jSv25CgRX57jUk8mVNuC5fIgDETTun3=
MzXByT7x3dyYU04ppxpTwQMsELemxjF7w8QMwXU0oN-Kmf2EA2CMQiUilpUtRcQfw59SBqC_-CI=
IlRYbLR0h3aKTlCAEKWKfi3U2G3eYXWebPoximTUhmgHWKpR5-6wdrAVojVpZ3GTtXzS0thChAN=
M_LiFwB2s5I_47oeDlWp2fRhEWyNxNJP3sVmW0YDzEhVH8YLfmXnmMQcj0S8I-ZnVhp9Ja0xNb7=
I5C6w/42u/ibow9buJQAmGcG5wL9pMmw/h14/33SAIN5fiWmKrix4fPsGqnmGOQinTAymCBWHPy=
w0Pbw&amp;source=3Dgmail&amp;ust=3D1712531692341000&amp;usg=3DAOvVaw2vOKjsa=
6S92N-fAFpotF7b"> here</a></p><p style=3D"font-family:&#39;Arial&#39;,Helve=
tica,sans-serif;color:#ffffff!important"> =C2=A9 2024 SEED Conference 2024 =
- Valencia </p><p style=3D"font-family:&#39;Arial&#39;,Helvetica,sans-serif=
;color:#ffffff!important"> Universitat Polit=C3=A8cnica de Val=C3=A8ncia Ca=
mino de Vera<br>Valencia, Comunidad Valenciana 46022 , Spain </p></td></tr>=
<tr style=3D"display:table-row!important"><td align=3D"center" valign=3D"to=
p" style=3D"padding-top:20px" style=3D"display:table-cell!important"><table=
 role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"ce=
nter" style=3D"display:table!important"><tr style=3D"display:table-row!impo=
rtant"><td align=3D"center" valign=3D"middle" height=3D"32" style=3D"height=
:32px;display:table-cell!important;max-height:32px!important;margin:0px!imp=
ortant"><a style=3D"line-height:32px!important;text-decoration:none;display=
:block!important" href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc=
0Duh6W13i1JVnHfTV-osXzaRbZV7_Rl1FzZwiJSW4hY_gEewf3rHZ8vMB9N1-EDL0J1hWTJlRr3=
ZPAcJEE1ZqFrnAbXEEpPPjAt6cG2zwjJfWuXKD5FBYaluY5OnLqrQEL2k5h3TIeMukXbdNoR9iQ=
yQGDCzGSRAfAnwcdKQilI4J-0y3SnDLGNfRdlTxBxBl0r8iq5w/42u/ibow9buJQAmGcG5wL9pM=
mw/h15/l-GF9tbvH2q4QM6Kcn8fznzZSPcwyP3DM59HCQRso6Y" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W13i1JVnHfTV-os=
XzaRbZV7_Rl1FzZwiJSW4hY_gEewf3rHZ8vMB9N1-EDL0J1hWTJlRr3ZPAcJEE1ZqFrnAbXEEpP=
PjAt6cG2zwjJfWuXKD5FBYaluY5OnLqrQEL2k5h3TIeMukXbdNoR9iQyQGDCzGSRAfAnwcdKQil=
I4J-0y3SnDLGNfRdlTxBxBl0r8iq5w/42u/ibow9buJQAmGcG5wL9pMmw/h15/l-GF9tbvH2q4Q=
M6Kcn8fznzZSPcwyP3DM59HCQRso6Y&amp;source=3Dgmail&amp;ust=3D171253169234200=
0&amp;usg=3DAOvVaw17swIcuPcbO48lJRivdZPd"><img src=3D"https://ci5.googleuse=
rcontent.com/proxy/OLeF5xMC4y0QYdC7W74kbBDlqs1uJk0Ys8kRIVzFpnzs1w7k3XOb4Zyz=
Lh3ttd3PStTuutrXop17p2NkrAgNXyYgk4cAWQ=3Ds0-d-e1-ft#https://media.beehiiv.c=
om/output-onlinepngtools.png" width=3D"16" alt=3D"beehiiv logo" style=3D"di=
splay:inline-block!important;max-width:16px!important;vertical-align:-3px!i=
mportant;width:16px!important" border=3D"0"><span style=3D"padding-left:11p=
x!important;display:inline-block!important">Powered by beehiiv</span></a></=
td></tr></table></td></tr></table></td></tr></table></td></tr></table></td>=
</tr></table></td></tr></table></td></tr></table></div></div></blockquote><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/023178c1-08db-448c-a0df-eff47f1fb2d5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/023178c1-08db-448c-a0df-eff47f1fb2d5n%40googlegroups.co=
m</a>.<br />

------=_Part_134793_1205237941.1712445321363--

------=_Part_134792_1311025711.1712445321363--
