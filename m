Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBMVO4GYAMGQESSGGYMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8660C8A20F0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 23:33:40 +0200 (CEST)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-61561dbdf14sf16436087b3.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712871219; x=1713476019; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=verW6xNdy0Hxsop6oRByM6vcOcw0bmZZgAD6DQiZN98=;
        b=qz6YR9PSPi5UOh9Cmt8EKtX5EGZk3xIAjv/Ujb93a0UBqcgijw8mFAFIaqKCd9WsmQ
         Qmnxq0T301kMqwXoRIGUV/RzzXS0n/IvW4VhM7aPYBZeBHVdeGaih7mLMZD/0VJcZCKU
         e3uAFAGTMEiC050b49AG/B3M2n2wFzXdTY0+di+zDnI4W8XgxVsW2llKzC4JeM1QkjXZ
         NQnCPWJlJh86Mn8EZZVR6+TZINlZ6f+bA9hQjzlvieTWa/+NuAqX+XBB0IuEQkqlEtBj
         KEqJyHsCwx/Q9gbFl897yUOB6uQ5KfTjZ4l3QfL5eMZeXczssFL8jYNgN9SoavyE33JD
         A3pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712871219; x=1713476019; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=verW6xNdy0Hxsop6oRByM6vcOcw0bmZZgAD6DQiZN98=;
        b=mdSjfEomvA1AedZzkuXghMLkQTlSRSHU15IprD97uilXBB2HmDn0huAqQEBOaqWpbx
         8wdIHyGv7BVq7cvvkLdnWZCCbsds7vJqzH4nDSooN+/19IfMO3oMX8qX56d7i2sxtIai
         Y2E9bW8+jkYfIieYvnVQjvC0/3Q4z3mANiKV52tDr+/oZ3Cd5FjXXBqvkL/+1E763Y8T
         fR905pYsV9AlmmOjFzEcL/G43bFKp6g8iGGa5WUwszPV81sNWKv0oIiKXQjPtZsfNQbM
         mk2l9VBrhUAOwTFTwvNgqYmpXNS8dodH7frbclcQGlpDaLYFnMgGPQXmnOhKst2y/LNN
         oMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871219; x=1713476019;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=verW6xNdy0Hxsop6oRByM6vcOcw0bmZZgAD6DQiZN98=;
        b=RrqW0bAgoXgPny9v2tpyVh4yoHTi4mUK4QY4W9hBSm6lKagB9ARBUYD/dAmkgNNEEi
         RNNMXgY97o2gaX3W2U3Bol05e7F1yiPzxajAHuoxvuqD39dIt4JE6OuLf/qTVXRVxJsL
         brjtEnfnnr5NKViF/aX9IydxZzKucY+kqz3Wvqez0g+mkI4tdIqdt9SPFaEcKpEL6hRo
         XKXh7GnZ+VMED85NySb3uBHoZhkiAf9ldY4B+MGx0ufTEmgOqFRqGX92ppiHj8ABW9UC
         mp9brDvMxhtf+XpByCtkJQKjZ0kvK+DTT2GtIs12VrZddk+pM8XAYN+KCOTxtZ+rQm9j
         Je4Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWWITtMHrhK0+F4buP2yFvboNgmqi6mOngPfpHjgI61qeYz6iIy0kY0xq1xPH12xRMEdBSnAek1Sl/qmUaT7NmP9HAHZL8gQpe+YUA=
X-Gm-Message-State: AOJu0Yx5JF6XPVkSyf43RO8M4zQDvidwbeC5kiYVw77uxPBfvQ5ZIP0s
	httKxknhPLrpdVLBIx2LZiHtaQLGtLH01iadzOCr4GtUqeuEdo0S
X-Google-Smtp-Source: AGHT+IEjKIkQMHJLBDCmlh5lOAOs5fi6fsl6jAh6ufWQ57A1TMq1657RIjS14o6ApUulWjfWKKZNtg==
X-Received: by 2002:a25:9c05:0:b0:dc2:3a05:489 with SMTP id c5-20020a259c05000000b00dc23a050489mr885103ybo.14.1712871219117;
        Thu, 11 Apr 2024 14:33:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d055:0:b0:dc7:4363:dc02 with SMTP id h82-20020a25d055000000b00dc74363dc02ls193416ybg.1.-pod-prod-06-us;
 Thu, 11 Apr 2024 14:33:37 -0700 (PDT)
X-Received: by 2002:a0d:cb8d:0:b0:615:2db0:fcb2 with SMTP id n135-20020a0dcb8d000000b006152db0fcb2mr170312ywd.2.1712871217245;
        Thu, 11 Apr 2024 14:33:37 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:33:36 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <da29a17c-dd06-49ec-abc5-10195f7e6c36n@googlegroups.com>
In-Reply-To: <hyxbG2epT4CDc5XYdEJ_2A@geopod-ismtpd-5>
References: <hyxbG2epT4CDc5XYdEJ_2A@geopod-ismtpd-5>
Subject: Re: Registration is open - SEED '24 Valencia
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_208422_96191948.1712871216536"
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

------=_Part_208422_96191948.1712871216536
Content-Type: multipart/alternative; 
	boundary="----=_Part_208423_80311252.1712871216536"

------=_Part_208423_80311252.1712871216536
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

On Wednesday, December 27, 2023 at 1:03:50=E2=80=AFPM UTC+1 SEED Conference=
 wrote:

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
> December 27, 2023   |   Read Online=20
> <https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqC=
n-b19AhOZMy-FPVkE1ycemZtXW-9C7Q4vE4f0CuzEXfxCeiYGiyAci8qD341MzbSrmr9jqa0RbL=
Z80afmuz_k2CPsmtiFgtTYLS3_CMWQlJVNZlVIu9rC92H6qweZCAh1ZyOqcDQhvi2hplol5V4He=
30jt0_jXcKQlYXUqJyAcmHDh3uRkrlkYwtqPbqNeaWFVeYfg0rKznUtwakl0fjd2q3l2viOAUvs=
JjNuebVqkLAahSq73xe60NfQMtvM6fjiUDkPj4055URDvpWFIeiZ-5Fa55ApLqW5B8xAR_dKhd8=
LXpk8HkBWFGmsl3xpFD3FR-ITfuRBZyfRHtLKYRJZvRbJMGguWltPbgwbGcdh2iSf-j9MJNtCkT=
GhyO9eKLvX0ZCYqjuCrfktyI6U2AD4iraAbZETJZRjFcshZefBlC2qzImIABXkALVulME76suXK=
MLsllOXFxO1V4feOB9kloi-_eI-bnybeB04KNh8wtw6FptClaOyhS0C5-zBvsMuxM4dVgxxlyP9=
ubKj53yHJiPIkqNOAOHeAsZq3l0eRZ75JhaMlrSHJfAjKe7V_vHi3-EXdxgJWaO7GWZmWLNrbfI=
xZhzgkDdgvjwRxRnOchga2j-E3uobAiQ4-0aOwEwuREHbc/42h/Ha9tzqlrT_y1ujgoMl3Efw/h=
0/Uhg2161UcTBkp7bnxdNnr1-txPnwE77YtPhq2fIbaAI>
>
>
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9m5MmJ5O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrO=
LnvxKY8J9vW8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY2a7NlqtUMgi5Qe-3B=
QvzJR9qfXW-DPxUQzbsM7TsF9Iw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h1/d2i2o6gJ600BkOXku=
xBSGonWTXF4AL75bz-1DkpCAfU>
> International Conference on Sustainable Energy Education
> July 3 - 5, 2024. Valencia, Spain
> Visit seedconference.eu=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9m5MmJ5O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrO=
LnvxKY8J9vW8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY2a7NlqtUMgi5Qe-3B=
QvzJR9qfXW-DPxUQzbsM7TsF9Iw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h2/bdMK4ie4l5pXpoz_F=
7pgPF7b9kveTt8Av19oD1yHWvE>
>
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9koN2XpmVENK4uKEKAKwZBSipGt4Rp3uhCJ84A0kbO5bLub9USqpFMOCs2C1JVetpG8y-Pd=
pbIgnAb_cWMkk_iPCn5kXSkrKgTF3qNWmODWsfg3Pm3weyh7TgLMj1uTy_mSBi8eQM_MyPpQ3PZ=
eNs_l1TpgfJUSgxHlDQK1LQ4pEw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h3/_EBRC484sEYrFcZIC=
zWq8G6VhHI5cn2YatXGzERaLN4>
>
> *We wish you Happy holidays!!*
> In this newsletter:
>
> Click on the section below to read more:
>
> *Call for Papers*
> Scope <#m_-2649755528240230986_scope>
> Topics of interest <#m_-2649755528240230986_topicsofinterest>
> Important dates <#m_-2649755528240230986_importantdates>
> Publications and Awards <#m_-2649755528240230986_publicationsaward>
> Submission guidelines <#m_-2649755528240230986_submissionguidelines>
>
> *Call for Workshops*
> Review criteria <#m_-2649755528240230986_reviewcriteria>
> Proposals guidelines <#m_-2649755528240230986_proposalguidelines>
> Important dates <#m_-2649755528240230986_importantdates-2>
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
wMq89l9FOdmTAaFsHnRbE7GCPfr9pvjw4_EWAxa4z8syUWNI/42h/Ha9tzqlrT_y1ujgoMl3Efw=
/h4/Y0m1WBct79Dwhes-2fW8xPG7Trmu4oJ5kNp5kqe2AcY>
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
K8XN5Xj77Ud-QW0HcndzQcbIt6XNlg-J644kUZiGKSPGxIDgEFZWiE7x3Sm6otqbwKp2NQb3It6=
BaHRE-xNPBOG7_rQ/42h/Ha9tzqlrT_y1ujgoMl3Efw/h5/gSWOP3qib4IgTxtvKrLKkydOPbvr=
PRxevHkj4PL7y8g>
>
> Submissions must be between 4 and 9 pages (A4 size), including 1 title=20
> page + 8 pages with the main text, figures, tables, and references.=20
> Submissions imply the willingness of at least one author to register,=20
> attend the conference, and present their contribution.
> Read more=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkk=
Ah3L9kRwuR9B71gtRmZkiE5Fb7FmfI9tMAhBptscSO1xOBx4y-tDRBQCzrpIL5Cxo7XQaDKGwnF=
Yn_ofnW7CPeLYoUtKxTOptnEJrObdN-4rO8hr8fyyWTpeOhfWoPjUs7pF1SMPhUt6aNZv3t7fD_=
Hlj_DWD8kYPU2p2ySiCq5a0rBRg/42h/Ha9tzqlrT_y1ujgoMl3Efw/h6/rI9jZFKdBT6J5f39q=
iGp9m5FCaT4kmDZPtpyf5upWRE>
>
> SEED is using the EasyChair platform to manage the submissions. The=20
> submission website is *EASY CHAIR SEED 2024*
> Submit on Easy Chair Platform=20
> <https://link.mail.beehiiv.com/ss/c/mI7BQRoctVTIGHO43x85D0IyYHUvJ7fPUgDzn=
ev73L38PDgyfgzkQmM_MHGbRoyseYIC3OXxrejG_W2du5Evlp7IQT5bKjw35eZASG0VFoLYeuXe=
KuFnOQHdf48fth9QuRCLMi0p53qHr4-hjAQjhaOQe_fhCke2xMUDDU3msmn7P95v3YnXJr8H7Dq=
CFNW0wmzOYiWfK1Q-qylAMpi1UlGmv6gG0YuxkEbTFRLLS8s/42h/Ha9tzqlrT_y1ujgoMl3Efw=
/h7/VfNtariB27D94sA3pSH0F9257ryEJLqmVF8eXMXlHLk>
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
XhPaMKn4xjJjWjdJTcBwlk6HYiP7pTXbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujgoMl3Efw=
/h8/BraEJ2jcwRzFdiKdAtFIOhFl_uDH9SoXgJdtg1vwWRM>
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
XhPaMKn4xjJjWjdJTcBwlk6HYiP7pTXbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujgoMl3Efw=
/h9/eYXXDA9oDthiEk5ukIX9RJCHhQJ_5rg6oMx8k_Tu0no>
> Important dates
>
> *Remember, your workshop proposal should be sent by e-mail *
> *by February 2, 2024 to  **seed...@upv.es**.*
>
> [image: fb]=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19n_meO0wke5FKBzf=
lRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDPCB6z8vhEMnt0zgr_0xSB8mCA7I4_IzXxUL0Bxv=
wowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0VoOTWsxhjeXzv6N0rcNwQKxEIDje94i_A07SYhbJ=
8C0ZF74_XYJ0jFb7h8TJGH6XgwQ/42h/Ha9tzqlrT_y1ujgoMl3Efw/h10/qZaD6gSE1PMs4sPB=
SfFDetqcOx9V1Ar6KGTz_JcSnKE> [image:=20
> tw]=20
> <https://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04BJ7-U5njEzF7ylz2nMaTnkJ55=
jYEaSNckuOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7GsnrP-q47S7c_m5j7f7sIGH2=
rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTYe6_7kov3y2eSnWSpWd3zEBVT=
FR08EilFukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw1iKQ0z7uxVVj9Qumfs95Mo/42h/H=
a9tzqlrT_y1ujgoMl3Efw/h11/DaD2mH3am6UPBCCYFzd6uvtt_EHC_eZA44ncLbGk65s> [ima=
ge:=20
> ig]=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19-oP22J3WocJyEIq=
lEBs30mdFwj7rvgg8GJtdPH65-M9mwqiG-vvmwaV9DVnHpUEAKtXByiNzks-sZep-mXhtzqiiDF=
Vl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZNcfrRDKc7G3t7Nqn0zn2al0tT8c5m5gwuznVQ3mwgGh=
RQyVlvNgi3cnUiSQSrGkQoCrNdg/42h/Ha9tzqlrT_y1ujgoMl3Efw/h12/psAEIDYbcOfc0lqj=
dx2eHe24_BHWhD5zPQmqunVZTpM> [image:=20
> in]=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrP=
SmgGRK74cEOs7Myre-gzzHjUdIlLDmhYyvXDVW6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_X=
H4o1UZo-t6INhxP3gdAhU4tjDhIlBnadN3kC8Awlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiD=
daEEgbfXmS6FC5vi4hd2XakUR_db9MoI6dg2EhOKV9wTakwI/42h/Ha9tzqlrT_y1ujgoMl3Efw=
/h13/eISlMMfB5aEejlSkFkFCtCyxSB9nJLu6DxMX2HCHbW4>=20
>  =20
>
> Update your email preferences or unsubscribe here=20
> <https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqC=
n-b19AhOZMy-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW-E=
9LTlRWORMLctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaAmfJVNSPeUtAlSEOB=
tutc9nCYFbIBUStCsKNv2sTEMoawWbx1iwH3iXq_r9j-Zglgv7qTGFbFHVKcQXvBs_GbVgIjeSo=
oageTjl9yWcXxU3ZulcX5i5CiwKeIhs7Kt1NrT0s5Ae43KdM4wjMSjdHRHXVHY478-NpXAsbObj=
fpela-4ww24kpCC1ejo0FVn4IjIKXf8PToOwtpP7CfhcvSejKUfAb90W46AqQg4_PwoVxsv8Pgn=
EzLb_EYupeWNDszU4KGquwCQogpnvzrsyyh4JGKJJraskA9V8ZRqZfPJOv7cbZeQ-SmYKhas29s=
D6lKLTHmtmQeZsNSK2-jjx5vt8h5GT6oW4wFnjypUM-lS7U-CD8WaO-JZIwn1Z2JIC5jCTBm5OC=
oQWvL43NL7wZNWWYuyaRduZs-40DBxueYaGWaOao-offum9afDfw-nCpbrpm4NKD0wVHvZFv4_p=
H-GVYAG2l3G_Z3iAg5K1YPtdDB0_qlVuzZM7MgPz3e2DtKyEpCA4twgHsMWGVsFlwf0mME95y4Y=
1qCfg7zxabDfZA/42h/Ha9tzqlrT_y1ujgoMl3Efw/h14/btQIAzGnFeDme0DVDCa2kf6yGxHpx=
BevklbSJfrNGFM>
>
> =C2=A9 2023 SEED Conference 2024 - Valencia=20
>
> Universitat Polit=C3=A8cnica de Val=C3=A8ncia Camino de Vera
> Valencia, Comunidad Valenciana 46022 , Spain=20
> [image: beehiiv logo]Powered by beehiiv=20
> <https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W13i1JVnHfTV-osXza=
RbZV78wksJE9mGGPgwzX9IN3t4wezuL8pjHQ42uJK6JFvSArMCfZE29DNdTfJ9DZQCdXJGioNN2=
c8fkZGAINvwDFm_ZdFwmj_g7aDfhW4WkPqFlEFJIxU08p112LW7ho0niwgI1M_m8mlqbZpekZYe=
bQSpig2JF_FyBB6jDL2ALlkz4Pw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h15/_Bq89SskEBq8UdGd=
X1ebLuv_jCxgaCO0O9UNrb2PD5E>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/da29a17c-dd06-49ec-abc5-10195f7e6c36n%40googlegroups.com.

------=_Part_208423_80311252.1712871216536
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
 Wednesday, December 27, 2023 at 1:03:50=E2=80=AFPM UTC+1 SEED Conference w=
rote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><u></u>=
<div style=3D"margin:0px auto;padding:0px;word-wrap:normal;word-spacing:nor=
mal;background-color:#f5f5f5"><div role=3D"article" aria-label=3D"email_nam=
e" lang=3D"en" style=3D"font-size:1rem"><div style=3D"display:none;max-heig=
ht:0px;overflow:hidden"> International Conference on Sustainable Energy Edu=
cation =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C </div><table role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" align=3D"center" cellpadding=3D"0"><tr><td align=3D"center" valign=
=3D"top"><table role=3D"none" width=3D"670" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0" style=3D"width:670px;table-layout:fixed"><tr><td align=3D=
"center" valign=3D"top" style=3D"padding:10px 5px 10px 5px"><table role=3D"=
none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=
=3D"center"><tr><td align=3D"center" valign=3D"top" style=3D"border:0px sol=
id #ffffff;border-radius:10px;background-color:#ffffff"><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"=
center"><tr><td align=3D"right" valign=3D"top" style=3D"padding:20px 15px">=
<p> December 27, 2023 =C2=A0 | =C2=A0 <a href=3D"https://link.mail.beehiiv.=
com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-9C=
7Q4vE4f0CuzEXfxCeiYGiyAci8qD341MzbSrmr9jqa0RbLZ80afmuz_k2CPsmtiFgtTYLS3_CMW=
QlJVNZlVIu9rC92H6qweZCAh1ZyOqcDQhvi2hplol5V4He30jt0_jXcKQlYXUqJyAcmHDh3uRkr=
lkYwtqPbqNeaWFVeYfg0rKznUtwakl0fjd2q3l2viOAUvsJjNuebVqkLAahSq73xe60NfQMtvM6=
fjiUDkPj4055URDvpWFIeiZ-5Fa55ApLqW5B8xAR_dKhd8LXpk8HkBWFGmsl3xpFD3FR-ITfuRB=
ZyfRHtLKYRJZvRbJMGguWltPbgwbGcdh2iSf-j9MJNtCkTGhyO9eKLvX0ZCYqjuCrfktyI6U2AD=
4iraAbZETJZRjFcshZefBlC2qzImIABXkALVulME76suXKMLsllOXFxO1V4feOB9kloi-_eI-bn=
ybeB04KNh8wtw6FptClaOyhS0C5-zBvsMuxM4dVgxxlyP9ubKj53yHJiPIkqNOAOHeAsZq3l0eR=
Z75JhaMlrSHJfAjKe7V_vHi3-EXdxgJWaO7GWZmWLNrbfIxZhzgkDdgvjwRxRnOchga2j-E3uob=
AiQ4-0aOwEwuREHbc/42h/Ha9tzqlrT_y1ujgoMl3Efw/h0/Uhg2161UcTBkp7bnxdNnr1-txPn=
wE77YtPhq2fIbaAI" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.co=
m/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-9C7Q=
4vE4f0CuzEXfxCeiYGiyAci8qD341MzbSrmr9jqa0RbLZ80afmuz_k2CPsmtiFgtTYLS3_CMWQl=
JVNZlVIu9rC92H6qweZCAh1ZyOqcDQhvi2hplol5V4He30jt0_jXcKQlYXUqJyAcmHDh3uRkrlk=
YwtqPbqNeaWFVeYfg0rKznUtwakl0fjd2q3l2viOAUvsJjNuebVqkLAahSq73xe60NfQMtvM6fj=
iUDkPj4055URDvpWFIeiZ-5Fa55ApLqW5B8xAR_dKhd8LXpk8HkBWFGmsl3xpFD3FR-ITfuRBZy=
fRHtLKYRJZvRbJMGguWltPbgwbGcdh2iSf-j9MJNtCkTGhyO9eKLvX0ZCYqjuCrfktyI6U2AD4i=
raAbZETJZRjFcshZefBlC2qzImIABXkALVulME76suXKMLsllOXFxO1V4feOB9kloi-_eI-bnyb=
eB04KNh8wtw6FptClaOyhS0C5-zBvsMuxM4dVgxxlyP9ubKj53yHJiPIkqNOAOHeAsZq3l0eRZ7=
5JhaMlrSHJfAjKe7V_vHi3-EXdxgJWaO7GWZmWLNrbfIxZhzgkDdgvjwRxRnOchga2j-E3uobAi=
Q4-0aOwEwuREHbc/42h/Ha9tzqlrT_y1ujgoMl3Efw/h0/Uhg2161UcTBkp7bnxdNnr1-txPnwE=
77YtPhq2fIbaAI&amp;source=3Dgmail&amp;ust=3D1712957600235000&amp;usg=3DAOvV=
aw2ZVGSEwghTVAbCW-Ae4JeC">Read Online</a></p></td></tr><tr><td style=3D"hei=
ght:0px;width:0px"><div style=3D"min-height:1px"> <img src=3D"https://ci6.g=
oogleusercontent.com/proxy/heQtKm07eewVCOpxXVoBFTsaWsg68Oo8LLq9bwrALd-Kw_yF=
22RiFTwXcySCmtWaN9BEjDprHoZlLQZAu13Qt7Y0YUpwrLGWoMq1BHtzghLE1E-A5M9opv1tX3Y=
_BJ4aWdr21YT6aHaKVjROpHE=3Ds0-d-e1-ft#https://link.mail.beehiiv.com/ss/o/hZ=
_JlIqIIa_woP0TRrumGA/42h/Ha9tzqlrT_y1ujgoMl3Efw/ho.gif" alt=3D"" width=3D"1=
" height=3D"1" border=3D"0" style=3D"min-height:1px!important;width:1px!imp=
ortant;border-width:0!important;margin-top:0!important;margin-bottom:0!impo=
rtant;margin-right:0!important;margin-left:0!important;padding-top:0!import=
ant;padding-bottom:0!important;padding-right:0!important;padding-left:0!imp=
ortant"> </div></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"p=
adding-bottom:15px"><table role=3D"none" width=3D"100%" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" sty=
le=3D"padding:0px 15px;text-align:center;word-break:break-word"><p></p></td=
></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px 0px=
"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" sty=
le=3D"margin:0 auto 0 auto"><tr><td align=3D"center" valign=3D"top" style=
=3D"width:252px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvov=
pc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1=
Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4p=
qcTb3SIY2a7NlqtUMgi5Qe-3BQvzJR9qfXW-DPxUQzbsM7TsF9Iw/42h/Ha9tzqlrT_y1ujgoMl=
3Efw/h1/d2i2o6gJ600BkOXkuxBSGonWTXF4AL75bz-1DkpCAfU" rel=3D"noopener norefe=
rrer nofollow" style=3D"text-decoration:none" target=3D"_blank" data-safere=
directurl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.b=
eehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9RK=
u4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alofQ=
GTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY2a7NlqtUMgi5Qe-3BQvzJR9qfXW-DPxUQzbsM7T=
sF9Iw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h1/d2i2o6gJ600BkOXkuxBSGonWTXF4AL75bz-1Dkp=
CAfU&amp;source=3Dgmail&amp;ust=3D1712957600235000&amp;usg=3DAOvVaw3BNvXEqf=
tv3TPl-Z-jjrkM"><img src=3D"https://ci6.googleusercontent.com/proxy/oqBcKxv=
BpwLSmPKPx7LNcmISabh-7JXELRcovHv3NAUP9Orn2z4deJZB95fkATisG2EnQLmbDSGmMUYd-x=
f4ZBi1-1c6enqth8JarLYm0noONqy3-RSElVO6bbjhn2Wac1bsxrG-bptDT6Ak_-JHoFzsqkX3I=
_1026VmadDoGncH-KJHkkvVobUP0YwvkcHHEVuel1wDP15biBRKOXK96hmPeZKAnZCwQXa0AyvA=
Rd08ul3FF0P-Jhcr-wqCvz4iRebkTIg4TWol3vqkg27DOAe95ds=3Ds0-d-e1-ft#https://me=
dia.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredi=
rect,quality=3D80/uploads/asset/file/dcbc0422-e91e-4be2-9044-0744bbc94e07/6=
543f3704bcc1407f3339baf.png?t=3D1702884418" alt=3D"" height=3D"auto" width=
=3D"252" style=3D"display:block;width:100%" border=3D"0"></a></td></tr></ta=
ble></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px =
15px;text-align:center"><h1><span style=3D"color:rgb(232,25,90);font-family=
:Arial;font-size:36px">International Conference on Sustainable Energy Educa=
tion</span></h1></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"=
padding:0px 15px;text-align:center"><h3><span style=3D"color:rgb(67,138,201=
);font-family:Arial;font-size:24px">July 3 - 5, 2024. Valencia, Spain</span=
></h3></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bo=
ttom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-align:=
center;width:100%;word-break:break-word"><table role=3D"none" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"cente=
r" valign=3D"middle" height=3D"52" style=3D"height:52px"><a href=3D"https:/=
/link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ=
5O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9v=
W8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY2a7NlqtUMgi5Qe-3BQvzJR9qfXW=
-DPxUQzbsM7TsF9Iw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h2/bdMK4ie4l5pXpoz_F7pgPF7b9kv=
eTt8Av19oD1yHWvE" rel=3D"noopener noreferrer nofollow" style=3D"color:#ffff=
ff;font-size:18px;padding:0px 22px;text-decoration:none" target=3D"_blank" =
data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://=
link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5=
O45XXPsR9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW=
8q8qo9alofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY2a7NlqtUMgi5Qe-3BQvzJR9qfXW-=
DPxUQzbsM7TsF9Iw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h2/bdMK4ie4l5pXpoz_F7pgPF7b9kve=
Tt8Av19oD1yHWvE&amp;source=3Dgmail&amp;ust=3D1712957600235000&amp;usg=3DAOv=
Vaw03l6h6nBLCTeCn230KidZY"> Visit seedconference.eu </a></td></tr></table><=
/td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px =
0px"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" =
style=3D"margin:0 auto 0 auto"><tr><td align=3D"center" valign=3D"top" styl=
e=3D"width:630px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvo=
vpc0Duh6W17ooVUgQpQHcjoAkkAh3L9koN2XpmVENK4uKEKAKwZBSipGt4Rp3uhCJ84A0kbO5bL=
ub9USqpFMOCs2C1JVetpG8y-PdpbIgnAb_cWMkk_iPCn5kXSkrKgTF3qNWmODWsfg3Pm3weyh7T=
gLMj1uTy_mSBi8eQM_MyPpQ3PZeNs_l1TpgfJUSgxHlDQK1LQ4pEw/42h/Ha9tzqlrT_y1ujgoM=
l3Efw/h3/_EBRC484sEYrFcZICzWq8G6VhHI5cn2YatXGzERaLN4" rel=3D"noopener noref=
errer nofollow" style=3D"text-decoration:none" target=3D"_blank" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.=
beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9koN2XpmVENK4uKEK=
AKwZBSipGt4Rp3uhCJ84A0kbO5bLub9USqpFMOCs2C1JVetpG8y-PdpbIgnAb_cWMkk_iPCn5kX=
SkrKgTF3qNWmODWsfg3Pm3weyh7TgLMj1uTy_mSBi8eQM_MyPpQ3PZeNs_l1TpgfJUSgxHlDQK1=
LQ4pEw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h3/_EBRC484sEYrFcZICzWq8G6VhHI5cn2YatXGzE=
RaLN4&amp;source=3Dgmail&amp;ust=3D1712957600235000&amp;usg=3DAOvVaw2UijehR=
y2NEgPKVRsdXpN6"><img src=3D"https://ci3.googleusercontent.com/proxy/sDc-5d=
XR7BoulS5As7THL4_JIcgtXc_O4lBkrHUG7QEpN2fDNH38GSsIBx7KpVRro3GL5zhHL8rObpct2=
OIvEDE_P9vkAdGzcD8jm-UMSPxkwlHcrEA6Q6GBEOut1Es6E3miDZNPEBI2bvRptAkhSZKlgX7R=
7M6jzLNRcIr17Lpg9PQY6iZVLBRd2aF70Ms7BBxa1nl2I5tQHmq_8GurAOH_TFni1GSAnZeHWdN=
dsLfbYpHAMCe5HHlfrPbca7RHLsHU2cg=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn=
-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/u=
ploads/asset/file/f07863db-3bc9-431e-83c3-498d85cf41d1/hero-2024.jpg?t=3D17=
03196349" alt=3D"" height=3D"auto" width=3D"630" style=3D"display:block;wid=
th:100%" border=3D"0"></a></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td bgcolor=3D"#fff5dc" style=3D"background-color:#fff5dc;padding:10px 0=
px 10px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td align=3D"center" style=3D"padding:0px 15px=
;text-align:center;word-break:break-word"><p><span style=3D"color:rgb(67,13=
8,201);font-family:Arial;font-size:1.5rem"><b>We wish you Happy holidays!!<=
/b></span></p></td></tr></table></td></tr></table></td></tr><tr><td><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#e8bec7;padding:0p=
x 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"p=
adding:0px 15px;text-align:center"><h1><span style=3D"color:#e8195a">In thi=
s newsletter:</span></h1></td></tr></table></td></tr></table></td></tr><tr>=
<td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cell=
padding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#e8bec7=
;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" style=3D"paddi=
ng:0px 15px;text-align:center;word-break:break-word"><p><span style=3D"colo=
r:#e8195a">Click on the section below to read more:</span></p></td></tr></t=
able></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#E8BE=
C7" style=3D"background-color:#e8bec7;padding:0px 0px 0px 0px"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td width=3D"100%"><table role=3D"none" width=3D"100%" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" style=3D"vertical-ali=
gn:top"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0"><tbody><tr><td align=3D"center" style=3D"padding:0px 15px=
;text-align:center;word-break:break-word"><p><span style=3D"color:#e8195a">=
<b>Call for Papers</b></span><br><span style=3D"color:#e8195a"><a href=3D"#=
m_-2649755528240230986_scope" rel=3D"noopener noreferrer nofollow">Scope</a=
></span><br><span style=3D"color:#e8195a"><a href=3D"#m_-264975552824023098=
6_topicsofinterest" rel=3D"noopener noreferrer nofollow">Topics of interest=
</a></span><br><span style=3D"color:#e8195a"><a href=3D"#m_-264975552824023=
0986_importantdates" rel=3D"noopener noreferrer nofollow">Important dates</=
a></span><br><span style=3D"color:#e8195a"><a href=3D"#m_-26497555282402309=
86_publicationsaward" rel=3D"noopener noreferrer nofollow">Publications and=
 Awards</a></span><br><span style=3D"color:#e8195a"><a href=3D"#m_-26497555=
28240230986_submissionguidelines" rel=3D"noopener noreferrer nofollow">Subm=
ission guidelines</a></span></p></td></tr></tbody></table></td><td width=3D=
"50%" style=3D"vertical-align:top"><table role=3D"none" width=3D"100%" bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td align=3D"center=
" style=3D"padding:0px 15px;text-align:center;word-break:break-word"><p><sp=
an style=3D"color:#e8195a"><b>Call for Workshops</b></span><br><span style=
=3D"color:#e8195a"><a href=3D"#m_-2649755528240230986_reviewcriteria" rel=
=3D"noopener noreferrer nofollow">Review criteria</a></span><br><span style=
=3D"color:#e8195a"><a href=3D"#m_-2649755528240230986_proposalguidelines" r=
el=3D"noopener noreferrer nofollow">Proposals guidelines</a></span><br><spa=
n style=3D"color:#e8195a"><a href=3D"#m_-2649755528240230986_importantdates=
-2" rel=3D"noopener noreferrer nofollow">Important dates</a></span></p></td=
></tr></tbody></table></td></tr></table></td></tr></table></td></tr></table=
></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"transparent" style=3D"backg=
round-color:transparent;padding:0px 0px 0px 0px"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D=
"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center"><h1><s=
pan style=3D"color:#438ac9">SEED 2024: Call for Papers</span></h1></td></tr=
></table></td></tr></table></td></tr><tr><td align=3D"center" valign=3D"top=
" style=3D"padding:0px 15px;text-align:center"><h2>Scope</h2></td></tr><tr>=
<td align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:bre=
ak-word"><p> The<b> First International Conference on Sustainable Energy Ed=
ucation (SEED)</b> aims to become a forum for researchers, academics, and p=
ractitioners to exchange ideas, experiences, opinions, and research results=
 relating to the preparation of students, teaching/learning methodologies, =
the organization of educational systems, partnerships and funding and gover=
nance related to Sustainable Energy Education. </p></td></tr><tr><td align=
=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word">=
<p> The <b>SEED</b> conference will be held on <b>July 3-5, 2024</b>, at th=
e <b>Faculty of Business Administration and Management of the Universitat P=
olit=C3=A8cnica de Val=C3=A8ncia (UPV)</b>, which has been ranked as the be=
st technical university in Spain by the Academic Ranking of World Universit=
ies since 2014. </p></td></tr><tr><td><table role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7"=
 style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"=
none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><=
td align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:cen=
ter"><h2><span>Topics of interest</span></h2></td></tr></table></td></tr></=
table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"back=
ground-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"le=
ft" style=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><sp=
an>The Program Committee encourages the submission of extended abstracts th=
at communicate applied and empirical findings of interest to higher educati=
on and vocational education &amp; training professionals, researchers, and =
practitioners.</span><br><span>Key topics include, but are not limited to, =
the following subjects:</span></p></td></tr></table></td></tr></table></td>=
</tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-co=
lor:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"100%"><tabl=
e role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tr><td width=3D"50%" style=3D"vertical-align:top"><table role=3D"no=
ne" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody>=
<tr><td align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break=
:break-word"><p><span><b>Track 1: Teaching and Learning on Sustainable Ener=
gy Education.</b></span><br><span><i>Good practices related to:</i></span><=
/p></td></tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding=
-right:27px;padding-top:12px"><div style=3D"margin-left:0px"><ul style=3D"l=
ist-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=3D=
"padding:0px;text-align:left;word-break:break-word"><span>Renewable energy =
sources and their development, use, and impact</span></p></li><li><p style=
=3D"padding:0px;text-align:left;word-break:break-word"><span>Development an=
d use of electric vehicles and the connection to the economy and the enviro=
nment</span></p></li><li><p style=3D"padding:0px;text-align:left;word-break=
:break-word"><span>Efficient use of energy technologies for conservation an=
d reduction of waste</span></p></li><li><p style=3D"padding:0px;text-align:=
left;word-break:break-word"><span>Nature-Based Solutions (NBS)</span></p></=
li><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><span=
>Circular Economy models</span></p></li></ul></div></td></tr></tbody></tabl=
e></td><td width=3D"50%" style=3D"vertical-align:top"><table role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr>=
<td align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:bre=
ak-word"><p><span><b>Track 2: Partnerships, Collaboration on Sustainable En=
ergy Education </b></span><br><span><i>Good practices related to:</i></span=
></p></td></tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;paddi=
ng-right:27px;padding-top:12px"><div style=3D"margin-left:0px"><ul style=3D=
"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=
=3D"padding:0px;text-align:left;word-break:break-word"><span>Traineeships &=
amp; apprenticeships</span></p></li><li><p style=3D"padding:0px;text-align:=
left;word-break:break-word"><span>Energy career and workforce development i=
n the energy industry</span></p></li><li><p style=3D"padding:0px;text-align=
:left;word-break:break-word"><span>Synthesis of energy information</span></=
p></li><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><=
span>HUBS in sustainable energy</span></p></li><li><p style=3D"padding:0px;=
text-align:left;word-break:break-word"><span>Skill needs of the labor marke=
t</span></p></li></ul></div></td></tr></tbody></table></td></tr></table></t=
d></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" wid=
th=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolo=
r=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td width=3D"100%"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" style=3D"v=
ertical-align:top"><table role=3D"none" width=3D"100%" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0"><tbody><tr><td align=3D"left" style=3D"padding=
:0px 15px;text-align:left;word-break:break-word"><p><span><b>Track 3: Gover=
nance &amp; Funding for Sustainable Energy Education</b></span><br><span><i=
>Good practices related to:</i></span></p></td></tr><tr><td style=3D"paddin=
g-bottom:12px;padding-left:37px;padding-right:27px;padding-top:12px"><div s=
tyle=3D"margin-left:0px"><ul style=3D"list-style-type:disc;margin:0px 0px;p=
adding:0px 0px 0px 0px"><li><p style=3D"padding:0px;text-align:left;word-br=
eak:break-word"><span>Financing models</span></p></li><li><p style=3D"paddi=
ng:0px;text-align:left;word-break:break-word"><span>Financial tools </span>=
</p></li><li><p style=3D"padding:0px;text-align:left;word-break:break-word"=
><span>Financing partnerships in energy</span></p></li><li><p style=3D"padd=
ing:0px;text-align:left;word-break:break-word"><span>Business models for en=
ergy education</span></p></li><li><p style=3D"padding:0px;text-align:left;w=
ord-break:break-word"><span>University spin-offs</span></p></li></ul></div>=
</td></tr></tbody></table></td><td width=3D"50%" style=3D"vertical-align:to=
p"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0"><tbody><tr><td align=3D"left" style=3D"padding:0px 15px;text-a=
lign:left;word-break:break-word"><p><span><b>Track 4: Sustainable Education=
 </b></span><br><span><i>Good practices related to:</i></span></p></td></tr=
><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27px;=
padding-top:12px"><div style=3D"margin-left:0px"><ul style=3D"list-style-ty=
pe:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=3D"padding:0px=
;text-align:left;word-break:break-word"><span>Competency-based learning and=
 skill assessment</span></p></li><li><p style=3D"padding:0px;text-align:lef=
t;word-break:break-word"><span>Education accreditation, quality, and assess=
ment</span></p></li><li><p style=3D"padding:0px;text-align:left;word-break:=
break-word"><span>Innovative materials and new tools for teaching</span></p=
></li><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><s=
pan>Teaching and learning experiences</span></p></li><li><p style=3D"paddin=
g:0px;text-align:left;word-break:break-word"><span>Educational technology (=
e.g., virtual labs, e-learning) </span></p></li></ul></div></td></tr></tbod=
y></table></td></tr></table></td></tr></table></td></tr></table></td></tr><=
tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff=
2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"t=
op" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;paddi=
ng-top:14px;text-align:center;width:100%;word-break:break-word"><table role=
=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"=
><tr><td align=3D"center" valign=3D"middle" height=3D"52" style=3D"height:5=
2px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17oo=
VUgQpQHcjoAkkAh3L9mszuoN1yA3Jgho2bXfGfrQUhLLKabviJfrip-rYP96kA-VBSI8kiBGDdp=
fbj01i8em0e2HYj3ycF7PU6trmWjBhVAnpTTJZHHNA3NPQ-qBaTCE8AYU-3UNsujR0_ju2grTEi=
ENyJE5OihvGbIwMq89l9FOdmTAaFsHnRbE7GCPfr9pvjw4_EWAxa4z8syUWNI/42h/Ha9tzqlrT=
_y1ujgoMl3Efw/h4/Y0m1WBct79Dwhes-2fW8xPG7Trmu4oJ5kNp5kqe2AcY" rel=3D"noopen=
er noreferrer nofollow" style=3D"color:#ffffff;font-size:18px;padding:0px 2=
2px;text-decoration:none" target=3D"_blank" data-saferedirecturl=3D"https:/=
/www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3=
DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mszuoN1yA3Jgho2bXfGfrQUhLLKabviJfrip-=
rYP96kA-VBSI8kiBGDdpfbj01i8em0e2HYj3ycF7PU6trmWjBhVAnpTTJZHHNA3NPQ-qBaTCE8A=
YU-3UNsujR0_ju2grTEiENyJE5OihvGbIwMq89l9FOdmTAaFsHnRbE7GCPfr9pvjw4_EWAxa4z8=
syUWNI/42h/Ha9tzqlrT_y1ujgoMl3Efw/h4/Y0m1WBct79Dwhes-2fW8xPG7Trmu4oJ5kNp5kq=
e2AcY&amp;source=3Dgmail&amp;ust=3D1712957600235000&amp;usg=3DAOvVaw2uYAf7u=
ct7zQbZAuEPV7-9"> Read More </a></td></tr></table></td></tr></table></td></=
tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D=
"background-color:#e8bec7;padding:0px 0px 0px 0px"><table role=3D"none" wid=
th=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center"><h2=
><span style=3D"color:#e8195a">Important dates</span></h2></td></tr></table=
></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#E8BEC7" =
style=3D"background-color:#e8bec7;padding:0px 0px 0px 0px"><table role=3D"n=
one" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><t=
d align=3D"center" valign=3D"top" style=3D"padding:0px 15px 0px"><table rol=
e=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin=
:0 auto 0 auto"><tr><td align=3D"center" valign=3D"top" style=3D"width:567p=
x"><img src=3D"https://ci4.googleusercontent.com/proxy/sYvwDprXj57bXMqK0k2i=
2CjkBuSKKf3OdjgKBHlctZx59MOPO3KcbL5B60P6IpQEuHLy4-967G-R3djItnQHIz5ZVLkuwVT=
WpYP1pApc7Y0iO80c6RvtWMNf7ol4ANY8IKqMX7Xs7HhhjXki0T59_jZCVUhL-AZRF-ndgaWDA5=
sc6bblfvCZBFsKQDflLnpX5RvALaAr34lGzVew4k14E-9-0FUTx1aB6sixjFmw__9TvD5IsoFNC=
rIpcIlxwVZCRRsaSVQNtnjotGlc6wY40n_-5GT9-hC-Fqaz-Jcm=3Ds0-d-e1-ft#https://me=
dia.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredi=
rect,quality=3D80/uploads/asset/file/78a793ec-823a-4cfa-a827-6da26cf59def/S=
chermata_2023-12-21_alle_00.07.10.png?t=3D1703113645" alt=3D"" height=3D"au=
to" width=3D"567" style=3D"display:block;width:100%" border=3D"0"></td></tr=
></table></td></tr></table></td></tr></table></td></tr><tr><td align=3D"cen=
ter" valign=3D"top" style=3D"padding:0px 15px;text-align:center"><h2>Public=
ations</h2></td></tr><tr><td align=3D"left" style=3D"padding:0px 15px;text-=
align:left;word-break:break-word"><p><b>All accepted extended abstracts wil=
l appear in the conference proceedings book, which will be assigned a=C2=A0=
DOI=C2=A0and=C2=A0ISBN.</b> They will be published in open access by=C2=A0U=
PV Press and submitted to be indexed in major international bibliographic d=
atabases. In previous conferences we organized, proceedings were indexed in=
 Scopus and the=C2=A0Thomson-Reuters Conference Proceedings Citation Index =
=E2=80=93 Web of Science Core Collection=C2=A0(former ISI Proceedings). </p=
></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15p=
x;text-align:center"><h2>Award</h2></td></tr><tr><td align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word"><p> To the=C2=
=A0Best Paper=C2=A0and=C2=A0Best Practice. </p></td></tr><tr><td><table rol=
e=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">=
<tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0=
px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padd=
ing:0px 15px;text-align:center"><h2><span>Submission guidelines</span></h2>=
</td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgc=
olor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0"><tr><td align=3D"left" style=3D"padding:0px 15px;text-align:left=
;word-break:break-word"><p><span>Authors worldwide are invited to submit or=
iginal and unpublished extended abstracts not under review in any other con=
ference or journal.=C2=A0</span><br><span>All extended abstracts will be pe=
er-reviewed by the Program Committee based on their significance, methodolo=
gical soundness, originality, and clarity of exposition.</span></p></td></t=
r></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"=
#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;pad=
ding-left:15px;padding-right:15px;padding-top:14px;text-align:center;width:=
100%;word-break:break-word"><table role=3D"none" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=
=3D"middle" height=3D"52" style=3D"height:52px"><a href=3D"https://link.mai=
l.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kQlP9QpGOx82cy=
awC83eMelUai2WiV9CTT5coYb3lilWY9eU5I1x3zefT5HCTwZyGOdkLSOsOSboTqBGItstKpD2D=
C0pWdQZPwbLSM85I148wNn5htnpgMDfzxnC2gOHs_JbNRGznfG1NEfS_K8XN5Xj77Ud-QW0Hcnd=
zQcbIt6XNlg-J644kUZiGKSPGxIDgEFZWiE7x3Sm6otqbwKp2NQb3It6BaHRE-xNPBOG7_rQ/42=
h/Ha9tzqlrT_y1ujgoMl3Efw/h5/gSWOP3qib4IgTxtvKrLKkydOPbvrPRxevHkj4PL7y8g" re=
l=3D"noopener noreferrer nofollow" style=3D"color:#ffffff;font-size:18px;pa=
dding:0px 22px;text-decoration:none" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.co=
m/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kQlP9QpGOx82cyawC83eMelUai=
2WiV9CTT5coYb3lilWY9eU5I1x3zefT5HCTwZyGOdkLSOsOSboTqBGItstKpD2DC0pWdQZPwbLS=
M85I148wNn5htnpgMDfzxnC2gOHs_JbNRGznfG1NEfS_K8XN5Xj77Ud-QW0HcndzQcbIt6XNlg-=
J644kUZiGKSPGxIDgEFZWiE7x3Sm6otqbwKp2NQb3It6BaHRE-xNPBOG7_rQ/42h/Ha9tzqlrT_=
y1ujgoMl3Efw/h5/gSWOP3qib4IgTxtvKrLKkydOPbvrPRxevHkj4PL7y8g&amp;source=3Dgm=
ail&amp;ust=3D1712957600235000&amp;usg=3DAOvVaw2SczhyB05V2nSDpiWpPuvY"> See=
 the template </a></td></tr></table></td></tr></table></td></tr></table></t=
d></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-co=
lor:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><span>Submis=
sions must be between 4 and 9 pages (A4 size), including 1 title page + 8 p=
ages with the main text, figures, tables, and references. Submissions imply=
 the willingness of at least one author to register, attend the conference,=
 and present their contribution.</span></p></td></tr></table></td></tr></ta=
ble></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"backgr=
ound-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"1=
00%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"cent=
er" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-r=
ight:15px;padding-top:14px;text-align:center;width:100%;word-break:break-wo=
rd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" a=
lign=3D"center"><tr><td align=3D"center" valign=3D"middle" height=3D"52" st=
yle=3D"height:52px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZ=
vovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kRwuR9B71gtRmZkiE5Fb7FmfI9tMAhBptscSO1xOBx=
4y-tDRBQCzrpIL5Cxo7XQaDKGwnFYn_ofnW7CPeLYoUtKxTOptnEJrObdN-4rO8hr8fyyWTpeOh=
fWoPjUs7pF1SMPhUt6aNZv3t7fD_Hlj_DWD8kYPU2p2ySiCq5a0rBRg/42h/Ha9tzqlrT_y1ujg=
oMl3Efw/h6/rI9jZFKdBT6J5f39qiGp9m5FCaT4kmDZPtpyf5upWRE" rel=3D"noopener nor=
eferrer nofollow" style=3D"color:#ffffff;font-size:18px;padding:0px 22px;te=
xt-decoration:none" target=3D"_blank" data-saferedirecturl=3D"https://www.g=
oogle.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZv=
ovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kRwuR9B71gtRmZkiE5Fb7FmfI9tMAhBptscSO1xOBx4=
y-tDRBQCzrpIL5Cxo7XQaDKGwnFYn_ofnW7CPeLYoUtKxTOptnEJrObdN-4rO8hr8fyyWTpeOhf=
WoPjUs7pF1SMPhUt6aNZv3t7fD_Hlj_DWD8kYPU2p2ySiCq5a0rBRg/42h/Ha9tzqlrT_y1ujgo=
Ml3Efw/h6/rI9jZFKdBT6J5f39qiGp9m5FCaT4kmDZPtpyf5upWRE&amp;source=3Dgmail&am=
p;ust=3D1712957600235000&amp;usg=3DAOvVaw0Gyb3-Gge0rxK4n-bIPrcy"> Read more=
 </a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><t=
d><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpa=
dding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;p=
adding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"left" style=3D"padding:0=
px 15px;text-align:left;word-break:break-word"><p><span>SEED is using the E=
asyChair platform to manage the submissions. The submission website is </sp=
an><span><b>EASY CHAIR SEED 2024</b></span></p></td></tr></table></td></tr>=
</table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"ba=
ckground-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D=
"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padd=
ing-right:15px;padding-top:14px;text-align:center;width:100%;word-break:bre=
ak-word"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" align=3D"center"><tr><td align=3D"center" valign=3D"middle" height=3D"5=
2" style=3D"height:52px"><a href=3D"https://link.mail.beehiiv.com/ss/c/mI7B=
QRoctVTIGHO43x85D0IyYHUvJ7fPUgDznev73L38PDgyfgzkQmM_MHGbRoyseYIC3OXxrejG_W2=
du5Evlp7IQT5bKjw35eZASG0VFoLYeuXeKuFnOQHdf48fth9QuRCLMi0p53qHr4-hjAQjhaOQe_=
fhCke2xMUDDU3msmn7P95v3YnXJr8H7DqCFNW0wmzOYiWfK1Q-qylAMpi1UlGmv6gG0YuxkEbTF=
RLLS8s/42h/Ha9tzqlrT_y1ujgoMl3Efw/h7/VfNtariB27D94sA3pSH0F9257ryEJLqmVF8eXM=
XlHLk" rel=3D"noopener noreferrer nofollow" style=3D"color:#ffffff;font-siz=
e:18px;padding:0px 22px;text-decoration:none" target=3D"_blank" data-safere=
directurl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.b=
eehiiv.com/ss/c/mI7BQRoctVTIGHO43x85D0IyYHUvJ7fPUgDznev73L38PDgyfgzkQmM_MHG=
bRoyseYIC3OXxrejG_W2du5Evlp7IQT5bKjw35eZASG0VFoLYeuXeKuFnOQHdf48fth9QuRCLMi=
0p53qHr4-hjAQjhaOQe_fhCke2xMUDDU3msmn7P95v3YnXJr8H7DqCFNW0wmzOYiWfK1Q-qylAM=
pi1UlGmv6gG0YuxkEbTFRLLS8s/42h/Ha9tzqlrT_y1ujgoMl3Efw/h7/VfNtariB27D94sA3pS=
H0F9257ryEJLqmVF8eXMXlHLk&amp;source=3Dgmail&amp;ust=3D1712957600235000&amp=
;usg=3DAOvVaw2PcIxuYoYYb9sGwiFoCdgt"> Submit on Easy Chair Platform </a></t=
d></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><table=
 role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0=
px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0"><tr><td align=3D"left" style=3D"padding:0px 15px;=
text-align:left;word-break:break-word"><p><span>If you have not previously =
used the platform, you must register first.</span></p></td></tr></table></t=
d></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"transparent" =
style=3D"background-color:transparent;padding:0px 0px 0px 0px"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align=
:center"><h1><span style=3D"color:#438ac9">SEED 2024: Call for Workshops</s=
pan></h1></td></tr></table></td></tr></table></td></tr><tr><td align=3D"lef=
t" style=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><spa=
n style=3D"font-size:16px">Researchers, academics, and practitioners are in=
vited to submit proposals for workshops at the=C2=A0</span><span style=3D"f=
ont-size:16px"><b>SEED conference</b></span><span style=3D"font-size:16px">=
. The purpose of workshops is to give room for presenting ideas and discuss=
ing preliminary results in an interactive atmosphere while focusing on a sp=
ecific topic. Workshops may be proposed for=C2=A0</span><span style=3D"font=
-size:16px"><b>a minimum of 1.5 hours and a maximum of 3 hours in length</b=
></span><span style=3D"font-size:16px">. It should encourage lively debates=
 and stimulate the production of new ideas and the discussion of controvers=
ial issues.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" sty=
le=3D"padding:0px 15px;text-align:center"><h2>Review criteria</h2></td></tr=
><tr><td align=3D"left" style=3D"padding:0px 15px;text-align:left;word-brea=
k:break-word"><p><span style=3D"font-size:16px">The decision on acceptance =
or rejection of a workshop proposal will be made</span><span style=3D"font-=
size:16px"><b> based on the overall quality</b></span><span style=3D"font-s=
ize:16px">=C2=A0of the proposal and its potential to attract a sufficiently=
 broad community.=C2=A0</span></p></td></tr><tr><td><table role=3D"none" wi=
dth=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcol=
or=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding:0px 15px;=
text-align:center"><h2><span>Proposal guidelines</span></h2></td></tr></tab=
le></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#EFF2F7=
" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><table role=3D=
"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr>=
<td align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:bre=
ak-word"><p><span><b>All workshop proposals should be sent to=C2=A0</b></sp=
an><span><b><a href rel=3D"noopener noreferrer nofollow" data-email-masked>=
seed...@upv.es</a></b></span><span>=C2=A0</span><span><b>in English</b></sp=
an><span> as a single PDF file (2-6 pages) containing the following section=
s:</span></p></td></tr><tr><td style=3D"padding-bottom:12px;padding-left:37=
px;padding-right:27px;padding-top:12px"><div style=3D"margin-left:0px"><ul =
style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><=
p style=3D"padding:0px;text-align:left;word-break:break-word"><span style=
=3D"font-size:12px">Title and acronym.</span></p></li><li><p style=3D"paddi=
ng:0px;text-align:left;word-break:break-word"><span style=3D"font-size:12px=
">Abstract: 150-200 word abstract describing the workshop purpose.</span></=
p><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"=
><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><span s=
tyle=3D"font-size:12px">Objectives: a clear description of the workshop obj=
ectives.=C2=A0</span></p></li><li><p style=3D"padding:0px;text-align:left;w=
ord-break:break-word"><span style=3D"font-size:12px">Description of the top=
ics and scope of the workshop.</span></p></li></ul></li><li><p style=3D"pad=
ding:0px;text-align:left;word-break:break-word"><span style=3D"font-size:12=
px">Organizer: a short biographical sketch of the workshop organizer, descr=
ibing relevant experience and qualifications.</span></p></li><li><p style=
=3D"padding:0px;text-align:left;word-break:break-word"><span style=3D"font-=
size:12px">Intended audience: description of the anticipated audience, incl=
uding experience level and prerequisites, the expected number of participan=
ts to the workshop and how the workshop organizer will call for participati=
on.</span></p></li><li><p style=3D"padding:0px;text-align:left;word-break:b=
reak-word"><span style=3D"font-size:12px">Rough agenda: 1-page outline of t=
he workshop content describing the workshop dynamics, including tentative s=
peakers, format (panels, call for extended abstracts, etc).</span></p><ul s=
tyle=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p=
 style=3D"padding:0px;text-align:left;word-break:break-word"><span style=3D=
"font-size:12px">If the workshops consist of the selection &amp; publicatio=
n of =E2=80=9Cextended abstracts=E2=80=9D (this is only a possibility):</sp=
an></p><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px=
 0px"><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><s=
pan style=3D"font-size:12px">Tentative dates</span></p></li><li><p style=3D=
"padding:0px;text-align:left;word-break:break-word"><span style=3D"font-siz=
e:12px">Review process=C2=A0</span></p></li><li><p style=3D"padding:0px;tex=
t-align:left;word-break:break-word"><span style=3D"font-size:12px">Publicat=
ion opportunities=C2=A0</span></p></li></ul></li></ul></li><li><p style=3D"=
padding:0px;text-align:left;word-break:break-word"><span style=3D"font-size=
:12px">Infrastructure: Description of the infrastructure needed to carry ou=
t the workshop.</span></p></li><li><p style=3D"padding:0px;text-align:left;=
word-break:break-word"><span style=3D"font-size:12px">Statement from the or=
ganizers willing to publish an extended abstract of the findings of the wor=
kshop (Final version submission deadline July 28, 2024)</span></p></li><li>=
<p style=3D"padding:0px;text-align:left;word-break:break-word"><span style=
=3D"font-size:12px">Maximum capacity of attendees=C2=A0</span></p></li><li>=
<p style=3D"padding:0px;text-align:left;word-break:break-word"><span style=
=3D"font-size:12px">Other information: For instance, information that will =
let attendees know more about your workshop.</span></p></li></ul></div></td=
></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" widt=
h=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=
=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0px"><ta=
ble role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px=
;padding-left:15px;padding-right:15px;padding-top:14px;text-align:center;wi=
dth:100%;word-break:break-word"><table role=3D"none" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=
=3D"middle" height=3D"52" style=3D"height:52px"><a href=3D"https://link.mai=
l.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mu_b5nHr6UwtK1=
UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMsdzpOMwenjWNNfNBoPwL=
n738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXOXhPaMKn4xjJjWjdJTcB=
wlk6HYiP7pTXbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujgoMl3Efw/h8/BraEJ2jcwRzFdiK=
dAtFIOhFl_uDH9SoXgJdtg1vwWRM" rel=3D"noopener noreferrer nofollow" style=3D=
"color:#ffffff;font-size:18px;padding:0px 22px;text-decoration:none" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAk=
kAh3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjM=
sdzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zX=
OXhPaMKn4xjJjWjdJTcBwlk6HYiP7pTXbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujgoMl3Ef=
w/h8/BraEJ2jcwRzFdiKdAtFIOhFl_uDH9SoXgJdtg1vwWRM&amp;source=3Dgmail&amp;ust=
=3D1712957600235000&amp;usg=3DAOvVaw35T2u0xoB-FcxxqlYykRZ9"> Read more </a>=
</td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><ta=
ble role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;paddin=
g:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0"><tr><td width=3D"100%"><table role=3D"none" wi=
dth=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=
=3D"50%" style=3D"vertical-align:top"><table role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td align=3D"lef=
t" style=3D"padding:0px 15px;text-align:left;word-break:break-word"><p><spa=
n><b>Resources provided by the SEED organizing committee:</b></span></p></t=
d></tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right=
:27px;padding-top:12px"><div style=3D"margin-left:0px"><ul style=3D"list-st=
yle-type:disc;margin:0px 0px;padding:0px 0px 0px 0px"><li><p style=3D"paddi=
ng:0px;text-align:left;word-break:break-word"><span>A link on the SEED webs=
ite.</span></p></li><li><p style=3D"padding:0px;text-align:left;word-break:=
break-word"><span>Management of registration for participants.</span></p></=
li><li><p style=3D"padding:0px;text-align:left;word-break:break-word"><span=
>Setup of meeting space and related equipment.</span></p></li></ul></div></=
td></tr></tbody></table></td><td width=3D"50%" style=3D"vertical-align:top"=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0"><tbody><tr><td align=3D"left" style=3D"padding:0px 15px;text-ali=
gn:left;word-break:break-word"><p><span><b>The workshop organizer must take=
 care of the following:</b></span></p></td></tr><tr><td style=3D"padding-bo=
ttom:12px;padding-left:37px;padding-right:27px;padding-top:12px"><div style=
=3D"margin-left:0px"><ul style=3D"list-style-type:disc;margin:0px 0px;paddi=
ng:0px 0px 0px 0px"><li><p style=3D"padding:0px;text-align:left;word-break:=
break-word"><span>Coordinating schedules and deadlines with the SEED organi=
zing committee.</span></p></li><li><p style=3D"padding:0px;text-align:left;=
word-break:break-word"><span>Provide a brief description of the workshop fo=
r inclusion in the SEED website and the workshop program when it is final.=
=C2=A0</span></p></li></ul></div></td></tr></tbody></table></td></tr></tabl=
e></td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td b=
gcolor=3D"#EFF2F7" style=3D"background-color:#eff2f7;padding:0px 0px 0px 0p=
x"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-botto=
m:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-align:cen=
ter;width:100%;word-break:break-word"><table role=3D"none" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" =
valign=3D"middle" height=3D"52" style=3D"height:52px"><a href=3D"https://li=
nk.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mu_b5nHr=
6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMsdzpOMwenjWNNf=
NBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXOXhPaMKn4xjJjW=
jdJTcBwlk6HYiP7pTXbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujgoMl3Efw/h9/eYXXDA9oD=
thiEk5ukIX9RJCHhQJ_5rg6oMx8k_Tu0no" rel=3D"noopener noreferrer nofollow" st=
yle=3D"color:#ffffff;font-size:18px;padding:0px 22px;text-decoration:none" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQ=
HcjoAkkAh3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsH=
yd7LjMsdzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9=
ws79zXOXhPaMKn4xjJjWjdJTcBwlk6HYiP7pTXbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujg=
oMl3Efw/h9/eYXXDA9oDthiEk5ukIX9RJCHhQJ_5rg6oMx8k_Tu0no&amp;source=3Dgmail&a=
mp;ust=3D1712957600235000&amp;usg=3DAOvVaw0jB3PpZ6NEgoiHvk1NSCwM"> Read mor=
e </a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><=
td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#e8bec7;=
padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" =
style=3D"padding:0px 15px;text-align:center"><h2><span style=3D"color:#e819=
5a">Important dates</span></h2></td></tr></table></td></tr></table></td></t=
r><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#=
e8bec7;padding:0px 0px 0px 0px"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=
=3D"top" style=3D"padding:0px 15px 0px"><table role=3D"none" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto"><tr><td a=
lign=3D"center" valign=3D"top" style=3D"width:567px"><img src=3D"https://ci=
6.googleusercontent.com/proxy/APLZClwC8LImwPed5zVJQO0g54OysowGw-MquQNV99Lvj=
9Nru61dTirVQ-T5HI_K8NPu6HBXVGALzZPYH9gKXkXGJVyANAynkr18Ga5vanI-8EKdgldiULSo=
8Wmg-VhI9569wZQQpvS4susJyYY6R-WRsCCoSPTNXCzj6F-gVmKbXVgluwh6M3i5wdOXJqTM76y=
ATABdrcV68oJEgut5RjA_QY5tkFkttXVb1lG3phftnSZWAw_3M82S6-noq1YFx-N9MNNFRQZMmf=
B4xLQbXlOayHa_GRtnigNuZqoW=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/i=
mage/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads=
/asset/file/e0cd1559-3afa-4178-95fa-cf6bae4f034b/Schermata_2023-12-21_alle_=
00.06.14.png?t=3D1703113598" alt=3D"" height=3D"auto" width=3D"567" style=
=3D"display:block;width:100%" border=3D"0"></td></tr></table></td></tr></ta=
ble></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td bgcolor=3D"#2466A=
1" style=3D"background-color:#2466a1;padding:20px 0px 30px 0px"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td align=3D"center" style=3D"padding:0px 15px;text-align:center;word-br=
eak:break-word"><p><span style=3D"color:rgb(255,255,255);font-size:14px"><b=
>Remember, your workshop proposal should be sent by e-mail=C2=A0</b></span>=
<br><span style=3D"color:rgb(255,255,255);font-size:14px"><b>by February 2,=
 2024 to =C2=A0</b></span><span style=3D"color:rgb(255,255,255);font-size:1=
4px"><b><a href rel=3D"noopener noreferrer nofollow" data-email-masked>seed=
...@upv.es</a></b></span><span style=3D"color:rgb(255,255,255);font-size:14=
px"><b>.</b></span></p></td></tr></table></td></tr></table></td></tr><tr><t=
d align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break=
-word"><p></p></td></tr></table></td></tr><tr><td align=3D"center" valign=
=3D"top" bgcolor=3D"#438ac9" style=3D"padding:0px;border-bottom-left-radius=
:10px;border-bottom-right-radius:10px"><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td a=
lign=3D"center" valign=3D"top" bgcolor=3D"#fbbb16" style=3D"padding:12px"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0" align=3D"center"><tr><td><span style=3D"padding-left:1px"></span><=
/td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px=
"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19n_meO=
0wke5FKBzflRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDPCB6z8vhEMnt0zgr_0xSB8mCA7I4_=
IzXxUL0BxvwowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0VoOTWsxhjeXzv6N0rcNwQKxEIDje94=
i_A07SYhbJ8C0ZF74_XYJ0jFb7h8TJGH6XgwQ/42h/Ha9tzqlrT_y1ujgoMl3Efw/h10/qZaD6g=
SE1PMs4sPBSfFDetqcOx9V1Ar6KGTz_JcSnKE" style=3D"text-decoration:none" targe=
t=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.co=
m/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh=
6W19n_meO0wke5FKBzflRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDPCB6z8vhEMnt0zgr_0xS=
B8mCA7I4_IzXxUL0BxvwowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0VoOTWsxhjeXzv6N0rcNwQ=
KxEIDje94i_A07SYhbJ8C0ZF74_XYJ0jFb7h8TJGH6XgwQ/42h/Ha9tzqlrT_y1ujgoMl3Efw/h=
10/qZaD6gSE1PMs4sPBSfFDetqcOx9V1Ar6KGTz_JcSnKE&amp;source=3Dgmail&amp;ust=
=3D1712957600236000&amp;usg=3DAOvVaw2ZO_fofMo2ZPSPx_ZXwHlB"><img width=3D"2=
2" alt=3D"fb" border=3D"0" style=3D"display:block;max-width:22px" src=3D"ht=
tps://ci3.googleusercontent.com/proxy/looCG2drRUo6hmiov-I-swidRfN8A8FNq5qLr=
iBTnbGcqTPOJkvyT6TZ_Jzs0d-TRtx2fHbZRSKedgehIJVkoEvjI3MeY2cb-3cTlGt0LLSJbPY2=
0xY7-cX3q9ILbl8rNP4vGlSP5rObzI8R60mXon0J3kXYXHQT1uo6yCBD2kyolYriDWf0pqKgC5l=
0v6zcqmQ=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-d=
own,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/facebook_li=
ght.png"></a></td><td align=3D"center" valign=3D"middle" width=3D"75" style=
=3D"width:75px"><a href=3D"https://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04B=
J7-U5njEzF7ylz2nMaTnkJ55jYEaSNckuOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7=
GsnrP-q47S7c_m5j7f7sIGH2rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTY=
e6_7kov3y2eSnWSpWd3zEBVTFR08EilFukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw1iKQ=
0z7uxVVj9Qumfs95Mo/42h/Ha9tzqlrT_y1ujgoMl3Efw/h11/DaD2mH3am6UPBCCYFzd6uvtt_=
EHC_eZA44ncLbGk65s" style=3D"text-decoration:none" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04BJ7-U5njEzF7ylz2nMaTnkJ55=
jYEaSNckuOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7GsnrP-q47S7c_m5j7f7sIGH2=
rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTYe6_7kov3y2eSnWSpWd3zEBVT=
FR08EilFukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw1iKQ0z7uxVVj9Qumfs95Mo/42h/H=
a9tzqlrT_y1ujgoMl3Efw/h11/DaD2mH3am6UPBCCYFzd6uvtt_EHC_eZA44ncLbGk65s&amp;s=
ource=3Dgmail&amp;ust=3D1712957600236000&amp;usg=3DAOvVaw2XlahXAzXDvZ18Yh50=
DwDm"><img width=3D"22" alt=3D"tw" border=3D"0" style=3D"display:block;max-=
width:22px" src=3D"https://ci5.googleusercontent.com/proxy/d2OxJiy6rkjHXTyu=
WaYbViAgKeIRqCZNRYSTFZL-rRVYvWnjr8qblCw6Qlt6uWF5q3iV9RfDHavjQaJ84HMjsJOdfo6=
1Vp3eWhEOLQGZ-TVpQlLEi2879-HsbEdqNTHOL9fYCQHtFgyRzQ0QvUNzt8D8w2LZEwDFmjgi8v=
_Yk8PdqG1dA09DGjfl9Q=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/f=
it=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets=
/x_light.png"></a></td><td align=3D"center" valign=3D"middle" width=3D"75" =
style=3D"width:75px"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7a=
Zvovpc0Duh6W19-oP22J3WocJyEIqlEBs30mdFwj7rvgg8GJtdPH65-M9mwqiG-vvmwaV9DVnHp=
UEAKtXByiNzks-sZep-mXhtzqiiDFVl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZNcfrRDKc7G3t7N=
qn0zn2al0tT8c5m5gwuznVQ3mwgGhRQyVlvNgi3cnUiSQSrGkQoCrNdg/42h/Ha9tzqlrT_y1uj=
goMl3Efw/h12/psAEIDYbcOfc0lqjdx2eHe24_BHWhD5zPQmqunVZTpM" style=3D"text-dec=
oration:none" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Den&amp;q=3Dhttps://link.mail.beehiiv.com/ss/c=
/9F_3DQ7aZvovpc0Duh6W19-oP22J3WocJyEIqlEBs30mdFwj7rvgg8GJtdPH65-M9mwqiG-vvm=
waV9DVnHpUEAKtXByiNzks-sZep-mXhtzqiiDFVl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZNcfrR=
DKc7G3t7Nqn0zn2al0tT8c5m5gwuznVQ3mwgGhRQyVlvNgi3cnUiSQSrGkQoCrNdg/42h/Ha9tz=
qlrT_y1ujgoMl3Efw/h12/psAEIDYbcOfc0lqjdx2eHe24_BHWhD5zPQmqunVZTpM&amp;sourc=
e=3Dgmail&amp;ust=3D1712957600236000&amp;usg=3DAOvVaw1LRMJrNU_srTDwiSEf6pct=
"><img width=3D"22" alt=3D"ig" border=3D"0" style=3D"display:block;max-widt=
h:22px" src=3D"https://ci6.googleusercontent.com/proxy/ncVljHE2MlvyX3_06exS=
OuyJ7dqSxK4uq6haZsxOq4P0sIsV6DYpFHgU_V9j2icThb-t590R4GzlWHM47Pob7YA5-mkVyCe=
Qh6TM7AYOJ8NFc2gXlBonIv_rahJwz2uWSyHnmq4ZBZx1XRoY3O9fe9ixPwdYpXC51EoZeG3jIp=
c6XzDOtMdRLOXf6PXEf9GFCcAWCw=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi=
/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/stati=
c_assets/instagram_light.png"></a></td><td align=3D"center" valign=3D"middl=
e" width=3D"75" style=3D"width:75px"><a href=3D"https://link.mail.beehiiv.c=
om/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrPSmgGRK74cEOs7Myre-gzzHjUdIlLDm=
hYyvXDVW6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_XH4o1UZo-t6INhxP3gdAhU4tjDhIlBn=
adN3kC8Awlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiDdaEEgbfXmS6FC5vi4hd2XakUR_db9M=
oI6dg2EhOKV9wTakwI/42h/Ha9tzqlrT_y1ujgoMl3Efw/h13/eISlMMfB5aEejlSkFkFCtCyxS=
B9nJLu6DxMX2HCHbW4" style=3D"text-decoration:none" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrP=
SmgGRK74cEOs7Myre-gzzHjUdIlLDmhYyvXDVW6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_X=
H4o1UZo-t6INhxP3gdAhU4tjDhIlBnadN3kC8Awlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiD=
daEEgbfXmS6FC5vi4hd2XakUR_db9MoI6dg2EhOKV9wTakwI/42h/Ha9tzqlrT_y1ujgoMl3Efw=
/h13/eISlMMfB5aEejlSkFkFCtCyxSB9nJLu6DxMX2HCHbW4&amp;source=3Dgmail&amp;ust=
=3D1712957600236000&amp;usg=3DAOvVaw3LV6OIy_IpOikDyIziruz2"><img width=3D"2=
2" alt=3D"in" border=3D"0" style=3D"display:block;max-width:22px" src=3D"ht=
tps://ci3.googleusercontent.com/proxy/OzNCKx3Bazr_ZUuv0pJsGRqeBCVFV60eWZION=
RUC8MME5_H-4NZRImT5qKJGKnPG1K2lt_SwA5QCA38e9Ih_TAl3XWriojILMgo9NhZiAR24U7Vi=
mj9_oEFi8ycCfbNoGOVIT41krJ1vroIMk1mQagCK6wK8IOtReGERi-gOhaIlNDJp0AhVRyZk1oH=
H9BsW63Q=3Ds0-d-e1-ft#https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-d=
own,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/linkedin_li=
ght.png"></a></td><td><span style=3D"padding-left:1px"></span></td></tr></t=
able></td></tr><tr><td height=3D"10" style=3D"line-height:1px;font-size:1px=
;height:10px"> =C2=A0 </td></tr><tr><td align=3D"center" valign=3D"top" sty=
le=3D"padding:15px"><table role=3D"none" width=3D"100%" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" val=
ign=3D"top"><p style=3D"font-family:&#39;Arial&#39;,Helvetica,sans-serif;co=
lor:#ffffff!important"> Update your email preferences or unsubscribe <a hre=
f=3D"https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24Q=
qCn-b19AhOZMy-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW=
-E9LTlRWORMLctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaAmfJVNSPeUtAlSE=
OBtutc9nCYFbIBUStCsKNv2sTEMoawWbx1iwH3iXq_r9j-Zglgv7qTGFbFHVKcQXvBs_GbVgIje=
SooageTjl9yWcXxU3ZulcX5i5CiwKeIhs7Kt1NrT0s5Ae43KdM4wjMSjdHRHXVHY478-NpXAsbO=
bjfpela-4ww24kpCC1ejo0FVn4IjIKXf8PToOwtpP7CfhcvSejKUfAb90W46AqQg4_PwoVxsv8P=
gnEzLb_EYupeWNDszU4KGquwCQogpnvzrsyyh4JGKJJraskA9V8ZRqZfPJOv7cbZeQ-SmYKhas2=
9sD6lKLTHmtmQeZsNSK2-jjx5vt8h5GT6oW4wFnjypUM-lS7U-CD8WaO-JZIwn1Z2JIC5jCTBm5=
OCoQWvL43NL7wZNWWYuyaRduZs-40DBxueYaGWaOao-offum9afDfw-nCpbrpm4NKD0wVHvZFv4=
_pH-GVYAG2l3G_Z3iAg5K1YPtdDB0_qlVuzZM7MgPz3e2DtKyEpCA4twgHsMWGVsFlwf0mME95y=
4Y1qCfg7zxabDfZA/42h/Ha9tzqlrT_y1ujgoMl3Efw/h14/btQIAzGnFeDme0DVDCa2kf6yGxH=
pxBevklbSJfrNGFM" style=3D"text-decoration:underline;text-decoration-color:=
#ffffff!important;color:#ffffff!important" target=3D"_blank" rel=3D"nofollo=
w" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps=
://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b19AhO=
ZMy-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW-E9LTlRWOR=
MLctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaAmfJVNSPeUtAlSEOBtutc9nCY=
FbIBUStCsKNv2sTEMoawWbx1iwH3iXq_r9j-Zglgv7qTGFbFHVKcQXvBs_GbVgIjeSooageTjl9=
yWcXxU3ZulcX5i5CiwKeIhs7Kt1NrT0s5Ae43KdM4wjMSjdHRHXVHY478-NpXAsbObjfpela-4w=
w24kpCC1ejo0FVn4IjIKXf8PToOwtpP7CfhcvSejKUfAb90W46AqQg4_PwoVxsv8PgnEzLb_EYu=
peWNDszU4KGquwCQogpnvzrsyyh4JGKJJraskA9V8ZRqZfPJOv7cbZeQ-SmYKhas29sD6lKLTHm=
tmQeZsNSK2-jjx5vt8h5GT6oW4wFnjypUM-lS7U-CD8WaO-JZIwn1Z2JIC5jCTBm5OCoQWvL43N=
L7wZNWWYuyaRduZs-40DBxueYaGWaOao-offum9afDfw-nCpbrpm4NKD0wVHvZFv4_pH-GVYAG2=
l3G_Z3iAg5K1YPtdDB0_qlVuzZM7MgPz3e2DtKyEpCA4twgHsMWGVsFlwf0mME95y4Y1qCfg7zx=
abDfZA/42h/Ha9tzqlrT_y1ujgoMl3Efw/h14/btQIAzGnFeDme0DVDCa2kf6yGxHpxBevklbSJ=
frNGFM&amp;source=3Dgmail&amp;ust=3D1712957600236000&amp;usg=3DAOvVaw385g1F=
5iActq2h4QfDGLxU"> here</a></p><p style=3D"font-family:&#39;Arial&#39;,Helv=
etica,sans-serif;color:#ffffff!important"> =C2=A9 2023 SEED Conference 2024=
 - Valencia </p><p style=3D"font-family:&#39;Arial&#39;,Helvetica,sans-seri=
f;color:#ffffff!important"> Universitat Polit=C3=A8cnica de Val=C3=A8ncia C=
amino de Vera<br>Valencia, Comunidad Valenciana 46022 , Spain </p></td></tr=
><tr style=3D"display:table-row!important"><td align=3D"center" valign=3D"t=
op" style=3D"padding-top:20px" style=3D"display:table-cell!important"><tabl=
e role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"c=
enter" style=3D"display:table!important"><tr style=3D"display:table-row!imp=
ortant"><td align=3D"center" valign=3D"middle" height=3D"32" style=3D"heigh=
t:32px;display:table-cell!important;max-height:32px!important;margin:0px!im=
portant"><a style=3D"line-height:32px!important;text-decoration:none;displa=
y:block!important" href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovp=
c0Duh6W13i1JVnHfTV-osXzaRbZV78wksJE9mGGPgwzX9IN3t4wezuL8pjHQ42uJK6JFvSArMCf=
ZE29DNdTfJ9DZQCdXJGioNN2c8fkZGAINvwDFm_ZdFwmj_g7aDfhW4WkPqFlEFJIxU08p112LW7=
ho0niwgI1M_m8mlqbZpekZYebQSpig2JF_FyBB6jDL2ALlkz4Pw/42h/Ha9tzqlrT_y1ujgoMl3=
Efw/h15/_Bq89SskEBq8UdGdX1ebLuv_jCxgaCO0O9UNrb2PD5E" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W13i1JVnHfTV-os=
XzaRbZV78wksJE9mGGPgwzX9IN3t4wezuL8pjHQ42uJK6JFvSArMCfZE29DNdTfJ9DZQCdXJGio=
NN2c8fkZGAINvwDFm_ZdFwmj_g7aDfhW4WkPqFlEFJIxU08p112LW7ho0niwgI1M_m8mlqbZpek=
ZYebQSpig2JF_FyBB6jDL2ALlkz4Pw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h15/_Bq89SskEBq8U=
dGdX1ebLuv_jCxgaCO0O9UNrb2PD5E&amp;source=3Dgmail&amp;ust=3D171295760023600=
0&amp;usg=3DAOvVaw2jbBWyTxXcgW6bduAGlhHK"><img src=3D"https://ci5.googleuse=
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
om/d/msgid/jailhouse-dev/da29a17c-dd06-49ec-abc5-10195f7e6c36n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/da29a17c-dd06-49ec-abc5-10195f7e6c36n%40googlegroups.co=
m</a>.<br />

------=_Part_208423_80311252.1712871216536--

------=_Part_208422_96191948.1712871216536--
