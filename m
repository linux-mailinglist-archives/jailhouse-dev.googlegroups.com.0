Return-Path: <jailhouse-dev+bncBCKO35F6UENRBSO237ZAKGQEKMQSR6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B558172332
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Feb 2020 17:24:43 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id l19sf1910502oil.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Feb 2020 08:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tCotlcEkaNKX1ZDQYVAX2RmpCAiH0guJFccJ7ObF8oI=;
        b=Kw5ORnvtO+sKYs8P56YN9FSXMk89olJBeap879O+EMJInzjwBJQ+gikRslZdu22zql
         MIutvdn7CZxe1LTLBNzUyVm/ardM27FMGGnlXL89BHfmvpLCBp8Jiag6Qmh9Asp9Uf53
         gUdT3Zb5P/mvMjgw7ib3PW8yz2HGnLIdPXy0uLPpCreQ8aiHJBXFdzh7ZjjK9kFbplvb
         ft7KdgcS7UfRayN1O1tYOuliZZtuRHG+INkPH774YQi9iWj6H+XkhwVos18MUncKQMqU
         wq3Gk5MbstriTKelGoIvfGleVNSEowGVyVb/Ejl5P7jHuU1sB0dCY8o46F34QC/oxQZ5
         srOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tCotlcEkaNKX1ZDQYVAX2RmpCAiH0guJFccJ7ObF8oI=;
        b=XWPWiq57LGhG+GU6Q9Q0JLEVtsIM/3BasuIpoQPUO2wiiKi6YaIDYfaztObR6HFuik
         bNogyYWmhD1GOw5+RVlACp5gas8jxx/RthKGmWJVgxCwHTB3n5Pw20ChNqDxhdEMbzcd
         tmqVOQqLWX1+R1h172iqNv6KfMjgTy3rKbPBFkxCuh0CaIcvK7MBwGRNdu7XulA7IMMa
         1aAaYS8FGnzUXFyyKIqNTkI+Fiva3VG5cuQA55VTl9zkYgbP9le3HuYBNMdfax1Xq2/3
         SUoJ2aj+oXrESNHroxQbI/JA8HxSEoKbAFgMy0aHFJjscxXafyBId5fo10eRWmrJPQ2/
         FmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tCotlcEkaNKX1ZDQYVAX2RmpCAiH0guJFccJ7ObF8oI=;
        b=qltuxYPBS+bvms1Ney6hqYEfbAomjwyAjJlel/9yXK+7NmQUw9hFX5TNRnfyl8I5b9
         qgML6kTuB1dtctxAiJnhD2Owll0spdM/dCTLyuRfx5DjzrNmqtOeXkK0Hs7IALk7wg/P
         Dq4fV/LtGABAtSpjVrFYvj1Kd2oZKN1jnNy6IsAgf2qe99LAgMp/zlhuAYyjY/jacjCX
         Yj9BF/FpcQalxDtUL/BlZoIOgWVXBy+Vc2aEaBoJGduaIA0j4o1roEfJyufQJobP5UwW
         z+buzvAk/1lHtKVuJSRfQCHGklrfyQsRvfPZ2jZgKGA2jKVUoMKHKCmG9z+nhV4+ZqWK
         VVqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVmXNJ9DGY9n3mYVe/PsxJ/8+vQBk9d5B1bWPnoG9ZE4Rtb+F0f
	KQyZL6Z2nSYLy70/rhIMlg8=
X-Google-Smtp-Source: APXvYqyTzYjD9e46cP1VNKUsUwAqLFYyq6JJ60HLnhYqjJNbuqkpBbGi+OIdhVVke4I3oF4n6Kzv/Q==
X-Received: by 2002:a05:6808:b13:: with SMTP id s19mr3872496oij.119.1582820681916;
        Thu, 27 Feb 2020 08:24:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:4a4:: with SMTP id l4ls1248069otd.11.gmail; Thu, 27
 Feb 2020 08:24:41 -0800 (PST)
X-Received: by 2002:a05:6830:c7:: with SMTP id x7mr419228oto.272.1582820681283;
        Thu, 27 Feb 2020 08:24:41 -0800 (PST)
Date: Thu, 27 Feb 2020 08:24:40 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8c73327a-1e44-458d-9c15-5d0a7ce03828@googlegroups.com>
In-Reply-To: <b434f550-5700-ba44-e88f-ea76c84a6d0d@oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
 <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
 <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
 <c0402eef-a0c8-40a7-b021-ba0f9f8422df@googlegroups.com>
 <b434f550-5700-ba44-e88f-ea76c84a6d0d@oth-regensburg.de>
Subject: Re: AMD: non-root linux inmates
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2778_2111597653.1582820680407"
X-Original-Sender: raymanfx@gmail.com
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

------=_Part_2778_2111597653.1582820680407
Content-Type: multipart/alternative; 
	boundary="----=_Part_2779_635548219.1582820680408"

------=_Part_2779_635548219.1582820680408
Content-Type: text/plain; charset="UTF-8"

More curious stuff:

The EPYC 7351P chip I have is supposed to support x2APIC (the entire AMD 
7002 series does) [1].
But I cannot find any BIOS option for my GIGABYTE MZ01-CE1 (Rev 2.0) board 
to switch the APIC mode to x2APIC.
And in fact Linux 5.5.5 does not report x2APIC mode on my machine when 
booting.

I was hoping to be able to "bypass" this issue by just using x2APIC, but oh 
well...
Contacting AMD on the mailing list would be nice. Let me know if you post 
something on a list and I will gladly follow up with any information needed.

[1] https://developer.amd.com/wp-content/resources/56745_0.80.pdf - page 15 
"x2APIC"

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8c73327a-1e44-458d-9c15-5d0a7ce03828%40googlegroups.com.

------=_Part_2779_635548219.1582820680408
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>More curious stuff:</div><div><br></div><div>The EPYC=
 7351P chip I have is supposed to support x2APIC (the entire AMD 7002 serie=
s does) [1].</div><div>But I cannot find any BIOS option for my GIGABYTE MZ=
01-CE1 (Rev 2.0) board to switch the APIC mode to x2APIC.</div><div>And in =
fact Linux 5.5.5 does not report x2APIC mode on my machine when booting.</d=
iv><div><br></div><div>I was hoping to be able to &quot;bypass&quot; this i=
ssue by just using x2APIC, but oh well...</div><div>Contacting AMD on the m=
ailing list would be nice. Let me know if you post something on a list and =
I will gladly follow up with any information needed.<br></div><div><br></di=
v><div>[1] https://developer.amd.com/wp-content/resources/56745_0.80.pdf - =
page 15 &quot;x2APIC&quot;<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8c73327a-1e44-458d-9c15-5d0a7ce03828%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/8c73327a-1e44-458d-9c15-5d0a7ce03828%40googlegroups.com<=
/a>.<br />

------=_Part_2779_635548219.1582820680408--

------=_Part_2778_2111597653.1582820680407--
