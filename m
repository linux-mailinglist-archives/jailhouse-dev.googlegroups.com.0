Return-Path: <jailhouse-dev+bncBCKO35F6UENRBIOCTLZAKGQE6JC3ZRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C515D882
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 14:31:14 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id 21sf4551308oiy.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 05:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lRMlpwtrDH96RzP/OQw99vXSpFzN7blgSYQqzkAg2Ck=;
        b=lOyY/LZSj9eOYFW1IibA0fyLPFLF2x9lh8qoloCWLq8mGXhZFtMgwETN23dSv1PJdf
         OEPkmVcDdZ+sQC5pUYr34tn0pJoN2epd/uvVQ3WD6lBUmdpAuHZHymxZbuAIfsTQzjy2
         xVJ/XkoHr/WetfzyddryG6Xeql7YyiagqBti3TcLKXwt5agn8Sn1jGEHjC/y6Kl0wWYO
         9olqrQ24erQKodnA9r6gDoYq0Q2Fb64WnT4z20YPtojNQJ2MiQhhuH+t2IFGilgKhWPg
         /Zp5bKSfhKl4Al7vU4bq2ugNX/LaDTeRAfzPy2nV4jhQZ9JuGs4gcm1pfDkRb/4NvIlf
         1JwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lRMlpwtrDH96RzP/OQw99vXSpFzN7blgSYQqzkAg2Ck=;
        b=T+e5TB+zFruApg1WX2aCHe5JZnXg4x4ib1/mFLx8ViYGzZ1jVS7qOHJPJ3qwQ7Qsqc
         pHxgJVBuuj9cYUmCS24p1JLtJwT/FmwOnuy64XxRSNEJgmvr15P9yiMKwLuZncc2eqQ8
         Ru7A6pYgd51g1qAmQhE98jk/0fsPFI6seqwDv/S7kWOoooSQw5H0pdc1DKZyvd/+Uvqy
         RBN2P+MF0abj+BIYrnn7N51EGsEfnRB6TisP2ZEZziUBWVIFH3/JuHPexPXh8G6FxrUs
         Sj2m/mLowUiMjcQ42A25zWUYK9Afc99nlJ/fGx5o+kzK3I1g2rJUmRMlRtV4B1cMeJQT
         PLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lRMlpwtrDH96RzP/OQw99vXSpFzN7blgSYQqzkAg2Ck=;
        b=YqCkC1Qf6I4ke5xJj9o0lq/+yDHRmjolsJ6CsTzJIZg16HsjtxJgAIpWeP8yGLbx69
         DJdPBuFFvhdqOGuuGOjTucTeTWKT+onGib4MnEUk0rNlDUd4okkuEYhh/cOHSo3+ooAT
         viMzFf5sLyNW7NLDFZwskX8vYDzMroFDaNtohhUvMbj1z+pRNXme0O0s9+wmDdfxXGz6
         gMvQJuAqrEp5kLfO/LghKEFOy9J45DbqfVBm84rsGc+L4lvmMu395DHfeLf93UX/lX81
         xVzS9SekIjSEaTkpwKqo//oeP1m3hZS7TVHJamEQYsapGpZEKTl7goimlB5T9aMW6tpf
         eaCQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWfEQOD9GuCiTaITHl1RfLT+4GCCPg6TIYKZ0F2AknQRy9MGJYQ
	wbWT/xstKWh5zB57emQlEZM=
X-Google-Smtp-Source: APXvYqwKX401S4/gBTW19SdzaItF4WkhTMmsWd5ceWpxohHzt0JvYr9FRw7TRE4nIjlDj91l12E3Fw==
X-Received: by 2002:a05:6830:128e:: with SMTP id z14mr2261804otp.184.1581687073234;
        Fri, 14 Feb 2020 05:31:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:4a4:: with SMTP id l4ls528548otd.11.gmail; Fri, 14
 Feb 2020 05:31:12 -0800 (PST)
X-Received: by 2002:a9d:7508:: with SMTP id r8mr2295086otk.116.1581687072325;
        Fri, 14 Feb 2020 05:31:12 -0800 (PST)
Date: Fri, 14 Feb 2020 05:31:11 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
Subject: Linux non-root cell tooling
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3436_1511694772.1581687071698"
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

------=_Part_3436_1511694772.1581687071698
Content-Type: multipart/alternative; 
	boundary="----=_Part_3437_1935082905.1581687071699"

------=_Part_3437_1935082905.1581687071699
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to create a non-root Linux cell but I'm stuck on the userspace 
tooling apparently.
I can run the apic-demo on x86 just fine, but trying to create the Linux 
cell yields the following output:

$ sudo jailhouse cell linux linux-x86-demo.cell bzImage 
Traceback (most recent call last):
  File "/usr/libexec/jailhouse/jailhouse-cell-linux", line 850, in <module>
    cell = JailhouseCell(config)
  File "/usr/lib/python3.7/site-packages/pyjailhouse/cell.py", line 36, in 
__init__
    raise e
  File "/usr/lib/python3.7/site-packages/pyjailhouse/cell.py", line 33, in 
__init__
    fcntl.ioctl(self.dev, JailhouseCell.JAILHOUSE_CELL_CREATE, create)
OSError: [Errno 7] Argument list too long

I have been following the documentation from here: 
https://github.com/siemens/jailhouse/blob/master/Documentation/non-root-linux.txt. 
"bzImage" is the compiled guest cell kernel. The linux-x86-demo config was 
not altered from the default one in the GIT repository.

The version of Jailhouse I'm using is 0.12 
(92db71f257fabd3c08fa4b99498fa61a41ea831d).
My root cell config and all the other stuff is the same as stated here: 
https://groups.google.com/forum/#!topic/jailhouse-dev/p0fcHAib0rw.
Right now I am loading the driver (jailhouse.ko) as out-of-tree module, but 
I made sure the version matches with the userspace tools (both built from 
the same GIT revision).

Cheers

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b9c213c-a111-4f3f-94c5-4f89d06b5fdf%40googlegroups.com.

------=_Part_3437_1935082905.1581687071699
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I&#39;m trying to cr=
eate a non-root Linux cell but I&#39;m stuck on the userspace tooling appar=
ently.</div><div>I can run the apic-demo on x86 just fine, but trying to cr=
eate the Linux cell yields the following output:</div><div><br></div><div><=
div style=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 1=
87, 187); border-style: solid; border-width: 1px; overflow-wrap: break-word=
;" class=3D"prettyprint"><code class=3D"prettyprint"><div class=3D"subprett=
yprint"><span style=3D"color: #000;" class=3D"styled-by-prettify">$ sudo ja=
ilhouse cell linux linux</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify">x86</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify">demo</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">cell bzImage <br></span><s=
pan style=3D"color: #606;" class=3D"styled-by-prettify">Traceback</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">most recent call </span><span style=
=3D"color: #008;" class=3D"styled-by-prettify">last</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">):</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"><br>=C2=A0 </span><span style=3D"color: #6=
06;" class=3D"styled-by-prettify">File</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> </span><span style=3D"color: #080;" class=3D"s=
tyled-by-prettify">&quot;/usr/libexec/jailhouse/jailhouse-cell-linux&quot;<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> line </span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">850</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" cla=
ss=3D"styled-by-prettify">in</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> </span><span style=3D"color: #080;" class=3D"styled-by-p=
rettify">&lt;module&gt;</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify"><br>=C2=A0 =C2=A0 cell </span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-=
prettify">JailhouseCell</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy">config</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=
=A0 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">File</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #080;" class=3D"styled-by-prettify">&quot;/usr/lib/python=
3.7/site-packages/pyjailhouse/cell.py&quot;</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> line </span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">36</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">in</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> __init__<br>=
=C2=A0 =C2=A0 </span><span style=3D"color: #008;" class=3D"styled-by-pretti=
fy">raise</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
e<br>=C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by-prettify=
">File</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;/usr/li=
b/python3.7/site-packages/pyjailhouse/cell.py&quot;</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> line </span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">33</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify=
">in</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> __ini=
t__<br>=C2=A0 =C2=A0 fcntl</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">ioctl</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">(</span><span style=3D"color: #008;" class=3D"styled-by-prettify">self</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">dev</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" =
class=3D"styled-by-prettify">JailhouseCell</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">JAILHOUSE_CELL_CREATE</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> create</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br></span><span style=3D"color: #606;" class=3D"styled-by-p=
rettify">OSError</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><spa=
n style=3D"color: #606;" class=3D"styled-by-prettify">Errno</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">7</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Argument</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify"> list too </span><span style=3D"color: #008;" class=3D"styled-=
by-prettify">long</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"><br></span></div></code></div><br>I have been following the document=
ation from here: https://github.com/siemens/jailhouse/blob/master/Documenta=
tion/non-root-linux.txt. &quot;bzImage&quot; is the compiled guest cell ker=
nel. The linux-x86-demo config was not altered from the default one in the =
GIT repository.</div><div><br></div><div>The version of Jailhouse I&#39;m u=
sing is 0.12 (92db71f257fabd3c08fa4b99498fa61a41ea831d).</div><div>My root =
cell config and all the other stuff is the same as stated here: https://gro=
ups.google.com/forum/#!topic/jailhouse-dev/p0fcHAib0rw.</div><div>Right now=
 I am loading the driver (jailhouse.ko) as out-of-tree module, but I made s=
ure the version matches with the userspace tools (both built from the same =
GIT revision).</div><div><br></div><div>Cheers<br><div><wbr></div></div></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2b9c213c-a111-4f3f-94c5-4f89d06b5fdf%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2b9c213c-a111-4f3f-94c5-4f89d06b5fdf%40googlegroups.com<=
/a>.<br />

------=_Part_3437_1935082905.1581687071699--

------=_Part_3436_1511694772.1581687071698--
