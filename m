Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB4VL3D5AKGQE67QLCTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8B25F91B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 13:13:55 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id 205sf7504607qkd.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h/4bwPYGNyX2bMGlC9XNUZ8vYApMCd77YvUTgY/L6bY=;
        b=OuIF9eAYl5pmcnnSnY6drlqMm4/MKvkKNh9b/J1uya1sVO7R2KFu68J2QnzWr1GV85
         Xb9/FL5gLv2k20CnxGELYhXjPRqkD/noBEPxHge2Fia9y3mzyFu220JSL5o5SRHVAlm2
         4Rb3ZDJw8eTr+cfH3CxGLFlrWGF+p69PESt/4OuJguX6uWW9cisz8aeDqSsdvqdvJdY1
         sXx82G8WdbaGJeYR9s8dDgB5dPKCs2ryHoxoBrnQAUxi79JKGRIsIkjaINjdZ3ub+2QK
         Fc9I/5F92jUyL7Ad4ttvXpMMCO4lXRJgl9hQAalQqfm3GYnEodNW0bqiCByGhFq8Dayk
         w6nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h/4bwPYGNyX2bMGlC9XNUZ8vYApMCd77YvUTgY/L6bY=;
        b=ohhwti0LXSEHWDDFoZ5g68Owq16MRiAYK4fs8HKVuGVXnJQx1lZSsoKTcpE37h+ncW
         zUTP1d2Um/WefhV/y91BS9p8SpwNRVlMeLNwR/Ki7V+QWmEcAKkFYYVDZsAYsdxlgZ+f
         EDHMItN8HduA2K3S8ckTiFkajvur5ZPt7wsbK0oQ/tvGnaBVIyL5hdoiFUKhP9KRoRXy
         X/K5kDyB3jtI7pt9ZdL2zfH5dRa+a8HxZctPahsLMZaHpCxUmIU13ITVzkR/JZJ1ds3a
         v6otKe6f8yesjlF0d+mls8Euan+KmgTneTqmO1RNeV7kgUMLGrajOHKcKlzzInTER/Ns
         DFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=h/4bwPYGNyX2bMGlC9XNUZ8vYApMCd77YvUTgY/L6bY=;
        b=VVlaWYxx5sf4ADVmmRpMWM5CaAHtKO492gzZPH2wFvLzyTI0xfdKvlac4yCpkMYD2n
         lD5o4tfim9dLLL4TVcJkiIN2slLB3ZPPLjufxr8r+MIe2VJGYKkhdJJ3B7HOIwmpEubn
         sqCjG5ZcGuJ/BQEaISUGkL4qgy0iz8iiFbxHytgqTJed0M1HzLDMaiWnCqYMFFPx1ubD
         xSF2Y6bx9In0l1nshJPWzEY/Wk+7WXoQor8bfBUWNI/00w+k/qUZA0QViYtGnktoxjm0
         f+GA/UwurcdJq8QWahYV6n5aJuvgEiI1ERUi/uXmOj+bQgV0Nv9So8K0Ip1SABBlj4/6
         zS7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533q8hv4h+qjfDuOW7eOK1Z5iKRisBMWESohVTPk66zkCY/+bdlS
	P6vzupc4urXOnOOFhl53PSE=
X-Google-Smtp-Source: ABdhPJzwaKvj7fFvsA/ts2FdrdQyojK8KNJeevKc5+oLKM7AfYin6pG6zQObMOsxd3VcgZzwc/OieA==
X-Received: by 2002:a37:9346:: with SMTP id v67mr19282968qkd.482.1599477234861;
        Mon, 07 Sep 2020 04:13:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:16c4:: with SMTP id d4ls248725qvz.5.gmail; Mon, 07
 Sep 2020 04:13:54 -0700 (PDT)
X-Received: by 2002:a0c:f194:: with SMTP id m20mr17900088qvl.9.1599477234149;
        Mon, 07 Sep 2020 04:13:54 -0700 (PDT)
Date: Mon, 7 Sep 2020 04:13:53 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
In-Reply-To: <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2672_101937190.1599477233375"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_2672_101937190.1599477233375
Content-Type: multipart/alternative; 
	boundary="----=_Part_2673_464307061.1599477233375"

------=_Part_2673_464307061.1599477233375
Content-Type: text/plain; charset="UTF-8"

In my rootfs "python V2.7.18" is included.
This version has a package "python-json" that maybe installed explicitly.

I've also tried to use Yocot "dunfell", however, I ran into a lot of other 
problems.


jsmo...@linuxfoundation.org schrieb am Montag, 7. September 2020 um 
13:06:24 UTC+2:

> Hi!
>
> We tested the layer with dunfell and master. 
> Warrior and zeus are too old.
>
> Best,
> JS
>
> Jan Kiszka <jan.k...@siemens.com> schrieb am Mo., 7. Sep. 2020, 13:02:
>
>> On 07.09.20 12:51, Jan-Marc Stranz wrote:
>> > Running
>> > 
>> > # python
>> >>>> from mako.template import Template
>> > 
>> > I get a lot of traceback messages.
>> > The last message is "ModuleNotFoundError: not module named 'json'".
>> > This message comes from
>> > "/usr/lib/python3.7/site-packages/mako/compat.py" (line 140: "import
>> > json  # noqa").
>> > 
>>
>> The python-mako package is likely missing a dependency, or it was not
>> properly converted to python3. Yocto bug.
>>
>> Note also that warrior is a bit old. Maybe you do not have the latest
>> 2.7.4, or maybe this was never fixed in that series.
>>
>> Jan
>>
>> -- 
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>>
>> -- 
>> You received this message because you are subscribed to the Google Groups 
>> "Jailhouse" group.
>>
> To unsubscribe from this group and stop receiving emails from it, send an 
>> email to jailhouse-de...@googlegroups.com.
>> To view this discussion on the web visit 
>> https://groups.google.com/d/msgid/jailhouse-dev/0e52381f-15b2-e833-7717-6335ddcc5f35%40siemens.com
>> .
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6f67008c-1b56-4c4e-9442-d011d178e895n%40googlegroups.com.

------=_Part_2673_464307061.1599477233375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>In my rootfs "python V2.7.18" is included.</div><div>This version has =
a package "python-json" that maybe installed explicitly.</div><div><br></di=
v><div>I've also tried to use Yocot "dunfell", however, I ran into a lot of=
 other problems.<br></div><div><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"auto" class=3D"gmail_attr">jsmo...@linuxfoundation.org schrieb am =
Montag, 7. September 2020 um 13:06:24 UTC+2:<br/></div><blockquote class=3D=
"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204,=
 204, 204); padding-left: 1ex;"><div dir=3D"auto">Hi!<div dir=3D"auto"><br>=
</div><div dir=3D"auto">We tested the layer with dunfell and master.=C2=A0<=
/div><div dir=3D"auto">Warrior and zeus are too old.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto">JS</div></div><br=
><div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Jan Kiszka &lt;<a href data-email-masked rel=3D"nof=
ollow">jan.k...@siemens.com</a>&gt; schrieb am Mo., 7. Sep. 2020, 13:02:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 0=
7.09.20 12:51, Jan-Marc Stranz wrote:<br>
&gt; Running<br>
&gt; <br>
&gt; # python<br>
&gt;&gt;&gt;&gt; from mako.template import Template<br>
&gt; <br>
&gt; I get a lot of traceback messages.<br>
&gt; The last message is &quot;ModuleNotFoundError: not module named &#39;j=
son&#39;&quot;.<br>
&gt; This message comes from<br>
&gt; &quot;/usr/lib/python3.7/site-packages/mako/compat.py&quot; (line 140:=
 &quot;import<br>
&gt; json=C2=A0 # noqa&quot;).<br>
&gt; <br>
<br>
The python-mako package is likely missing a dependency, or it was not<br>
properly converted to python3. Yocto bug.<br>
<br>
Note also that warrior is a bit old. Maybe you do not have the latest<br>
2.7.4, or maybe this was never fixed in that series.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
<br></blockquote></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br></blockquote></div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href rel=3D"noreferrer nofollow" data-email-masked>jailhouse-de.=
..@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0e52381f-15b2-e833-7717-6335ddcc5f35%40siemens.com=
" rel=3D"noreferrer noreferrer nofollow" target=3D"_blank" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google.co=
m/d/msgid/jailhouse-dev/0e52381f-15b2-e833-7717-6335ddcc5f35%2540siemens.co=
m&amp;source=3Dgmail&amp;ust=3D1599563260385000&amp;usg=3DAFQjCNEzHncvBQhKO=
nguiGO1fBULObRvSg">https://groups.google.com/d/msgid/jailhouse-dev/0e52381f=
-15b2-e833-7717-6335ddcc5f35%40siemens.com</a>.<br>
</blockquote></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6f67008c-1b56-4c4e-9442-d011d178e895n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6f67008c-1b56-4c4e-9442-d011d178e895n%40googlegroups.co=
m</a>.<br />

------=_Part_2673_464307061.1599477233375--

------=_Part_2672_101937190.1599477233375--
