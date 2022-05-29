Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZMVZ2KAMGQEO2XET3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B56253716F
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 17:01:59 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id q17-20020a0565123a9100b0047889d19f70sf4094870lfu.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 08:01:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653836518; cv=pass;
        d=google.com; s=arc-20160816;
        b=PPdO2hkXqPKoALQI2G3fFes0gBhVBUDCt1HavLxce9fGmvB24gvGUZIpOEvBylrf7K
         BsyT7eBmq6mcLdAJVG7cyOHYF3uVzvqlypzJ6W+9geRa4s6mj/t21dhZUZ6btM1QRzgk
         1dIV+v7xlyn5lYQhdlCbW6Qh7RyEDv07o+UEVVetfV6pRJKmdqqsk0O/XwpsrkJdLuMF
         Wil05V9KxJKP7dDIqum59VOssCIVIYAdRABCMLAKzr1oUuOqeTpZtvhglwJvzxJ/L0s1
         PQDmppYosEmAc3rvaBti5fBoCWhhnE1U84W5lNl5jLEZJ9pYAyIAVQpm/AcS9dMqdrQk
         s6Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=rJ8oYdTQkTVHYpgYn1eJ/SLLVeskeLvhtR3IJszhjEs=;
        b=cHKiZ/jjOI6lurpgqlJkTIWW+2BE48/MUC54LG5TxKVdmXYz22hj1p9BmLRrNFloPM
         tDwMmcyFgf14KY1lDgZhzRErgES+qi4jXKzNVDGod4FDFIjFZ43ps1r4uxzHMGPauq5P
         2POrQU6gYXQ75vNSbkikslOecOf5jJj9QOaVoJ65LNlzK/a6c6mYVKEfpPvMP3jkMf7E
         BZdosFaWpGDV58SCww7DDsnk8wcbW5dLJiIOqBJTfBwk5B5M4lqFWajKiChSyOs/tFjQ
         jmwQcE9eKGuQ95NCcNlsEXI25oNdUqjFmDruN4Sd9bW9vz/Fk3YqqsPiKqkXFJNqsx6N
         iLnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I8F6eNit;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rJ8oYdTQkTVHYpgYn1eJ/SLLVeskeLvhtR3IJszhjEs=;
        b=SUuAmFlliwO5UZrMahbHeSxIIvdByvwQoWXIH6XOCtNcol0IGJnB7esNLmU32z6Pqa
         ZOGqml+B/RZRcQxvFswC3zPWyuLdpunEI1tSwJ/dDUKhqdQHkqLq7baCRQmaajVILkrz
         QZK2faXJ+G2ep2cfbH2HnPVh8FiBxcf3ANeLuaoY4Z6G0ak7eLlaqV8IpRpoX/mVw9Xd
         w73h1q6EcuGQBatgpsX+ht6W3lwKz/02QVrzsnIAiVtyGiHTuVJnvhRfy0f17dwSxS3C
         SWEhVy2ywuQs8O+gHrq6RnUYFwblRHulD8FGiLsTmtZ2wPfKr6y8KJ2pyjm0kun0JfOj
         xOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rJ8oYdTQkTVHYpgYn1eJ/SLLVeskeLvhtR3IJszhjEs=;
        b=OzW3gQZz6JWtuCpKcd+F+rAIyZbW2qHe3l2z2AJi61g5zNJRr1ijgTO2tW50ZTLj1W
         7cjduLPN+2haXs9On8Ql6Qzp3JFFgiHKsf35cvzOLr6/umWDLf8tVqB1/7yS8nUu+rt6
         0CZm/SAKQiQzVMYEzO5/4e4PfSrurCXmvMG9cVQsMhEkl00m9JRUt3MLVth5RFn4LkFe
         6YSHGvQEWtVVyOKiXj3Ukl72Q3lZx+wSxUcooWDPMrK8YTlEIIM7qvqoG1n6bOvweTIk
         0ehdCkE2VfSNlFSQdUUB3AIB9nCl4yo/zr8a5g/LD9EJJ01K2476M5y7hdfyuo+ROHgV
         SAUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531/aGsNyrH5FzUrasAAW2DHk79yWZCTQAvRx7r/O7ul7KYgRVw2
	TTdLZE6f2c2EdcU9QUfzhxA=
X-Google-Smtp-Source: ABdhPJyyNg2VauMz3aseTT4j1UoLG0EpSExuI65SjBYCv/EGtP+QVb6e0lPc+4GC3uEpuDRm56YRkQ==
X-Received: by 2002:a2e:83c9:0:b0:24d:a95d:7b7a with SMTP id s9-20020a2e83c9000000b0024da95d7b7amr30810165ljh.254.1653836518199;
        Sun, 29 May 2022 08:01:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bf11:0:b0:24a:fdc1:7af4 with SMTP id c17-20020a2ebf11000000b0024afdc17af4ls5238323ljr.1.gmail;
 Sun, 29 May 2022 08:01:56 -0700 (PDT)
X-Received: by 2002:a2e:93c8:0:b0:24e:eabd:bf6e with SMTP id p8-20020a2e93c8000000b0024eeabdbf6emr29374039ljh.347.1653836516518;
        Sun, 29 May 2022 08:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653836516; cv=none;
        d=google.com; s=arc-20160816;
        b=YGyVhIEdv8QjsQJ3MWyvzVHOgpFaup6DOXKjazwQb1JLNbYm05K8A8htVbns/hm04h
         o0TLDS9O+hRKpoNf4fDwwMEkhtteMHxM6BK7QnN1MgIJVGcPy8OWWnYmnjI5/0Hdcc+C
         CQXkd6fONyco4iMA0+McUKdSBeNkt7SNEfH6I5kZZIZ9MlNGYTZn5/wmrc1bwV8Jthlh
         O72ir7+tWx/G0SxUo0Fin0hYkJgNeDE77aTMmyBXzXd4kkil1/w276lA1mBZAJEYd4ZJ
         wxtWBa8wvXgOufwhWflOp33NBItfTxr76KkSPzm7IeokZCr5P6I+B9pfBXMTrUTxD3vv
         N4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fkSwHVEwZ7LlBJ6QjIBQinSxlv/surM2tRM0qyMXGcE=;
        b=kd2b/h6t5nL0oe2DDLSLlTQvNKv7H3riACeUTnrMPNgD1wXNiiyJb/LCiCqbcfVWr0
         PzRG2B1T1h5RTuwp3m21Gtg1y3XOTH0FCDoIrTouGlAW5Mfyhz+a4hQWQ5/T4e6xz0K9
         2NXsQyWJ9Nq5QSIh0Yu1PTtM3Y8ucwOITDvlhVzqzDmRZYljXp9m4cfLgKfgUIseJ2x/
         TBeAN7C+zqntuwZ0cnP7K8zIrnE6TD/5Eh8bRlUdNjuAU/NxSpEgC4IDrw7PGy3IG4VZ
         FdCHI6dPc0VKXfwcfJFeFSyk8THF4bXcazFpMiL3oXeoL52muJon2dWhKYJtao2klrPf
         cAWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I8F6eNit;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id v16-20020ac258f0000000b004785b6eac92si345244lfo.7.2022.05.29.08.01.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 08:01:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.20.10.4] ([109.42.112.134]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5Qq9-1nw9uI1Cir-001e8a; Sun, 29
 May 2022 17:01:55 +0200
Message-ID: <3ed840dd-2aa5-b578-617b-cad9e8fd6667@web.de>
Date: Sun, 29 May 2022 17:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com>
 <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com>
 <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com>
 <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
 <5172e723-49ce-a870-2066-d22f44115da3@siemens.com>
 <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
 <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de>
 <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
 <1a407933-180e-48fa-760c-1c90e159eb2f@web.de>
 <CA+V-a8sFJc+uFp+n6G+fUFNX1u6oDwbG4Ge=+2yrhoh8FQ-UfQ@mail.gmail.com>
 <69a0ae1d-1ee9-e99b-f190-d534ce86c227@web.de>
 <CA+V-a8vhKb7ic998w275ajCjXSC0QmsnutAkDK-csJmP9DYzrg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <CA+V-a8vhKb7ic998w275ajCjXSC0QmsnutAkDK-csJmP9DYzrg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vvhuKiNbuwCyy26Oxv/ZQHcgenq7J++CLKveyLQoHIPO5tkQHE3
 tSVctDCMkPA45oMtAeAfUd4VU81LGw/0LtDecrqIc3I0WoE9sbcgicTUio+CTTl68x3yUcb
 wSyq3fVCK3UAVd9RoLTh0xBxVIx+ev3FslfhnqDSnXYbLKpSM2FFDQiuMsHZ3KDWw2WoPWr
 rnqWPd9xhAcCT8dsrQA7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sOfJF5PSNrQ=:OIdPYsxH/xKIFBw4ICD/Fc
 NydS28PInDwmgarTXKo9RJKxom+1QoicrO+RbsoTpRl2OiOki9XsjDWMDVFcKKDLD8nQJ2ecJ
 oDNK8wmodmetp2W0ZUEIkPNcWNW5VcjWReAxmQvZp7IJd2r+UTaq741aaqw/HmSInnXxDc5Gs
 3/U+cHFoMyZXkwr4NX58jn4LDdtg2Nnkf/g3fall9rkAJyCMdoNX+hPBh9SYlR2O4e2DSGctU
 Gt/4RYEYGtKb82uRP/ItXEAHRo8jqE188h91f3QcLsz5h+NEGe9jPBYTrYDsLakeWwYHCA0/O
 T2YtxZKlimIOXxXIk2Zdx7TMWjBjTsqfHuJl5lZVdadlkJEQVdKzUueVtCIWXrBnsDBT0FCx+
 Us+kRMDqn88XkcVQR7fKM+0NXrDyXZwQ3i4L4WRAbm0WSyvZz9Yxlj64H9vN0if9ciP/v5/tP
 G7DdmRmgXesBXkf92Caq8hMx1082+EMV+oxKQ/q9+ROe+fBrEGyTzvFCErieIvC4inhBkE4Cf
 5Uek8cwzv7x13Z+3zZr69DNRbRmMD2GxRrjc/+t/S3f/kg/qVPxkrnALQgmCTJ/aAV+sQ3uOR
 a7SyyoCiGgXERSeWnNMfLAVDmr8+Y3dQT4nmA5bp5FEsWogxq+mBLM+A4Z4l4zX99VZPCkzXc
 vYev7zYipOmC2MYoYae21ffzcXLnPJSQYOYVoUEbX1rIkWB+M3cp42RSrQRc0DTjpDtT9VFDv
 24FXk88bOpDax/k/eih4MZFY/o28vpDhbKCx26z/5/wdNUsPJpeZHKhH2lCCaGHNWnvzFokhc
 epVnTLaoS270Q/KmCZNu2gUIDN+fhHsyeq0ubxmZYVQ+VTNCc8Dz+kRPJCbV5JOkTlmodM4JX
 8QL6iNc1WPNHxLoHLk3xBvvn4vWirZk2Znkgjchcnem5YXJR/GaJvhyBfPmxzfchrGDKwPX10
 Do5vFUrR/u53HTl8QodIkSQ3UVwxZXSUYX3hVvFqCXHZGobXMfjg6hAAuJPF/nZph0feqbVwQ
 KOEo2qPwJQgmH8AIFrEVEuSz+r0SkgqS/P3ULQnVZwTINgYNlq5Y9WSG+mOA3UgB6SwSEomNq
 i9q7UVn92+DxZNZurSKhrgdfHtKMMfKSaY1RYNmmBZ0Uc5By7aMaTuJOQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=I8F6eNit;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 29.05.22 16:44, Lad, Prabhakar wrote:
> Thanks, after updating gicv_base to 0xf106f000 I get an "forbidden
> access" error, looking at the address it belongs to ethernet
> "e6800304" and this is configured in the memory regions
>
>         /* AVB */ {
>             .phys_start = 0xe6800000,
>             .virt_start = 0xe6800000,
>             .size = 0x800,

This turns the region into a so-called sub-page (see
JAILHOUSE_MEMORY_IS_SUBPAGE), and then...

>             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                 JAILHOUSE_MEM_IO,

...you also need to specify the permitted access width for registers in
that sub-page (JAILHOUSE_MEM_IO_{8,16,32,64}). If unaligned accesses are
ok (unlikely), also set JAILHOUSE_MEM_IO_UNALIGNED.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3ed840dd-2aa5-b578-617b-cad9e8fd6667%40web.de.
