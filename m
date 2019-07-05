Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBL6T73UAKGQEJHGD7OA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DC660BE1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 21:49:04 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id i13sf331343lfj.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 12:49:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562356144; cv=pass;
        d=google.com; s=arc-20160816;
        b=gMmjHmU1xvIke+iS3Dspb9QLafY3lil3K+tIqrnbERimrRtBxTZaqasC3DA3wVwiy0
         09MUIahKX64yZitc2pctF/m5crroiU28PPUpimOtxGH7UEf9BD7Jd8DvLfgIxorj8ucz
         YAyZUbyF7nW5YpJ6f975uv9qTTIOqvUXEW+UxwDmNgf57Mr9Ey2y9avnu7fEiYmj3xwa
         q2bpKYZvwq4GxNr/GfZ5A73FVJBG3pPCJbnrNko3p4URLqZOFoUlbsDG7qVK9Hnsf9rA
         i7GKCnjY+O1XWri/lFiS7PNy/x1rk8H9ccZ2+p8WsByc2Mjm62NF3t/Kt25i4Fv+srNJ
         lfWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:to:sender:dkim-signature;
        bh=ckO+x0PJ8JT/fd9UBYz5TaziJqV3y4nq0JBFR15uAi8=;
        b=nKzTp8FNaIrVtqYgTD/Gp6sBhCZXdxZCtcjqJWbyNQGfcxqltHwBGsBCikX83epsZb
         EfL6BeqwqqZJcynKLu4iMFCNgO4UW0VuzFkRf3DmO0PnDVISFWzyykjNbLIPZVJXENzq
         jbm3KtxAffDrcpIfJaSsNijQ5AHcx6/1OdTmr4QflgeUj0Cz3w9cmeDbtPOwBiDsPFl0
         SEQxRhiaackNkqMUOwClqIIco7iGO6+nVj/JhoLJe7dzMWSgT0sku18951goPyhTH0FE
         vJlBxyyVCp0phGqKIrHBD1tC9Gj77uU5hGuDNcoSfCqqOExTRmz8Z/xab2byMmkTcHgB
         TfQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=S6CzGEMs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ckO+x0PJ8JT/fd9UBYz5TaziJqV3y4nq0JBFR15uAi8=;
        b=Fi60agV5VKw++pvDTC1WFwK9XVEdYMqYUQ6n3eZbNVCqGTW6Twvco++5c+tHHaqXmX
         WnfEwzOSVn/dcrsrh6TeQvJjTAerhWKwd5hHGT34tS9Lq6f/OaaQnfxJZkkh9rgyvIub
         4N+m84R8iKU8voeZOsru2HVfoKhIudP/SzzsX+rFLOb0+8P4e0LiqHcMbonVRRPzfStJ
         gtXIGz/Tg2ZBKA7HjhHYY35p9GAg4Sv84DbgZB1XxM1xt4YpllYhLVeBuwy/nB8/L312
         tQytkTm+HIXxFArLx6qdT16/ZuVg/dw2jF6FsxU6iBVM+Qr8zqT02pJv0NROzfMo/hnT
         9jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ckO+x0PJ8JT/fd9UBYz5TaziJqV3y4nq0JBFR15uAi8=;
        b=CF/VlnOeaxtNrwsYXurBusBXq7aOuI9YwQKtxwlFU99+iFPPzFja0vdxvw+8vmmtdx
         hLSfUV5vAI6tQ+3gJyoaIiZ/VUm1jJ+nFlGopdgfPTKWCe6Q0lWws2IQxt8PiW2FbNYq
         3v0WTXgoeQzy0zLbKtO9OYJlQ5hB+vLWgHNpg/t4gaM19GXtgi5fu1K8+Iv2Qh83CVZj
         h/M9P0/cdE1NJCIGJwWbvWcOx7TC9jbNtcTx2HuJwKGYxLREZiXpzkj3dM0M7iOsn+58
         6D1MV9wu/ieqPVfMpZ6OGNr/Psp3SV7htm5lF2TWRllBHWrHoQOGMXAWuOj50xv+coML
         7bBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUNZY3hnowFqFiNCfvDir/z+v3nQ1TDyhFuqOqkNswmMtXViRSY
	wxFQS6auH+OTqTIN1kuLexs=
X-Google-Smtp-Source: APXvYqwfwGt7+3eERTJsIVEH29Q++wEb1wCHGcoblzGwlvbGyese/h7C63dfDpY3cWUnBFk4BX6EBw==
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr3098077ljc.240.1562356144220;
        Fri, 05 Jul 2019 12:49:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d0c:: with SMTP id t12ls1222634lji.12.gmail; Fri, 05
 Jul 2019 12:49:03 -0700 (PDT)
X-Received: by 2002:a2e:9192:: with SMTP id f18mr3117271ljg.52.1562356143551;
        Fri, 05 Jul 2019 12:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562356143; cv=none;
        d=google.com; s=arc-20160816;
        b=p8/GqEycrxVT8cJ+1hFOLNn5YZBkVCYj52TFCK82/0CY0y8rhfSKTO2otS4UuQLYB/
         IevMtfBjRV3QvZJFwUTeuMefSiCzC4WBXEuCxmv0LogxjFkPZvpfRWqCLPw4VpG+321z
         BZmPNQXHfpmc2azp9++dpqrj1lN8+WISn8xjCeplsuSKKC32/A9ANoUoCsnVpRl9oQRF
         hP9uuS0EO/eUVKXXoft8tDs6EgPfpYF2HbxREM9k6CbGEEQU13Qi/9FGkwtL1tlk0Chg
         7a8vjvc1rV+ZKp0skkzQmVWLtBugBkA4pkL1BGaDalJihZzKtVL3WBh7EdF2lkwx8Bj/
         W2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=WvQWgTvfu9/h+HIK3JvaoYcgkHLO+YRczfNwfGNHVBE=;
        b=ctw5mwpMxyXPaEe3U0PfsVmHh98++489Ul4rSlPHLh1E/vb7b8g4M9pA/Tc+BLXu6N
         p29+3rpYxyw6Nb5vZe2DsPG+6Qao9cEGObQ3pkgudXkGDBkNcr2EQzI/j498XfLJyNeD
         ksG8Y9cdcbDaaKqaoymYdcA06BiZa0GfkqFAhRi/L9FzKVSI7AVhNLx7Q4UUFCDwEmSt
         hkc1ZOZgurveg0zuvHxv4LUOXY50UGQzG/9xnFwKesiH5J2JqcWjkYlm90L761wK5DUR
         3BNSx4PyKgqDpDxXhh6SjJv+NYS5UBHkk8d4TqXEtKl1NmSPQxgVs2k2y6Dm+hoDbuOi
         8JwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=S6CzGEMs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q11si625427ljg.2.2019.07.05.12.49.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 12:49:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45gQQQ2Swczy9f;
	Fri,  5 Jul 2019 21:49:02 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 5 Jul 2019
 21:49:01 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
 <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
 <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
 <9a4b887f-a641-cacf-763b-53dbd1c229a2@siemens.com>
 <dd55c1a5-8863-5f94-b339-bebc221dfc6f@oth-regensburg.de>
 <7adc75a2-c777-6f35-6652-99dd5212926b@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFsT8OUBEADEz1dVva7HkfpQUsAH71/4RzV23kannVpJhTOhy9wLEJclj0cGMvvWFyaw
 9lTRxKfmWgDNThCvNziuPgJdaZ3KMlCuF9QOsW/e2ZKvP5N1GoIperljb3+DW3FFGC8mzCDa
 x6rVeY0MtSa9rdKbWKIwtSOPBgPk7Yg+QkF0gMHyDMjKrNPolnCZjypAIj81MQfG0s6hIwMB
 5LXZPl9WL2NwcBWxU71NBhyTvtVMy6eCPTDIT+rDIaIjdqXUbL8QBzaApxSLAgb7Nbatkx7k
 3LjqflPMmtQfQ67O1qS/ILe5DrYjGbwZWYb2xmXNwJvEENIDou9Wnusxphh1P1acnn+9DIjQ
 9/A+/zCiube3tgCpv5sq8++knQChn2NLMrHlVsRCgGApciO7/0hCvcS9mGE1JM3Nmwfs2wqW
 vG9vhv3uBJHjH4C8s5UCvF/44E22+bBqsrLUlr5d+YRNtY+LCH1rwNIrzNtfZraq0hPiI8pv
 P4GpvHDmrsGTyG9YbD33XiI7DD8IaAtwld7wSkMmt07NRhyxVsPc1ZIBQMyS28VvuLbDK4f6
 WyjQMJmA8EQspEmNcTFG6LnmW+7PGad2Nt7RhHRs4e4JkT8WckWzTCRzlRusyr13SbiFWznt
 +29Q47elnVUG3nB2h1VGZofX+myYJS0uX4BQ2G7sO+LrBY4HXQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPhYhBMAttVrc
 MMGXiLwkKnP5TRHIUlLMBQJbE/EnAhsDBQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 AAoJEHP5TRHIUlLMICYQALEBOS5+OegeYvi/8qwcXWTtSPu6/L6z2kgh6XCii8zH8Rn9T1mB
 xzA5h1sBku1wIH+xloRxNNmZlxNyJOML5zMng8cLw/PRTDZ3JdzIFFw7bssAgDiLzr8F0gTq
 bRrAwFCDuZMNCJgJhxRrPRNSrZovqUeaSUAxw10Dea3NgcvJ1SLtClBaU2+U7dHQdBINBLXm
 UAg54P6voe/MhkPEwESRHWKsiEWBp4BBPv8AjXnYAth6F9LZksugF4KZMPWnEgXNjw6ObD6C
 T7qA46/ETXBcxI05lQFs3G9P6YpeOmH1V5pRWb2pS/f9vDudU52QRcAIUir0yjR45tmgJMLV
 oRR7xRyj/BXqBHbzjilg3GDZMiUtfjg6skr++du79b7xnoEgzHR/ByHW67MCbjcuTmpTeXBK
 Iq61He/l2NETfy+2ZnWOUNC7/lZHdfrEyHR3Q3S7TQbkm80TXE05Cfb5NXtZxlbCNxFEMtCT
 UeaUX0NtsHfRDNBzFY6pKSpg8EXDtEFe8+utLekEZ6lFgQ5ZJ1c9NfaOiRJ/NrnQfqAEXUyo
 uILPmXK+3UiFlWtmIIzSQ/Wd+4pJtM291zt0umnxboOZc1mOU9B2wKT3mnA3HxQ1LiRIT9j8
 l8iT6TwRB/aiiXa51hN4R7rfSQMxK6a93EAyUZSoWFpZiBo1/5PynB4zuQINBFsT8OUBEAC9
 HeOKJ/KJ861Q/5C1qwHRK95nJiwCCpASxip68e3ZW9vPTV3VmcQ3tPNRBLPZW1S+IV6DL8/j
 HnopXyyrFBkSJYEAtKkBI5xO6olYglCJqhJ5GdE2WIxvFfTkKwXf3gYc7zuif/5tS7D4XeEH
 wScrncFHCxDSUCXyGM/lnLhu3HfQbK49whpel67uteHrXC4tCMzaTy1SOwlXQi4nufxfARBe
 PT2udi+aZCs4a5bTqvEllPsWRsab4JjTsd831VLYCeRM6siKkzzv9nUjBjTri2cPm0FDS80X
 vQVHEw4bP+V4EvcrarNh/9VmCypuH23qRsAX33mLhB94aBoE6afCkWG5G2m24pj3NCkdA0MG
 IleuuD4/I+6+31Dip53AMvx5EDepMrA2b7gsQOKidgDe1fz/j1qkszmQlxlcb/LruXMWWY7L
 3NcwGUjNRfH0KiSyQ6GMtU5ECu8/o4fecOee76fHTviI6h7jSL3O0AKJadUXekAfhyVS/zUD
 iZTv2zI4wAyxIWj3AFVXXeb1T4UG+k4Ea+M7+jtgGUz/K3/mDYXWWRHkT5CMZLiU8BCdfewg
 Zp94L5KOWDYCeX5LWworOwtkoePd9h5g7L2EBbeINk8Ru018FkEiqALN03vPI8KYNXb6epUg
 xhdvhaPoSD3aCnQttvU8lN70cKBGMwTZYwARAQABiQI8BBgBCAAmFiEEwC21WtwwwZeIvCQq
 c/lNEchSUswFAlsT8OUCGwwFCQWjmoAACgkQc/lNEchSUswevA//RM2YQI1Z3QMBRMr/5As0
 2zXcJFp+j07wkO9avm8U7GwjPjLHGVvs44rTSc0IKSsIKCJDSqNod9jd2iR39lr5/FpRiRk/
 7A1ACZUagASNC+PiyCCjlg34bWulzVmb5ozjqKQqgYww4c6D0P44JDUtedVbKd7HdwjjzP0P
 cubSgAohnXzrkp3gtVg07KeoQyiZctJqJu9Z84MiXMIQ+G75mFkIJEL4WYIkcJ9pamUHX71Y
 T1s6qtrqXemn25w87TioHUMcW4wRXhHHJ4gDbe/P9wb9XKS41ks0kiTia1ZcFsf6QQzoCoK1
 R8ahGzsqvCRHMR7fU5w25qXAPfS5ENZgH0KcAVi1bDjwDyhQk3PfPiraiHmtEz2IlthAPpRD
 Drr0lqCvDFNtqaC+ZI0eOmTvy6/zfVh7ODmaDq1KqMu5EB9ojHXM7N6XXN8OubY+lNx+q0T5
 STssqr8EKkrHp6rw2OQHCX7uaEQri2GEJW4HowVvlashmxC4bxR8B4gbm+EB8gR8PD7BSZQG
 k5NkPOqUZJXq1HO+d5Udk1WdT+mkFGwIMN/U9t3gJNWkab+aAYg1mKwdz7B+10j51vbQbFgY
 2/n9jtl/AFgfYQocbJta5+0fOwIJObNFpLAotvtFNF+Q164Bc3E7Njh230nFduU/9BnmCpOQ
 RncIIYr0LjXAAzY=
Subject: Re: Having trouble setting up a shared PCI device in root cell
Message-ID: <479fadb9-f346-0666-fed5-a1bed2b298c8@oth-regensburg.de>
Date: Fri, 5 Jul 2019 21:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7adc75a2-c777-6f35-6652-99dd5212926b@siemens.com>
Content-Type: multipart/mixed;
	boundary="------------1BA7A4D3F24FB766E0D6FBA9"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=S6CzGEMs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

--------------1BA7A4D3F24FB766E0D6FBA9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On 7/1/19 6:46 PM, Jan Kiszka wrote:
>> Got it running. The issue was that the config generator fully mapped all
>> PCI Bus regions:
>>
>> /* MemRegion: 380000000000-380fffffffff : PCI Bus 0000:00 */
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x38000=
0000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x38000=
0000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x1000000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE,
>> },
>> [...]
>>
>> So access wasn't intercepted at all as those pages were fully mapped.
>> After commenting out all of those regions everything works as expected
>> (well, not tested against another endpoint, but at least ivshmem-net
>> successfully probes).
>>
>> The config generator created those regions. Happens on master, next and
>> older versions. I guess this happens as those regions don't have any
>> siblings -- they should probably be filtered out. Find the iomem
>> attached.
>>
>> BTW: This behavior can be reconstructed by running the config generator
>> on the qemu virtual target for x86.
>=20
> Ugh. Needs fixing...
>=20
> Seems the longer I wait with the release, the more pieces are falling
> off (currently fighting against broken dt overlays, thus virtual PCI, on
> ARM with latest kernels, including stable ones).
>=20
> Jan

We still have some issues adding ivshmem-net to the root and non-root
Linux cell. Devices successfully probe on both endpoints, the hypervisor
reports that the connection is established. Nevertheless, I can't
send/receive packets.

Looks like the device doesn't come really up, but ifconfig reports the
device would be up (on both sides). If I send packets over the
interface, I don't get a call on any function of ivshmem-net.

After initialisation, ivshmem_net_run immediately returns, as
'in->lstate < IVSHMEM_NET_STATE_READY' is true: in->lstate stucks in
INIT state.

I suspect this is probably caused by a configuration mistake, but I
don't see anything suspicious in the configuration. Please find the
sysconfig, and the inmate config attached. (dactales is just the name of
our linux non-root inmate).

Am I missing anything there?

BTW: When are packets being sent over the interface? Do I need a remote
endpoint, or are packets also sent without having a peer?

The reason why I ask: I'm not entirely sure, if I'm able to send/receive
interrupts in the non-root world.

There, ivshmem-net registers int 24:
 24:          0   PCI-MSI 16384-edge      ivshmem-net[0000:00:01.0]

Does the non-root cell the corresponding irqchip?

IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31

Currently, non-root only sees IOAPIC[0], and afaict, the jailhouse
paravirt driver only registers ioapic[0].

Thanks
  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/479fadb9-f346-0666-fed5-a1bed2b298c8%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

--------------1BA7A4D3F24FB766E0D6FBA9
Content-Type: text/x-csrc; name="dell.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="dell.c"

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the followi=
ng
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the=

 *    documentation and/or other materials provided with the distribution=
=2E
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS=
 BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER I=
N
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE=
)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=

 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for Dell Inc. PowerEdge T440
 * created with '/usr/local/libexec/jailhouse/jailhouse config create fre=
sh_dell.c'
 *
 * NOTE: This config expects the following to be appended to your kernel =
cmdline
 *       "memmap=3D0x200000000$0x100000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#include "dell.h"

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[63];
	struct jailhouse_irqchip irqchips[5];
	__u8 pio_bitmap[0x2000];
	struct jailhouse_pci_device pci_devices[124];
	struct jailhouse_pci_capability pci_caps[80];
} __attribute__((packed)) config =3D {
	.header =3D {
		.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
		.revision =3D JAILHOUSE_CONFIG_REVISION,
		.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory =3D {
			.phys_start =3D HYPERVISOR_BASE,
			.size =3D HYPERVISOR_SIZE,
		},
		.debug_console =3D {
			.address =3D 0x3f8,
			.type =3D JAILHOUSE_CON_TYPE_8250,
			.flags =3D JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info =3D {
			.pci_mmconfig_base =3D 0x80000000,
			.pci_mmconfig_end_bus =3D 0xff,
			.x86 =3D {
				.pm_timer_address =3D 0x508,
				.vtd_interrupt_limit =3D 512,
				.iommu_units =3D {
					{
						.base =3D 0xc5ffc000,
						.size =3D 0x1000,
					},
					{
						.base =3D 0xe0ffc000,
						.size =3D 0x1000,
					},
					{
						.base =3D 0xfbffc000,
						.size =3D 0x1000,
					},
					{
						.base =3D 0xaaffc000,
						.size =3D 0x1000,
					},
				},
			},
		},
		.root_cell =3D {
			.name =3D "RootCell",
			.cpu_set_size =3D sizeof(config.cpus),
			.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
			.num_irqchips =3D ARRAY_SIZE(config.irqchips),
			.pio_bitmap_size =3D ARRAY_SIZE(config.pio_bitmap),
			.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
			.num_pci_caps =3D ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus =3D {
		0x0000000000000fff,
	},

	.mem_regions =3D {
		/* MemRegion: 00000000-0009ffff : System RAM */
		{
			.phys_start =3D 0x0,
			.virt_start =3D 0x0,
			.size =3D 0xa0000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-00ffffff : System RAM */
		/* MemRegion: 01000000-02ffffff : Kernel */
		/* MemRegion: 03000000-5411001f : System RAM */
		/* MemRegion: 54110020-5414145f : System RAM */
		/* MemRegion: 54141460-5414201f : System RAM */
		/* MemRegion: 54142020-5417345f : System RAM */
		/* MemRegion: 54173460-5420401f : System RAM */
		/* MemRegion: 54204020-5421c65f : System RAM */
		/* MemRegion: 5421c660-5428301f : System RAM */
		/* MemRegion: 54283020-5428b05f : System RAM */
		/* MemRegion: 5428b060-56101fff : System RAM */
		{
			.phys_start =3D 0x100000,
			.virt_start =3D 0x100000,
			.size =3D 0x56002000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 5e10a000-5f531fff : System RAM */
		{
			.phys_start =3D 0x5e10a000,
			.virt_start =3D 0x5e10a000,
			.size =3D 0x1428000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 5f610000-611bdfff : System RAM */
		{
			.phys_start =3D 0x5f610000,
			.virt_start =3D 0x5f610000,
			.size =3D 0x1bae000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 651be000-6c2cefff : System RAM */
		{
			.phys_start =3D 0x651be000,
			.virt_start =3D 0x651be000,
			.size =3D 0x7111000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 6e7cf000-6f5fefff : ACPI Non-volatile Storage */
		{
			.phys_start =3D 0x6e7cf000,
			.virt_start =3D 0x6e7cf000,
			.size =3D 0xe30000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 6f5ff000-6f7fefff : ACPI Tables */
		{
			.phys_start =3D 0x6f5ff000,
			.virt_start =3D 0x6f5ff000,
			.size =3D 0x200000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 6f7ff000-6f7fffff : System RAM */
		{
			.phys_start =3D 0x6f7ff000,
			.virt_start =3D 0x6f7ff000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 90000000-90007fff : 0000:01:00.0 */
		{
			.phys_start =3D 0x90000000,
			.virt_start =3D 0x90000000,
			.size =3D 0x8000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 90100000-9013ffff : 0000:04:00.0 */
		{
			.phys_start =3D 0x90100000,
			.virt_start =3D 0x90100000,
			.size =3D 0x40000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 90140000-9017ffff : 0000:04:00.1 */
		{
			.phys_start =3D 0x90140000,
			.virt_start =3D 0x90140000,
			.size =3D 0x40000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91000000-912fffff : efifb */
		{
			.phys_start =3D 0x91000000,
			.virt_start =3D 0x91000000,
			.size =3D 0x300000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92000000-927fffff : 0000:03:00.0 */
		{
			.phys_start =3D 0x92000000,
			.virt_start =3D 0x92000000,
			.size =3D 0x800000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92808000-9280bfff : 0000:03:00.0 */
		{
			.phys_start =3D 0x92808000,
			.virt_start =3D 0x92808000,
			.size =3D 0x4000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92900000-92907fff : 0000:01:00.0 */
		{
			.phys_start =3D 0x92900000,
			.virt_start =3D 0x92900000,
			.size =3D 0x8000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92a00000-92a0ffff : tg3 */
		{
			.phys_start =3D 0x92a00000,
			.virt_start =3D 0x92a00000,
			.size =3D 0x10000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92a10000-92a1ffff : tg3 */
		{
			.phys_start =3D 0x92a10000,
			.virt_start =3D 0x92a10000,
			.size =3D 0x10000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92a21000-92a2ffff : tg3 */
		{
			.phys_start =3D 0x92a21000,
			.virt_start =3D 0x92a21000,
			.size =3D 0xf000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92a30000-92a3ffff : tg3 */
		{
			.phys_start =3D 0x92a30000,
			.virt_start =3D 0x92a30000,
			.size =3D 0x10000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92a40000-92a4ffff : tg3 */
		{
			.phys_start =3D 0x92a40000,
			.virt_start =3D 0x92a40000,
			.size =3D 0x10000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92a51000-92a5ffff : tg3 */
		{
			.phys_start =3D 0x92a51000,
			.virt_start =3D 0x92a51000,
			.size =3D 0xf000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92b00000-92b7ffff : ahci */
		{
			.phys_start =3D 0x92b00000,
			.virt_start =3D 0x92b00000,
			.size =3D 0x80000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92b80000-92bfffff : ahci */
		{
			.phys_start =3D 0x92b80000,
			.virt_start =3D 0x92b80000,
			.size =3D 0x80000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c00000-92c0ffff : 0000:00:14.0 */
		{
			.phys_start =3D 0x92c00000,
			.virt_start =3D 0x92c00000,
			.size =3D 0x10000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c10000-92c13fff : 0000:00:1f.2 */
		{
			.phys_start =3D 0x92c10000,
			.virt_start =3D 0x92c10000,
			.size =3D 0x4000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c14000-92c15fff : ahci */
		{
			.phys_start =3D 0x92c14000,
			.virt_start =3D 0x92c14000,
			.size =3D 0x2000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c16000-92c17fff : ahci */
		{
			.phys_start =3D 0x92c16000,
			.virt_start =3D 0x92c16000,
			.size =3D 0x2000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c18000-92c180ff : 0000:00:1f.4 */
		{
			.phys_start =3D 0x92c18000,
			.virt_start =3D 0x92c18000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c19000-92c19fff : 0000:00:16.4 */
		{
			.phys_start =3D 0x92c19000,
			.virt_start =3D 0x92c19000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c1a000-92c1afff : 0000:00:16.1 */
		{
			.phys_start =3D 0x92c1a000,
			.virt_start =3D 0x92c1a000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c1b000-92c1bfff : 0000:00:16.0 */
		{
			.phys_start =3D 0x92c1b000,
			.virt_start =3D 0x92c1b000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c1c000-92c1cfff : 0000:00:14.2 */
		{
			.phys_start =3D 0x92c1c000,
			.virt_start =3D 0x92c1c000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c1e000-92c1e0ff : ahci */
		{
			.phys_start =3D 0x92c1e000,
			.virt_start =3D 0x92c1e000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c1f000-92c1f0ff : ahci */
		{
			.phys_start =3D 0x92c1f000,
			.virt_start =3D 0x92c1f000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 92c20000-92c20fff : 0000:00:05.4 */
		{
			.phys_start =3D 0x92c20000,
			.virt_start =3D 0x92c20000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ab000000-ab007fff : 0000:17:00.0 */
		{
			.phys_start =3D 0xab000000,
			.virt_start =3D 0xab000000,
			.size =3D 0x8000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ab100000-ab100fff : 0000:16:05.4 */
		{
			.phys_start =3D 0xab100000,
			.virt_start =3D 0xab100000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ab200000-ab207fff : 0000:17:00.0 */
		{
			.phys_start =3D 0xab200000,
			.virt_start =3D 0xab200000,
			.size =3D 0x8000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c6000000-c6000fff : 0000:64:05.4 */
		{
			.phys_start =3D 0xc6000000,
			.virt_start =3D 0xc6000000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: e1000000-e10fffff : 0000:b3:00.0 */
		{
			.phys_start =3D 0xe1000000,
			.virt_start =3D 0xe1000000,
			.size =3D 0x100000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: e1100000-e110dfff : megasas: LSI */
		{
			.phys_start =3D 0xe1100000,
			.virt_start =3D 0xe1100000,
			.size =3D 0xe000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: e110f000-e110ffff : megasas: LSI */
		{
			.phys_start =3D 0xe110f000,
			.virt_start =3D 0xe110f000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: e1200000-e1200fff : 0000:b2:05.4 */
		{
			.phys_start =3D 0xe1200000,
			.virt_start =3D 0xe1200000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fdabffff : pnp 00:04 */
		{
			.phys_start =3D 0xfd000000,
			.virt_start =3D 0xfd000000,
			.size =3D 0xac0000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdad0000-fdadffff : pnp 00:04 */
		{
			.phys_start =3D 0xfdad0000,
			.virt_start =3D 0xfdad0000,
			.size =3D 0x10000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdc6000c-fdc6000f : iTCO_wdt */
		{
			.phys_start =3D 0xfdc6000c,
			.virt_start =3D 0xfdc6000c,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe011000-fe01ffff : pnp 00:04 */
		{
			.phys_start =3D 0xfe011000,
			.virt_start =3D 0xfe011000,
			.size =3D 0xf000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe036000-fe03bfff : pnp 00:04 */
		{
			.phys_start =3D 0xfe036000,
			.virt_start =3D 0xfe036000,
			.size =3D 0x6000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe03d000-fe3fffff : pnp 00:04 */
		{
			.phys_start =3D 0xfe03d000,
			.virt_start =3D 0xfe03d000,
			.size =3D 0x3c3000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe410000-fe7fffff : pnp 00:04 */
		{
			.phys_start =3D 0xfe410000,
			.virt_start =3D 0xfe410000,
			.size =3D 0x3f0000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start =3D 0xfed00000,
			.virt_start =3D 0xfed00000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed12000-fed1200f : pnp 00:01 */
		{
			.phys_start =3D 0xfed12000,
			.virt_start =3D 0xfed12000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed12010-fed1201f : pnp 00:01 */
		{
			.phys_start =3D 0xfed12010,
			.virt_start =3D 0xfed12010,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed1b000-fed1bfff : pnp 00:01 */
		{
			.phys_start =3D 0xfed1b000,
			.virt_start =3D 0xfed1b000,
			.size =3D 0x1000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed1c000-fed3ffff : pnp 00:01 */
		{
			.phys_start =3D 0xfed1c000,
			.virt_start =3D 0xfed1c000,
			.size =3D 0x24000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed45000-fed8bfff : pnp 00:01 */
		{
			.phys_start =3D 0xfed45000,
			.virt_start =3D 0xfed45000,
			.size =3D 0x47000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fee00000-feefffff : pnp 00:01 */
		{
			.phys_start =3D 0xfee00000,
			.virt_start =3D 0xfee00000,
			.size =3D 0x100000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ff000000-ffffffff : pnp 00:01 */
		{
			.phys_start =3D 0xff000000,
			.virt_start =3D 0xff000000,
			.size =3D 0x1000000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 300000000-87fffffff : System RAM */
		{
			.phys_start =3D 0x300000000,
			.virt_start =3D 0x300000000,
			.size =3D 0x580000000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 56102000-5e109fff : ACPI DMAR RMRR */
		/* PCI device: b3:00.0 */
		{
			.phys_start =3D 0x56102000,
			.virt_start =3D 0x56102000,
			.size =3D 0x8008000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 6f441000-6f443fff : ACPI DMAR RMRR */
		/* PCI device: 00:14.0 */
		{
			.phys_start =3D 0x6f441000,
			.virt_start =3D 0x6f441000,
			.size =3D 0x3000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: HYPERVISOR_END-IVSHMEM_BASE: JAILHOUSE Inmate Memory */
		{
			.phys_start =3D INMATE_BASE,
			.virt_start =3D INMATE_BASE,
			.size =3D INMATE_SIZE,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* IVSHMEM shared memory region */
		{
			.phys_start =3D IVSHMEM_BASE,
			.virt_start =3D IVSHMEM_BASE,
			.size =3D IVSHMEM_SIZE,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips =3D {
		/* IOAPIC 8, GSI base 0 */
		{
			.address =3D 0xfec00000,
			.id =3D 0x3f0f8,
			.pin_bitmap =3D {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 9, GSI base 24 */
		{
			.address =3D 0xfec01000,
			.id =3D 0x3002c,
			.pin_bitmap =3D {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 10, GSI base 32 */
		{
			.address =3D 0xfec08000,
			.id =3D 0x162c,
			.pin_bitmap =3D {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 11, GSI base 40 */
		{
			.address =3D 0xfec10000,
			.id =3D 0x1642c,
			.pin_bitmap =3D {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 12, GSI base 48 */
		{
			.address =3D 0xfec18000,
			.id =3D 0x2b22c,
			.pin_bitmap =3D {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_bitmap =3D {
		[     0/8 ...   0x3f/8] =3D -1,
		[  0x40/8 ...   0x47/8] =3D 0xf0, /* PIT */
		[  0x48/8 ...   0x5f/8] =3D -1,
		[  0x60/8 ...   0x67/8] =3D 0xec, /* HACK: NMI status/control */
		[  0x68/8 ...   0x6f/8] =3D -1,
		[  0x70/8 ...   0x77/8] =3D 0xfc, /* RTC */
		[  0x78/8 ...  0x3af/8] =3D -1,
		[ 0x3b0/8 ...  0x3df/8] =3D 0x00, /* VGA */
		[ 0x3e0/8 ...  0xcff/8] =3D -1,
		[ 0xd00/8 ... 0xffff/8] =3D 0, /* HACK: PCI bus */
	},

	.pci_devices =3D {
		/* PCIDevice: 00:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x0,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 9,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:05.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x28,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:05.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x2a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:05.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x2c,
			.bar_mask =3D {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 11,
			.num_caps =3D 3,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x40,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:08.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x41,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:08.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x42,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x88,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 14,
			.num_caps =3D 1,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:11.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x8d,
			.bar_mask =3D {
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfff80000,
			},
			.caps_start =3D 15,
			.num_caps =3D 3,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xa0,
			.bar_mask =3D {
				0xffff0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 18,
			.num_caps =3D 2,
			.num_msi_vectors =3D 8,
			.msi_64bits =3D 1,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:14.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xa2,
			.bar_mask =3D {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 20,
			.num_caps =3D 2,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:16.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb0,
			.bar_mask =3D {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 22,
			.num_caps =3D 2,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 1,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:16.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb1,
			.bar_mask =3D {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 22,
			.num_caps =3D 2,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 1,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:16.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb4,
			.bar_mask =3D {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 22,
			.num_caps =3D 2,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 1,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:17.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb8,
			.bar_mask =3D {
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfff80000,
			},
			.caps_start =3D 15,
			.num_caps =3D 3,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xe0,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 24,
			.num_caps =3D 7,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:1c.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xe4,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 31,
			.num_caps =3D 6,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:1c.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xe5,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 24,
			.num_caps =3D 7,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xf8,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xfa,
			.bar_mask =3D {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:1f.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xfc,
			.bar_mask =3D {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 00:1f.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xfd,
			.bar_mask =3D {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x100,
			.bar_mask =3D {
				0xffffff00, 0xffff8000, 0xfffffffc,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 37,
			.num_caps =3D 4,
			.num_msi_vectors =3D 32,
			.msi_64bits =3D 1,
			.msi_maskable =3D 1,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x200,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 41,
			.num_caps =3D 5,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 1,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x300,
			.bar_mask =3D {
				0xff000000, 0xffffc000, 0xff800000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 46,
			.num_caps =3D 1,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 04:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x400,
			.bar_mask =3D {
				0xffff0000, 0xffffffff, 0xffff0000,
				0xffffffff, 0xffff0000, 0xffffffff,
			},
			.caps_start =3D 47,
			.num_caps =3D 9,
			.num_msi_vectors =3D 8,
			.msi_64bits =3D 1,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 17,
			.msix_region_size =3D 0x1000,
			.msix_address =3D 0x92a50000,
		},
		/* PCIDevice: 04:00.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x401,
			.bar_mask =3D {
				0xffff0000, 0xffffffff, 0xffff0000,
				0xffffffff, 0xffff0000, 0xffffffff,
			},
			.caps_start =3D 47,
			.num_caps =3D 9,
			.num_msi_vectors =3D 8,
			.msi_64bits =3D 1,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 17,
			.msix_region_size =3D 0x1000,
			.msix_address =3D 0x92a20000,
		},
		/* PCIDevice: 16:01.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1608,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 56,
			.num_caps =3D 12,
			.num_msi_vectors =3D 2,
			.msi_64bits =3D 0,
			.msi_maskable =3D 1,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:05.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1628,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:05.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x162a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:05.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x162c,
			.bar_mask =3D {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 11,
			.num_caps =3D 3,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1640,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1641,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1642,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1643,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1644,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1645,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.6 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1646,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:08.7 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1647,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1648,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1649,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x164a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x164b,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x164c,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x164d,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.6 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x164e,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:09.7 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x164f,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0a.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1650,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0a.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1651,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1670,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1671,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1672,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1673,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1674,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1675,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.6 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1676,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0e.7 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1677,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1678,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1679,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x167a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x167b,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x167c,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x167d,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.6 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x167e,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:0f.7 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x167f,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:10.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1680,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:10.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x1681,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1d.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16e8,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1d.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16e9,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1d.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16ea,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1d.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16eb,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1e.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16f0,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1e.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16f1,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1e.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16f2,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1e.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16f3,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1e.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16f4,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1e.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16f5,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 16:1e.6 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x16f6,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 17:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 0,
			.domain =3D 0x0,
			.bdf =3D 0x1700,
			.bar_mask =3D {
				0xffffff00, 0xffff8000, 0xfffffffc,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 37,
			.num_caps =3D 4,
			.num_msi_vectors =3D 32,
			.msi_64bits =3D 1,
			.msi_maskable =3D 1,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:05.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6428,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:05.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x642a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:05.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x642c,
			.bar_mask =3D {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 11,
			.num_caps =3D 3,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:08.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6440,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:09.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6448,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6450,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6451,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6452,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6453,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6454,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6455,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.6 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6456,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0a.7 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6457,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0b.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6458,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0b.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6459,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0b.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x645a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0b.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x645b,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6460,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6461,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6462,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6463,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6464,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.5 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6465,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.6 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6466,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0c.7 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6467,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0d.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6468,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0d.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x6469,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0d.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x646a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: 64:0d.3 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0x646b,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 68,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb200,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 56,
			.num_caps =3D 12,
			.num_msi_vectors =3D 2,
			.msi_64bits =3D 0,
			.msi_maskable =3D 1,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:05.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb228,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:05.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb22a,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:05.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb22c,
			.bar_mask =3D {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 11,
			.num_caps =3D 3,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:0e.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb270,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:0e.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb271,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 70,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:0f.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb278,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:0f.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb279,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 70,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:12.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb290,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 9,
			.num_caps =3D 2,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:12.1 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb291,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:12.2 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb292,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:15.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb2a8,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:16.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb2b0,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b2:16.4 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 3,
			.domain =3D 0x0,
			.bdf =3D 0xb2b4,
			.bar_mask =3D {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start =3D 0,
			.num_caps =3D 0,
			.num_msi_vectors =3D 0,
			.msi_64bits =3D 0,
			.msi_maskable =3D 0,
			.num_msix_vectors =3D 0,
			.msix_region_size =3D 0x0,
			.msix_address =3D 0x0,
		},
		/* PCIDevice: b3:00.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu =3D 2,
			.domain =3D 0x0,
			.bdf =3D 0xb300,
			.bar_mask =3D {
				0xffffff00, 0xffff0000, 0xffffffff,
				0xfff00000, 0xffffffff, 0x00000000,
			},
			.caps_start =3D 72,
			.num_caps =3D 8,
			.num_msi_vectors =3D 1,
			.msi_64bits =3D 1,
			.msi_maskable =3D 1,
			.num_msix_vectors =3D 97,
			.msix_region_size =3D 0x1000,
			.msix_address =3D 0xe110e000,
		},
		/* IVSHMEM: 00:01.0 */
		{
			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain =3D 0x0,
			.bdf =3D 0x08,
			.bar_mask =3D {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0xffffffff,
			},
			.shmem_region =3D 62,
			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
			.num_msix_vectors =3D 1,
		},
	},

	.pci_caps =3D {
		/* PCIDevice: 00:00.0 */
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x90,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0xe0,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x144,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x1d0,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x250,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x280,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x298,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x300,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 00:05.0 */
		/* PCIDevice: 00:05.2 */
		/* PCIDevice: 00:08.0 */
		/* PCIDevice: 00:08.2 */
		/* PCIDevice: 16:05.0 */
		/* PCIDevice: 16:05.2 */
		/* PCIDevice: 64:05.0 */
		/* PCIDevice: 64:05.2 */
		/* PCIDevice: b2:05.0 */
		/* PCIDevice: b2:05.2 */
		/* PCIDevice: b2:0e.0 */
		/* PCIDevice: b2:0f.0 */
		/* PCIDevice: b2:12.0 */
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x40,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 00:05.4 */
		/* PCIDevice: 16:05.4 */
		/* PCIDevice: 64:05.4 */
		/* PCIDevice: b2:05.4 */
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x44,
			.len =3D 20,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0xe0,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x80,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:11.5 */
		/* PCIDevice: 00:17.0 */
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x80,
			.len =3D 10,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x70,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_SATA,
			.start =3D 0xa8,
			.len =3D 2,
			.flags =3D 0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x70,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x80,
			.len =3D 14,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:14.2 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x50,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x80,
			.len =3D 10,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:16.0 */
		/* PCIDevice: 00:16.1 */
		/* PCIDevice: 00:16.4 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x50,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x8c,
			.len =3D 14,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1c.5 */
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x40,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x80,
			.len =3D 10,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_SSVID,
			.start =3D 0x90,
			.len =3D 2,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0xa0,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x140,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x220,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 00:1c.4 */
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x40,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x80,
			.len =3D 10,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_SSVID,
			.start =3D 0x90,
			.len =3D 2,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0xa0,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x140,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 01:00.0 */
		/* PCIDevice: 17:00.0 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x60,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x68,
			.len =3D 24,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x80,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x50,
			.len =3D 14,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x78,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x80,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x800,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0xdc,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 04:00.0 */
		/* PCIDevice: 04:00.1 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x48,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_VPD,
			.start =3D 0x50,
			.len =3D 2,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x58,
			.len =3D 14,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_MSIX,
			.start =3D 0xa0,
			.len =3D 12,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0xac,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x13c,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x150,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x160,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 16:01.0 */
		/* PCIDevice: b2:00.0 */
		{
			.id =3D PCI_CAP_ID_SSVID,
			.start =3D 0x40,
			.len =3D 2,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0x60,
			.len =3D 20,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x90,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0xe0,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x110,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x148,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x1d0,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x250,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x280,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x298,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x300,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: 64:08.0 */
		/* PCIDevice: 64:09.0 */
		/* PCIDevice: 64:0a.0 */
		/* PCIDevice: 64:0a.1 */
		/* PCIDevice: 64:0a.2 */
		/* PCIDevice: 64:0a.3 */
		/* PCIDevice: 64:0a.4 */
		/* PCIDevice: 64:0a.5 */
		/* PCIDevice: 64:0a.6 */
		/* PCIDevice: 64:0a.7 */
		/* PCIDevice: 64:0b.0 */
		/* PCIDevice: 64:0b.1 */
		/* PCIDevice: 64:0b.2 */
		/* PCIDevice: 64:0b.3 */
		/* PCIDevice: 64:0c.0 */
		/* PCIDevice: 64:0c.1 */
		/* PCIDevice: 64:0c.2 */
		/* PCIDevice: 64:0c.3 */
		/* PCIDevice: 64:0c.4 */
		/* PCIDevice: 64:0c.5 */
		/* PCIDevice: 64:0c.6 */
		/* PCIDevice: 64:0c.7 */
		/* PCIDevice: 64:0d.0 */
		/* PCIDevice: 64:0d.1 */
		/* PCIDevice: 64:0d.2 */
		/* PCIDevice: 64:0d.3 */
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x40,
			.len =3D 20,
			.flags =3D 0,
		},
		{
			.id =3D 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: b2:0e.1 */
		/* PCIDevice: b2:0f.1 */
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x40,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		/* PCIDevice: b3:00.0 */
		{
			.id =3D PCI_CAP_ID_PM,
			.start =3D 0x50,
			.len =3D 8,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_EXP,
			.start =3D 0x68,
			.len =3D 60,
			.flags =3D 0,
		},
		{
			.id =3D PCI_CAP_ID_MSI,
			.start =3D 0xa8,
			.len =3D 24,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_CAP_ID_MSIX,
			.start =3D 0xc0,
			.len =3D 12,
			.flags =3D JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x100,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x1e0,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x1c0,
			.len =3D 4,
			.flags =3D 0,
		},
		{
			.id =3D PCI_EXT_CAP_ID_ARI | JAILHOUSE_PCI_EXT_CAP,
			.start =3D 0x148,
			.len =3D 4,
			.flags =3D 0,
		},
	},
};

--------------1BA7A4D3F24FB766E0D6FBA9
Content-Type: text/x-chdr; name="dell.h"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="dell.h"

/* serial port mapping
 * ttyS0 @0x3f8		(irq =3D 4)
 * ttyS1 @0x2f8		(irq =3D 3)
 * ttyS4 @0x20c0	(irq =3D 16)
 * ttyS5 @0x20c8	(irq =3D 16)
 * ttyS6 @0x40c0	(irq =3D 31)
 * ttyS7 @0x40c8	(irq =3D 31)
 */

#define HYPERVISOR_BASE 	0x100000000ULL /* @4GiB */
#define JAILHOUSE_RESERVED_SIZE 0x200000000ULL /* 8GiB */
#define JAILHOUSE_RESERVED_END	(HYPERVISOR_BASE + JAILHOUSE_RESERVED_SIZE=
)
#define HYPERVISOR_SIZE		0x000600000ULL /* 6MiB */
#define HYPERVISOR_END		(HYPERVISOR_BASE + HYPERVISOR_SIZE)

#define IVSHMEM_BASE		HYPERVISOR_END
#define IVSHMEM_SIZE		0x100000ULL /* 1MiB */

#define INMATE_BASE		(IVSHMEM_BASE + IVSHMEM_SIZE)
#define INMATE_SIZE		(JAILHOUSE_RESERVED_END - INMATE_BASE) /* =3D 8GiB -=
 6MiB - 1MiB */

#define DACTALES_BASE		INMATE_BASE
#define DACTALES_SIZE		(512 * 1024 * 1024)

--------------1BA7A4D3F24FB766E0D6FBA9
Content-Type: text/x-csrc; name="dactales-linux.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="dactales-linux.c"

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Linux inmate, 1 CPU, 74 MB RAM, ~1MB shmem, serial p=
orts
 *
 * Copyright (c) Siemens AG, 2013-2015
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#include "dell.h"

#define DACTALES_LOW_BASE	DACTALES_BASE
#define DACTALES_LOW_SIZE	0x100000 /* 1MiB */
#define DACTALES_HIGH_BASE	(DACTALES_LOW_BASE + DACTALES_LOW_SIZE)
#define DACTALES_HIGH_SIZE	(DACTALES_SIZE - DACTALES_LOW_SIZE)

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[4];
	struct jailhouse_cache cache_regions[0];
	struct jailhouse_irqchip irqchips[1];
	__u8 pio_bitmap[0x2000];
	struct jailhouse_pci_device pci_devices[1];
	struct jailhouse_pci_capability pci_caps[0];
} __attribute__((packed)) config =3D {
	.cell =3D {
		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision =3D JAILHOUSE_CONFIG_REVISION,
		.name =3D "dactales-linux",
		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size =3D sizeof(config.cpus),
		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
		.num_cache_regions =3D ARRAY_SIZE(config.cache_regions),
		.num_irqchips =3D ARRAY_SIZE(config.irqchips),
		.pio_bitmap_size =3D ARRAY_SIZE(config.pio_bitmap),
		.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
		.num_pci_caps =3D ARRAY_SIZE(config.pci_caps),
	},

	.cpus =3D {
		0x8,
	},

	.mem_regions =3D {
		/* low RAM */ {
			.phys_start =3D DACTALES_LOW_BASE,
			.virt_start =3D 0,
			.size =3D DACTALES_LOW_SIZE,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start =3D 0x00100000,
			.size =3D 0x00001000,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
		/* high RAM */ {
			.phys_start =3D DACTALES_HIGH_BASE,
			.virt_start =3D 0x00200000,
			.size =3D DACTALES_HIGH_SIZE,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* IVSHMEM shared memory region */
		{
			.phys_start =3D IVSHMEM_BASE,
			.virt_start =3D IVSHMEM_BASE,
			.size =3D IVSHMEM_SIZE,
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
			},

	.cache_regions =3D {
#if 0
		{
			.start =3D 0,
			.size =3D 2,
			.type =3D JAILHOUSE_CACHE_L3,
		},
#endif
	},

	.irqchips =3D {
		/* IOAPIC */ {
			.address =3D 0xfec00000,
			.id =3D 0x3f0f8,
			.pin_bitmap =3D {
				(1 << 4),
			},
		},
	},

	.pio_bitmap =3D {
		[     0/8 ... 0x3f7/8] =3D -1,
		[ 0x3f8/8 ... 0x3ff/8] =3D 0,
		[ 0x400/8 ...0xffff/8] =3D -1,
	},

	.pci_devices =3D {
		{
			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain =3D 0x0,
			.bdf =3D 0x08,
			.bar_mask =3D {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0xffffffff,
			},
			.num_msix_vectors =3D 1,
			.shmem_region =3D 3,
			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},

	.pci_caps =3D {
	}
};

--------------1BA7A4D3F24FB766E0D6FBA9--
